--Global Variables
VCB_BUTTONNAME = {buff="VCB_BF_BUFF_BUTTON", debuff="VCB_BF_DEBUFF_BUTTON", weapon = "VCB_BF_WEAPON_BUTTON"}
VCB_MININDEX = {buff=0, debuff=0, weapon=0}
VCB_MAXINDEX = {buff=31, debuff=15, weapon=1}

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

local timeSinceWeaponUpdate = 0
local timeSinceBuffUpdate = 0

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
			VCB_BF_BUFF_BUTTON_Update(button)
		end
	end
end

function VCB_BF_BUFF_BUTTON_Update(button)
	if (VCB_BF_DUMMY_MODE == false) then
	local hackfix = false

	local buffIndex, untilCancelled = GetPlayerBuff(button:GetID(), button.buffFilter);
 	button.buffIndex = buffIndex;
 	button.untilCancelled = untilCancelled;
 	local timeLeft = GetPlayerBuffTimeLeft(buffIndex)
 	local buffDuration = getglobal(button:GetName().."Duration");
 	buffDuration:SetText(VCB_BF_GetDuration(timeLeft))
	
	if Consolidated_Buffs ~= nil and button:GetParent() ~= VCB_BF_DEBUFF_FRAME then
		GameTooltip:SetOwner(button)
		GameTooltip:SetPlayerBuff(buffIndex)
		local name = GameTooltipTextLeft1:GetText()
		for e = 1, VCB_tablelength(Consolidated_Buffs) do
			if not Consolidated_Buffs[e] or name == nil then break end
			if strfind(strlower(Consolidated_Buffs[e]), strlower(name)) then
				button:SetParent(VCB_BF_CONSOLIDATED_BUFFFRAME)
				hackfix = true
			end
		end
		if (not hackfix) then
			button:SetParent(VCB_BF_BUFF_FRAME)
		end
		
		-- Banned Buffs implementation
		if Banned_Buffs ~= nil then
			for p = 1, VCB_tablelength(Banned_Buffs) do
				if not Banned_Buffs[p] or name == nil then break end
				if ( strfind(strlower(Banned_Buffs[p]), strlower(name)) ) then
					CancelPlayerBuff(button:GetID())
					VCB_SendMessage(name.." has been cancelled!")
					break
				end
			end
		end
	end
	
	if ( buffIndex < 0 and VCB_BF_LOCKED ) then
		button:Hide();
		buffDuration:Hide();
 	else
 		button:SetAlpha(1.0);
 		button:Show();
 		if ( SHOW_BUFF_DURATIONS == "1" and timeLeft > 0) then
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
 	if ( debuffType ) then
 		color = DebuffTypeColor[debuffType];
 		color.a=1
 	elseif(buffIndex >= 0) then
 		color = DebuffTypeColor["none"];
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
 	if ( debuffSlot ) then
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
	
	if VCB_IS_LOADED then
		VCB_BF_WEAPON_BUTTON_OnUpdate(2.0)
		VCB_BF_RepositioningAndResizing()
	end
	end
end

