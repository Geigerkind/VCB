--Global Variables
VCB_BUTTONNAME = {buff="VCB_BF_BUFF_BUTTON", debuff="VCB_BF_DEBUFF_BUTTON", weapon = "VCB_BF_WEAPON_BUTTON"}
VCB_MININDEX = {buff=0, debuff=0, weapon=0}
VCB_MAXINDEX = {buff=41, debuff=15, weapon=1}

-- Local Variables
local BUTTON_TEMPLATE_NAME = {buff="VCB_BF_BUFF_BUTTON", debuff="VCB_BF_DEBUFF_BUTTON", weapon = "VCB_BF_WEAPON_BUTTON"}
local FRAME_NAME = {buff="VCB_BF_BUFF_FRAME", debuff="VCB_BF_DEBUFF_FRAME", weapon = "VCB_BF_WEAPON_FRAME"}
local TEMPENCHANTGHOSTTEXT = {"MH", "OH"}
local BUFF, DEBUFF, WEAPON = "buff", "debuff", "weapon" --cats
local GHOST_COLOR = {	buff =	{r=0.2, g=0.8, b=0.2},
						debuff=	{r=0.8, g=0.2, b=0.2},
						weapon=	{r=0.2, g=0.2, b=0.8},
						warning={r=1.0, g=0.2, b=0.2},
						alpha=0.8}
local BUFF_FILTER={buff="HELPFUL", debuff="HARMFUL"}
local UPDATETIME = 0.2
local VCB_BuffFrameUpdateTime = 0
local VCB_BuffFrameFlashState = 0
local VCB_BuffFrameFlashTime = 0
local VCB_BUFF_ALPHA_VALUE = 1
local updater = false

local timeSinceWeaponUpdate = 0
local timeSinceBuffUpdate = 0
local grayedIcons = false
local classicon = {}
classicon = {
	[1] = "Interface\\ICONS\\Spell_Nature_Regeneration.tga",
	[2] = "Interface\\ICONS\\Ability_TrueShot.tga",
	[3] = "Interface\\ICONS\\Spell_Magic_GreaterBlessingofKings.tga",
	[4] = "Interface\\ICONS\\Spell_Holy_GreaterBlessingofKings.tga",
	[5] = "Interface\\ICONS\\Spell_Holy_GreaterBlessingofWisdom.tga",
	[6] = "Interface\\ICONS\\Spell_Holy_GreaterBlessingofLight.tga",
	[7] = "Interface\\ICONS\\Spell_Holy_GreaterBlessingofSalvation.tga",
	[8] = "Interface\\ICONS\\Spell_Holy_ArcaneIntellect.tga",
	[9] = "Interface\\ICONS\\Spell_Holy_PrayerOfFortitude.tga",
	[10] = "Interface\\ICONS\\Spell_Holy_PrayerofSpirit.tga",
	[11] = "Interface\\ICONS\\Spell_Holy_PrayerofShadowProtection.tga",
}

function VCB_BF_OnLoad()
	if (not VCB_BF_BUFF_BUTTON0) then
		VCB_BF_DisableBlizzardBuffs()
		VCB_BF_CreateBuffButtons()
	end
end

function VCB_BF_ButtonIterator(cat, n)
	local buttonName, ghostButtonLabel
	if(not n) then
		n=VCB_MININDEX[cat]
		buttonName=VCB_BUTTONNAME[cat].."0"
	elseif(VCB_MININDEX[cat]<=n and n<VCB_MAXINDEX[cat]) then
		n=n+1
		buttonName=VCB_BUTTONNAME[cat]..(n-VCB_MININDEX[cat])
	else
		n=nil
	end
	if(cat==WEAPON and n) then
		ghostButtonLabel = TEMPENCHANTGHOSTTEXT[n+1]
	elseif(n) then
		ghostButtonLabel = n+1 - VCB_MININDEX[cat]
	end
	return n, buttonName, ghostButtonLabel
end

function VCB_BF_DisableBlizzardBuffs()
	VCB_BF_BUFF_FRAME:Show()
	VCB_BF_DEBUFF_FRAME:Show()
	VCB_BF_WEAPON_FRAME:Show()
	BuffFrame:Hide()
	TemporaryEnchantFrame:Hide()
	for i=0,23 do
		button = getglobal("BuffButton"..i)
		button:UnregisterEvent("PLAYER_AURAS_CHANGED")
		button:Hide()
	end

	for i=1,2 do
		button = getglobal("TempEnchant"..i)
		button:UnregisterEvent("PLAYER_AURAS_CHANGED")
		button:Hide()
	end
end

function VCB_BF_CreateBuffButtons()
	for cat, templateName in pairs(BUTTON_TEMPLATE_NAME) do
		for i, buttonName, ghostButtonLabel in VCB_BF_ButtonIterator, cat, nil do
			local button = CreateFrame("Button", buttonName, getglobal(FRAME_NAME[cat]), templateName)
			button.cat=cat
			if(cat ~= "weapon") then
				button:SetID(i)
			else
				button:SetID(i+16)
			end
			button.buffFilter=BUFF_FILTER[cat]
			button:RegisterForClicks("RightButtonUp")
			getglobal(button:GetName().."_Ghost_Label"):SetText(ghostButtonLabel)
			getglobal(button:GetName().."_Ghost_Texture"):SetTexture(GHOST_COLOR[cat].r, GHOST_COLOR[cat].g, GHOST_COLOR[cat].b, GHOST_COLOR.alpha)
			
			VCB_BuffFrameUpdateTime = 0
			VCB_BuffFrameFlashState = 0
			VCB_BuffFrameFlashTime = 0
			VCB_BUFF_ALPHA_VALUE = 1
			
			
			VCB_BF_BUFF_BUTTON_Update(button)
		end
	end
end

function VCB_BF_BUFF_BUTTON_Update(button)
	if (VCB_BF_DUMMY_MODE == false and VCB_IS_LOADED) then
		local buffIndex, untilCancelled = GetPlayerBuff(button:GetID(), button.buffFilter);
		button.buffIndex = buffIndex;
		button.untilCancelled = untilCancelled;
		local timeLeft = GetPlayerBuffTimeLeft(buffIndex)
		local buffDuration = getglobal(button:GetName().."Duration");
		buffDuration:SetText(VCB_BF_GetDuration(timeLeft))
		
		VCB_Tooltip:SetOwner(button)
		VCB_Tooltip:ClearLines()
		VCB_Tooltip:SetPlayerBuff(buffIndex)
		local name = VCB_TooltipTextLeft1:GetText()
		
		if button.cat == "buff" then button:SetParent(VCB_BF_BUFF_FRAME) end
		if Consolidated_Buffs ~= nil and button:GetParent() ~= VCB_BF_DEBUFF_FRAME and (not VCB_SAVE["MISC_disable_CF"]) then
			for e = 1, VCB_tablelength(Consolidated_Buffs) do
				if not Consolidated_Buffs[e] or name == nil then break end
				if strfind(strlower(Consolidated_Buffs[e]), strlower(name)) then
					button:SetParent(VCB_BF_CONSOLIDATED_BUFFFRAME)
					break
				end
			end
		end
		
		-- Banned Buffs implementation
		if Banned_Buffs ~= nil and (not VCB_SAVE["MISC_disable_BB"]) then
			for p = 1, VCB_tablelength(Banned_Buffs) do
				if not Banned_Buffs[p] or name == nil then break end
				if ( strfind(strlower(Banned_Buffs[p]), strlower(name)) ) then
					CancelPlayerBuff(button.buffIndex)
					VCB_SendMessage(name..VCB_HAS_BEEN_CANCELLED)
					break
				end
			end
		end
		
		if ( buffIndex < 0 and VCB_BF_LOCKED ) then
			if updater and updater==button:GetName() then
				updater = false
			end
			button:Hide();
			buffDuration:Hide();
		else
			button:SetAlpha(1.0);
			button:Show();
			if (timeLeft > 0) then -- SHOW_BUFF_DURATIONS ??
				buffDuration:Show();
			else
				buffDuration:Hide();
			end
		end
		
		local icon = getglobal(button:GetName().."Icon");
		icon:SetTexture(GetPlayerBuffTexture(buffIndex));

		-- Set color of debuff border based on dispel class.
		local color;
		local debuffType = GetPlayerBuffDispelType(GetPlayerBuff(button:GetID(), "HARMFUL"));
		local debuffSlot = getglobal(button:GetName().."Border");
		if ( debuffType ) or VCB_BF_DUMMY_MODE then
			color = {r=VCB_SAVE["DBF_BORDER_"..strlower(debuffType).."color_r"],g=VCB_SAVE["DBF_BORDER_"..strlower(debuffType).."color_g"],b=VCB_SAVE["DBF_BORDER_"..strlower(debuffType).."color_b"],a=1}
		elseif(buffIndex >= 0) then
			color = {r=VCB_SAVE["DBF_BORDER_nonecolor_r"],g=VCB_SAVE["DBF_BORDER_nonecolor_g"],b=VCB_SAVE["DBF_BORDER_nonecolor_b"],a=VCB_SAVE["DBF_BORDER_borderopacity"]}
			if VCB_IS_LOADED and button.cat == "buff" then
				if VCB_SAVE["CF_AURA_enableborder"] and button:GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
					color = {r=VCB_SAVE["CF_AURA_bordercolor_r"], g=VCB_SAVE["CF_AURA_bordercolor_r"], b=VCB_SAVE["CF_AURA_bordercolor_r"], a=VCB_SAVE["CF_AURA_borderopacity"]}
				elseif VCB_SAVE["BF_BORDER_enableborder"] and button:GetParent() == VCB_BF_BUFF_FRAME then
					color = {r=VCB_SAVE["BF_BORDER_bordercolor_r"], g=VCB_SAVE["BF_BORDER_bordercolor_g"], b=VCB_SAVE["BF_BORDER_bordercolor_b"], a=VCB_SAVE["BF_BORDER_borderopacity"]}
				end
			end
		else
			color = {r=0, g=0, b=0, a=0}
		end
		if ( debuffSlot ) or VCB_BF_DUMMY_MODE then
			debuffSlot:SetVertexColor(color.r, color.g, color.b, color.a);
		end

		-- Set the number of applications of an aura if its a debuff
		local buffCount = getglobal(button:GetName().."Count");
		local count = GetPlayerBuffApplications(buffIndex);
		if ( count > 1 ) then
			buffCount:SetText(count);
			buffCount:Show();
		else
			buffCount:Hide();
		end
		
		if VCB_IS_LOADED and button.cat == "buff" and button:GetID() == 31 then
			VCB_BF_RepositioningAndResizing() -- Performance
		elseif VCB_IS_LOADED and button.cat == "debuff" and button:GetID() == 15 then
			if VCB_SAVE["DBF_GENERAL_invert"] then
				VCB_BF_RepositionDebuffs()
			end
		end
	end
