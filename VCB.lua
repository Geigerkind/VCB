-- Title: Vanilla Consolidate Buffs (VCB)
-- Author: Shino <Synced> - Kronos

-- Global variables
VCB_NAME = "Vanilla Consolidate Buffs"
VCB_VERSION = "2.4"
VCB_IS_LOADED = false
VCB_BF_DUMMY_MODE = false
VCB_FONT_ARRAY = {}
VCB_FONT_ARRAY[1] = "FRIZQT__.ttf"
VCB_FONT_ARRAY[2] = "ARIALN.ttf"
VCB_FONT_ARRAY[3] = "skurri.ttf"
VCB_FONT_ARRAY[4] = "MORPHEUS.ttf"
VCB_ANCHOR_ARRAY = {}
VCB_ANCHOR_ARRAY[1] = "Bottom"
VCB_ANCHOR_ARRAY[2] = "Right"
VCB_ANCHOR_ARRAY[3] = "Top"
VCB_ANCHOR_ARRAY[4] = "Left"
VCB_BF_COLOR_OBJ = nil
VCB_BF_COLOR_VAR = nil
VCB_BF_COLOR_TAR = nil
VCB_BF_COLOR_TYPE = nil
VCB_ICON_ARRAY = {}
VCB_ICON_ARRAY[1] = "icon"
VCB_BORDER_ARRAY = {}
VCB_BORDER_ARRAY[1] = "Interface\\Tooltips\\UI-Tooltip-Border.tga"
VCB_BORDER_ARRAY[2] = "Interface\\DialogFrame\\UI-DialogBox-Border.tga"
VCB_AURABORDER_ARRAY = {}
VCB_AURABORDER_ARRAY[1] = "Interface\\Buttons\\UI-Debuff-Overlays.tga"
VCB_BACKGROUND_ARRAY = {}
VCB_BACKGROUND_ARRAY[1] = "Interface\\Tooltips\\UI-Tooltip-Background.tga"
VCB_BACKGROUND_ARRAY[2] = "Interface\\DialogFrame\\UI-DialogBox-Background.tga"
VCB_BACKGROUND_ARRAY[3] = "Interface\\CHARACTERFRAME\\UI-Party-Background.tga"

--[[
-- VCB_OnLoad()
-- @returns: Void
-- Use: Initialization and registering events
--]]
function VCB_OnLoad()
	this:RegisterEvent("ADDON_LOADED")

	SLASH_VCB1 = "/VanillaConsolidateBuffs"
	SLASH_VCB2 = "/vanillaconsolidatebuffs"
	SLASH_VCB3 = "/VCB"
	SLASH_VCB4 = "/vcb"
	SlashCmdList["VCB"] = function(msg)
		VCB_SlashCommandHandler(msg)
	end
	
	DEFAULT_CHAT_FRAME:AddMessage("VCB "..VCB_VERSION.." is now loaded! Use the command /vcb to configure VCB!")
end