function VCB_BF_RepositioningAndResizing()
	local a = 1
	local b = 1
	for i=0, 31 do
		local button = getglobal("VCB_BF_BUFF_BUTTON"..i)
		if (button.buffIndex or VCB_BF_DUMMY_MODE) then
			local parent = button:GetParent()
			local buttonDuration = getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration")
			local buttonBorder = getglobal("VCB_BF_BUFF_BUTTON"..i.."Border")
			local buttonIcon = getglobal("VCB_BF_BUFF_BUTTON"..i.."Icon")
			if parent == VCB_BF_BUFF_FRAME then
				button:ClearAllPoints()
				local u = 0
				local o = 0
				if VCB_SAVE["WP_GENERAL_attach"] then
					if VCB_BF_DUMMY_MODE then
						u = 2
					else
						local hasMainHandEnchant, mainHandExpiration, mainHandCharges, hasOffHandEnchant, offHandExpiration, offHandCharges = GetWeaponEnchantInfo()
						if hasMainHandEnchant then u = u + 1 end
						if hasOffHandEnchant then u = u + 1 end
					end
					VCB_BF_CONSOLIDATED_ICON:ClearAllPoints()
					if a <= (VCB_SAVE["BF_GENERAL_numperrow"]-3) then
						o = u
					end
				end
				if VCB_SAVE["BF_GENERAL_verticalmode"] then
					VCB_BF_CONSOLIDATED_ICON:SetPoint("TOPRIGHT", 0, -(44+VCB_SAVE["BF_GENERAL_padding_v"])*u)
					button:SetPoint("TOP", VCB_BF_BUFF_FRAME, "BOTTOM", -(36+VCB_SAVE["BF_GENERAL_padding_h"])*floor((a+u-o)/(VCB_SAVE["BF_GENERAL_numperrow"])) + 10,-(44+VCB_SAVE["BF_GENERAL_padding_v"])*(a+u) + floor((a+u)/(VCB_SAVE["BF_GENERAL_numperrow"]))*(VCB_SAVE["BF_GENERAL_numperrow"])*(44+VCB_SAVE["BF_GENERAL_padding_v"]) + 50)
				else
					VCB_BF_CONSOLIDATED_ICON:SetPoint("TOPRIGHT", -(32+VCB_SAVE["BF_GENERAL_padding_h"])*u, 0)
					button:SetPoint("TOPRIGHT", VCB_BF_BUFF_FRAME, "TOPRIGHT", -(32+VCB_SAVE["BF_GENERAL_padding_h"])*(a+u) + floor((a+u)/(VCB_SAVE["BF_GENERAL_numperrow"]))*VCB_SAVE["BF_GENERAL_numperrow"]*(32+VCB_SAVE["BF_GENERAL_padding_h"]),-(44+VCB_SAVE["BF_GENERAL_padding_v"])*floor((a+u-o)/(VCB_SAVE["BF_GENERAL_numperrow"]-o)))
				end
				if VCB_SAVE["BF_TIMER_border"] then
					buttonDuration:SetFont("Fonts\\"..VCB_SAVE["Timer_font"], VCB_SAVE["BF_TIMER_fontsize"], "OUTLINE")
				else
					buttonDuration:SetFont("Fonts\\"..VCB_SAVE["Timer_font"], VCB_SAVE["BF_TIMER_fontsize"])
				end
				buttonDuration:SetTextColor(VCB_SAVE["BF_TIMER_fontcolor_r"],VCB_SAVE["BF_TIMER_fontcolor_g"],VCB_SAVE["BF_TIMER_fontcolor_b"],VCB_SAVE["BF_TIMER_fontopacity"])
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
				a = a + 1
			else
				button:ClearAllPoints()
				if VCB_SAVE["CF_BF_invert"] then
					button:SetPoint("TOPLEFT", VCB_BF_CONSOLIDATED_BUFFFRAME, "TOPLEFT", ((32+VCB_SAVE["CF_AURA_padding_h"])*b)-(24-0.5*VCB_SAVE["CF_AURA_padding_h"]) - (ceil(b/VCB_SAVE["CF_BF_numperrow"]) - 1)*VCB_SAVE["CF_BF_numperrow"]*(32+VCB_SAVE["CF_AURA_padding_h"]),-(44+VCB_SAVE["CF_AURA_padding_v"])*(ceil(b/VCB_SAVE["CF_BF_numperrow"]) - 1)-(6+VCB_SAVE["CF_AURA_padding_v"]))
				else
					button:SetPoint("TOPRIGHT", VCB_BF_CONSOLIDATED_BUFFFRAME, "TOPRIGHT", (-(32+VCB_SAVE["CF_AURA_padding_h"])*b)+(24-0.5*VCB_SAVE["CF_AURA_padding_h"]) + (ceil(b/VCB_SAVE["CF_BF_numperrow"]) - 1)*VCB_SAVE["CF_BF_numperrow"]*(32+VCB_SAVE["CF_AURA_padding_h"]),-(44+VCB_SAVE["CF_AURA_padding_v"])*(ceil(b/VCB_SAVE["CF_BF_numperrow"]) - 1)-(6+VCB_SAVE["CF_AURA_padding_v"]))
				end
				if VCB_SAVE["CF_TIMER_border"] then
					buttonDuration:SetFont("Fonts\\"..VCB_SAVE["Timer_font"], VCB_SAVE["CF_TIMER_fontsize"], "OUTLINE")
				else
					buttonDuration:SetFont("Fonts\\"..VCB_SAVE["Timer_font"], VCB_SAVE["CF_TIMER_fontsize"])
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
					buttonIcon:SetVertexColor(VCB_SAVE["CF_AURA_bgcolor_r"],VCB_SAVE["CF_AURA_bgcolor_g"],VCB_SAVE["CF_AURA_bgcolor_b"])
				else
					buttonIcon:SetVertexColor(1,1,1)
				end
				if VCB_SAVE["CF_TIMER_border"] then
					buttonDuration:SetFont("Fonts\\"..VCB_SAVE["Timer_font"], VCB_SAVE["CF_BF_scale"]*VCB_SAVE["CF_TIMER_fontsize"], "OUTLINE")
				else
					buttonDuration:SetFont("Fonts\\"..VCB_SAVE["Timer_font"], VCB_SAVE["CF_BF_scale"]*VCB_SAVE["CF_TIMER_fontsize"])
				end
				buttonDuration:SetTextColor(VCB_SAVE["CF_TIMER_fontcolor_r"],VCB_SAVE["CF_TIMER_fontcolor_g"],VCB_SAVE["CF_TIMER_fontcolor_b"],VCB_SAVE["CF_TIMER_fontopacity"])
				b = b + 1
			end
		else
			break
		end
	end
	getglobal("VCB_BF_CONSOLIDATED_ICONCount"):SetText(b-1)
	VCB_BF_ResizeConsolidatedFrame(b-1)