end

function VCB_BF_RepositioningAndResizing()
	local a = 1
	local b = 1
	for i=0, VCB_MAXINDEX.buff do
		local button = getglobal("VCB_BF_BUFF_BUTTON"..i)
		local parent = button:GetParent()
		local buttonDuration = getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration")
		local buttonBorder = getglobal("VCB_BF_BUFF_BUTTON"..i.."Border")
		local buttonIcon = getglobal("VCB_BF_BUFF_BUTTON"..i.."Icon")
		local buttonCount = getglobal("VCB_BF_BUFF_BUTTON"..i.."Count")
		local timeLeft = GetPlayerBuffTimeLeft(button.buffIndex or 1);
		
		if VCB_SAVE["BF_GENERAL_invert"] then
			local j = VCB_MAXINDEX.buff-i
			button = getglobal("VCB_BF_BUFF_BUTTON"..j)
			parent = button:GetParent()
			buttonDuration = getglobal("VCB_BF_BUFF_BUTTON"..j.."Duration")
			buttonBorder = getglobal("VCB_BF_BUFF_BUTTON"..j.."Border")
			buttonIcon = getglobal("VCB_BF_BUFF_BUTTON"..j.."Icon")
			buttonCount = getglobal("VCB_BF_BUFF_BUTTON"..j.."Count")
		end
		
		local CF = 0
		if VCB_SAVE["MISC_disable_CF"] then
			button:SetParent(VCB_BF_BUFF_FRAME)
			CF = 1
		end
		
		if (not button.buffIndex) then break end -- for /reload function
		
		if parent == VCB_BF_BUFF_FRAME and (button.buffIndex >= 0 or VCB_BF_DUMMY_MODE or (not VCB_BF_LOCKED)) then
			button:ClearAllPoints()
			
			buttonDuration:ClearAllPoints()
			buttonDuration:SetPoint("TOPLEFT", button, "BOTTOMLEFT", -20, VCB_SAVE["Timer_yoffset"])
			buttonDuration:SetPoint("TOPRIGHT", button, "BOTTOMRIGHT", 20, VCB_SAVE["Timer_yoffset"])
			
			local u = 0
			local o = 0
			if VCB_SAVE["WP_GENERAL_attach"] then
				if VCB_BF_DUMMY_MODE then
					u = 2
					if (not VCB_SAVE["CF_icon_attach"]) then u = u - 1 end
				else
					local hasMainHandEnchant, mainHandExpiration, mainHandCharges, hasOffHandEnchant, offHandExpiration, offHandCharges = GetWeaponEnchantInfo()
					if hasMainHandEnchant then u = u + 1 end
					if hasOffHandEnchant then u = u + 1 end
					if (not VCB_SAVE["CF_icon_attach"]) then u = u - 1 end
				end
				if VCB_SAVE["CF_icon_attach"] then
					VCB_BF_CONSOLIDATED_ICON:ClearAllPoints()
				end
				if a <= (VCB_SAVE["BF_GENERAL_numperrow"]-(3-CF)) then
					o = u
				end
			end
			if VCB_SAVE["BF_GENERAL_verticalmode"] then
				if VCB_SAVE["BF_GENERAL_invertorientation"] then
					if VCB_SAVE["CF_icon_attach"] then
						VCB_BF_CONSOLIDATED_ICON:ClearAllPoints()
						VCB_BF_CONSOLIDATED_ICON:SetPoint("TOPLEFT", VCB_BF_BUFF_FRAME, "BOTTOMLEFT", 0, -(44+VCB_SAVE["BF_GENERAL_padding_v"])*(u-1)) -- WHY -1 ?!
					end
					button:SetPoint("TOPLEFT", VCB_BF_BUFF_FRAME, "BOTTOMLEFT", (36+VCB_SAVE["BF_GENERAL_padding_h"])*floor((a+u-o)/(VCB_SAVE["BF_GENERAL_numperrow"])),-(44+VCB_SAVE["BF_GENERAL_padding_v"])*(a+u) + floor((a+u)/(VCB_SAVE["BF_GENERAL_numperrow"]))*(VCB_SAVE["BF_GENERAL_numperrow"])*(44+VCB_SAVE["BF_GENERAL_padding_v"]) + 50)
				else
					if VCB_SAVE["CF_icon_attach"] then
						VCB_BF_CONSOLIDATED_ICON:ClearAllPoints()
						VCB_BF_CONSOLIDATED_ICON:SetPoint("TOPRIGHT", VCB_BF_BUFF_FRAME, "BOTTOMRIGHT", 0, -(44+VCB_SAVE["BF_GENERAL_padding_v"])*(u-1))
					end
					button:SetPoint("TOPRIGHT", VCB_BF_BUFF_FRAME, "BOTTOMRIGHT", -(36+VCB_SAVE["BF_GENERAL_padding_h"])*floor((a+u-o)/(VCB_SAVE["BF_GENERAL_numperrow"])),-(44+VCB_SAVE["BF_GENERAL_padding_v"])*(a+u) + floor((a+u)/(VCB_SAVE["BF_GENERAL_numperrow"]))*(VCB_SAVE["BF_GENERAL_numperrow"])*(44+VCB_SAVE["BF_GENERAL_padding_v"]) + 50)
				end
			else
				if VCB_SAVE["BF_GENERAL_invertorientation"] then
					if VCB_SAVE["CF_icon_attach"] then
						VCB_BF_CONSOLIDATED_ICON:ClearAllPoints()
						VCB_BF_CONSOLIDATED_ICON:SetPoint("TOPLEFT", (32+VCB_SAVE["BF_GENERAL_padding_h"])*u, 0)
					end
					button:SetPoint("TOPLEFT", VCB_BF_BUFF_FRAME, "TOPLEFT", (32+VCB_SAVE["BF_GENERAL_padding_h"])*(a+u) - floor((a+u-CF)/(VCB_SAVE["BF_GENERAL_numperrow"]))*(VCB_SAVE["BF_GENERAL_numperrow"])*(32+VCB_SAVE["BF_GENERAL_padding_h"]) - (32+VCB_SAVE["BF_GENERAL_padding_h"])*CF,-(44+VCB_SAVE["BF_GENERAL_padding_v"])*floor((a+u-o-CF)/(VCB_SAVE["BF_GENERAL_numperrow"]-o)))
				else
					if VCB_SAVE["CF_icon_attach"] then
						VCB_BF_CONSOLIDATED_ICON:ClearAllPoints()
						VCB_BF_CONSOLIDATED_ICON:SetPoint("TOPRIGHT", -(32+VCB_SAVE["BF_GENERAL_padding_h"])*u, 0)
					end
					button:SetPoint("TOPRIGHT", VCB_BF_BUFF_FRAME, "TOPRIGHT", -(32+VCB_SAVE["BF_GENERAL_padding_h"])*(a+u) + floor((a+u-CF)/(VCB_SAVE["BF_GENERAL_numperrow"]))*(VCB_SAVE["BF_GENERAL_numperrow"])*(32+VCB_SAVE["BF_GENERAL_padding_h"]) + (32+VCB_SAVE["BF_GENERAL_padding_h"])*CF,-(44+VCB_SAVE["BF_GENERAL_padding_v"])*floor((a+u-o-CF)/(VCB_SAVE["BF_GENERAL_numperrow"]-o)))
				end
			end
			if VCB_SAVE["Timer_usecfont"] then
				if VCB_SAVE["BF_TIMER_border"] then
					buttonDuration:SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["BF_TIMER_fontsize"], "OUTLINE")
				else
					buttonDuration:SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["BF_TIMER_fontsize"])
				end

			else
				if VCB_SAVE["BF_TIMER_border"] then
					buttonDuration:SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["BF_TIMER_fontsize"], "OUTLINE")
				else
					buttonDuration:SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["BF_TIMER_fontsize"])
				end
			end
			if VCB_SAVE["Timer_below_60"] and timeLeft < 60 then
				buttonDuration:SetTextColor(VCB_SAVE["Timer_below_60_color_r"],VCB_SAVE["Timer_below_60_color_g"],VCB_SAVE["Timer_below_60_color_b"],VCB_SAVE["BF_TIMER_fontopacity"])
			else
				buttonDuration:SetTextColor(VCB_SAVE["BF_TIMER_fontcolor_r"],VCB_SAVE["BF_TIMER_fontcolor_g"],VCB_SAVE["BF_TIMER_fontcolor_b"],VCB_SAVE["BF_TIMER_fontopacity"])
			end
			if VCB_SAVE["BF_GENERAL_enablebgcolor"] then
				buttonIcon:SetVertexColor(VCB_SAVE["BF_GENERAL_bgcolor_r"],VCB_SAVE["BF_GENERAL_bgcolor_g"],VCB_SAVE["BF_GENERAL_bgcolor_b"],VCB_SAVE["BF_GENERAL_bgopacity"])
			else
				buttonIcon:SetVertexColor(1,1,1,VCB_SAVE["BF_GENERAL_bgopacity"])
			end
			if VCB_SAVE["BF_BORDER_enableborder"] then
				buttonBorder:SetTexture(nil)
				if VCB_SAVE["BF_BORDER_usecustomborder"] then
					buttonBorder:SetTexture(VCB_SAVE["BF_BORDER_customborderpath"])
				else
					buttonBorder:SetTexture(VCB_AURABORDER_ARRAY[VCB_SAVE["BF_BORDER_border"]])
				end
				buttonBorder:SetVertexColor(VCB_SAVE["BF_BORDER_bordercolor_r"],VCB_SAVE["BF_BORDER_bordercolor_g"],VCB_SAVE["BF_BORDER_bordercolor_b"],VCB_SAVE["BF_BORDER_borderopacity"])
			else
				buttonBorder:SetTexture(nil)
			end
			if VCB_SAVE["BF_GENERAL_usecfont"] then
				if VCB_SAVE["BF_GENERAL_enableborder"] then
					buttonCount:SetFont(VCB_SAVE["BF_GENERAL_customfont"], VCB_SAVE["BF_GENERAL_fontsize"], "OUTLINE")
				else
					buttonCount:SetFont(VCB_SAVE["BF_GENERAL_customfont"], VCB_SAVE["BF_GENERAL_fontsize"])
				end
			else
				if VCB_SAVE["BF_GENERAL_enableborder"] then
					buttonCount:SetFont(VCB_SAVE["BF_GENERAL_font"], VCB_SAVE["BF_GENERAL_fontsize"], "OUTLINE")
				else
					buttonCount:SetFont(VCB_SAVE["BF_GENERAL_font"], VCB_SAVE["BF_GENERAL_fontsize"])
				end
			end
			buttonCount:SetVertexColor(VCB_SAVE["BF_GENERAL_fontcolor_r"],VCB_SAVE["BF_GENERAL_fontcolor_g"],VCB_SAVE["BF_GENERAL_fontcolor_b"],VCB_SAVE["BF_GENERAL_fontopacity"])
			buttonCount:ClearAllPoints()
			buttonCount:SetPoint("BOTTOMRIGHT", VCB_SAVE["BF_GENERAL_fontoffset_x"], VCB_SAVE["BF_GENERAL_fontoffset_y"])
			a = a + 1
		end
		
		if VCB_SAVE["CF_BF_invert"] then
			local j = VCB_MAXINDEX.buff-i
			button = getglobal("VCB_BF_BUFF_BUTTON"..j)
			parent = button:GetParent()
			buttonDuration = getglobal("VCB_BF_BUFF_BUTTON"..j.."Duration")
			buttonBorder = getglobal("VCB_BF_BUFF_BUTTON"..j.."Border")
			buttonIcon = getglobal("VCB_BF_BUFF_BUTTON"..j.."Icon")
			buttonCount = getglobal("VCB_BF_BUFF_BUTTON"..j.."Count")
		else
			button = getglobal("VCB_BF_BUFF_BUTTON"..i)
			parent = button:GetParent()
			buttonDuration = getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration")
			buttonBorder = getglobal("VCB_BF_BUFF_BUTTON"..i.."Border")
			buttonIcon = getglobal("VCB_BF_BUFF_BUTTON"..i.."Icon")
			buttonCount = getglobal("VCB_BF_BUFF_BUTTON"..i.."Count")
		end
		
		CF = 0
		if VCB_SAVE["MISC_disable_CF"] then
			button:SetParent(VCB_BF_BUFF_FRAME)
			CF = 1
		end
		if parent == VCB_BF_CONSOLIDATED_BUFFFRAME and (button.buffIndex >= 0 or VCB_BF_DUMMY_MODE or (not VCB_BF_LOCKED)) then
			button:ClearAllPoints()
			if VCB_SAVE["CF_BF_invertorientation"] then
				button:SetPoint("TOPLEFT", VCB_BF_CONSOLIDATED_BUFFFRAME, "TOPLEFT", ((32+VCB_SAVE["CF_AURA_padding_h"])*b)-(24-0.5*VCB_SAVE["CF_AURA_padding_h"]) - (ceil(b/VCB_SAVE["CF_BF_numperrow"]) - 1)*VCB_SAVE["CF_BF_numperrow"]*(32+VCB_SAVE["CF_AURA_padding_h"]),-(44+VCB_SAVE["CF_AURA_padding_v"])*(ceil(b/VCB_SAVE["CF_BF_numperrow"]) - 1)-(6+VCB_SAVE["CF_AURA_padding_v"]))
			else
				button:SetPoint("TOPRIGHT", VCB_BF_CONSOLIDATED_BUFFFRAME, "TOPRIGHT", (-(32+VCB_SAVE["CF_AURA_padding_h"])*b)+(24-0.5*VCB_SAVE["CF_AURA_padding_h"]) + (ceil(b/VCB_SAVE["CF_BF_numperrow"]) - 1)*VCB_SAVE["CF_BF_numperrow"]*(32+VCB_SAVE["CF_AURA_padding_h"]),-(44+VCB_SAVE["CF_AURA_padding_v"])*(ceil(b/VCB_SAVE["CF_BF_numperrow"]) - 1)-(6+VCB_SAVE["CF_AURA_padding_v"]))
			end
			if VCB_SAVE["CF_TIMER_border"] then
				buttonDuration:SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["CF_TIMER_fontsize"], "OUTLINE")
			else
				buttonDuration:SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["CF_TIMER_fontsize"])
			end
			if VCB_SAVE["CF_AURA_enableborder"] then
				if VCB_SAVE["CF_AURA_customborder"] then
					buttonBorder:SetTexture(VCB_SAVE["CF_AURA_customborderpath"])
				else
					buttonBorder:SetTexture(VCB_AURABORDER_ARRAY[VCB_SAVE["CF_AURA_border"]])
				end
			else
				buttonBorder:SetTexture(nil)
			end
			buttonBorder:SetVertexColor(VCB_SAVE["CF_AURA_bordercolor_r"],VCB_SAVE["CF_AURA_bordercolor_g"],VCB_SAVE["CF_AURA_bordercolor_b"],VCB_SAVE["CF_AURA_borderopactiy"])
			if VCB_SAVE["CF_AURA_enablebgcolor"] then
				buttonIcon:SetVertexColor(VCB_SAVE["CF_AURA_bgcolor_r"],VCB_SAVE["CF_AURA_bgcolor_g"],VCB_SAVE["CF_AURA_bgcolor_b"],VCB_SAVE["CF_AURA_bgopacity"])
			else
				buttonIcon:SetVertexColor(1,1,1,VCB_SAVE["CF_AURA_bgcolor_b"])
			end
			if VCB_SAVE["Timer_usecfont"] then
				if VCB_SAVE["CF_TIMER_border"] then
					buttonDuration:SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["CF_BF_scale"]*VCB_SAVE["CF_TIMER_fontsize"], "OUTLINE")
				else
					buttonDuration:SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["CF_BF_scale"]*VCB_SAVE["CF_TIMER_fontsize"])
				end
			else
				if VCB_SAVE["CF_TIMER_border"] then
					buttonDuration:SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["CF_BF_scale"]*VCB_SAVE["CF_TIMER_fontsize"], "OUTLINE")
				else
					buttonDuration:SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["CF_BF_scale"]*VCB_SAVE["CF_TIMER_fontsize"])
				end
			end
			if VCB_SAVE["Timer_below_60"] and timeLeft < 60 then
				buttonDuration:SetTextColor(VCB_SAVE["Timer_below_60_color_r"],VCB_SAVE["Timer_below_60_color_g"],VCB_SAVE["Timer_below_60_color_b"],VCB_SAVE["CF_TIMER_fontopacity"])
			else
				buttonDuration:SetTextColor(VCB_SAVE["CF_TIMER_fontcolor_r"],VCB_SAVE["CF_TIMER_fontcolor_g"],VCB_SAVE["CF_TIMER_fontcolor_b"],VCB_SAVE["CF_TIMER_fontopacity"])
			end
			if VCB_SAVE["CF_AURA_usecfont"] then
				if VCB_SAVE["CF_AURA_enablefontborder"] then
					buttonCount:SetFont(VCB_SAVE["CF_AURA_customfont"], VCB_SAVE["CF_AURA_fontsize"], "OUTLINE")
				else
					buttonCount:SetFont(VCB_SAVE["CF_AURA_customfont"], VCB_SAVE["CF_AURA_fontsize"])
				end
			else
				if VCB_SAVE["CF_AURA_enablefontborder"] then
					buttonCount:SetFont(VCB_SAVE["CF_AURA_font"], VCB_SAVE["CF_AURA_fontsize"], "OUTLINE")
				else
					buttonCount:SetFont(VCB_SAVE["CF_AURA_font"], VCB_SAVE["CF_AURA_fontsize"])
				end
			end
			buttonCount:SetVertexColor(VCB_SAVE["CF_AURA_fontcolor_r"],VCB_SAVE["CF_AURA_fontcolor_g"],VCB_SAVE["CF_AURA_fontcolor_b"],VCB_SAVE["CF_AURA_fontopacity"])
			buttonCount:ClearAllPoints()
			buttonCount:SetPoint("BOTTOMRIGHT", VCB_SAVE["CF_AURA_fontoffset_x"], VCB_SAVE["CF_AURA_fontoffset_y"])
			b = b + 1
		end
	end
	if VCB_SAVE["CF_icon_showpbgrayedout"] or VCB_SAVE["CF_icon_possiblebuffs"] then
		VCB_BF_ADD_GRAYEDOUTICONS(b)
	else
		if grayedIcons then
			for i=0,10 do
				getglobal("GrayedIcon"..i):Hide()
			end
		end
		getglobal("VCB_BF_CONSOLIDATED_ICONCount"):SetText(b-1)
		VCB_BF_ResizeConsolidatedFrame(b-1)
	end