function VCB_OnEvent(event)
	if event == "ADDON_LOADED" and not VCB_IS_LOADED then
		if VCB_SAVE == nil then
			VCB_SAVE = {}
			VCB_SAVE = {
				Timer_hours = false,
				Timer_hours_convert = false,
				Timer_minutes = true,
				Timer_minutes_convert = false,
				Timer_tenth = false,
				Timer_round = false,
				Timer_fontsize = 10, 
				Timer_font = "FRIZQT__.ttf",
				Timer_alpha = 1,
				CF_icon_color_r = 1,
				CF_icon_color_g = 1,
				CF_icon_color_b = 1,
				CF_icon_fontsize = 13,
				CF_icon_font = "FRIZQT__.ttf",
				CF_icon_opacity = 1,
				CF_icon_fontopacity = 1,
				CF_icon_texture = "icon",
				CF_icon_border = true,
				CF_BF_anchor = 1,
				CF_BF_scale = 1,
				CF_BF_invert = false,
				CF_BF_numperrow = 5,
				CF_BF_bgopacity = 1,
				CF_BF_bgcolor_r = 0,
				CF_BF_bgcolor_g = 0,
				CF_BF_bgcolor_b = 0,
				CF_BF_borderopacity = 1,
				CF_BF_bordercolor_r = 1,
				CF_BF_bordercolor_g = 1,
				CF_BF_bordercolor_b = 1,
				CF_BF_border = 1,
				CF_BF_customborder = false,
				CF_BF_customborderpath = "",
				CF_BF_background = 1,
				CF_BF_custombackground = false,
				CF_BF_custombackgroundpath = "",
				CF_AURA_enableborder = false,
				CF_AURA_borderopacity = 1,
				CF_AURA_bordercolor_r = 1,
				CF_AURA_bordercolor_g = 1,
				CF_AURA_bordercolor_b = 1,
				CF_AURA_padding_h = 2,
				CF_AURA_padding_v = 2,
				CF_AURA_border = 1,
				CF_AURA_customborder = false,
				CF_AURA_customborderpath = "",
				CF_AURA_bgcolor_r = 1,
				CF_AURA_bgcolor_g = 1,
				CF_AURA_bgcolor_b = 1,
				CF_AURA_enablebgcolor = false,
				CF_TIMER_border = false,
				CF_TIMER_fontcolor_r = 1,
				CF_TIMER_fontcolor_g = 0.82,
				CF_TIMER_fontcolor_b = 0,
				CF_TIMER_fontsize = 10,
				CF_TIMER_fontopacity = 1,
			}
		end
		if VCB_BF_LOCKED == nil then
			VCB_BF_LOCKED = false
		end
		if Consolidated_Buffs == nil then
			Consolidated_Buffs = {}
		end
		if Banned_Buffs == nil then
			Banned_Buffs = {}
		end
		
		--VCB_SAVE["CF_BF_custombackground"] = false
		--VCB_SAVE["CF_BF_custombackgroundpath"] = ""
		--VCB_SAVE["CF_AURA_enableborder"] = false
		--VCB_SAVE["CF_AURA_borderopacity"] = 1
		--VCB_SAVE["CF_AURA_bordercolor_r"] = 1
		--VCB_SAVE["CF_AURA_bordercolor_g"] = 1
		--VCB_SAVE["CF_AURA_bordercolor_b"] = 1
		--VCB_SAVE["CF_AURA_padding_h"] = 2
		--VCB_SAVE["CF_AURA_padding_v"] = 2
		--VCB_SAVE["CF_AURA_border"] = 1
		--VCB_SAVE["CF_AURA_customborder"] = false
		--VCB_SAVE["CF_AURA_customborderpath"] = ""
		--VCB_SAVE["CF_AURA_bgcolor_r"] = 1
		--VCB_SAVE["CF_AURA_bgcolor_g"] = 1
		--VCB_SAVE["CF_AURA_enablebgcolor"] = false
		--VCB_SAVE["CF_TIMER_border"] = false
		--VCB_SAVE["CF_TIMER_bordercolor_r"] = 0
		--VCB_SAVE["CF_TIMER_bordercolor_r"] = 0
		--VCB_SAVE["CF_TIMER_bordercolor_r"] = 0
		--VCB_SAVE["CF_TIMER_fontcolor_r"] = 1
		--VCB_SAVE["CF_TIMER_fontcolor_g"] = 0.82
		--VCB_SAVE["CF_TIMER_fontcolor_b"] = 0
		--VCB_SAVE["CF_TIMER_fontopacity"] = 1
		--VCB_SAVE["CF_TIMER_fontsize"] = 10
		
		VCB_BF_CONSOLIDATED_BUFFFRAME:ClearAllPoints()
		if VCB_SAVE["CF_BF_anchor"] == 1 then
			VCB_BF_CONSOLIDATED_BUFFFRAME:SetPoint("TOP", VCB_BF_CONSOLIDATED_ICON, "BOTTOM", 0, 0)
		elseif VCB_SAVE["CF_BF_anchor"] == 2 then
			VCB_BF_CONSOLIDATED_BUFFFRAME:SetPoint("LEFT", VCB_BF_CONSOLIDATED_ICON, "RIGHT", 0, 0)
		elseif VCB_SAVE["CF_BF_anchor"] == 3 then
			VCB_BF_CONSOLIDATED_BUFFFRAME:SetPoint("BOTTOM", VCB_BF_CONSOLIDATED_ICON, "TOP", 0, 0)
		else
			VCB_BF_CONSOLIDATED_BUFFFRAME:SetPoint("RIGHT", VCB_BF_CONSOLIDATED_ICON, "LEFT", 0, 0)
		end
		
		VCB_BF_CONSOLIDATED_ICON:SetAlpha(VCB_SAVE["CF_icon_opacity"])
		if VCB_SAVE["CF_icon_border"] then
			VCB_BF_CONSOLIDATED_ICONCount:SetFont("Fonts\\"..VCB_SAVE["CF_icon_font"], VCB_SAVE["CF_icon_fontsize"], "OUTLINE")
		else
			VCB_BF_CONSOLIDATED_ICONCount:SetFont("Fonts\\"..VCB_SAVE["CF_icon_font"], VCB_SAVE["CF_icon_fontsize"])
		end
		VCB_BF_CONSOLIDATED_ICONCount:SetTextColor(VCB_SAVE["CF_icon_color_r"], VCB_SAVE["CF_icon_color_g"], VCB_SAVE["CF_icon_color_b"], VCB_SAVE["CF_icon_fontopacity"])
		VCB_BF_CONSOLIDATED_ICONIcon:SetTexture(nil)
		VCB_BF_CONSOLIDATED_ICONIcon:SetTexture("Interface\\AddOns\\VCB\\images\\"..VCB_SAVE["CF_icon_texture"]..".tga")
		VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdrop(nil)
		if VCB_SAVE["CF_BF_customborder"] then
			if VCB_SAVE["CF_BF_custombackground"] then
				VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdrop({bgFile=VCB_SAVE["CF_BF_custombackgroundpath"], edgeFile=VCB_SAVE["CF_BF_customborderpath"], tile=true, tileSize=16, edgeSize=16, insets={left=4,right=4,top=4,bottom=4}})
			else
				VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdrop({bgFile=VCB_BACKGROUND_ARRAY[VCB_SAVE["CF_BF_background"]], edgeFile=VCB_SAVE["CF_BF_customborderpath"], tile=true, tileSize=16, edgeSize=16, insets={left=4,right=4,top=4,bottom=4}})
			end
		else
			if VCB_SAVE["CF_BF_custombackground"] then
				VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdrop({bgFile=VCB_SAVE["CF_BF_custombackgroundpath"], edgeFile=VCB_BORDER_ARRAY[VCB_SAVE["CF_BF_border"]], tile=true, tileSize=16, edgeSize=16, insets={left=4,right=4,top=4,bottom=4}})
			else
				VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdrop({bgFile=VCB_BACKGROUND_ARRAY[VCB_SAVE["CF_BF_background"]], edgeFile=VCB_BORDER_ARRAY[VCB_SAVE["CF_BF_border"]], tile=true, tileSize=16, edgeSize=16, insets={left=4,right=4,top=4,bottom=4}})
			end
		end
		VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdropColor(VCB_SAVE["CF_BF_bgcolor_r"],VCB_SAVE["CF_BF_bgcolor_g"],VCB_SAVE["CF_BF_bgcolor_b"],VCB_SAVE["CF_BF_bgopacity"])
		VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdropBorderColor(VCB_SAVE["CF_BF_bordercolor_r"],VCB_SAVE["CF_BF_bordercolor_g"],VCB_SAVE["CF_BF_bordercolor_b"],VCB_SAVE["CF_BF_borderopacity"])
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				if VCB_SAVE["CF_AURA_enableborder"] then
					if VCB_SAVE["CF_AURA_customborder"] then
						getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetTexture(VCB_SAVE["CF_AURA_customborderpath"])
					else
						getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetTexture(VCB_AURABORDER_ARRAY[VCB_SAVE["CF_AURA_border"]])
					end
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetTexture(nil)
				end
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["CF_AURA_bordercolor_r"],VCB_SAVE["CF_AURA_bordercolor_g"],VCB_SAVE["CF_AURA_bordercolor_b"],VCB_SAVE["CF_AURA_borderopactiy"])
				if VCB_SAVE["CF_AURA_enablebgcolor"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Icon"):SetVertexColor(VCB_SAVE["CF_AURA_bgcolor_r"],VCB_SAVE["CF_AURA_bgcolor_g"],VCB_SAVE["CF_AURA_bgcolor_b"])
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Icon"):SetVertexColor(1,1,1)
				end
				if VCB_SAVE["CF_TIMER_border"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetFont("Fonts\\"..VCB_SAVE["Timer_font"], VCB_SAVE["CF_BF_scale"]*VCB_SAVE["CF_TIMER_fontsize"], "OUTLINE")
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetFont("Fonts\\"..VCB_SAVE["Timer_font"], VCB_SAVE["CF_BF_scale"]*VCB_SAVE["CF_TIMER_fontsize"])
				end
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetTextColor(VCB_SAVE["CF_TIMER_fontcolor_r"],VCB_SAVE["CF_TIMER_fontcolor_g"],VCB_SAVE["CF_TIMER_fontcolor_b"],VCB_SAVE["CF_TIMER_fontopacity"])
			else
				
			end
		end
		for i=0,15 do
			getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Duration"):SetAlpha(VCB_SAVE["Timer_alpha"])
		end
		for i=0,1 do
			getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetAlpha(VCB_SAVE["Timer_alpha"])
		end
		VCB_BF_Lock(VCB_BF_LOCKED)
		VCB_IS_LOADED = true
	end	
end

--[[
-- VCB_SlashCommandHandler(string)
-- @returns: Message-Output
-- Use: Handles the incoming commands for VBS and sorts the data to the functions
--]]
function VCB_SlashCommandHandler(msg)
	if(msg) then
		local cmd = string.lower(msg)
		if string.sub(cmd, 1, 5) == "scale" and IsAddOnLoaded("VCB_Buffframe") then
			if string.len(cmd) > 6 then
				local scale = string.sub(cmd, 7, string.len(cmd))
				VCB_BF:Scale(tonumber(scale))
			end
		elseif string.sub(cmd, 1, 6) == "unbuff" and IsAddOnLoaded("VCB_AutoUnbuffer") then
			if string.len(cmd) > 7 then
				local unbuff = string.sub(cmd, 8, string.len(cmd))
				VCB_AU:Unbuff(unbuff)
			end
		else
			VCB_BF_ConfigFrame:Show()
		end
	end
end

--[[
-- VCB_tablelength(table/array)
-- @return: int
-- Use: Evaluates the length of a table/array for utility use. F. e. for loops.
--]]
function VCB_tablelength(T)
	local count = 0
	for _ in pairs(T) do 
		count = count + 1 
	end 
	return count
end

--[[
-- VCB_Contains(table/array, obj)
-- @return: Boolean
-- Use: Evaluates if a table or an array contains a specific value/object for utility use.
--]]
function VCB_Contains(table, element)
	for _, value in pairs(table) do
		if value == element then
			return true
		end
	end
	return false
end

--[[
-- VCB_GetKeys(table/array, obj)
-- @return: int
-- Use: Returns the key of a specific value/object in an table/array for utility use.
--]]
function VCB_GetKeys(a, b)
	local i = 0
	while true do
		if a[i] == b then
			return i
		end
	end
end

--[[
-- VCB_GetKeys(table/array, obj)
-- @return: int
-- Use: Returns the key of a specific value/object in an table/array for utility use.
-- Not sure if I will some up those two functions to improve the performance :/
--]]
function VCB_Table_GetKeys(a, b)
	local i = 1
	while true do
		if a[i] == b then
			return i
		end
		i = i + 1
	end
end

function VCB_EmptyTable(t)
	for k in pairs (t) do
		t [k] = nil
	end
end

function VCB_SendMessage(msg)
	DEFAULT_CHAT_FRAME:AddMessage("|cFFFF8080VCB v"..VCB_VERSION..":|r "..msg)
end

---------------------------------------OPTION FRAME BEGIN-----------------------------------------------------------------------------------------------------------------

function VCB_OPTIONS_HIDE_ALL()
	getglobal("VCB_BF_CONSOLIDATED_FRAME"):Hide()
	getglobal("VCB_BF_BANNED_FRAME"):Hide()
	getglobal("VCB_BF_TIMER_FRAME"):Hide()
	getglobal("VCB_BF_CF_FRAME"):Hide()
	getglobal("VCB_BF_CF_FRAME2"):Hide()
	getglobal("VCB_BF_BF_FRAME"):Hide()
	getglobal("VCB_BF_DBF_FRAME"):Hide()
	getglobal("VCB_BF_WP_FRAME"):Hide()
	getglobal("VCB_BF_MISC_FRAME"):Hide()
	getglobal("VCB_BF_PM_FRAME"):Hide()
	getglobal("VCB_BF_OM_FRAME"):Hide()
	getglobal("VCB_BF_ABOUT_FRAME"):Hide()
end

function VCB_OPTIONS_SHOW(frame, text)
	getglobal(frame):Show()
	getglobal("VCB_BF_CONFIG_FRAME_TITLE_FONTSTRING"):SetText(text)
	VCB_PAGEINIT(frame)
	PlaySound("igMainMenuOptionCheckBoxOff")
end

function VCB_PAGEINIT(frame)
	if frame == "VCB_BF_TIMER_FRAME" then
		getglobal("VCB_BF_TIMER_FRAME_CHECKBUTTON1"):SetChecked(VCB_SAVE["Timer_hours"])
		getglobal("VCB_BF_TIMER_FRAME_CHECKBUTTON2"):SetChecked(VCB_SAVE["Timer_hours_convert"])
		getglobal("VCB_BF_TIMER_FRAME_CHECKBUTTON3"):SetChecked(VCB_SAVE["Timer_minutes"])
		getglobal("VCB_BF_TIMER_FRAME_CHECKBUTTON4"):SetChecked(VCB_SAVE["Timer_minutes_convert"])
		getglobal("VCB_BF_TIMER_FRAME_CHECKBUTTON5"):SetChecked(VCB_SAVE["Timer_tenth"])
		if VCB_SAVE["Timer_round"] then
			getglobal("VCB_BF_TIMER_FRAME_CHECKBUTTON6"):SetChecked(false)
			getglobal("VCB_BF_TIMER_FRAME_CHECKBUTTON7"):SetChecked(true)
		else
			getglobal("VCB_BF_TIMER_FRAME_CHECKBUTTON6"):SetChecked(true)
			getglobal("VCB_BF_TIMER_FRAME_CHECKBUTTON7"):SetChecked(false)
		end
		getglobal("VCB_BF_TIMER_FRAME_FontSlider"):SetValue(VCB_Table_GetKeys(VCB_FONT_ARRAY, VCB_SAVE["Timer_font"]))
		getglobal("VCB_BF_TIMER_FRAME_FontSliderText"):SetText("Font: "..VCB_SAVE["Timer_font"])
	elseif frame == "VCB_BF_CF_FRAME" then	
		getglobal("VCB_BF_CF_FRAME_AnchorSlider"):SetValue(VCB_SAVE["CF_BF_anchor"])
		getglobal("VCB_BF_CF_FRAME_AnchorSliderText"):SetText("Anchor: "..VCB_ANCHOR_ARRAY[VCB_SAVE["CF_BF_anchor"]])
		getglobal("VCB_BF_CF_FRAME_ScaleSlider"):SetValue(VCB_SAVE["CF_BF_scale"])
		getglobal("VCB_BF_CF_FRAME_ScaleSliderText"):SetText("Scale: "..VCB_SAVE["CF_BF_scale"])
		getglobal("VCB_BF_CF_FRAME_CHECKBUTTON1"):SetChecked(VCB_SAVE["CF_BF_invert"])
		getglobal("VCB_BF_CF_FRAME_NumPerRowSlider"):SetValue(VCB_SAVE["CF_BF_numperrow"])
		getglobal("VCB_BF_CF_FRAME_NumPerRowSliderText"):SetText("Buffs per row: "..VCB_SAVE["CF_BF_numperrow"])
		getglobal("VCB_BF_CF_FRAME_ColorNormalTexture"):SetVertexColor(VCB_SAVE["CF_icon_color_r"], VCB_SAVE["CF_icon_color_g"], VCB_SAVE["CF_icon_color_b"])
		getglobal("VCB_BF_CF_FRAME_Color_SwatchBg").r = VCB_SAVE["CF_icon_color_r"]
		getglobal("VCB_BF_CF_FRAME_Color_SwatchBg").g = VCB_SAVE["CF_icon_color_g"]
		getglobal("VCB_BF_CF_FRAME_Color_SwatchBg").b = VCB_SAVE["CF_icon_color_b"]
		getglobal("VCB_BF_CF_FRAME_SizeSlider"):SetValue(VCB_SAVE["CF_icon_fontsize"])
		getglobal("VCB_BF_CF_FRAME_SizeSliderText"):SetText("Font size: "..VCB_SAVE["CF_icon_fontsize"])
		getglobal("VCB_BF_CF_FRAME_FontSlider"):SetValue(VCB_Table_GetKeys(VCB_FONT_ARRAY, VCB_SAVE["CF_icon_font"]))
		getglobal("VCB_BF_CF_FRAME_FontSliderText"):SetText("Font: "..VCB_SAVE["CF_icon_font"])
		getglobal("VCB_BF_CF_FRAME_AlphaSlider"):SetValue(VCB_SAVE["CF_icon_opacity"])
		getglobal("VCB_BF_CF_FRAME_AlphaSliderText"):SetText("Icon Opacity: "..VCB_SAVE["CF_icon_opacity"])
		getglobal("VCB_BF_CF_FRAME_FontAlphaSlider"):SetValue(VCB_SAVE["CF_icon_fontopacity"])
		getglobal("VCB_BF_CF_FRAME_FontAlphaSliderText"):SetText("Font Opacity: "..VCB_SAVE["CF_icon_fontopacity"])
		getglobal("VCB_BF_CF_FRAME_TextureSlider"):SetValue(VCB_Table_GetKeys(VCB_ICON_ARRAY, VCB_SAVE["CF_icon_texture"]))
		getglobal("VCB_BF_CF_FRAME_TextureSliderText"):SetText("Texture: "..VCB_SAVE["CF_icon_texture"])
		getglobal("VCB_BF_CF_FRAME_BGOpaSlider"):SetValue(VCB_SAVE["CF_BF_bgopacity"])
		getglobal("VCB_BF_CF_FRAME_BGOpaSliderText"):SetText("Background opacity: "..VCB_SAVE["CF_BF_bgopacity"])
		getglobal("VCB_BF_CF_FRAME_Color3NormalTexture"):SetVertexColor(VCB_SAVE["CF_BF_bgcolor_r"], VCB_SAVE["CF_BF_bgcolor_g"], VCB_SAVE["CF_BF_bgcolor_b"])
		getglobal("VCB_BF_CF_FRAME_Color3_SwatchBg").r = VCB_SAVE["CF_BF_bgcolor_r"]
		getglobal("VCB_BF_CF_FRAME_Color3_SwatchBg").g = VCB_SAVE["CF_BF_bgcolor_g"]
		getglobal("VCB_BF_CF_FRAME_Color3_SwatchBg").b = VCB_SAVE["CF_BF_bgcolor_b"]
		getglobal("VCB_BF_CF_FRAME_Color2NormalTexture"):SetVertexColor(VCB_SAVE["CF_BF_bordercolor_r"], VCB_SAVE["CF_BF_bordercolor_g"], VCB_SAVE["CF_BF_bordercolor_b"])
		getglobal("VCB_BF_CF_FRAME_Color2_SwatchBg").r = VCB_SAVE["CF_BF_bordercolor_r"]
		getglobal("VCB_BF_CF_FRAME_Color2_SwatchBg").g = VCB_SAVE["CF_BF_bordercolor_g"]
		getglobal("VCB_BF_CF_FRAME_Color2_SwatchBg").b = VCB_SAVE["CF_BF_bordercolor_b"]
		getglobal("VCB_BF_CF_FRAME_BFBorderSlider"):SetValue(VCB_SAVE["CF_BF_border"])
		getglobal("VCB_BF_CF_FRAME_BFBorderSliderText"):SetText("Border: "..VCB_SAVE["CF_BF_border"])
		getglobal("VCB_BF_CF_FRAME_CHECKBUTTON4"):SetChecked(VCB_SAVE["CF_BF_customborder"])
		getglobal("VCB_BF_CF_FRAME_EDITBOX_BORDER"):SetText(VCB_SAVE["CF_BF_customborderpath"])
		getglobal("VCB_BF_CF_FRAME_CHECKBUTTON_BORDER"):SetChecked(VCB_SAVE["CF_icon_border"])
		getglobal("VCB_BF_CF_FRAME_BackdropSlider"):SetValue(VCB_SAVE["CF_BF_background"])
		getglobal("VCB_BF_CF_FRAME_BackdropSliderText"):SetText("Background: "..VCB_SAVE["CF_BF_background"])
		getglobal("VCB_BF_CF_FRAME_BorderOpaSlider"):SetValue(VCB_SAVE["CF_BF_borderopacity"])
		getglobal("VCB_BF_CF_FRAME_BorderOpaSliderText"):SetText("Border opacity: "..VCB_SAVE["CF_BF_borderopacity"])
		getglobal("VCB_BF_CF_FRAME_CHECKBUTTON_CBG"):SetChecked(VCB_SAVE["CF_BF_custombackground"])
		getglobal("VCB_BF_CF_FRAME_EDITBOX_BACKGROUND"):SetText(VCB_SAVE["CF_BF_custombackgroundpath"])
	elseif frame == "VCB_BF_CF_FRAME2" then
		getglobal("VCB_BF_CF_FRAME2_CHECKBUTTON1"):SetChecked(VCB_SAVE["CF_AURA_enableborder"])
		getglobal("VCB_BF_CF_FRAME2_ColorNormalTexture"):SetVertexColor(VCB_SAVE["CF_AURA_bordercolor_r"], VCB_SAVE["CF_AURA_bordercolor_g"], VCB_SAVE["CF_AURA_bordercolor_b"])
		getglobal("VCB_BF_CF_FRAME2_Color_SwatchBg").r = VCB_SAVE["CF_AURA_bordercolor_r"]
		getglobal("VCB_BF_CF_FRAME2_Color_SwatchBg").g = VCB_SAVE["CF_AURA_bordercolor_g"]
		getglobal("VCB_BF_CF_FRAME2_Color_SwatchBg").b = VCB_SAVE["CF_AURA_bordercolor_b"]
		getglobal("VCB_BF_CF_FRAME2_AuraPaddingHSlider"):SetValue(VCB_SAVE["CF_AURA_padding_h"])
		getglobal("VCB_BF_CF_FRAME2_AuraPaddingHSliderText"):SetText("Padding H: "..VCB_SAVE["CF_AURA_padding_h"])
		getglobal("VCB_BF_CF_FRAME2_AuraPaddingVSlider"):SetValue(VCB_SAVE["CF_AURA_padding_v"])
		getglobal("VCB_BF_CF_FRAME2_AuraPaddingVSliderText"):SetText("Padding V: "..VCB_SAVE["CF_AURA_padding_v"])
		getglobal("VCB_BF_CF_FRAME2_AuraBorderSlider"):SetValue(VCB_SAVE["CF_AURA_border"])
		getglobal("VCB_BF_CF_FRAME2_AuraBorderSliderText"):SetText("Border: "..VCB_SAVE["CF_AURA_border"])
		getglobal("VCB_BF_CF_FRAME2_CHECKBUTTON3"):SetChecked(VCB_SAVE["CF_AURA_customborder"])
		getglobal("VCB_BF_CF_FRAME2_EDITBOX_BORDER"):SetText(VCB_SAVE["CF_AURA_customborderpath"])
		getglobal("VCB_BF_CF_FRAME2_Color2NormalTexture"):SetVertexColor(VCB_SAVE["CF_AURA_bgcolor_r"], VCB_SAVE["CF_AURA_bgcolor_g"], VCB_SAVE["CF_AURA_bgcolor_b"])
		getglobal("VCB_BF_CF_FRAME2_Color2_SwatchBg").r = VCB_SAVE["CF_AURA_bgcolor_r"]
		getglobal("VCB_BF_CF_FRAME2_Color2_SwatchBg").g = VCB_SAVE["CF_AURA_bgcolor_g"]
		getglobal("VCB_BF_CF_FRAME2_Color2_SwatchBg").b = VCB_SAVE["CF_AURA_bgcolor_b"]
		getglobal("VCB_BF_CF_FRAME2_CHECKBUTTON2"):SetChecked(VCB_SAVE["CF_AURA_enablebgcolor"])
		getglobal("VCB_BF_CF_FRAME2_CHECKBUTTON4"):SetChecked(VCB_SAVE["CF_TIMER_border"])
		getglobal("VCB_BF_CF_FRAME2_Color3NormalTexture"):SetVertexColor(VCB_SAVE["CF_TIMER_fontcolor_r"], VCB_SAVE["CF_TIMER_fontcolor_g"], VCB_SAVE["CF_TIMER_fontcolor_b"])
		getglobal("VCB_BF_CF_FRAME2_Color3_SwatchBg").r = VCB_SAVE["CF_TIMER_fontcolor_r"]
		getglobal("VCB_BF_CF_FRAME2_Color3_SwatchBg").g = VCB_SAVE["CF_TIMER_fontcolor_g"]
		getglobal("VCB_BF_CF_FRAME2_Color3_SwatchBg").b = VCB_SAVE["CF_TIMER_fontcolor_b"]
		getglobal("VCB_BF_CF_FRAME2_AuraTimerFontSizeSlider"):SetValue(VCB_SAVE["CF_TIMER_fontsize"])
		getglobal("VCB_BF_CF_FRAME2_AuraTimerFontSizeSliderText"):SetText("Font size: "..VCB_SAVE["CF_TIMER_fontsize"])
	end
end

function VCB_BF_CHECKBUTTON(obj)
	if (VCB_SAVE[obj]) then
		VCB_SAVE[obj] = false
	else
		VCB_SAVE[obj] = true
	end
end

function VCB_BF_MINIMAP_OnClick(arg1)
	if arg1 == "LeftButton" then
		if VCB_BF_ConfigFrame:IsVisible() then
			VCB_BF_ConfigFrame:Hide()
		else
			VCB_BF_ConfigFrame:Show()
		end
	else
		VCB_BF_ToggleLock()
	end
end

function VCB_BF_OptionsFrame_SetColor()
	local r,g,b = ColorPickerFrame:GetColorRGB();
	local swatch,frame;
	swatch = getglobal(VCB_BF_COLOR_OBJ:GetName().."NormalTexture"); -- juste le visuel
	frame = getglobal(VCB_BF_COLOR_OBJ:GetName().."_SwatchBg");      -- enregistre la couleur
	swatch:SetVertexColor(r,g,b);
	frame.r = r;
	frame.g = g;
	frame.b = b;

	VCB_SAVE[VCB_BF_COLOR_VAR.."color_r"] = r;
	VCB_SAVE[VCB_BF_COLOR_VAR.."color_g"] = g;
	VCB_SAVE[VCB_BF_COLOR_VAR.."color_b"] = b;
	
	if VCB_BF_COLOR_TYPE == "font" then
		getglobal(VCB_BF_COLOR_TAR):SetTextColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."fontopacity"]);
	elseif VCB_BF_COLOR_TYPE=="bg" then
		getglobal(VCB_BF_COLOR_TAR):SetBackdropColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opacity"])
	elseif VCB_BF_COLOR_TYPE=="border" then
		getglobal(VCB_BF_COLOR_TAR):SetBackdropBorderColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opacity"])
	elseif VCB_BF_COLOR_TYPE=="buffsborder" then
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetVertexColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="buffsbg" then
		for i=0,31 do
			if VCB_SAVE[VCB_BF_COLOR_TAR] and getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Icon"):SetVertexColor(r,g,b)
			end
		end
	elseif VCB_BF_COLOR_TYPE=="buffsfont" then
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetTextColor(r,g,b)
			end
		end
	end