end

function VCB_BF_ResizeConsolidatedFrame(i)
	local p = i
	if p >= VCB_SAVE["CF_BF_numperrow"] then p = VCB_SAVE["CF_BF_numperrow"] end
	VCB_BF_CONSOLIDATED_BUFFFRAME:SetWidth(16+2*VCB_SAVE["CF_AURA_padding_h"]+(p*(32+VCB_SAVE["CF_AURA_padding_h"])))
	VCB_BF_CONSOLIDATED_BUFFFRAME:SetHeight(10+2*VCB_SAVE["CF_AURA_padding_v"]+(ceil(i/VCB_SAVE["CF_BF_numperrow"])*(44+VCB_SAVE["CF_AURA_padding_v"])))
end

function VCB_BF_BUFF_BUTTON_OnUpdate(elapsed, button)
	button.timeSinceLastUpdate = button.timeSinceLastUpdate + elapsed
	if(button.timeSinceLastUpdate > UPDATETIME) then
		local buffDuration = getglobal(button:GetName().."Duration");
		if ( button.untilCancelled == 1 and (not VCB_BF_DUMMY_MODE)) then
			buffDuration:Hide();
			return;
		end
	
		local buffIndex = button.buffIndex;
		local timeLeft = GetPlayerBuffTimeLeft(buffIndex);
		--if ( timeLeft < BUFF_WARNING_TIME and VCB_BF_LOCKED ) then -- later potential -> and self.db.profile.flashes[button.cat]
			--UIFrameFlash(button, 2, 2, timeLeft, false, 0, 0) -- Causing Buttons to disappear
		--else
			--UIFrameFlashRemoveFrame(button)
			--button:SetAlpha(1.0);
		--end
	
		-- Update duration
		if (timeLeft>0 or VCB_BF_DUMMY_MODE) then
			if VCB_BF_DUMMY_MODE then
				buffDuration:SetText(VCB_BF_GetDuration(random(1,150)+(random(1,99)/100)))
			else
				buffDuration:SetText(VCB_BF_GetDuration(timeLeft))
			end
			buffDuration:Show()
		else
			buffDuration:Hide()
		end
		if ( BuffFrameUpdateTime > 0 ) then
			return;
		end
		if ( GameTooltip:IsOwned(button) ) then
			GameTooltip:SetPlayerBuff(buffIndex);
		end
		button.timeSinceLastUpdate = 0
	end
end