end

function VCB_BF_ADD_GRAYEDOUTICONS(x)
	if (not grayedIcons) then
		for i=0,10 do
			local GIcon = CreateFrame("Button", "GrayedIcon"..i, VCB_BF_CONSOLIDATED_BUFFFRAME, nil) -- Need to create xml template
			GIcon:SetWidth(32)
			GIcon:SetHeight(32)
			
			local t = GIcon:CreateTexture(nil,"BACKGROUND")
			t:SetTexture(classicon[i+1])
			t:SetAllPoints(GIcon)
			t:SetVertexColor(0.3,0.3,0.3,1)
			GIcon.texture = t
			
			GIcon:SetScript("OnEnter", function() VCB_BF_CONSOLIDATED_BUFFFRAME:Show() end)
			GIcon:SetScript("OnLeave", function() VCB_BF_CONSOLIDATED_BUFFFRAME:Hide() end)
			GIcon:Hide()
		end
		grayedIcons = true
	else
		for i=0,10 do
			getglobal("GrayedIcon"..i):Hide()
		end
	end
	
	local buffs = {}
	local tchildren =  { VCB_BF_CONSOLIDATED_BUFFFRAME:GetChildren() }
	local children = {}
	local numPaladins = 0
	local classes = {}
	local b = x
	local gd = 0
	
	-- Filter out grayed out icons
	for _,child in ipairs(tchildren) do
		if (not strfind(child:GetName(), "GrayedIcon")) then
			table.insert(children, child)
		end
	end
	
	-- Fill buffs array
	for _,child in pairs(children) do
		VCB_Tooltip:SetOwner(UIParent)
		VCB_Tooltip:SetPlayerBuff(GetPlayerBuff(child.buffIndex, "HELPFUL"))
		local name = VCB_TooltipTextLeft1:GetText()
		VCB_Tooltip:Hide()
		if (name) then
			table.insert(buffs, strlower(name))
		end
	end
	
	-- Get number of Paladins and different classes of the group / raid
	if UnitInRaid("player") then
		for i=1, 40 do
			local _, englishClass = UnitClass("raid"..i);
			if (not englishClass) then break end
			if (not VCB_Contains(classes, englishClass)) then
				table.insert(classes, englishClass)
			end
			if englishClass == "PALADIN" then numPaladins = numPaladins + 1 end
		end
	else
		for i=1, GetNumPartyMembers() do
			if GetPartyMember(i) then
				local _, englishClass = UnitClass("party"..i);
				if (not VCB_Contains(classes, englishClass)) then
					table.insert(classes, englishClass)
				end
				if englishClass == "PALADIN" then numPaladins = numPaladins + 1 end
			end
		end
	end
	
	-- Add grayed out icons
	-- Druid
	if (not VCB_Contains(buffs, VCB_ABILITY_LOWER_SCRIPT_1)) and (not VCB_Contains(buffs, VCB_ABILITY_LOWER_SCRIPT_2)) and VCB_Contains(classes, "DRUID") and (VCB_Contains(Consolidated_Buffs, VCB_ABILITY_LOWER_SCRIPT_2) or VCB_Contains(Consolidated_Buffs, VCB_ABILITY_LOWER_SCRIPT_1)) then
		if VCB_SAVE["CF_icon_showpbgrayedout"] then
			GrayedIcon0:SetPoint("TOPRIGHT", VCB_BF_CONSOLIDATED_BUFFFRAME, "TOPRIGHT", (-(32+VCB_SAVE["CF_AURA_padding_h"])*x)+(24-0.5*VCB_SAVE["CF_AURA_padding_h"]) + (ceil(x/VCB_SAVE["CF_BF_numperrow"]) - 1)*VCB_SAVE["CF_BF_numperrow"]*(32+VCB_SAVE["CF_AURA_padding_h"]),-(44+VCB_SAVE["CF_AURA_padding_v"])*(ceil(x/VCB_SAVE["CF_BF_numperrow"]) - 1)-(6+VCB_SAVE["CF_AURA_padding_v"]))
			GrayedIcon0:Show()
		end
		x = x + 1
	else
		GrayedIcon0:Hide()
	end
	-- Hunter
	if (not VCB_Contains(buffs, VCB_ABILITY_LOWER_SCRIPT_3)) and VCB_Contains(classes, "HUNTER") and (VCB_Contains(Consolidated_Buffs, VCB_ABILITY_LOWER_SCRIPT_3)) then
		if VCB_SAVE["CF_icon_showpbgrayedout"] then
			GrayedIcon1:SetPoint("TOPRIGHT", VCB_BF_CONSOLIDATED_BUFFFRAME, "TOPRIGHT", (-(32+VCB_SAVE["CF_AURA_padding_h"])*x)+(24-0.5*VCB_SAVE["CF_AURA_padding_h"]) + (ceil(x/VCB_SAVE["CF_BF_numperrow"]) - 1)*VCB_SAVE["CF_BF_numperrow"]*(32+VCB_SAVE["CF_AURA_padding_h"]),-(44+VCB_SAVE["CF_AURA_padding_v"])*(ceil(x/VCB_SAVE["CF_BF_numperrow"]) - 1)-(6+VCB_SAVE["CF_AURA_padding_v"]))
			GrayedIcon1:Show()
		end
		x = x + 1
	else
		GrayedIcon1:Hide()
	end
	-- Paladin
	if (not VCB_Contains(buffs, VCB_ABILITY_LOWER_SCRIPT_4)) and (not VCB_Contains(buffs, VCB_ABILITY_LOWER_SCRIPT_5)) and VCB_Contains(classes, "PALADIN") and (numPaladins > VCB_BF_getNumPaladinBuffs(buffs, VCB_ABILITY_LOWER_SCRIPT_5)) and (VCB_Contains(Consolidated_Buffs, VCB_ABILITY_LOWER_SCRIPT_4) or VCB_Contains(Consolidated_Buffs, VCB_ABILITY_LOWER_SCRIPT_5)) then
		if VCB_SAVE["CF_icon_showpbgrayedout"] then
			GrayedIcon2:SetPoint("TOPRIGHT", VCB_BF_CONSOLIDATED_BUFFFRAME, "TOPRIGHT", (-(32+VCB_SAVE["CF_AURA_padding_h"])*x)+(24-0.5*VCB_SAVE["CF_AURA_padding_h"]) + (ceil(x/VCB_SAVE["CF_BF_numperrow"]) - 1)*VCB_SAVE["CF_BF_numperrow"]*(32+VCB_SAVE["CF_AURA_padding_h"]),-(44+VCB_SAVE["CF_AURA_padding_v"])*(ceil(x/VCB_SAVE["CF_BF_numperrow"]) - 1)-(6+VCB_SAVE["CF_AURA_padding_v"]))
			GrayedIcon2:Show()
		end
		x = x + 1
	else
		GrayedIcon2:Hide()
	end
	if (not VCB_Contains(buffs, VCB_ABILITY_LOWER_SCRIPT_6)) and (not VCB_Contains(buffs, VCB_ABILITY_LOWER_SCRIPT_7)) and VCB_Contains(classes, "PALADIN") and (numPaladins > VCB_BF_getNumPaladinBuffs(buffs, VCB_ABILITY_LOWER_SCRIPT_7)) and (VCB_Contains(Consolidated_Buffs, VCB_ABILITY_LOWER_SCRIPT_6) or VCB_Contains(Consolidated_Buffs, VCB_ABILITY_LOWER_SCRIPT_7)) then
		if VCB_SAVE["CF_icon_showpbgrayedout"] then
			GrayedIcon3:SetPoint("TOPRIGHT", VCB_BF_CONSOLIDATED_BUFFFRAME, "TOPRIGHT", (-(32+VCB_SAVE["CF_AURA_padding_h"])*x)+(24-0.5*VCB_SAVE["CF_AURA_padding_h"]) + (ceil(x/VCB_SAVE["CF_BF_numperrow"]) - 1)*VCB_SAVE["CF_BF_numperrow"]*(32+VCB_SAVE["CF_AURA_padding_h"]),-(44+VCB_SAVE["CF_AURA_padding_v"])*(ceil(x/VCB_SAVE["CF_BF_numperrow"]) - 1)-(6+VCB_SAVE["CF_AURA_padding_v"]))
			GrayedIcon3:Show()
		end
		x = x + 1
	else
		GrayedIcon3:Hide()
	end
	if (not VCB_Contains(buffs, VCB_ABILITY_LOWER_SCRIPT_8)) and (not VCB_Contains(buffs, VCB_ABILITY_LOWER_SCRIPT_9)) and VCB_Contains(classes, "PALADIN") and (numPaladins > VCB_BF_getNumPaladinBuffs(buffs, VCB_ABILITY_LOWER_SCRIPT_9)) and (VCB_Contains(Consolidated_Buffs, VCB_ABILITY_LOWER_SCRIPT_8) or VCB_Contains(Consolidated_Buffs, VCB_ABILITY_LOWER_SCRIPT_9)) then
		if VCB_SAVE["CF_icon_showpbgrayedout"] then
			GrayedIcon4:SetPoint("TOPRIGHT", VCB_BF_CONSOLIDATED_BUFFFRAME, "TOPRIGHT", (-(32+VCB_SAVE["CF_AURA_padding_h"])*x)+(24-0.5*VCB_SAVE["CF_AURA_padding_h"]) + (ceil(x/VCB_SAVE["CF_BF_numperrow"]) - 1)*VCB_SAVE["CF_BF_numperrow"]*(32+VCB_SAVE["CF_AURA_padding_h"]),-(44+VCB_SAVE["CF_AURA_padding_v"])*(ceil(x/VCB_SAVE["CF_BF_numperrow"]) - 1)-(6+VCB_SAVE["CF_AURA_padding_v"]))
			GrayedIcon4:Show()
		end
		x = x + 1
	else
		GrayedIcon4:Hide()
	end
	if (not VCB_Contains(buffs, VCB_ABILITY_LOWER_SCRIPT_10)) and (not VCB_Contains(buffs, VCB_ABILITY_LOWER_SCRIPT_11)) and VCB_Contains(classes, "PALADIN") and (numPaladins > VCB_BF_getNumPaladinBuffs(buffs, VCB_ABILITY_LOWER_SCRIPT_11)) and (VCB_Contains(Consolidated_Buffs, VCB_ABILITY_LOWER_SCRIPT_10) or VCB_Contains(Consolidated_Buffs, VCB_ABILITY_LOWER_SCRIPT_11)) then
		if VCB_SAVE["CF_icon_showpbgrayedout"] then
			GrayedIcon5:SetPoint("TOPRIGHT", VCB_BF_CONSOLIDATED_BUFFFRAME, "TOPRIGHT", (-(32+VCB_SAVE["CF_AURA_padding_h"])*x)+(24-0.5*VCB_SAVE["CF_AURA_padding_h"]) + (ceil(x/VCB_SAVE["CF_BF_numperrow"]) - 1)*VCB_SAVE["CF_BF_numperrow"]*(32+VCB_SAVE["CF_AURA_padding_h"]),-(44+VCB_SAVE["CF_AURA_padding_v"])*(ceil(x/VCB_SAVE["CF_BF_numperrow"]) - 1)-(6+VCB_SAVE["CF_AURA_padding_v"]))
			GrayedIcon5:Show()
		end
		x = x + 1
	else
		GrayedIcon5:Hide()
	end
	if (not VCB_Contains(buffs, VCB_ABILITY_LOWER_SCRIPT_12)) and (not VCB_Contains(buffs, VCB_ABILITY_LOWER_SCRIPT_13)) and VCB_Contains(classes, "PALADIN") and (numPaladins > VCB_BF_getNumPaladinBuffs(buffs, VCB_ABILITY_LOWER_SCRIPT_13)) and (VCB_Contains(Consolidated_Buffs, VCB_ABILITY_LOWER_SCRIPT_12) or VCB_Contains(Consolidated_Buffs, VCB_ABILITY_LOWER_SCRIPT_13)) then
		if VCB_SAVE["CF_icon_showpbgrayedout"] then
			GrayedIcon6:SetPoint("TOPRIGHT", VCB_BF_CONSOLIDATED_BUFFFRAME, "TOPRIGHT", (-(32+VCB_SAVE["CF_AURA_padding_h"])*x)+(24-0.5*VCB_SAVE["CF_AURA_padding_h"]) + (ceil(x/VCB_SAVE["CF_BF_numperrow"]) - 1)*VCB_SAVE["CF_BF_numperrow"]*(32+VCB_SAVE["CF_AURA_padding_h"]),-(44+VCB_SAVE["CF_AURA_padding_v"])*(ceil(x/VCB_SAVE["CF_BF_numperrow"]) - 1)-(6+VCB_SAVE["CF_AURA_padding_v"]))
			GrayedIcon6:Show()
		end
		x = x + 1
	else
		GrayedIcon6:Hide()
	end
	-- Mage
	if (not VCB_Contains(buffs, VCB_ABILITY_LOWER_SCRIPT_14)) and (not VCB_Contains(buffs, VCB_ABILITY_LOWER_SCRIPT_15)) and VCB_Contains(classes, "MAGE") and (VCB_Contains(Consolidated_Buffs, VCB_ABILITY_LOWER_SCRIPT_14) or VCB_Contains(Consolidated_Buffs, VCB_ABILITY_LOWER_SCRIPT_15)) then
		if VCB_SAVE["CF_icon_showpbgrayedout"] then
			GrayedIcon7:SetPoint("TOPRIGHT", VCB_BF_CONSOLIDATED_BUFFFRAME, "TOPRIGHT", (-(32+VCB_SAVE["CF_AURA_padding_h"])*x)+(24-0.5*VCB_SAVE["CF_AURA_padding_h"]) + (ceil(x/VCB_SAVE["CF_BF_numperrow"]) - 1)*VCB_SAVE["CF_BF_numperrow"]*(32+VCB_SAVE["CF_AURA_padding_h"]),-(44+VCB_SAVE["CF_AURA_padding_v"])*(ceil(x/VCB_SAVE["CF_BF_numperrow"]) - 1)-(6+VCB_SAVE["CF_AURA_padding_v"]))
			GrayedIcon7:Show()
		end
		x = x + 1
	else
		GrayedIcon7:Hide()
	end
	-- Priest
	if (not VCB_Contains(buffs, VCB_ABILITY_LOWER_SCRIPT_16)) and (not VCB_Contains(buffs, VCB_ABILITY_LOWER_SCRIPT_17)) and VCB_Contains(classes, "PRIEST") and (VCB_Contains(Consolidated_Buffs, VCB_ABILITY_LOWER_SCRIPT_17) or VCB_Contains(Consolidated_Buffs, VCB_ABILITY_LOWER_SCRIPT_16)) then
		if VCB_SAVE["CF_icon_showpbgrayedout"] then
			GrayedIcon8:SetPoint("TOPRIGHT", VCB_BF_CONSOLIDATED_BUFFFRAME, "TOPRIGHT", (-(32+VCB_SAVE["CF_AURA_padding_h"])*x)+(24-0.5*VCB_SAVE["CF_AURA_padding_h"]) + (ceil(x/VCB_SAVE["CF_BF_numperrow"]) - 1)*VCB_SAVE["CF_BF_numperrow"]*(32+VCB_SAVE["CF_AURA_padding_h"]),-(44+VCB_SAVE["CF_AURA_padding_v"])*(ceil(x/VCB_SAVE["CF_BF_numperrow"]) - 1)-(6+VCB_SAVE["CF_AURA_padding_v"]))
			GrayedIcon8:Show()
		end
		x = x + 1
	else
		GrayedIcon8:Hide()
	end
	if (not VCB_Contains(buffs, VCB_ABILITY_LOWER_SCRIPT_18)) and (not VCB_Contains(buffs, VCB_ABILITY_LOWER_SCRIPT_19)) and VCB_Contains(classes, "PRIEST") and (VCB_Contains(Consolidated_Buffs, VCB_ABILITY_LOWER_SCRIPT_19) or VCB_Contains(Consolidated_Buffs, VCB_ABILITY_LOWER_SCRIPT_18)) then
		if VCB_SAVE["CF_icon_showpbgrayedout"] then
			GrayedIcon9:SetPoint("TOPRIGHT", VCB_BF_CONSOLIDATED_BUFFFRAME, "TOPRIGHT", (-(32+VCB_SAVE["CF_AURA_padding_h"])*x)+(24-0.5*VCB_SAVE["CF_AURA_padding_h"]) + (ceil(x/VCB_SAVE["CF_BF_numperrow"]) - 1)*VCB_SAVE["CF_BF_numperrow"]*(32+VCB_SAVE["CF_AURA_padding_h"]),-(44+VCB_SAVE["CF_AURA_padding_v"])*(ceil(x/VCB_SAVE["CF_BF_numperrow"]) - 1)-(6+VCB_SAVE["CF_AURA_padding_v"]))
			GrayedIcon9:Show()
		end
		x = x + 1
	else
		GrayedIcon9:Hide()
	end
	if (not VCB_Contains(buffs, VCB_ABILITY_LOWER_SCRIPT_20)) and (not VCB_Contains(buffs, VCB_ABILITY_LOWER_SCRIPT_21)) and VCB_Contains(classes, "PRIEST") and (VCB_Contains(Consolidated_Buffs, VCB_ABILITY_LOWER_SCRIPT_21) or VCB_Contains(Consolidated_Buffs, VCB_ABILITY_LOWER_SCRIPT_20)) then
		if VCB_SAVE["CF_icon_showpbgrayedout"] then
			GrayedIcon10:SetPoint("TOPRIGHT", VCB_BF_CONSOLIDATED_BUFFFRAME, "TOPRIGHT", (-(32+VCB_SAVE["CF_AURA_padding_h"])*x)+(24-0.5*VCB_SAVE["CF_AURA_padding_h"]) + (ceil(x/VCB_SAVE["CF_BF_numperrow"]) - 1)*VCB_SAVE["CF_BF_numperrow"]*(32+VCB_SAVE["CF_AURA_padding_h"]),-(44+VCB_SAVE["CF_AURA_padding_v"])*(ceil(x/VCB_SAVE["CF_BF_numperrow"]) - 1)-(6+VCB_SAVE["CF_AURA_padding_v"]))
			GrayedIcon10:Show()
		end
		x = x + 1
	else
		GrayedIcon10:Hide()
	end
	
	if VCB_SAVE["CF_icon_possiblebuffs"] then
		gd = x - b
		local cPB = VCB_BF_GetNumPBuffsInCF()
		if cPB > numPaladins then gd = gd - (cPB - numPaladins) end
		local result = (gd+b-1)
		if result < (b-1) then result = (b-1) end
		
		getglobal("VCB_BF_CONSOLIDATED_ICONCount"):SetText((b-1).."/"..result)
	else
		getglobal("VCB_BF_CONSOLIDATED_ICONCount"):SetText((b-1))
	end
	if VCB_SAVE["CF_icon_showpbgrayedout"] then
		VCB_BF_ResizeConsolidatedFrame(x-1)
	else
		VCB_BF_ResizeConsolidatedFrame(b-1)
	end