end

function VCB_BF_OptionsFrame_CancelColor()
	local r = ColorPickerFrame.previousValues.r;
	local g = ColorPickerFrame.previousValues.g;
	local b = ColorPickerFrame.previousValues.b;
	local swatch,frame;
	swatch = getglobal(VCB_BF_COLOR_OBJ:GetName().."NormalTexture"); -- juste le visuel
	frame = getglobal(VCB_BF_COLOR_OBJ:GetName().."_SwatchBg");      -- enregistre la couleur
	swatch:SetVertexColor(r,g,b);
	frame.r = r;
	frame.g = g;
	frame.b = b;

	if VCB_BF_COLOR_TYPE == "font" then
		getglobal(VCB_BF_COLOR_TAR):SetTextColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."fontopacity"]);
	elseif VCB_BF_COLOR_TYPE=="bg" then
		getglobal(VCB_BF_COLOR_TAR):SetBackdropColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opacity"])
	elseif VCB_BF_COLOR_TYPE=="border" then
		getglobal(VCB_BF_COLOR_TAR):SetBackdropBorderColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opacity"])
	elseif VCB_BF_COLOR_TYPE=="buffsborder" then
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetVertexColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="buffsbg" then
		for i=0,31 do
			if VCB_SAVE[VCB_BF_COLOR_TAR] and getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Icon"):SetVertexColor(r,g,b)
			end
		end
	elseif VCB_BF_COLOR_TYPE=="buffsfont" then
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetTextColor(r,g,b)
			end
		end
	end