function VCB_BF_BUFF_BUTTON_OnClick(button)
	if button.cat == "buff" then
		CancelPlayerBuff(button:GetID())
	end
end

function VCB_BF_WEAPON_BUTTON_OnUpdate(elapsed)
	timeSinceWeaponUpdate = timeSinceWeaponUpdate + elapsed
	if(timeSinceWeaponUpdate > UPDATETIME) then
		local hasMainHandEnchant, mainHandExpiration, mainHandCharges, hasOffHandEnchant, offHandExpiration, offHandCharges = GetWeaponEnchantInfo();
		if (not hasMainHandEnchant) and hasOffHandEnchant and VCB_IS_LOADED then -- Performance (?)
			VCB_BF_WEAPON_BUTTON0:ClearAllPoints()
			VCB_BF_WEAPON_BUTTON1:ClearAllPoints()
			if VCB_SAVE["WP_GENERAL_attach"] then
				VCB_BF_WEAPON_BUTTON0:SetPoint("TOPRIGHT", -(32+VCB_SAVE["BF_GENERAL_padding_h"]), 0)
			else
				VCB_BF_WEAPON_BUTTON0:SetPoint("TOPRIGHT", -(32+VCB_SAVE["WP_GENERAL_padding_h"]), 0)
			end
			VCB_BF_WEAPON_BUTTON1:SetPoint("TOPRIGHT", 0, 0)
		else
			VCB_BF_WEAPON_BUTTON0:ClearAllPoints()
			VCB_BF_WEAPON_BUTTON1:ClearAllPoints()
			if VCB_SAVE["WP_GENERAL_attach"] then
				VCB_BF_WEAPON_BUTTON1:SetPoint("TOPRIGHT", -(32+VCB_SAVE["BF_GENERAL_padding_h"]), 0)
			else
				VCB_BF_WEAPON_BUTTON1:SetPoint("TOPRIGHT", -(32+VCB_SAVE["WP_GENERAL_padding_h"]), 0)
			end
			VCB_BF_WEAPON_BUTTON0:SetPoint("TOPRIGHT", 0, 0)
		end
		if(hasMainHandEnchant or VCB_BF_DUMMY_MODE) then
			local textureName = GetInventoryItemTexture("player", 16)
			if (VCB_BF_DUMMY_MODE == false) then
				VCB_BF_WEAPON_BUTTON0Icon:SetTexture(textureName)
				VCB_BF_WEAPON_BUTTON0Duration:SetText(VCB_BF_GetDuration(mainHandExpiration/1000))
			else
				VCB_BF_WEAPON_BUTTON0Duration:SetText(VCB_BF_GetDuration(random(1,150)+(random(1,99)/100)))
				mainHandCharges = 100
			end
			VCB_BF_WEAPON_BUTTON0Border:SetVertexColor(0.2, 0.2, 0.8, 1)
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
			VCB_BF_WEAPON_BUTTON1Border:SetVertexColor(0.2, 0.2, 0.8, 1)
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
		if VCB_SAVE["Timer_minutes"] and timeLeft > 60 then
			if VCB_SAVE["Timer_hours"] and timeLeft > 3600 then
				if VCB_SAVE["Timer_hours_convert"] then
					if VCB_SAVE["Timer_minutes_convert"] then
						if VCB_SAVE["Timer_round"] then
							return floor(timeLeft/3600)..":"..ceil(timeLeft)-3600*ceil(timeLeft/3600)..":"..ceil(timeLeft)-60*ceil(timeLeft/60).."h"
						else
							return floor(timeLeft/3600)..":"..floor(timeLeft)-3600*floor(timeLeft/3600)..":"..floor(timeLeft)-60*floor(timeLeft/60).."h"
						end
					else
						if VCB_SAVE["Timer_round"] then
							return floor(timeLeft/3600)..":"..ceil(timeLeft)-3600*ceil(timeLeft/3600).."h"
						else
							return floor(timeLeft/3600)..":"..floor(timeLeft)-3600*floor(timeLeft/3600).."h"
						end
					end
				else
					if VCB_SAVE["Timer_minutes_convert"] then
						if VCB_SAVE["Timer_round"] then
							return floor(timeLeft/60)..":"..ceil(timeLeft)-60*ceil(timeLeft/60).."h"
						else
							return floor(timeLeft/60)..":"..floor(timeLeft)-60*floor(timeLeft/60).."h"
						end
					else
						if VCB_SAVE["Timer_round"] then
							return ceil(timeLeft/3600).."h"
						else
							return floor(timeLeft/3600).."h"
						end
					end
				end
			else
				if VCB_SAVE["Timer_minutes_convert"] then
					if VCB_SAVE["Timer_hours_convert"] then
						if VCB_SAVE["Timer_round"] then
							return "0:"..ceil(timeLeft/60)..":"..ceil(timeLeft)-60*ceil(timeLeft/60).."h"
						else
							return "0:"..floor(timeLeft/60)..":"..floor(timeLeft)-60*floor(timeLeft/60).."h"
						end
					else
						if VCB_SAVE["Timer_round"] then
							return ceil(timeLeft/60)..":"..ceil(timeLeft)-60*ceil(timeLeft/60).."m"
						else
							return floor(timeLeft/60)..":"..floor(timeLeft)-60*floor(timeLeft/60).."m"
						end
					end
				else
					if VCB_SAVE["Timer_hours_convert"] then
						if VCB_SAVE["Timer_round"] then
							return "0:"..ceil(timeLeft/60).."h"
						else
							return "0:"..floor(timeLeft/60).."h"
						end
					else
						if VCB_SAVE["Timer_round"] then
							return ceil(timeLeft/60).."m"
						else
							return floor(timeLeft/60).."m"
						end
					end
				end
			end
		else
			if VCB_SAVE["Timer_minutes_convert"] then
				if timeLeft >=10 then
					if VCB_SAVE["Timer_tenth"] then
						if VCB_SAVE["Timer_round"] then
							return "0:"..ceil(timeLeft)..":"..100*timeLeft-100*floor(timeLeft).."m"
						else
							return "0:"..floor(timeLeft)..":"..100*timeLeft-100*floor(timeLeft).."m"
						end
					else
						if VCB_SAVE["Timer_round"] then
							return "0:"..ceil(timeLeft).."m"
						else
							return "0:"..floor(timeLeft).."m"
						end
					end
				else
					if VCB_SAVE["Timer_tenth"] then
						if VCB_SAVE["Timer_round"] then
							return "0:0"..ceil(timeLeft)..":"..ceil(100*timeLeft-100*floor(timeLeft)).."m"
						else
							return "0:0"..floor(timeLeft)..":"..floor(100*timeLeft-100*floor(timeLeft)).."m"
						end
					else
						if VCB_SAVE["Timer_round"] then
							return "0:0"..ceil(timeLeft).."m"
						else
							return "0:0"..floor(timeLeft).."m"
						end
					end
				end
			else
				if VCB_SAVE["Timer_tenth"] then
					if VCB_SAVE["Timer_round"] then
						return ceil(timeLeft)..":"..ceil(100*timeLeft-100*floor(timeLeft)).."s"
					else
						return floor(timeLeft)..":"..floor(100*timeLeft-100*floor(timeLeft)).."s"
					end
				else
					if VCB_SAVE["Timer_round"] then
						return ceil(timeLeft).."s"
					else
						return floor(timeLeft).."s"
					end
				end
			end
		end
	else
		if timeLeft > 60 then
			return floor(timeLeft/60).."m"
		else
			return floor(timeLeft).."s"
		end
	end