end

function VCB_BF_getNumPaladinBuffs(buffs, ext)
	local paladinBuffs = {}
	local count = 0
	paladinBuffs = {
		[1] = VCB_ABILITY_LOWER_SCRIPT_5,
		[2] = VCB_ABILITY_LOWER_SCRIPT_7,
		[3] = VCB_ABILITY_LOWER_SCRIPT_9,
		[4] = VCB_ABILITY_LOWER_SCRIPT_11,
		[5] = VCB_ABILITY_LOWER_SCRIPT_13,
		[6] = VCB_ABILITY_LOWER_SCRIPT_4,
		[7] = VCB_ABILITY_LOWER_SCRIPT_6,
		[8] = VCB_ABILITY_LOWER_SCRIPT_8,
		[9] = VCB_ABILITY_LOWER_SCRIPT_10,
		[10] = VCB_ABILITY_LOWER_SCRIPT_12,
	}
	for i=1,10 do
		if VCB_Contains(buffs, paladinBuffs[i]) and (not strfind(paladinBuffs[i], ext)) then
			count = count + 1
		end
	end
	return count
end

function VCB_BF_GetNumPBuffsInCF()
	local count = 0
	
	if (VCB_Contains(Consolidated_Buffs, VCB_ABILITY_LOWER_SCRIPT_4) or VCB_Contains(Consolidated_Buffs, VCB_ABILITY_LOWER_SCRIPT_5)) then count = count + 1 end
	if (VCB_Contains(Consolidated_Buffs, VCB_ABILITY_LOWER_SCRIPT_6) or VCB_Contains(Consolidated_Buffs, VCB_ABILITY_LOWER_SCRIPT_7)) then count = count + 1 end
	if (VCB_Contains(Consolidated_Buffs, VCB_ABILITY_LOWER_SCRIPT_8) or VCB_Contains(Consolidated_Buffs, VCB_ABILITY_LOWER_SCRIPT_9)) then count = count + 1 end
	if (VCB_Contains(Consolidated_Buffs, VCB_ABILITY_LOWER_SCRIPT_10) or VCB_Contains(Consolidated_Buffs, VCB_ABILITY_LOWER_SCRIPT_11)) then count = count + 1 end
	if (VCB_Contains(Consolidated_Buffs, VCB_ABILITY_LOWER_SCRIPT_12) or VCB_Contains(Consolidated_Buffs, VCB_ABILITY_LOWER_SCRIPT_13)) then count = count + 1 end
	
	return count