end

function VCB_BF_OpenColorPicker(obj, var, tar, type)
	VCB_BF_COLOR_OBJ = obj
	VCB_BF_COLOR_VAR = var
	VCB_BF_COLOR_TAR = tar
	VCB_BF_COLOR_TYPE = type
	
	CloseMenus();
	
	button = getglobal(obj:GetName().."_SwatchBg");

	ColorPickerFrame.func = VCB_BF_OptionsFrame_SetColor -- button.swatchFunc;
	ColorPickerFrame:SetColorRGB(button.r, button.g, button.b);
	ColorPickerFrame.previousValues = {r = button.r, g = button.g, b = button.b, opacity = button.opacity};
	ColorPickerFrame.cancelFunc = VCB_BF_OptionsFrame_CancelColor

	ColorPickerFrame:SetPoint("TOPLEFT", obj, "TOPRIGHT", 0, 0)

	ColorPickerFrame:Show();
end

---------------------------------------START CONSOLIDATED BUFFS FRAME-----------------------------------------------------------------------------------------------------------------

function VCB_BF_CONSOLIDATED_FRAME_RIGHT_SCROLLFRAME_Update()
	local line -- 1 through 5 of our window to scroll
	local lineplusoffset -- an index into our data calculated from the scroll offset
	local FRAME = getglobal("VCB_BF_CONSOLIDATED_FRAME_RIGHT_SCROLLFRAME")
	FauxScrollFrame_Update(FRAME,VCB_tablelength(Consolidated_Buffs),10,40)
	for line=1,10 do
		lineplusoffset = line + FauxScrollFrame_GetOffset(FRAME)
		if Consolidated_Buffs[lineplusoffset] ~= nil then
			getglobal("VCB_CONSOLIDATED_BUFFS_ENTRY_TEXT"..line):SetText(lineplusoffset..". "..Consolidated_Buffs[lineplusoffset])
			getglobal("VCB_CONSOLIDATED_BUFFS_ENTRY"..line).buff = Consolidated_Buffs[lineplusoffset]
			getglobal("VCB_CONSOLIDATED_BUFFS_ENTRY"..line):Show()
		else
			getglobal("VCB_CONSOLIDATED_BUFFS_ENTRY"..line):Hide()
		end
	end