end

function VCB_BF_ToggleLock()
	if (not VCB_BF_LOCKED) then
		VCB_BF_Lock(true)
		VCB_BF_LOCKED = true
	else
		VCB_BF_Lock(false)
		VCB_BF_LOCKED = false
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
	if (lock) then
		VCB_SendMessage("Locked the frames!")
	else
		VCB_SendMessage("Unlocked the frames!")
	end
end

function VCB_BF_DummyConfigMode_Enable()
	VCB_BF_DUMMY_MODE = true
	for cat, templateName in pairs(VCB_BUTTONNAME) do
		for i=VCB_MININDEX[cat], VCB_MAXINDEX[cat] do
			local button = getglobal(templateName..i)
			local icon = getglobal(templateName..i.."Icon")
			local buffDuration = getglobal(templateName..i.."Duration")
			local border = getglobal(templateName..i.."Border")
			icon:SetTexture("Interface\\AddOns\\VCB\\images\\dummy.tga")
			buffDuration:SetText(VCB_BF_GetDuration(10))
			if cat == "buff" then
				if button:GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
					border:SetVertexColor(VCB_SAVE["CF_AURA_bordercolor_r"],VCB_SAVE["CF_AURA_bordercolor_g"],VCB_SAVE["CF_AURA_bordercolor_b"],VCB_SAVE["CF_AURA_borderopacity"])
				elseif button:GetParent() == VCB_BF_BUFF_FRAME then
					border:SetVertexColor(VCB_SAVE["BF_BORDER_bordercolor_r"],VCB_SAVE["BF_BORDER_bordercolor_g"],VCB_SAVE["BF_BORDER_bordercolor_b"],VCB_SAVE["BF_BORDER_borderopacity"])
				end
			end
			if i < 7 and cat == "buff" then
				button:SetParent(VCB_BF_CONSOLIDATED_BUFFFRAME)
			end
			VCB_BF_RepositioningAndResizing()
			button:Show()
		end
	end