end

function VCB_BF_RepositionDebuffs()
	local a = 0
	for i=0,15 do
		local j = 15-i
		local button = getglobal("VCB_BF_DEBUFF_BUTTON"..j)
		if button.buffIndex >= 0 then
			getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
			if VCB_SAVE["DBF_GENERAL_verticalmode"] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(a/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*a + floor(a/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*a + floor(a/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(a/VCB_SAVE["DBF_GENERAL_numperrow"]))
			end
			a = a + 1
		end
	end
end

function VCB_BF_ResizeConsolidatedFrame(i)
	local p = i
	if p >= VCB_SAVE["CF_BF_numperrow"] then p = VCB_SAVE["CF_BF_numperrow"] end
	VCB_BF_CONSOLIDATED_BUFFFRAME:SetWidth(16+2*VCB_SAVE["CF_AURA_padding_h"]+(p*(32+VCB_SAVE["CF_AURA_padding_h"])))
	VCB_BF_CONSOLIDATED_BUFFFRAME:SetHeight(10+2*VCB_SAVE["CF_AURA_padding_v"]+(ceil(i/VCB_SAVE["CF_BF_numperrow"])*(44+VCB_SAVE["CF_AURA_padding_v"])))
	
	if i == 0 then 
		VCB_BF_CONSOLIDATED_BUFFFRAME:SetWidth(0)
		VCB_BF_CONSOLIDATED_BUFFFRAME:SetHeight(0)
		VCB_BF_CONSOLIDATED_BUFFFRAME:Hide()
	end
end

function VCB_BF_BUFF_BUTTON_OnUpdate(elapsed, button)
	local buffIndex, timeLeft, buttonid;
	buffIndex = button.buffIndex;
	timeLeft = GetPlayerBuffTimeLeft(buffIndex);
	buttonid = button:GetName()
	if VCB_SAVE["Timer_flash"] then -- Implements Blizzlike flashing
		if not updater or updater==buttonid then
			updater = buttonid;
			if ( VCB_BuffFrameUpdateTime > 0 ) then
				VCB_BuffFrameUpdateTime = VCB_BuffFrameUpdateTime - elapsed;
			else
				VCB_BuffFrameUpdateTime = VCB_BuffFrameUpdateTime + TOOLTIP_UPDATE_TIME;
			end
		 
			VCB_BuffFrameFlashTime = VCB_BuffFrameFlashTime - 0.85*elapsed;
			if ( VCB_BuffFrameFlashTime < 0 ) then
				local overtime = -VCB_BuffFrameFlashTime;
				if ( VCB_BuffFrameFlashState == 0 ) then
					VCB_BuffFrameFlashState = 1;
					VCB_BuffFrameFlashTime = BUFF_FLASH_TIME_ON;
				else
					VCB_BuffFrameFlashState = 0;
					VCB_BuffFrameFlashTime = BUFF_FLASH_TIME_OFF;
				end
				if ( overtime < VCB_BuffFrameFlashTime ) then
					VCB_BuffFrameFlashTime = VCB_BuffFrameFlashTime - overtime;
				end
			end
			if ( VCB_BuffFrameFlashState == 1 ) then
				VCB_BUFF_ALPHA_VALUE = (BUFF_FLASH_TIME_ON - VCB_BuffFrameFlashTime) / BUFF_FLASH_TIME_ON;
			else
				VCB_BUFF_ALPHA_VALUE = VCB_BuffFrameFlashTime / BUFF_FLASH_TIME_ON;
			end
			VCB_BUFF_ALPHA_VALUE = (VCB_BUFF_ALPHA_VALUE * (1 - BUFF_MIN_ALPHA)) + BUFF_MIN_ALPHA;
		end
		if timeLeft < 30 and timeLeft ~= 0 then
			button:SetAlpha(VCB_BUFF_ALPHA_VALUE);
		else
			button:SetAlpha(VCB_BF_GETBUTTONALPHA(button))
		end
	else
		button:SetAlpha(VCB_BF_GETBUTTONALPHA(button))
	end
	
	button.timeSinceLastUpdate = button.timeSinceLastUpdate + elapsed
	if(button.timeSinceLastUpdate > UPDATETIME) then
		local buffDuration = getglobal(button:GetName().."Duration");
		if ( button.untilCancelled == 1 and (not VCB_BF_DUMMY_MODE)) then
			buffDuration:Hide();
			return;
		end
		
		-- Update duration
		if (timeLeft>0 or VCB_BF_DUMMY_MODE) then
			if VCB_BF_DUMMY_MODE then
				timeLeft = random(1,150)+(random(1,99)/100)
			end
			if VCB_SAVE["Timer_below_60"] and timeLeft < 60 then
				if button.cat == "buff" then
					buffDuration:SetTextColor(VCB_SAVE["Timer_below_60_color_r"],VCB_SAVE["Timer_below_60_color_g"],VCB_SAVE["Timer_below_60_color_b"],VCB_SAVE["BF_TIMER_fontopacity"])
				elseif button.cat == "debuff" then
					buffDuration:SetTextColor(VCB_SAVE["Timer_below_60_color_r"],VCB_SAVE["Timer_below_60_color_g"],VCB_SAVE["Timer_below_60_color_b"],VCB_SAVE["CF_TIMER_fontopacity"])
				end
			else
				if button.cat == "buff" then
					buffDuration:SetTextColor(VCB_SAVE["BF_TIMER_fontcolor_r"],VCB_SAVE["BF_TIMER_fontcolor_g"],VCB_SAVE["BF_TIMER_fontcolor_b"],VCB_SAVE["BF_TIMER_fontopacity"])
				elseif button.cat == "debuff" then
					buffDuration:SetTextColor(VCB_SAVE["DBF_TIMER_fontcolor_r"],VCB_SAVE["DBF_TIMER_fontcolor_g"],VCB_SAVE["DBF_TIMER_fontcolor_b"],VCB_SAVE["CF_TIMER_fontopacity"])
				end
			end
			buffDuration:SetText(VCB_BF_GetDuration(timeLeft))
			buffDuration:Show()
		else
			buffDuration:Hide()
		end
		if ( BuffFrameUpdateTime > 0 ) then
			return;
		end
		if ( VCB_Tooltip:IsOwned(button) ) then
			VCB_Tooltip:SetPlayerBuff(buffIndex);
		end
		button.timeSinceLastUpdate = 0
	end
end

function VCB_BF_GETBUTTONALPHA(button)
	local a = 1
	if button.cat == "debuff" then 
		a = VCB_SAVE["DBF_GENERAL_bgopacity"]
	elseif button.cat == "buff" then
		if button:GetParent() == VCB_BF_BUFF_FRAME then
			a = VCB_SAVE["BF_GENERAL_bgopacity"]
		else
			a = VCB_SAVE["CF_AURA_bgopacity"]
		end
	end
	return a
end

function VCB_BF_BUFF_BUTTON_OnClick(button)
	if button.cat == "buff" then
		CancelPlayerBuff(button.buffIndex)
	end
end

function VCB_BF_WEAPON_BUTTON_OnEvent(bool)
	local hasMainHandEnchant, mainHandExpiration, mainHandCharges, hasOffHandEnchant, offHandExpiration, offHandCharges = GetWeaponEnchantInfo();
	local u = 0
	if hasMainHandEnchant then u = u + 1 end
	if hasOffHandEnchant then u = u + 1 end
	if (not VCB_SAVE["CF_icon_attach"]) then u = u - 1 end
	if VCB_SAVE["WP_GENERAL_attach"] then
		VCB_BF_CONSOLIDATED_ICON:ClearAllPoints()
		if VCB_SAVE["BF_GENERAL_verticalmode"] then
			if VCB_SAVE["BF_GENERAL_invertorientation"] then
				VCB_BF_CONSOLIDATED_ICON:SetPoint("TOPLEFT", VCB_BF_BUFF_FRAME, "BOTTOMLEFT", 0, -(44+VCB_SAVE["BF_GENERAL_padding_v"])*(u-1)) -- WHY?!
			else
				VCB_BF_CONSOLIDATED_ICON:SetPoint("TOPRIGHT", VCB_BF_BUFF_FRAME, "BOTTOMRIGHT", 0, -(44+VCB_SAVE["BF_GENERAL_padding_v"])*(u-1))
			end
		else
			if VCB_SAVE["BF_GENERAL_invertorientation"] then
				VCB_BF_CONSOLIDATED_ICON:SetPoint("TOPLEFT", (32+VCB_SAVE["BF_GENERAL_padding_h"])*u, 0)
			else
				VCB_BF_CONSOLIDATED_ICON:SetPoint("TOPRIGHT", -(32+VCB_SAVE["BF_GENERAL_padding_h"])*u, 0)
			end
		end
	end
	
	if (not hasMainHandEnchant) and hasOffHandEnchant then -- Performance (?)
		VCB_BF_WEAPON_BUTTON0:ClearAllPoints()
		VCB_BF_WEAPON_BUTTON1:ClearAllPoints()
		if VCB_SAVE["WP_GENERAL_attach"] then
			if VCB_SAVE["BF_GENERAL_invertorientation"] then
				if VCB_SAVE["BF_GENERAL_verticalmode"] then
					VCB_BF_WEAPON_BUTTON0:SetPoint("TOPLEFT", VCB_BF_WEAPON_FRAME, "TOPLEFT", 0, -(44+VCB_SAVE["BF_GENERAL_padding_v"]))
					VCB_BF_WEAPON_BUTTON1:SetPoint("TOPLEFT", VCB_BF_WEAPON_FRAME, "TOPLEFT", 0, 0)
				else
					VCB_BF_WEAPON_BUTTON0:SetPoint("TOPLEFT", VCB_BF_WEAPON_FRAME, "TOPLEFT",(32+VCB_SAVE["BF_GENERAL_padding_h"]), 0)
					VCB_BF_WEAPON_BUTTON1:SetPoint("TOPLEFT", VCB_BF_WEAPON_FRAME, "TOPLEFT", 0, 0)
				end
			else
				if VCB_SAVE["BF_GENERAL_verticalmode"] then
					VCB_BF_WEAPON_BUTTON0:SetPoint("TOPRIGHT", VCB_BF_WEAPON_FRAME, "TOPRIGHT", 0, -(44+VCB_SAVE["BF_GENERAL_padding_v"]))
					VCB_BF_WEAPON_BUTTON1:SetPoint("TOPRIGHT", VCB_BF_WEAPON_FRAME, "TOPRIGHT", 0, 0)
				else
					VCB_BF_WEAPON_BUTTON0:SetPoint("TOPRIGHT", VCB_BF_WEAPON_FRAME, "TOPRIGHT",-(32+VCB_SAVE["BF_GENERAL_padding_h"]), 0)
					VCB_BF_WEAPON_BUTTON1:SetPoint("TOPRIGHT", VCB_BF_WEAPON_FRAME, "TOPRIGHT", 0, 0)
				end
			end
		else
			if VCB_SAVE["WP_GENERAL_invert"] then
				VCB_BF_WEAPON_BUTTON1:SetPoint("TOPRIGHT", VCB_BF_WEAPON_FRAME, "TOPRIGHT",-(32+VCB_SAVE["WP_GENERAL_padding_h"]), 0)
				VCB_BF_WEAPON_BUTTON0:SetPoint("TOPRIGHT", VCB_BF_WEAPON_FRAME, "TOPRIGHT", 0, 0)
			else
				VCB_BF_WEAPON_BUTTON0:SetPoint("TOPRIGHT", VCB_BF_WEAPON_FRAME, "TOPRIGHT",-(32+VCB_SAVE["WP_GENERAL_padding_h"]), 0)
				VCB_BF_WEAPON_BUTTON1:SetPoint("TOPRIGHT", VCB_BF_WEAPON_FRAME, "TOPRIGHT", 0, 0)
			end
		end
	else
		VCB_BF_WEAPON_BUTTON0:ClearAllPoints()
		VCB_BF_WEAPON_BUTTON1:ClearAllPoints()
		if VCB_SAVE["WP_GENERAL_attach"] then
			if VCB_SAVE["BF_GENERAL_invertorientation"] then
				if VCB_SAVE["BF_GENERAL_verticalmode"] then
					VCB_BF_WEAPON_BUTTON1:SetPoint("TOPLEFT", VCB_BF_WEAPON_FRAME, "TOPLEFT", 0, -(44+VCB_SAVE["BF_GENERAL_padding_v"]))
					VCB_BF_WEAPON_BUTTON0:SetPoint("TOPLEFT", VCB_BF_WEAPON_FRAME, "TOPLEFT", 0, 0)
				else
					VCB_BF_WEAPON_BUTTON1:SetPoint("TOPLEFT", VCB_BF_WEAPON_FRAME, "TOPLEFT",(32+VCB_SAVE["BF_GENERAL_padding_h"]), 0)
					VCB_BF_WEAPON_BUTTON0:SetPoint("TOPLEFT", VCB_BF_WEAPON_FRAME, "TOPLEFT", 0, 0)
				end
			else
				if VCB_SAVE["BF_GENERAL_verticalmode"] then
					VCB_BF_WEAPON_BUTTON1:SetPoint("TOPRIGHT", VCB_BF_WEAPON_FRAME, "TOPRIGHT", 0, -(44+VCB_SAVE["BF_GENERAL_padding_v"]))
					VCB_BF_WEAPON_BUTTON0:SetPoint("TOPRIGHT", VCB_BF_WEAPON_FRAME, "TOPRIGHT", 0, 0)
				else
					VCB_BF_WEAPON_BUTTON1:SetPoint("TOPRIGHT", VCB_BF_WEAPON_FRAME, "TOPRIGHT",-(32+VCB_SAVE["BF_GENERAL_padding_h"]), 0)
					VCB_BF_WEAPON_BUTTON0:SetPoint("TOPRIGHT", VCB_BF_WEAPON_FRAME, "TOPRIGHT", 0, 0)
				end
			end
		else
			if VCB_SAVE["WP_GENERAL_invert"] then
				VCB_BF_WEAPON_BUTTON0:SetPoint("TOPRIGHT", VCB_BF_WEAPON_FRAME, "TOPRIGHT", -(32+VCB_SAVE["WP_GENERAL_padding_h"]), 0)
				VCB_BF_WEAPON_BUTTON1:SetPoint("TOPRIGHT", VCB_BF_WEAPON_FRAME, "TOPRIGHT", 0, 0)
			else
				VCB_BF_WEAPON_BUTTON1:SetPoint("TOPRIGHT", VCB_BF_WEAPON_FRAME, "TOPRIGHT", -(32+VCB_SAVE["WP_GENERAL_padding_h"]), 0)
				VCB_BF_WEAPON_BUTTON0:SetPoint("TOPRIGHT", VCB_BF_WEAPON_FRAME, "TOPRIGHT", 0, 0)
			end
		end
	end
	if VCB_SAVE["WP_GENERAL_attach"] and (bool) then
		VCB_BF_RepositioningAndResizing()
	end
	VCB_BF_WEAPON_BUTTON_OnUpdate(2.0)
end

function VCB_BF_WEAPON_BUTTON_OnUpdate(elapsed)
	timeSinceWeaponUpdate = timeSinceWeaponUpdate + elapsed
	if(timeSinceWeaponUpdate > UPDATETIME) then
		local hasMainHandEnchant, mainHandExpiration, mainHandCharges, hasOffHandEnchant, offHandExpiration, offHandCharges = GetWeaponEnchantInfo();
		if(hasMainHandEnchant or VCB_BF_DUMMY_MODE) then
			local textureName = GetInventoryItemTexture("player", 16)
			if (VCB_BF_DUMMY_MODE == false) then
				VCB_BF_WEAPON_BUTTON0Icon:SetTexture(textureName)
				VCB_BF_WEAPON_BUTTON0Duration:SetText(VCB_BF_GetDuration(mainHandExpiration/1000))
			else
				VCB_BF_WEAPON_BUTTON0Duration:SetText(VCB_BF_GetDuration(random(1,150)+(random(1,99)/100)))
				mainHandCharges = 100
			end
			VCB_BF_WEAPON_BUTTON0Border:SetVertexColor(VCB_SAVE["WP_BORDER_bordercolor_r"],VCB_SAVE["WP_BORDER_bordercolor_g"],VCB_SAVE["WP_BORDER_bordercolor_b"],VCB_SAVE["WP_BORDER_borderopacity"])
			VCB_BF_WEAPON_BUTTON0Duration:Show()
			if(mainHandCharges > 0) then
				VCB_BF_WEAPON_BUTTON0Count:SetText(mainHandCharges)
				VCB_BF_WEAPON_BUTTON0Count:Show()
			else
				VCB_BF_WEAPON_BUTTON0Count:Hide()
			end
			VCB_BF_WEAPON_BUTTON0:SetID(16)
			VCB_BF_WEAPON_BUTTON0:Show()
		elseif (VCB_BF_LOCKED) then
			if (VCB_BF_DUMMY_MODE == false) then
				VCB_BF_WEAPON_BUTTON0:Hide()
			end
		else
			VCB_BF_WEAPON_BUTTON0Icon:SetTexture(nil)
		end

		if(hasOffHandEnchant or VCB_BF_DUMMY_MODE) then
			local textureName = GetInventoryItemTexture("player", 17)
			if (VCB_BF_DUMMY_MODE == false) then
				VCB_BF_WEAPON_BUTTON1Icon:SetTexture(textureName)
				VCB_BF_WEAPON_BUTTON1Duration:SetText(VCB_BF_GetDuration(offHandExpiration/1000))
			else
				VCB_BF_WEAPON_BUTTON1Duration:SetText(VCB_BF_GetDuration(random(1,15)+(random(1,99)/100)))
				offHandCharges = 100
			end
			VCB_BF_WEAPON_BUTTON1Border:SetVertexColor(VCB_SAVE["WP_BORDER_bordercolor_r"],VCB_SAVE["WP_BORDER_bordercolor_g"],VCB_SAVE["WP_BORDER_bordercolor_b"],VCB_SAVE["WP_BORDER_borderopacity"])
			VCB_BF_WEAPON_BUTTON1Duration:Show()
			if(offHandCharges > 0) then
				VCB_BF_WEAPON_BUTTON1Count:SetText(offHandCharges)
				VCB_BF_WEAPON_BUTTON1Count:Show()
			else
				VCB_BF_WEAPON_BUTTON1Count:Hide()
			end
			VCB_BF_WEAPON_BUTTON1:SetID(17)
			VCB_BF_WEAPON_BUTTON1:Show()
		elseif(VCB_BF_LOCKED) then
			if (VCB_BF_DUMMY_MODE == false) then
				VCB_BF_WEAPON_BUTTON1:Hide()
			end
		else
			VCB_BF_WEAPON_BUTTON1Icon:SetTexture(nil)
		end

		timeSinceWeaponUpdate = 0
	end
end

function VCB_BF_GetDuration(timeLeft)
	if VCB_IS_LOADED then
		local suffix = {
			[1] = " s",
			[2] = " m",
			[3] = " h"
		}
		if VCB_SAVE["Timer_disableUnit"] then
			suffix = {
				[1] = "",
				[2] = "",
				[3] = ""
			}
		end
		if VCB_SAVE["Timer_minutes"] and timeLeft > 60 then
			if VCB_SAVE["Timer_hours"] and timeLeft > 3600 then
				if VCB_SAVE["Timer_hours_convert"] then
					if VCB_SAVE["Timer_minutes_convert"] then
						if VCB_SAVE["Timer_round"] then
							return floor(timeLeft/3600)..":"..ceil(timeLeft)-3600*ceil(timeLeft/3600)..":"..ceil(timeLeft)-60*ceil(timeLeft/60)..suffix[3]
						else
							return floor(timeLeft/3600)..":"..floor(timeLeft)-3600*floor(timeLeft/3600)..":"..floor(timeLeft)-60*floor(timeLeft/60)..suffix[3]
						end
					else
						if VCB_SAVE["Timer_round"] then
							return floor(timeLeft/3600)..":"..ceil(timeLeft)-3600*ceil(timeLeft/3600)..suffix[3]
						else
							return floor(timeLeft/3600)..":"..floor(timeLeft)-3600*floor(timeLeft/3600)..suffix[3]
						end
					end
				else
					if VCB_SAVE["Timer_minutes_convert"] then
						if VCB_SAVE["Timer_round"] then
							return floor(timeLeft/60)..":"..ceil(timeLeft)-60*ceil(timeLeft/60)..suffix[3]
						else
							return floor(timeLeft/60)..":"..floor(timeLeft)-60*floor(timeLeft/60)..suffix[3]
						end
					else
						if VCB_SAVE["Timer_round"] then
							return ceil(timeLeft/3600)..suffix[3]
						else
							return floor(timeLeft/3600)..suffix[3]
						end
					end
				end
			else
				if VCB_SAVE["Timer_minutes_convert"] then
					if VCB_SAVE["Timer_hours_convert"] then
						if VCB_SAVE["Timer_round"] then
							return "0:"..ceil(timeLeft/60)..":"..ceil(timeLeft)-60*ceil(timeLeft/60)..suffix[3]
						else
							return "0:"..floor(timeLeft/60)..":"..floor(timeLeft)-60*floor(timeLeft/60)..suffix[3]
						end
					else
						if VCB_SAVE["Timer_round"] then
							return ceil(timeLeft/60)..":"..ceil(timeLeft)-60*ceil(timeLeft/60)..suffix[2]
						else
							return floor(timeLeft/60)..":"..floor(timeLeft)-60*floor(timeLeft/60)..suffix[2]
						end
					end
				else
					if VCB_SAVE["Timer_hours_convert"] then
						if VCB_SAVE["Timer_round"] then
							return "0:"..ceil(timeLeft/60)..suffix[3]
						else
							return "0:"..floor(timeLeft/60)..suffix[3]
						end
					else
						if VCB_SAVE["Timer_round"] then
							return ceil(timeLeft/60)..suffix[2]
						else
							return floor(timeLeft/60)..suffix[2]
						end
					end
				end
			end
		else
			if VCB_SAVE["Timer_minutes_convert"] then
				if timeLeft >=10 then
					if VCB_SAVE["Timer_tenth"] then
						if VCB_SAVE["Timer_round"] then
							return "0:"..ceil(timeLeft)..":"..100*timeLeft-100*floor(timeLeft)..suffix[2]
						else
							return "0:"..floor(timeLeft)..":"..100*timeLeft-100*floor(timeLeft)..suffix[2]
						end
					else
						if VCB_SAVE["Timer_round"] then
							return "0:"..ceil(timeLeft)..suffix[2]
						else
							return "0:"..floor(timeLeft)..suffix[2]
						end
					end
				else
					if VCB_SAVE["Timer_tenth"] then
						if VCB_SAVE["Timer_round"] then
							return "0:0"..ceil(timeLeft)..":"..ceil(100*timeLeft-100*floor(timeLeft))..suffix[2]
						else
							return "0:0"..floor(timeLeft)..":"..floor(100*timeLeft-100*floor(timeLeft))..suffix[2]
						end
					else
						if VCB_SAVE["Timer_round"] then
							return "0:0"..ceil(timeLeft)..suffix[2]
						else
							return "0:0"..floor(timeLeft)..suffix[2]
						end
					end
				end
			else
				if VCB_SAVE["Timer_tenth"] then
					if VCB_SAVE["Timer_round"] then
						return ceil(timeLeft)..":"..ceil(100*timeLeft-100*floor(timeLeft))..suffix[1]
					else
						return floor(timeLeft)..":"..floor(100*timeLeft-100*floor(timeLeft))..suffix[1]
					end
				else
					if VCB_SAVE["Timer_round"] then
						return ceil(timeLeft)..suffix[1]
					else
						return floor(timeLeft)..suffix[1]
					end
				end
			end
		end
	else
		if suffix then
			if timeLeft > 60 then
				return floor(timeLeft/60)..suffix[2]
			else
				return floor(timeLeft)..suffix[1]
			end
		end
	end
end

function VCB_BF_ToggleLock()
	if (not VCB_BF_LOCKED) then
		VCB_BF_LOCKED = true
		VCB_BF_Lock(true)
		VCB_SendMessage(VCB_LOCKED_FRAMES)
		VCB_SAVEFRAMEPOS()
	else
		VCB_SAVEFRAMEPOS()
		VCB_BF_LOCKED = false
		VCB_BF_Lock(false)
		VCB_SendMessage(VCB_UNLOCKED_FRAMES)
	end
end

function VCB_BF_Lock(lock)
	for cat, templateName in pairs(VCB_BUTTONNAME) do
		for i=VCB_MININDEX[cat], VCB_MAXINDEX[cat] do
			if (lock) then
				getglobal(templateName..i.."_Ghost_Label"):Hide()
				getglobal(templateName..i.."_Ghost_Texture"):Hide()
			else
				getglobal(templateName..i):Show()
				getglobal(templateName..i.."_Ghost_Label"):Show()
				getglobal(templateName..i.."_Ghost_Texture"):Show()
			end
		end
	end
	VCB_BF_RepositioningAndResizing()
end

function VCB_BF_DummyConfigMode_Enable()
	VCB_BF_DUMMY_MODE = true
	for cat, templateName in pairs(VCB_BUTTONNAME) do
		for i=VCB_MININDEX[cat], VCB_MAXINDEX[cat] do
			local button = getglobal(templateName..i)
			local icon = getglobal(templateName..i.."Icon")
			local buffDuration = getglobal(templateName..i.."Duration")
			local border = getglobal(templateName..i.."Border")
			local count = getglobal(templateName..i.."Count")
			icon:SetTexture("Interface\\AddOns\\VCB\\images\\dummy.tga")
			if i < 7 and cat == "buff" and (not VCB_SAVE["MISC_disable_CF"]) then
				button:SetParent(VCB_BF_CONSOLIDATED_BUFFFRAME)
			end
			if cat == "buff" then
				if button:GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
					border:SetVertexColor(VCB_SAVE["CF_AURA_bordercolor_r"],VCB_SAVE["CF_AURA_bordercolor_g"],VCB_SAVE["CF_AURA_bordercolor_b"],VCB_SAVE["CF_AURA_borderopacity"])
				elseif button:GetParent() == VCB_BF_BUFF_FRAME then
					border:SetVertexColor(VCB_SAVE["BF_BORDER_bordercolor_r"],VCB_SAVE["BF_BORDER_bordercolor_g"],VCB_SAVE["BF_BORDER_bordercolor_b"],VCB_SAVE["BF_BORDER_borderopacity"])
				end
			elseif cat == "debuff" and VCB_SAVE["DBF_BORDER_enableborder"] then
				if VCB_SAVE["DBF_GENERAL_invert"] then
					local j = 15-i
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
					if VCB_SAVE["DBF_GENERAL_invertorientation"] then
						if VCB_SAVE["DBF_GENERAL_verticalmode"] then
							getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
						else
							getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*i - floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
						end
					else
						if VCB_SAVE["DBF_GENERAL_verticalmode"] then
							getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
						else
							getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
						end
					end
				end
				if i < 3 then
					border:SetVertexColor(VCB_SAVE["DBF_BORDER_nonecolor_r"],VCB_SAVE["DBF_BORDER_nonecolor_g"],VCB_SAVE["DBF_BORDER_nonecolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
				elseif i >= 3 and i < 6 then
					border:SetVertexColor(VCB_SAVE["DBF_BORDER_poisoncolor_r"],VCB_SAVE["DBF_BORDER_poisoncolor_g"],VCB_SAVE["DBF_BORDER_poisoncolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
				elseif i >= 6 and i < 9 then
					border:SetVertexColor(VCB_SAVE["DBF_BORDER_magiccolor_r"],VCB_SAVE["DBF_BORDER_magiccolor_g"],VCB_SAVE["DBF_BORDER_magiccolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
				elseif i >= 9 and i < 12 then
					border:SetVertexColor(VCB_SAVE["DBF_BORDER_cursecolor_r"],VCB_SAVE["DBF_BORDER_cursecolor_g"],VCB_SAVE["DBF_BORDER_cursecolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
				else
					border:SetVertexColor(VCB_SAVE["DBF_BORDER_diseasecolor_r"],VCB_SAVE["DBF_BORDER_diseasecolor_g"],VCB_SAVE["DBF_BORDER_diseasecolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
				end
			end
			count:SetText(5)
			count:Show()
			button:Show()
		end
	end
	VCB_BF_RepositioningAndResizing()
end

function VCB_BF_DummyConfigMode_Disable()
	VCB_BF_DUMMY_MODE = false
	for cat, templateName in pairs(VCB_BUTTONNAME) do
		for i=VCB_MININDEX[cat], VCB_MAXINDEX[cat] do
			VCB_BF_BUFF_BUTTON_Update(getglobal(templateName..i))
		end
	end
	VCB_BF_WEAPON_BUTTON_OnEvent(false)
	VCB_BF_RepositioningAndResizing()
end

function VCB_BF_updateBuffs()
	for i=0,VCB_MAXINDEX.buff do
		VCB_BF_BUFF_BUTTON_Update(getglobal("VCB_BF_BUFF_BUTTON"..i))
	end
end

function VCB_BF_ConsolidatedAdd(name)
	if not VCB_Contains(Consolidated_Buffs, name) then
		table.insert(Consolidated_Buffs, name)
		VCB_SendMessage(name..VCB_HAS_BEEN_ADDED)
	else
		VCB_SendMessage(name..VCB_IS_ALREADY_IN_LIST)
	end
	VCB_BF_updateBuffs()
end

function VCB_BF_ConsolidatedRemove(name)
	if VCB_Contains(Consolidated_Buffs, name) then
		table.remove(Consolidated_Buffs, VCB_Table_GetKeys(Consolidated_Buffs, name))
		VCB_SendMessage(name..VCB_HAS_BEEN_REMOVED)
	else
		VCB_SendMessage(name..VCB_IS_NOT_IN_LIST)
	end
	VCB_BF_updateBuffs()
end

function VCB_BF_RemoveAllFromConsolidate()
	Consolidated_Buffs = {}
	VCB_SendMessage(VCB_CB_LIST_EMPTIED)
	VCB_BF_updateBuffs()
end

function VCB_BF_AddToBanned(name) 
	if not VCB_Contains(Banned_Buffs, name) then
		table.insert(Banned_Buffs, name)
		VCB_SendMessage(name..VCB_HAS_BEEN_ADDED)
	else
		VCB_SendMessage(name..VCB_IS_ALREADY_IN_LIST)
	end
	VCB_BF_updateBuffs()
end

function VCB_BF_RemoveFromBanned(name)
	if VCB_Contains(Banned_Buffs, name) then
		table.remove(Banned_Buffs, VCB_Table_GetKeys(Banned_Buffs, name))
		VCB_SendMessage(name..VCB_HAS_BEEN_REMOVED)
	else
		VCB_SendMessage(name..VCB_IS_NOT_IN_LIST)
	end
end

function VCB_BF_RemoveAllFromBanned()
	Banned_Buffs = {}
	VCB_SendMessage(VCB_BB_LIST_EMPTIED)
end