end

function VCB_CONSOLIDATED_SCROLLFRAME_ENTRY(button)
	getglobal("VCB_BF_CONSOLIDATED_FRAME_LEFT_DELETE_INBOX_TEXT"):SetText(button.buff)
end

function VCB_CONSOLIDATED_BUFFS_DELETE()
	VCB_BF_ConsolidatedRemove(getglobal("VCB_BF_CONSOLIDATED_FRAME_LEFT_DELETE_INBOX_TEXT"):GetText())
	VCB_BF_CONSOLIDATED_FRAME_RIGHT_SCROLLFRAME_Update()
end

function VCB_CONSOLIDATED_BUFFS_ADD()
	VCB_BF_ConsolidatedAdd(getglobal("VCB_BF_CONSOLIDATED_FRAME_EditBox"):GetText())
	VCB_BF_CONSOLIDATED_FRAME_RIGHT_SCROLLFRAME_Update()
end

function VCB_CONSOLIDATED_BUFFS_REMOVE_ALL()
	VCB_BF_RemoveAllFromConsolidate()
	VCB_BF_CONSOLIDATED_FRAME_RIGHT_SCROLLFRAME_Update()
end

---------------------------------------END CONSOLIDATED BUFFS FRAME-----------------------------------------------------------------------------------------------------------------

---------------------------------------START BANNED BUFFS FRAME-----------------------------------------------------------------------------------------------------------------
function VCB_BF_BANNED_FRAME_RIGHT_SCROLLFRAME_Update()
	local line -- 1 through 5 of our window to scroll
	local lineplusoffset -- an index into our data calculated from the scroll offset
	local FRAME = getglobal("VCB_BF_BANNED_FRAME_RIGHT_SCROLLFRAME")
	FauxScrollFrame_Update(FRAME,VCB_tablelength(Banned_Buffs),10,40)
	for line=1,10 do
		lineplusoffset = line + FauxScrollFrame_GetOffset(FRAME)
		if Banned_Buffs[lineplusoffset] ~= nil then
			getglobal("VCB_BANNED_BUFFS_ENTRY_TEXT"..line):SetText(lineplusoffset..". "..Banned_Buffs[lineplusoffset])
			getglobal("VCB_BANNED_BUFFS_ENTRY"..line).buff = Banned_Buffs[lineplusoffset]
			getglobal("VCB_BANNED_BUFFS_ENTRY"..line):Show()
		else
			getglobal("VCB_BANNED_BUFFS_ENTRY"..line):Hide()
		end
	end
end

function VCB_BANNED_SCROLLFRAME_ENTRY(button)
	getglobal("VCB_BF_BANNED_FRAME_LEFT_DELETE_INBOX_TEXT"):SetText(button.buff)
end

function VCB_BANNED_BUFFS_DELETE()
	VCB_BF_RemoveFromBanned(getglobal("VCB_BF_BANNED_FRAME_LEFT_DELETE_INBOX_TEXT"):GetText())
	VCB_BF_BANNED_FRAME_RIGHT_SCROLLFRAME_Update()
end

function VCB_BANNED_BUFFS_ADD()
	VCB_BF_AddToBanned(getglobal("VCB_BF_BANNED_FRAME_EditBox"):GetText())
	VCB_BF_BANNED_FRAME_RIGHT_SCROLLFRAME_Update()
end

function VCB_BANNED_BUFFS_REMOVE_ALL()
	VCB_BF_RemoveAllFromBanned()
	VCB_BF_BANNED_FRAME_RIGHT_SCROLLFRAME_Update()
end

---------------------------------------END BANNED BUFFS FRAME-----------------------------------------------------------------------------------------------------------------
---------------------------------------START TIMER FRAME-----------------------------------------------------------------------------------------------------------------
function VCB_BF_CHECKBUTTON_TIMER_HOURS()
	if not VCB_SAVE["Timer_hours"] then
		VCB_SAVE["Timer_hours"] = true
		VCB_BF_TIMER_FRAME_CHECKBUTTON3:SetChecked(true)
		VCB_SAVE["Timer_minutes"] = true
	else
		VCB_SAVE["Timer_hours"] = false
		VCB_BF_TIMER_FRAME_CHECKBUTTON2:SetChecked(false)
		VCB_SAVE["Timer_hours_convert"] = false
	end
end

function VCB_BF_CHECKBUTTON_TIMER_HOURS_CONVERT()
	if not VCB_SAVE["Timer_hours_convert"] then
		VCB_SAVE["Timer_hours_convert"] = true
		VCB_BF_TIMER_FRAME_CHECKBUTTON1:SetChecked(true)
		VCB_SAVE["Timer_hours"] = true
		VCB_BF_TIMER_FRAME_CHECKBUTTON3:SetChecked(true)
		VCB_SAVE["Timer_minutes"] = true
	else
		VCB_SAVE["Timer_hours_convert"] = false
	end
end

function VCB_BF_CHECKBUTTON_TIMER_MINUTES()
	if not VCB_SAVE["Timer_minutes"] then
		VCB_SAVE["Timer_minutes"] = true
	else
		VCB_SAVE["Timer_minutes"] = false
		VCB_BF_TIMER_FRAME_CHECKBUTTON1:SetChecked(false)
		VCB_SAVE["Timer_hours"] = false
		VCB_BF_TIMER_FRAME_CHECKBUTTON2:SetChecked(false)
		VCB_SAVE["Timer_hours_convert"] = false
		VCB_BF_TIMER_FRAME_CHECKBUTTON4:SetChecked(false)
		VCB_SAVE["Timer_minutes_convert"] = false
	end
end

function VCB_BF_CHECKBUTTON_TIMER_MINUTES_CONVERT()
	if not VCB_SAVE["Timer_minutes_convert"] then
		VCB_SAVE["Timer_minutes_convert"] = true
		VCB_BF_TIMER_FRAME_CHECKBUTTON3:SetChecked(true)
		VCB_SAVE["Timer_minutes"] = true
	else
		VCB_SAVE["Timer_minutes_convert"] = false
		VCB_BF_TIMER_FRAME_CHECKBUTTON1:SetChecked(false)
		VCB_SAVE["Timer_hours"] = false
		VCB_BF_TIMER_FRAME_CHECKBUTTON2:SetChecked(false)
		VCB_SAVE["Timer_hours_convert"] = false
	end
end

function VCB_BF_CHECKBUTTON_ROUND()
	if VCB_SAVE["Timer_round"] then
		VCB_SAVE["Timer_round"] = false
		VCB_BF_TIMER_FRAME_CHECKBUTTON7:SetChecked(false)
	else
		VCB_SAVE["Timer_round"] = true
		VCB_BF_TIMER_FRAME_CHECKBUTTON6:SetChecked(false)
	end
end

function VCB_BF_CHECKBUTTON_TIMER_BORDER()
	if VCB_SAVE["Timer_border"] then
		VCB_SAVE["Timer_border"] = false
	else
		VCB_SAVE["Timer_border"] = true
	end
	for cat, tname in pairs(VCB_BUTTONNAME) do
		for i=VCB_MININDEX[cat], VCB_MAXINDEX[cat] do
			if VCB_SAVE["Timer_border"] then
				getglobal(tname..i.."Duration"):SetFont("Fonts\\"..VCB_SAVE["Timer_font"], VCB_SAVE["Timer_fontsize"], "OUTLINE")
			else
				getglobal(tname..i.."Duration"):SetFont("Fonts\\"..VCB_SAVE["Timer_font"], VCB_SAVE["Timer_fontsize"])
			end
		end
	end