end

function VCB_BF_DummyConfigMode_Disable()
	VCB_BF_DUMMY_MODE = false
	for cat, templateName in pairs(VCB_BUTTONNAME) do
		for i=VCB_MININDEX[cat], VCB_MAXINDEX[cat] do
			local button = getglobal(templateName..i)
			button:Hide()
			VCB_BF_BUFF_BUTTON_Update(button)
		end
	end
end

--[[
-- VCB_BF:ConsolidatedAdd
-- @return: Void
-- Use: Adds an aura to the consolidated list
--]]
function VCB_BF_ConsolidatedAdd(name)
	if not VCB_Contains(Consolidated_Buffs, name) then
		table.insert(Consolidated_Buffs, name)
		VCB_SendMessage(name.." has been added!")
	else
		VCB_SendMessage(name.." is already in the list!")
	end
end

--[[
-- VCB_BF:ConsolidatedRemove
-- @return: Void
-- Use: Removes an aura from the consolidated list
--]]
function VCB_BF_ConsolidatedRemove(name)
	if VCB_Contains(Consolidated_Buffs, name) then
		table.remove(Consolidated_Buffs, VCB_Table_GetKeys(Consolidated_Buffs, name))
		VCB_SendMessage(name.." has been removed!")
	else
		VCB_SendMessage(name.." is not in the list!")
	end
end

--[[
-- VCB_BF:RemoveAll
-- @return: Void
-- Use: Clears the whole consolidated aura list
--]]
function VCB_BF_RemoveAllFromConsolidate()
	Consolidated_Buffs = {}
	VCB_SendMessage("The Consolidated Buffs list was emptied!")
end

--[[
-- VCB_AU:AddToBanned(string)
-- @return: Void
-- Fired: Per command
-- Use: Adds a buffname to the banned list
--]]
function VCB_BF_AddToBanned(name) 
	if not VCB_Contains(Banned_Buffs, name) then
		table.insert(Banned_Buffs, name)
		VCB_SendMessage(name.." has been added!")
	else
		VCB_SendMessage(name.." is already in the list!")
	end
end

--[[
-- VCB_AU:RemoveFromBanned(string)
-- @return: Void
-- Fired: Per command
-- Use: Removes a buffname to the banned list
--]]
function VCB_BF_RemoveFromBanned(name)
	if VCB_Contains(Banned_Buffs, name) then
		table.remove(Banned_Buffs, VCB_Table_GetKeys(Banned_Buffs, name))
		VCB_SendMessage(name.." has been removed!")
	else
		VCB_SendMessage(name.." is not in the list!")
	end
end

--[[
-- VCB_AU:RemoveAll
-- @return: Void
-- Use: Clears the whole banned aura list
--]]
function VCB_BF_RemoveAllFromBanned()
	Banned_Buffs = {}
	VCB_SendMessage("The Banned Buffs list was emptied!")
end