end

function VCB_BF_TIMER_FRAME_FontSliderChange(obj)
	VCB_SAVE["Timer_font"] = VCB_FONT_ARRAY[obj:GetValue()]
	getglobal("VCB_BF_TIMER_FRAME_FontSliderText"):SetText("Font: "..VCB_SAVE["Timer_font"])
	for cat, tname in pairs(VCB_BUTTONNAME) do
		for i=VCB_MININDEX[cat], VCB_MAXINDEX[cat] do
			if getglobal(tname..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				getglobal(tname..i.."Duration"):SetFont("Fonts\\"..VCB_SAVE["Timer_font"], VCB_SAVE["CF_BF_scale"]*VCB_SAVE["CF_TIMER_fontsize"])
			else
				getglobal(tname..i.."Duration"):SetFont("Fonts\\"..VCB_SAVE["Timer_font"], VCB_SAVE["CF_TIMER_fontsize"])
			end
		end
	end
end

---------------------------------------END TIMER FRAME-----------------------------------------------------------------------------------------------------------------
---------------------------------------START CONSOLIDATED FRAME-----------------------------------------------------------------------------------------------------------------

function VCB_BF_CF_FRAME_AnchorSliderChange(obj)
	VCB_SAVE["CF_BF_anchor"] = obj:GetValue()
	getglobal("VCB_BF_CF_FRAME_AnchorSliderText"):SetText("Anchor: "..VCB_ANCHOR_ARRAY[VCB_SAVE["CF_BF_anchor"]])
	VCB_BF_CONSOLIDATED_BUFFFRAME:ClearAllPoints()
	if VCB_SAVE["CF_BF_anchor"] == 1 then
		VCB_BF_CONSOLIDATED_BUFFFRAME:SetPoint("TOP", VCB_BF_CONSOLIDATED_ICON, "BOTTOM", 0, 0)
	elseif VCB_SAVE["CF_BF_anchor"] == 2 then
		VCB_BF_CONSOLIDATED_BUFFFRAME:SetPoint("LEFT", VCB_BF_CONSOLIDATED_ICON, "RIGHT", 0, 0)
	elseif VCB_SAVE["CF_BF_anchor"] == 3 then
		VCB_BF_CONSOLIDATED_BUFFFRAME:SetPoint("BOTTOM", VCB_BF_CONSOLIDATED_ICON, "TOP", 0, 0)
	else
		VCB_BF_CONSOLIDATED_BUFFFRAME:SetPoint("RIGHT", VCB_BF_CONSOLIDATED_ICON, "LEFT", 0, 0)
	end
end

function VCB_BF_CF_FRAME_ScaleSliderChange(obj)
	VCB_SAVE["CF_BF_scale"] = string.format("%.1f", obj:GetValue())
	getglobal("VCB_BF_CF_FRAME_ScaleSliderText"):SetText("Scale: "..VCB_SAVE["CF_BF_scale"])
	VCB_BF_RepositioningAndResizing()
end

function VCB_BF_CF_FRAME_INVERTBUTTON()
	if VCB_SAVE["CF_BF_invert"] then
		VCB_SAVE["CF_BF_invert"] = false
	else
		VCB_SAVE["CF_BF_invert"] = true
	end
	VCB_BF_RepositioningAndResizing()
end

function VCB_BF_CF_FRAME_NumPerRowSliderChange(obj)
	VCB_SAVE["CF_BF_numperrow"] = obj:GetValue()
	getglobal("VCB_BF_CF_FRAME_NumPerRowSliderText"):SetText("Buffs per row: "..VCB_SAVE["CF_BF_numperrow"])
	VCB_BF_RepositioningAndResizing()
end

function VCB_BF_CF_FRAME_CHANGE_PAGE()
	if VCB_BF_CF_FRAME:IsVisible() then
		VCB_OPTIONS_HIDE_ALL()
		VCB_OPTIONS_SHOW("VCB_BF_CF_FRAME2", "Consolidated Frame -2-")
	else
		VCB_OPTIONS_HIDE_ALL()
		VCB_OPTIONS_SHOW("VCB_BF_CF_FRAME", "Consolidated Frame -1-")
	end
end

function VCB_BF_CF_FRAME_SizeSliderChange(obj)
	VCB_SAVE["CF_icon_fontsize"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText("Font size: "..VCB_SAVE["CF_icon_fontsize"])
	if VCB_SAVE["CF_icon_border"] then
		VCB_BF_CONSOLIDATED_ICONCount:SetFont("Fonts\\"..VCB_SAVE["CF_icon_font"], VCB_SAVE["CF_icon_fontsize"], "OUTLINE")
	else
		VCB_BF_CONSOLIDATED_ICONCount:SetFont("Fonts\\"..VCB_SAVE["CF_icon_font"], VCB_SAVE["CF_icon_fontsize"])
	end
end

function VCB_BF_CF_FRAME_FontSliderChange(obj)
	VCB_SAVE["CF_icon_font"] = VCB_FONT_ARRAY[obj:GetValue()]
	getglobal(obj:GetName().."Text"):SetText("Font: "..VCB_FONT_ARRAY[obj:GetValue()])
	if VCB_SAVE["CF_icon_border"] then
		VCB_BF_CONSOLIDATED_ICONCount:SetFont("Fonts\\"..VCB_SAVE["CF_icon_font"], VCB_SAVE["CF_icon_fontsize"], "OUTLINE")
	else
		VCB_BF_CONSOLIDATED_ICONCount:SetFont("Fonts\\"..VCB_SAVE["CF_icon_font"], VCB_SAVE["CF_icon_fontsize"])
	end
end

function VCB_BF_CF_FRAME_CHECKBUTTON_BORDER_CLICK()
	if VCB_SAVE["CF_icon_border"] then
		VCB_SAVE["CF_icon_border"] = false
		VCB_BF_CONSOLIDATED_ICONCount:SetFont("Fonts\\"..VCB_SAVE["CF_icon_font"], VCB_SAVE["CF_icon_fontsize"])
	else
		VCB_SAVE["CF_icon_border"] = true
		VCB_BF_CONSOLIDATED_ICONCount:SetFont("Fonts\\"..VCB_SAVE["CF_icon_font"], VCB_SAVE["CF_icon_fontsize"], "OUTLINE")
	end
end

function VCB_BF_CF_FRAME_AlphaSliderChange(obj)
	VCB_SAVE["CF_icon_opacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText("Icon opacity: "..VCB_SAVE["CF_icon_opacity"])
	VCB_BF_CONSOLIDATED_ICON:SetAlpha(VCB_SAVE["CF_icon_opacity"])
end

function VCB_BF_CF_FRAME_FontAlphaSliderChange(obj)
	VCB_SAVE["CF_icon_fontopacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText("Font opacity: "..VCB_SAVE["CF_icon_fontopacity"])
	VCB_BF_CONSOLIDATED_ICONCount:SetAlpha(VCB_SAVE["CF_icon_fontopacity"])
end

function VCB_BF_CF_FRAME_TextureSliderChange(obj)
	VCB_SAVE["CF_icon_texture"] = VCB_ICON_ARRAY[obj:GetValue()]
	getglobal(obj:GetName().."Text"):SetText("Texture: "..VCB_SAVE["CF_icon_texture"])
	VCB_BF_CONSOLIDATED_ICONIcon:SetTexture(nil)
	VCB_BF_CONSOLIDATED_ICONIcon:SetTexture("Interface\\AddOns\\VCB\\images\\"..VCB_SAVE["CF_icon_texture"]..".tga")
end

function VCB_BF_CF_FRAME_BGOpaSliderChange(obj)
	VCB_SAVE["CF_BF_bgopacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText("Background Opacity: "..VCB_SAVE["CF_BF_bgopacity"])
	VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdropColor(VCB_SAVE["CF_BF_bgcolor_r"],VCB_SAVE["CF_BF_bgcolor_g"],VCB_SAVE["CF_BF_bgcolor_b"],VCB_SAVE["CF_BF_bgopacity"])
end

function VCB_BF_CF_FRAME_BFBorderSliderChange(obj)
	VCB_SAVE["CF_BF_border"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText("Border: "..VCB_SAVE["CF_BF_border"])
	if VCB_SAVE["CF_BF_customborder"] == false then
		VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdrop(nil)
		if VCB_SAVE["CF_BF_custombackground"] then
			VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdrop({bgFile=VCB_SAVE["CF_BF_custombackgroundpath"], edgeFile=VCB_BORDER_ARRAY[VCB_SAVE["CF_BF_border"]], tile=true, tileSize=16, edgeSize=16, insets={left=4,right=4,top=4,bottom=4}})
		else
			VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdrop({bgFile=VCB_BACKGROUND_ARRAY[VCB_SAVE["CF_BF_background"]], edgeFile=VCB_BORDER_ARRAY[VCB_SAVE["CF_BF_border"]], tile=true, tileSize=16, edgeSize=16, insets={left=4,right=4,top=4,bottom=4}})
		end
		VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdropColor(VCB_SAVE["CF_BF_bgcolor_r"],VCB_SAVE["CF_BF_bgcolor_g"],VCB_SAVE["CF_BF_bgcolor_b"],VCB_SAVE["CF_BF_bgopacity"])
		VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdropBorderColor(VCB_SAVE["CF_BF_bordercolor_r"],VCB_SAVE["CF_BF_bordercolor_g"],VCB_SAVE["CF_BF_bordercolor_b"],VCB_SAVE["CF_BF_borderopacity"])
	end
end

function VCB_BF_CF_FRAME_USE_CUSTOM_BORDER()
	VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdrop(nil)
	if VCB_SAVE["CF_BF_customborder"] then
		VCB_SAVE["CF_BF_customborder"] = false
		if VCB_SAVE["CF_BF_custombackground"] then
			VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdrop({bgFile=VCB_SAVE["CF_BF_custombackgroundpath"], edgeFile=VCB_BORDER_ARRAY[VCB_SAVE["CF_BF_border"]], tile=true, tileSize=16, edgeSize=16, insets={left=4,right=4,top=4,bottom=4}})
		else
			VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdrop({bgFile=VCB_BACKGROUND_ARRAY[VCB_SAVE["CF_BF_background"]], edgeFile=VCB_BORDER_ARRAY[VCB_SAVE["CF_BF_border"]], tile=true, tileSize=16, edgeSize=16, insets={left=4,right=4,top=4,bottom=4}})
		end
	else
		VCB_SAVE["CF_BF_customborder"] = true
		if VCB_SAVE["CF_BF_custombackground"] then
			VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdrop({bgFile=VCB_SAVE["CF_BF_custombackgroundpath"], edgeFile=VCB_SAVE["CF_BF_customborderpath"], tile=true, tileSize=16, edgeSize=16, insets={left=4,right=4,top=4,bottom=4}})
		else
			VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdrop({bgFile=VCB_BACKGROUND_ARRAY[VCB_SAVE["CF_BF_background"]], edgeFile=VCB_SAVE["CF_BF_customborderpath"], tile=true, tileSize=16, edgeSize=16, insets={left=4,right=4,top=4,bottom=4}})
		end
	end
	VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdropColor(VCB_SAVE["CF_BF_bgcolor_r"],VCB_SAVE["CF_BF_bgcolor_g"],VCB_SAVE["CF_BF_bgcolor_b"],VCB_SAVE["CF_BF_bgopacity"])
	VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdropBorderColor(VCB_SAVE["CF_BF_bordercolor_r"],VCB_SAVE["CF_BF_bordercolor_g"],VCB_SAVE["CF_BF_bordercolor_b"],VCB_SAVE["CF_BF_borderopacity"])
end

function VCB_BF_CF_FRAME_USE_CUSTOM_BACKGROUND()
	VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdrop(nil)
	if VCB_SAVE["CF_BF_custombackground"] then
		VCB_SAVE["CF_BF_custombackground"] = false
		if VCB_SAVE["CF_BF_customborder"] then
			VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdrop({bgFile=VCB_BACKGROUND_ARRAY[VCB_SAVE["CF_BF_background"]], edgeFile=VCB_SAVE["CF_BF_customborderpath"], tile=true, tileSize=16, edgeSize=16, insets={left=4,right=4,top=4,bottom=4}})
		else
			VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdrop({bgFile=VCB_BACKGROUND_ARRAY[VCB_SAVE["CF_BF_background"]], edgeFile=VCB_BORDER_ARRAY[VCB_SAVE["CF_BF_border"]], tile=true, tileSize=16, edgeSize=16, insets={left=4,right=4,top=4,bottom=4}})
		end
	else
		VCB_SAVE["CF_BF_custombackground"] = true
		if VCB_SAVE["CF_BF_customborder"] then
			VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdrop({bgFile=VCB_SAVE["CF_BF_custombackgroundpath"], edgeFile=VCB_SAVE["CF_BF_customborderpath"], tile=true, tileSize=16, edgeSize=16, insets={left=4,right=4,top=4,bottom=4}})
		else
			VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdrop({bgFile=VCB_SAVE["CF_BF_custombackgroundpath"], edgeFile=VCB_BORDER_ARRAY[VCB_SAVE["CF_BF_border"]], tile=true, tileSize=16, edgeSize=16, insets={left=4,right=4,top=4,bottom=4}})
		end
	end
	VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdropColor(VCB_SAVE["CF_BF_bgcolor_r"],VCB_SAVE["CF_BF_bgcolor_g"],VCB_SAVE["CF_BF_bgcolor_b"],VCB_SAVE["CF_BF_bgopacity"])
	VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdropBorderColor(VCB_SAVE["CF_BF_bordercolor_r"],VCB_SAVE["CF_BF_bordercolor_g"],VCB_SAVE["CF_BF_bordercolor_b"],VCB_SAVE["CF_BF_borderopacity"])
end

function VCB_BF_CF_FRAME_EDITBOX_BORDER_CHANGE(obj)
	VCB_SAVE["CF_BF_customborderpath"] = obj:GetText()
	if VCB_SAVE["CF_BF_customborder"] then
		VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdrop(nil)
		if VCB_SAVE["CF_BF_custombackground"] then
			VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdrop({bgFile=VCB_SAVE["CF_BF_custombackgroundpath"], edgeFile=VCB_SAVE["CF_BF_customborderpath"], tile=true, tileSize=16, edgeSize=16, insets={left=4,right=4,top=4,bottom=4}})
		else
			VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdrop({bgFile=VCB_BACKGROUND_ARRAY[VCB_SAVE["CF_BF_background"]], edgeFile=VCB_SAVE["CF_BF_customborderpath"], tile=true, tileSize=16, edgeSize=16, insets={left=4,right=4,top=4,bottom=4}})
		end
		VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdropColor(VCB_SAVE["CF_BF_bgcolor_r"],VCB_SAVE["CF_BF_bgcolor_g"],VCB_SAVE["CF_BF_bgcolor_b"],VCB_SAVE["CF_BF_bgopacity"])
		VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdropBorderColor(VCB_SAVE["CF_BF_bordercolor_r"],VCB_SAVE["CF_BF_bordercolor_g"],VCB_SAVE["CF_BF_bordercolor_b"],VCB_SAVE["CF_BF_borderopacity"])
	end
end

function VCB_BF_CF_FRAME_EDITBOX_BACKGROUND_CHANGE(obj)
	VCB_SAVE["CF_BF_customborderpath"] = obj:GetText()
	if VCB_SAVE["CF_BF_custombackground"] then
		VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdrop(nil)
		if VCB_SAVE["CF_BF_customborder"] then
			VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdrop({bgFile=VCB_SAVE["CF_BF_custombackgroundpath"], edgeFile=VCB_SAVE["CF_BF_customborderpath"], tile=true, tileSize=16, edgeSize=16, insets={left=4,right=4,top=4,bottom=4}})
		else
			VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdrop({bgFile=VCB_SAVE["CF_BF_custombackgroundpath"], edgeFile=VCB_BORDER_ARRAY[VCB_SAVE["CF_BF_border"]], tile=true, tileSize=16, edgeSize=16, insets={left=4,right=4,top=4,bottom=4}})
		end
		VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdropColor(VCB_SAVE["CF_BF_bgcolor_r"],VCB_SAVE["CF_BF_bgcolor_g"],VCB_SAVE["CF_BF_bgcolor_b"],VCB_SAVE["CF_BF_bgopacity"])
		VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdropBorderColor(VCB_SAVE["CF_BF_bordercolor_r"],VCB_SAVE["CF_BF_bordercolor_g"],VCB_SAVE["CF_BF_bordercolor_b"],VCB_SAVE["CF_BF_borderopacity"])
	end
end

function VCB_BF_CF_FRAME_BackdropSliderChange(obj)
	VCB_SAVE["CF_BF_background"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText("Background: "..VCB_SAVE["CF_BF_background"])
	if VCB_SAVE["CF_BF_custombackground"] == false then
		VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdrop(nil)
		if VCB_SAVE["CF_BF_customborder"] then
			VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdrop({bgFile=VCB_BACKGROUND_ARRAY[VCB_SAVE["CF_BF_background"]], edgeFile=VCB_SAVE["CF_BF_customborderpath"], tile=true, tileSize=16, edgeSize=16, insets={left=4,right=4,top=4,bottom=4}})
		else
			VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdrop({bgFile=VCB_BACKGROUND_ARRAY[VCB_SAVE["CF_BF_background"]], edgeFile=VCB_BORDER_ARRAY[VCB_SAVE["CF_BF_border"]], tile=true, tileSize=16, edgeSize=16, insets={left=4,right=4,top=4,bottom=4}})
		end
		VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdropColor(VCB_SAVE["CF_BF_bgcolor_r"],VCB_SAVE["CF_BF_bgcolor_g"],VCB_SAVE["CF_BF_bgcolor_b"],VCB_SAVE["CF_BF_bgopacity"])
		VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdropBorderColor(VCB_SAVE["CF_BF_bordercolor_r"],VCB_SAVE["CF_BF_bordercolor_g"],VCB_SAVE["CF_BF_bordercolor_b"],VCB_SAVE["CF_BF_borderopacity"])
	end
end

function VCB_BF_CF_FRAME_BorderOpaSliderChange(obj)
	VCB_SAVE["CF_BF_borderopacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText("Border opacity: "..VCB_SAVE["CF_BF_borderopacity"])
	VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdropBorderColor(VCB_SAVE["CF_BF_bordercolor_r"],VCB_SAVE["CF_BF_bordercolor_g"],VCB_SAVE["CF_BF_bordercolor_b"],VCB_SAVE["CF_BF_borderopacity"])
end

function VCB_BF_CF_FRAME_EDITBOX_BACKGROUND_CHANGE(obj)
	VCB_SAVE["CF_BF_custombackgroundpath"] = obj:GetText()
	if VCB_SAVE["CF_BF_custombackground"] then
		VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdrop(nil)
		if VCB_SAVE["CF_BF_customborder"] then
			VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdrop({bgFile=VCB_SAVE["CF_BF_custombackgroundpath"], edgeFile=VCB_SAVE["CF_BF_customborderpath"], tile=true, tileSize=16, edgeSize=16, insets={left=4,right=4,top=4,bottom=4}})
		else
			VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdrop({bgFile=VCB_SAVE["CF_BF_custombackgroundpath"], edgeFile=VCB_BORDER_ARRAY[VCB_SAVE["CF_BF_border"]], tile=true, tileSize=16, edgeSize=16, insets={left=4,right=4,top=4,bottom=4}})
		end
		VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdropColor(VCB_SAVE["CF_BF_bgcolor_r"],VCB_SAVE["CF_BF_bgcolor_g"],VCB_SAVE["CF_BF_bgcolor_b"],VCB_SAVE["CF_BF_bgopacity"])
		VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdropBorderColor(VCB_SAVE["CF_BF_bordercolor_r"],VCB_SAVE["CF_BF_bordercolor_g"],VCB_SAVE["CF_BF_bordercolor_b"],VCB_SAVE["CF_BF_borderopacity"])
	end
end

function VCB_BF_CF_FRAME2_ENABLEBORDER()
	if VCB_SAVE["CF_AURA_enableborder"] then
		VCB_SAVE["CF_AURA_enableborder"] = false
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetTexture(nil)
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["CF_AURA_bordercolor_r"],VCB_SAVE["CF_AURA_bordercolor_g"],VCB_SAVE["CF_AURA_bordercolor_b"],VCB_SAVE["CF_AURA_borderopactiy"])
			end
		end
	else
		VCB_SAVE["CF_AURA_enableborder"] = true
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				if VCB_SAVE["CF_AURA_customborder"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetTexture(VCB_SAVE["CF_AURA_customborderpath"])
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetTexture(VCB_AURABORDER_ARRAY[VCB_SAVE["CF_AURA_border"]])
				end
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["CF_AURA_bordercolor_r"],VCB_SAVE["CF_AURA_bordercolor_g"],VCB_SAVE["CF_AURA_bordercolor_b"],VCB_SAVE["CF_AURA_borderopactiy"])
			end
		end
	end
end

function VCB_BF_CF_FRAME2_AuraPaddingHSliderChange(obj)
	VCB_SAVE["CF_AURA_padding_h"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText("Padding H: "..VCB_SAVE["CF_AURA_padding_h"])
	VCB_BF_RepositioningAndResizing()
end

function VCB_BF_CF_FRAME2_AuraPaddingVSliderChange(obj)
	VCB_SAVE["CF_AURA_padding_v"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText("Padding V: "..VCB_SAVE["CF_AURA_padding_v"])
	VCB_BF_RepositioningAndResizing()
end

function VCB_BF_CF_FRAME_AuraBorderSliderChange(obj)
	VCB_SAVE["CF_AURA_border"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText("Border: "..VCB_SAVE["CF_AURA_border"])
	if VCB_SAVE["CF_AURA_customborder"] == false and VCB_SAVE["CF_AURA_enableborder"] then
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then	
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetTexture(nil)
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetTexture(VCB_AURABORDER_ARRAY[VCB_SAVE["CF_AURA_border"]])
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["CF_AURA_bordercolor_r"],VCB_SAVE["CF_AURA_bordercolor_g"],VCB_SAVE["CF_AURA_bordercolor_b"],VCB_SAVE["CF_AURA_borderopactiy"])
			end
		end
	end
end

function VCB_BF_CF_FRAME2_USE_CUSTOMBORDER()
	if VCB_SAVE["CF_AURA_enableborder"] then
		if VCB_SAVE["CF_AURA_customborder"] then
			VCB_SAVE["CF_AURA_customborder"] = false
			for i=0,31 do
				if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetTexture(nil)
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetTexture(VCB_AURABORDER_ARRAY[VCB_SAVE["CF_AURA_border"]])
				end
			end
		else
			VCB_SAVE["CF_AURA_customborder"] = true
			for i=0,31 do
				if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetTexture(nil)
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetTexture(VCB_SAVE["CF_AURA_customborderpath"])
				end
			end
		end
	end
end

function VCB_BF_CF_FRAME2_EDITBOX_BORDER_CHANGE(obj)
	VCB_SAVE["CF_AURA_customborderpath"] = obj:GetText()
	if VCB_SAVE["CF_AURA_enableborder"] and VCB_SAVE["CF_AURA_customborder"] then
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetTexture(nil)
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetTexture(VCB_SAVE["CF_AURA_customborderpath"])
			end
		end
	end
end

function VCB_BF_CF_FRAME2_ENABLEBGCOLOR()
	if VCB_SAVE["CF_AURA_enablebgcolor"] then
		VCB_SAVE["CF_AURA_enablebgcolor"] = false
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Icon"):SetVertexColor(1,1,1)
			end
		end
	else
		VCB_SAVE["CF_AURA_enablebgcolor"] = true
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Icon"):SetVertexColor(VCB_SAVE["CF_AURA_bgcolor_r"],VCB_SAVE["CF_AURA_bgcolor_g"],VCB_SAVE["CF_AURA_bgcolor_b"])
			end
		end
	end
end

function VCB_BF_CF_FRAME2_TIMER_ENABLEBORDER()
	if VCB_SAVE["CF_TIMER_border"] then
		VCB_SAVE["CF_TIMER_border"] = false
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetFont("Fonts\\"..VCB_SAVE["Timer_font"], VCB_SAVE["CF_TIMER_fontsize"])
			end
		end
	else
		VCB_SAVE["CF_TIMER_border"] = true
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetFont("Fonts\\"..VCB_SAVE["Timer_font"], VCB_SAVE["CF_TIMER_fontsize"], "OUTLINE")
			end
		end
	end
end

function VCB_BF_CF_FRAME_AuraTimerFontSizeSliderChange(obj)
	VCB_SAVE["CF_TIMER_fontsize"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText("Font size: "..VCB_SAVE["CF_TIMER_fontsize"])
	for i=0,31 do
		if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
			getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetFont("Fonts\\"..VCB_SAVE["Timer_font"], VCB_SAVE["CF_BF_scale"]*VCB_SAVE["CF_TIMER_fontsize"])
		end
	end
end

function VCB_BF_CF_FRAME_AuraTimerOpacitySliderChange(obj)
	VCB_SAVE["CF_TIMER_fontopacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText("Opacity: "..VCB_SAVE["CF_TIMER_fontopacity"])
	for i=0,31 do
		if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
			getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetAlpha(VCB_SAVE["CF_TIMER_fontopacity"])
		end
	end
end

---------------------------------------END CONSOLIDATED FRAME-----------------------------------------------------------------------------------------------------------------