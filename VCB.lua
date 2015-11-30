-- Title: Vanilla Consolidate Buffs (VCB)
-- Author: Shino <Synced> - Kronos

-- Global variables
VCB_NAME = "Vanilla Consolidate Buffs"
VCB_VERSION = "3.0"
VCB_IS_LOADED = false
VCB_BF_DUMMY_MODE = false
VCB_FONT_ARRAY = {}
VCB_FONT_ARRAY[1] = "Fonts\\FRIZQT__.ttf"
VCB_FONT_ARRAY[2] = "Fonts\\ARIALN.ttf"
VCB_FONT_ARRAY[3] = "Fonts\\skurri.ttf"
VCB_FONT_ARRAY[4] = "Fonts\\MORPHEUS.ttf"
VCB_FONT_ARRAY[5] = "Interface\\AddOns\\VCB\\Fonts\\DUF_Font1.ttf"
VCB_FONT_ARRAY[6] = "Interface\\AddOns\\VCB\\Fonts\\DUF_Font2.ttf"
VCB_FONT_ARRAY[7] = "Interface\\AddOns\\VCB\\Fonts\\DUF_Font3.ttf"
VCB_FONT_ARRAY[8] = "Interface\\AddOns\\VCB\\Fonts\\DUF_Font4.ttf"
VCB_FONT_ARRAY[9] = "Interface\\AddOns\\VCB\\Fonts\\DUF_Font5.ttf"
VCB_FONT_ARRAY[10] = "Interface\\AddOns\\VCB\\Fonts\\FUTURABC.TTF"
VCB_FONT_ARRAY[11] = "Interface\\AddOns\\VCB\\Fonts\\FUTUXKCI.TTF"
VCB_FONT_ARRAY[12] = "Interface\\AddOns\\VCB\\Fonts\\IX_Font_Bold.ttf"
VCB_FONT_ARRAY[13] = "Interface\\AddOns\\VCB\\Fonts\\IX_Font_Bold_Italic.ttf"
VCB_FONT_ARRAY[14] = "Interface\\AddOns\\VCB\\Fonts\\Montreal_Bold.ttf"
VCB_FONT_ARRAY[15] = "Interface\\AddOns\\VCB\\Fonts\\Montreal_Heavy_Bold.ttf"
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
VCB_WEAPONBORDER_ARRAY = {}
VCB_WEAPONBORDER_ARRAY[1] = "Interface\\Buttons\\UI-TempEnchant-Border.tga"
VCB_BACKGROUND_ARRAY = {}
VCB_BACKGROUND_ARRAY[1] = "Interface\\Tooltips\\UI-Tooltip-Background.tga"
VCB_BACKGROUND_ARRAY[2] = "Interface\\DialogFrame\\UI-DialogBox-Background.tga"
VCB_BACKGROUND_ARRAY[3] = "Interface\\CHARACTERFRAME\\UI-Party-Background.tga"
VCB_THEME_NAME = {}
VCB_THEME_NAME[1] = "Default"
VCB_THEME = {}
VCB_THEME[1] = {
	Timer_hours = false,
	Timer_hours_convert = false,
	Timer_minutes = true,
	Timer_minutes_convert = false,
	Timer_tenth = false,
	Timer_round = false,
	Timer_font = "Fonts\\FRIZQT__.ttf",
	Timer_flash = false,
	Timer_below_60 = false,
	Timer_below_60_color_r = 1,
	Timer_below_60_color_g = 0.82,
	Timer_below_60_color_b = 0,
	Timer_usecfont = false,
	Timer_customfont = "",
	CF_icon_color_r = 1,
	CF_icon_color_g = 1,
	CF_icon_color_b = 1,
	CF_icon_fontsize = 13,
	CF_icon_font = "Fonts\\FRIZQT__.ttf",
	CF_icon_opacity = 1,
	CF_icon_fontopacity = 1,
	CF_icon_texture = "icon",
	CF_icon_border = true,
	CF_icon_possiblebuffs = false,
	CF_icon_showpbgrayedout = false,
	CF_icon_attach = true,
	CF_icon_usecfont = false,
	CF_icon_customfont = "",
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
	CF_BF_invertorientation = false,
	CF_AURA_bgopacity = 1,
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
	CF_AURA_enablefontborder = true,
	CF_AURA_fontcolor_r = 1,
	CF_AURA_fontcolor_g = 1,
	CF_AURA_fontcolor_b = 1,
	CF_AURA_font = "Fonts\\FRIZQT__.ttf",
	CF_AURA_fontopacity = 1,
	CF_AURA_fontsize = 13,
	CF_AURA_fontoffset_x = -5,
	CF_AURA_fontoffset_y = 5,
	CF_TIMER_border = true,
	CF_TIMER_fontcolor_r = 1,
	CF_TIMER_fontcolor_g = 0.82,
	CF_TIMER_fontcolor_b = 0,
	CF_TIMER_fontsize = 10,
	CF_TIMER_fontopacity = 1,
	BF_GENERAL_verticalmode = false,
	BF_GENERAL_numperrow = 16,
	BF_GENERAL_padding_h = 2,
	BF_GENERAL_padding_v = 2,
	BF_GENERAL_scale = 1,
	BF_GENERAL_bgopacity = 1,
	BF_GENERAL_enablebgcolor = false,
	BF_GENERAL_bgcolor_r = 1,
	BF_GENERAL_bgcolor_g = 1,
	BF_GENERAL_bgcolor_b = 1,
	BF_GENERAL_enableborder = true,
	BF_GENERAL_fontcolor_r = 1,
	BF_GENERAL_fontcolor_g = 1,
	BF_GENERAL_fontcolor_b = 1,
	BF_GENERAL_font = "Fonts\\FRIZQT__.ttf",
	BF_GENERAL_fontopacity = 1,
	BF_GENERAL_fontsize = 13,
	BF_GENERAL_fontoffset_x = -5,
	BF_GENERAL_fontoffset_y = 5,
	BF_GENERAL_invert = false,
	BF_GENERAL_invertorientation = false,
	BF_GENERAL_usecfont = false,
	BF_GENERAL_customfont = "",
	BF_BORDER_enableborder = false,
	BF_BORDER_bordercolor_r = 1,
	BF_BORDER_bordercolor_g = 1,
	BF_BORDER_bordercolor_b = 1,
	BF_BORDER_borderopacity = 1,
	BF_BORDER_border = 1,
	BF_BORDER_usecustomborder = false,
	BF_BORDER_customborderpath = "",
	BF_TIMER_border = true,
	BF_TIMER_fontcolor_r = 1,
	BF_TIMER_fontcolor_g = 0.82,
	BF_TIMER_fontcolor_b = 0,
	BF_TIMER_fontopacity = 1,
	BF_TIMER_fontsize = 10,
	DBF_GENERAL_verticalmode = false,
	DBF_GENERAL_numperrow = 16,
	DBF_GENERAL_padding_h = 2,
	DBF_GENERAL_padding_v = 2,
	DBF_GENERAL_bgopacity = 1,
	DBF_GENERAL_scale = 1,
	DBF_GENERAL_enablebgcolor = false,
	DBF_GENERAL_bgcolor_r = 1,
	DBF_GENERAL_bgcolor_g = 1,
	DBF_GENERAL_bgcolor_b = 1,
	DBF_GENERAL_enableborder = true,
	DBF_GENERAL_fontcolor_r = 1,
	DBF_GENERAL_fontcolor_g = 1,
	DBF_GENERAL_fontcolor_b = 1,
	DBF_GENERAL_font = "Fonts\\FRIZQT__.ttf",
	DBF_GENERAL_fontopacity = 1,
	DBF_GENERAL_fontsize = 13,
	DBF_GENERAL_fontoffset_x = -5,
	DBF_GENERAL_fontoffset_y = 5,
	DBF_GENERAL_invert = false,
	DBF_GENERAL_invertorientation = false,
	DBF_GENERAL_usecfont = false,
	DBF_GENERAL_customfont = "",
	DBF_BORDER_enableborder = true,
	DBF_BORDER_usecustomborder = false,
	DBF_BORDER_customborderpath = "",
	DBF_BORDER_border = 1,
	DBF_BORDER_borderopacity = 1,
	DBF_BORDER_nonecolor_r = 0.8,
	DBF_BORDER_nonecolor_g = 0,
	DBF_BORDER_nonecolor_b = 0,
	DBF_BORDER_poisoncolor_r = 0,
	DBF_BORDER_poisoncolor_g = 0.6,
	DBF_BORDER_poisoncolor_b = 0,
	DBF_BORDER_magiccolor_r = 0.2,
	DBF_BORDER_magiccolor_g = 0.6,
	DBF_BORDER_magiccolor_b = 1,
	DBF_BORDER_cursecolor_r = 0.6,
	DBF_BORDER_cursecolor_g = 0,
	DBF_BORDER_cursecolor_b = 1,
	DBF_BORDER_diseasecolor_r = 0.6,
	DBF_BORDER_diseasecolor_g = 0.4,
	DBF_BORDER_diseasecolor_b = 0,
	DBF_TIMER_enableborder = true,
	DBF_TIMER_fontcolor_r = 1,
	DBF_TIMER_fontcolor_g = 0.82,
	DBF_TIMER_fontcolor_b = 0,
	DBF_TIMER_fontsize = 10,
	DBF_TIMER_fontopacity = 1,
	WP_GENERAL_verticalmode = false,
	WP_GENERAL_enablebgcolor = false,
	WP_GENERAL_enableborder = true,
	WP_GENERAL_bgcolor_r = 1,
	WP_GENERAL_bgcolor_g = 1,
	WP_GENERAL_bgcolor_b = 1,
	WP_GENERAL_attach = false,
	WP_GENERAL_padding_h = 2,
	WP_GENERAL_padding_v = 2,
	WP_GENERAL_fontsize = 13,
	WP_GENERAL_fontopacity = 1,
	WP_GENERAL_fontcolor_r = 1,
	WP_GENERAL_fontcolor_g = 1,
	WP_GENERAL_fontcolor_b = 1,
	WP_GENERAL_bgopacity = 1,
	WP_GENERAL_scale = 1,
	WP_GENERAL_font = "Fonts\\FRIZQT__.ttf",
	WP_GENERAL_offset_x = -2,
	WP_GENERAL_offset_y = 2,
	WP_GENERAL_usecfont = false,
	WP_GENERAL_customfont = "",
	WP_BORDER_enableborder = true,
	WP_BORDER_usecustomborder = false,
	WP_BORDER_bordercolor_r = 0.2,
	WP_BORDER_bordercolor_g = 0.2,
	WP_BORDER_bordercolor_b = 0.8,
	WP_BORDER_borderopacity = 1,
	WP_BORDER_border = 1,
	WP_BORDER_customborderpath = "",
	WP_TIMER_enableborder = true,
	WP_TIMER_fontcolor_r = 1,
	WP_TIMER_fontcolor_g = 0.82,
	WP_TIMER_fontcolor_b = 0,
	WP_TIMER_fontopacity = 1,
	WP_TIMER_fontsize = 10,
	MISC_disable_CF = false,
	MISC_disable_BB = false,
}

--[[
-- VCB_OnLoad()
-- @returns: Void
-- Use: Initialization and registering events
--]]
function VCB_OnLoad()
	this:RegisterEvent("ADDON_LOADED")
	this:RegisterEvent("PARTY_MEMBERS_CHANGED")
	this:RegisterEvent("RAID_ROSTER_UPDATE")
	this:RegisterEvent("PLAYER_ENTERING_WORLD")

	SLASH_VCB1 = "/VanillaConsolidateBuffs"
	SLASH_VCB2 = "/vanillaconsolidatebuffs"
	SLASH_VCB3 = "/VCB"
	SLASH_VCB4 = "/vcb"
	SlashCmdList["VCB"] = function(msg)
		VCB_SlashCommandHandler(msg)
	end
	
	DEFAULT_CHAT_FRAME:AddMessage("VCB "..VCB_VERSION..VCB_WELCOME_TEXT)
end

function VCB_OnEvent(event)
	if event == "ADDON_LOADED" and VCB_IS_LOADED == false then
		if VCB_SAVE == nil then
			VCB_SAVE = {}
			VCB_SAVE = {
				Timer_hours = false,
				Timer_hours_convert = false,
				Timer_minutes = true,
				Timer_minutes_convert = false,
				Timer_tenth = false,
				Timer_round = false,
				Timer_font = "Fonts\\FRIZQT__.ttf",
				Timer_flash = false,
				Timer_below_60 = false,
				Timer_below_60_color_g = 0.82,
				Timer_below_60_color_b = 0,
				Timer_usecfont = false,
				Timer_customfont = "",
				CF_icon_color_r = 1,
				CF_icon_color_g = 1,
				CF_icon_color_b = 1,
				CF_icon_fontsize = 13,
				CF_icon_font = "Fonts\\FRIZQT__.ttf",
				CF_icon_opacity = 1,
				CF_icon_fontopacity = 1,
				CF_icon_texture = "icon",
				CF_icon_border = true,
				CF_icon_possiblebuffs = false,
				CF_icon_showpbgrayedout = false,
				CF_icon_attach = true,
				CF_icon_usecfont = false,
				CF_icon_customfont = "",
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
				CF_BF_invertorientation = false,
				CF_AURA_bgopacity = 1,
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
				CF_AURA_enablefontborder = true,
				CF_AURA_fontcolor_r = 1,
				CF_AURA_fontcolor_g = 1,
				CF_AURA_fontcolor_b = 1,
				CF_AURA_font = "Fonts\\FRIZQT__.ttf",
				CF_AURA_fontopacity = 1,
				CF_AURA_fontsize = 13,
				CF_AURA_fontoffset_x = -5,
				CF_AURA_fontoffset_y = 5,
				CF_TIMER_border = true,
				CF_TIMER_fontcolor_r = 1,
				CF_TIMER_fontcolor_g = 0.82,
				CF_TIMER_fontcolor_b = 0,
				CF_TIMER_fontsize = 10,
				CF_TIMER_fontopacity = 1,
				BF_GENERAL_verticalmode = false,
				BF_GENERAL_numperrow = 16,
				BF_GENERAL_padding_h = 2,
				BF_GENERAL_padding_v = 2,
				BF_GENERAL_scale = 1,
				BF_GENERAL_bgopacity = 1,
				BF_GENERAL_enablebgcolor = false,
				BF_GENERAL_bgcolor_r = 1,
				BF_GENERAL_bgcolor_g = 1,
				BF_GENERAL_bgcolor_b = 1,
				BF_GENERAL_enableborder = true,
				BF_GENERAL_fontcolor_r = 1,
				BF_GENERAL_fontcolor_g = 1,
				BF_GENERAL_fontcolor_b = 1,
				BF_GENERAL_font = "Fonts\\FRIZQT__.ttf",
				BF_GENERAL_fontopacity = 1,
				BF_GENERAL_fontsize = 13,
				BF_GENERAL_fontoffset_x = -5,
				BF_GENERAL_fontoffset_y = 5,
				BF_GENERAL_invert = false,
				BF_GENERAL_invertorientation = false,
				BF_GENERAL_usecfont = false,
				BF_GENERAL_customfont = "",
				BF_BORDER_enableborder = false,
				BF_BORDER_bordercolor_r = 1,
				BF_BORDER_bordercolor_g = 1,
				BF_BORDER_bordercolor_b = 1,
				BF_BORDER_borderopacity = 1,
				BF_BORDER_border = 1,
				BF_BORDER_usecustomborder = false,
				BF_BORDER_customborderpath = "",
				BF_TIMER_border = true,
				BF_TIMER_fontcolor_r = 1,
				BF_TIMER_fontcolor_g = 0.82,
				BF_TIMER_fontcolor_b = 0,
				BF_TIMER_fontopacity = 1,
				BF_TIMER_fontsize = 10,
				DBF_GENERAL_verticalmode = false,
				DBF_GENERAL_numperrow = 16,
				DBF_GENERAL_padding_h = 2,
				DBF_GENERAL_padding_v = 2,
				DBF_GENERAL_bgopacity = 1,
				DBF_GENERAL_scale = 1,
				DBF_GENERAL_enablebgcolor = false,
				DBF_GENERAL_bgcolor_r = 1,
				DBF_GENERAL_bgcolor_g = 1,
				DBF_GENERAL_bgcolor_b = 1,
				DBF_GENERAL_enableborder = true,
				DBF_GENERAL_fontcolor_r = 1,
				DBF_GENERAL_fontcolor_g = 1,
				DBF_GENERAL_fontcolor_b = 1,
				DBF_GENERAL_font = "Fonts\\FRIZQT__.ttf",
				DBF_GENERAL_fontopacity = 1,
				DBF_GENERAL_fontsize = 13,
				DBF_GENERAL_fontoffset_x = -5,
				DBF_GENERAL_fontoffset_y = 5,
				DBF_GENERAL_invert = false,
				DBF_GENERAL_invertorientation = false,
				DBF_GENERAL_usecfont = false,
				DBF_GENERAL_customfont = "",
				DBF_BORDER_enableborder = true,
				DBF_BORDER_usecustomborder = false,
				DBF_BORDER_customborderpath = "",
				DBF_BORDER_border = 1,
				DBF_BORDER_borderopacity = 1,
				DBF_BORDER_nonecolor_r = 0.8,
				DBF_BORDER_nonecolor_g = 0,
				DBF_BORDER_nonecolor_b = 0,
				DBF_BORDER_poisoncolor_r = 0,
				DBF_BORDER_poisoncolor_g = 0.6,
				DBF_BORDER_poisoncolor_b = 0,
				DBF_BORDER_magiccolor_r = 0.2,
				DBF_BORDER_magiccolor_g = 0.6,
				DBF_BORDER_magiccolor_b = 1,
				DBF_BORDER_cursecolor_r = 0.6,
				DBF_BORDER_cursecolor_g = 0,
				DBF_BORDER_cursecolor_b = 1,
				DBF_BORDER_diseasecolor_r = 0.6,
				DBF_BORDER_diseasecolor_g = 0.4,
				DBF_BORDER_diseasecolor_b = 0,
				DBF_TIMER_enableborder = true,
				DBF_TIMER_fontcolor_r = 1,
				DBF_TIMER_fontcolor_g = 0.82,
				DBF_TIMER_fontcolor_b = 0,
				DBF_TIMER_fontsize = 10,
				DBF_TIMER_fontopacity = 1,
				WP_GENERAL_verticalmode = false,
				WP_GENERAL_enablebgcolor = false,
				WP_GENERAL_enableborder = true,
				WP_GENERAL_bgcolor_r = 1,
				WP_GENERAL_bgcolor_g = 1,
				WP_GENERAL_bgcolor_b = 1,
				WP_GENERAL_attach = false,
				WP_GENERAL_padding_h = 2,
				WP_GENERAL_padding_v = 2,
				WP_GENERAL_fontsize = 13,
				WP_GENERAL_fontopacity = 1,
				WP_GENERAL_fontcolor_r = 1,
				WP_GENERAL_fontcolor_g = 1,
				WP_GENERAL_fontcolor_b = 1,
				WP_GENERAL_bgopacity = 1,
				WP_GENERAL_scale = 1,
				WP_GENERAL_font = "Fonts\\FRIZQT__.ttf",
				WP_GENERAL_offset_x = -2,
				WP_GENERAL_offset_y = 2,
				WP_GENERAL_usecfont = false,
				WP_GENERAL_customfont = "",
				WP_BORDER_enableborder = true,
				WP_BORDER_usecustomborder = false,
				WP_BORDER_bordercolor_r = 0.2,
				WP_BORDER_bordercolor_g = 0.2,
				WP_BORDER_bordercolor_b = 0.8,
				WP_BORDER_borderopacity = 1,
				WP_BORDER_border = 1,
				WP_BORDER_customborderpath = "",
				WP_TIMER_enableborder = true,
				WP_TIMER_fontcolor_r = 1,
				WP_TIMER_fontcolor_g = 0.82,
				WP_TIMER_fontcolor_b = 0,
				WP_TIMER_fontopacity = 1,
				WP_TIMER_fontsize = 10,
				MISC_disable_CF = false,
				MISC_disable_BB = false,
			}
		end
		if VCB_BF_LOCKED == nil then
			VCB_BF_LOCKED = false
		end
		if Consolidated_Buffs == nil then
			Consolidated_Buffs = {}
			Consolidated_Buffs = {
				-- Druid Buffs
				[1] = VCB_CONSOLIDATED_BUFFS_TEXT_1,
				[2] = VCB_CONSOLIDATED_BUFFS_TEXT_2,
				-- Priest Buffs
				[3] = VCB_CONSOLIDATED_BUFFS_TEXT_3,
				[4] = VCB_CONSOLIDATED_BUFFS_TEXT_4,
				[5] = VCB_CONSOLIDATED_BUFFS_TEXT_5,
				[6] = VCB_CONSOLIDATED_BUFFS_TEXT_6,
				[7] = VCB_CONSOLIDATED_BUFFS_TEXT_7,
				[8] = VCB_CONSOLIDATED_BUFFS_TEXT_8,
				-- Mage Buffs
				[9] = VCB_CONSOLIDATED_BUFFS_TEXT_9,
				[10] = VCB_CONSOLIDATED_BUFFS_TEXT_10,
				-- Paladin Buffs
				[11] = VCB_CONSOLIDATED_BUFFS_TEXT_11,
				[12] = VCB_CONSOLIDATED_BUFFS_TEXT_12,
				[13] = VCB_CONSOLIDATED_BUFFS_TEXT_13,
				[14] = VCB_CONSOLIDATED_BUFFS_TEXT_14,
				[15] = VCB_CONSOLIDATED_BUFFS_TEXT_15,
				[16] = VCB_CONSOLIDATED_BUFFS_TEXT_16,
				-- Hunter
				[17] = VCB_CONSOLIDATED_BUFFS_TEXT_17,
				-- Warlock, Rogue and Warrior left out
			}
		end
		if Banned_Buffs == nil then
			Banned_Buffs = {}
		end
		if VCB_Profile == nil then
			VCB_Profile = {}
		end
		if VCB_Profile_Name == nil then
			VCB_Profile_Name = {}
		end
		if VCB_CUR_PROFILE == nil then
			VCB_CUR_PROFILE = VCB_CUR_PROFILE_TEXT
		end
		if VCB_WP_POSX == nil then
			VCB_WP_POSX = 0
		end
		if VCB_WP_POSY == nil then
			VCB_WP_POSY = 0
		end
		if VCB_WP_POINT == nil then
			VCB_WP_POINT = "CENTER"
		end
		if VCB_ICON_POSX == nil then
			VCB_ICON_POSX = 0
		end
		if VCB_ICON_POSY == nil then
			VCB_ICON_POSY = 0
		end
		if VCB_ICON_POINT == nil then
			VCB_ICON_POINT = "CENTER"
		end
		
		-- New variables since v2.5:
		if VCB_SAVE["Timer_below_60"] == nil then VCB_SAVE["Timer_below_60"] = false end
		if VCB_SAVE["Timer_below_60_color_r"] == nil then VCB_SAVE["Timer_below_60_color_r"] = 1 end
		if VCB_SAVE["Timer_below_60_color_g"] == nil then VCB_SAVE["Timer_below_60_color_g"] = 0.82 end
		if VCB_SAVE["Timer_below_60_color_b"] == nil then VCB_SAVE["Timer_below_60_color_b"] = 0 end
		if VCB_SAVE["CF_icon_attach"] == nil then VCB_SAVE["CF_icon_attach"] = true end
		if VCB_MM_ICON == nil then VCB_MM_ICON = false end
		if VCB_SAVE["CF_icon_usecfont"] == nil then VCB_SAVE["CF_icon_usecfont"] = false end
		if VCB_SAVE["CF_icon_customfont"] == nil then VCB_SAVE["CF_icon_customfont"] = "" end
		if VCB_SAVE["Timer_usecfont"] == nil then VCB_SAVE["Timer_usecfont"] = false end
		if VCB_SAVE["Timer_customfont"] == nil then VCB_SAVE["Timer_customfont"] = "" end
		if VCB_SAVE["BF_GENERAL_usecfont"] == nil then VCB_SAVE["BF_GENERAL_usecfont"] = false end
		if VCB_SAVE["BF_GENERAL_customfont"] == nil then VCB_SAVE["BF_GENERAL_customfont"] = "" end
		if VCB_SAVE["DBF_GENERAL_usecfont"] == nil then VCB_SAVE["DBF_GENERAL_usecfont"] = false end
		if VCB_SAVE["DBF_GENERAL_customfont"] == nil then VCB_SAVE["DBF_GENERAL_customfont"] = "" end
		if VCB_SAVE["WP_GENERAL_usecfont"] == nil then VCB_SAVE["WP_GENERAL_usecfont"] = false end
		if VCB_SAVE["WP_GENERAL_customfont"] == nil then VCB_SAVE["WP_GENERAL_customfont"] = "" end
		
		-- To catch a crash due to the font update
		if strsub(VCB_SAVE["Timer_font"], 1, 5) ~= "Fonts" then
			VCB_SAVE["Timer_font"] = "Fonts\\FRIZQT__.ttf"
			VCB_SAVE["CF_icon_font"] = "Fonts\\FRIZQT__.ttf"
			VCB_SAVE["CF_AURA_font"] = "Fonts\\FRIZQT__.ttf"
			VCB_SAVE["BF_GENERAL_font"] = "Fonts\\FRIZQT__.ttf"
			VCB_SAVE["DBF_GENERAL_font"] = "Fonts\\FRIZQT__.ttf"
			VCB_SAVE["WP_GENERAL_font"] = "Fonts\\FRIZQT__.ttf"
		end
		
		VCB_INITIALIZE()
		VCB_BF_Lock(VCB_BF_LOCKED)
		VCB_IS_LOADED = true
	elseif (event == "PARTY_MEMBERS_CHANGED" or event == "RAID_ROSTER_UPDATE") then
		if VCB_SAVE["CF_icon_possiblebuffs"] then
			VCB_BF_RepositioningAndResizing()
		end
	elseif (event == "PLAYER_ENTERING_WORLD") then
		VCB_BF_WEAPON_BUTTON_OnEvent(false)
	end	
end

function VCB_INITIALIZE()
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
		VCB_BF_CONSOLIDATED_ICONCount:SetFont(VCB_SAVE["CF_icon_font"], VCB_SAVE["CF_icon_fontsize"], "OUTLINE")
	else
		VCB_BF_CONSOLIDATED_ICONCount:SetFont(VCB_SAVE["CF_icon_font"], VCB_SAVE["CF_icon_fontsize"])
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
	for i=0,15 do
		if VCB_SAVE["DBF_GENERAL_invertorientation"] then
			if VCB_SAVE["DBF_GENERAL_invert"] then
				local j = 15-i
				getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
				if VCB_SAVE["DBF_GENERAL_verticalmode"] then
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*i - floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
				if VCB_SAVE["DBF_GENERAL_verticalmode"] then
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*i - floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			end
		else
			if VCB_SAVE["DBF_GENERAL_invert"] then
				local j = 15-i
				getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
				if VCB_SAVE["DBF_GENERAL_verticalmode"] then
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
				if VCB_SAVE["DBF_GENERAL_verticalmode"] then
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			end
		end
		if VCB_SAVE["DBF_GENERAL_enablebgcolor"] then
			getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Icon"):SetVertexColor(VCB_SAVE["DBF_GENERAL_bgcolor_r"],VCB_SAVE["DBF_GENERAL_bgcolor_g"],VCB_SAVE["DBF_GENERAL_bgcolor_b"],VCB_SAVE["DBF_GENERAL_bgopacity"])
		else
			getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Icon"):SetVertexColor(1,1,1,VCB_SAVE["DBF_GENERAL_bgopacity"])
		end
		getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetTexture(nil)
		if VCB_SAVE["DBF_BORDER_enableborder"] then
			if VCB_SAVE["DBF_BORDER_usecustomborder"] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetTexture(VCB_SAVE["DBF_BORDER_customborderpath"])
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetTexture(VCB_AURABORDER_ARRAY[VCB_SAVE["DBF_BORDER_border"]])
			end
		end
		getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetAlpha(VCB_SAVE["DBF_BORDER_borderopacity"]) -- Need colors
		if VCB_SAVE["Timer_usecfont"] then
			if VCB_SAVE["DBF_TIMER_enableborder"] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["DBF_TIMER_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["DBF_TIMER_fontsize"])
			end
		else
			if VCB_SAVE["DBF_TIMER_enableborder"] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["DBF_TIMER_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["DBF_TIMER_fontsize"])
			end
		end
		if VCB_SAVE["DBF_GENERAL_usecfont"] then
			if VCB_SAVE["DBF_GENERAL_enableborder"] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["DBF_GENERAL_customfont"], VCB_SAVE["DBF_GENERAL_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["DBF_GENERAL_customfont"], VCB_SAVE["DBF_GENERAL_fontsize"])
			end
		else
			if VCB_SAVE["DBF_GENERAL_enableborder"] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["DBF_GENERAL_font"], VCB_SAVE["DBF_GENERAL_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["DBF_GENERAL_font"], VCB_SAVE["DBF_GENERAL_fontsize"])
			end
		end
		getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetVertexColor(VCB_SAVE["DBF_GENERAL_fontcolor_r"],VCB_SAVE["DBF_GENERAL_fontcolor_g"],VCB_SAVE["DBF_GENERAL_fontcolor_b"],VCB_SAVE["DBF_GENERAL_fontopacity"])
		getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):ClearAllPoints()
		getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetPoint("BOTTOMRIGHT", VCB_SAVE["DBF_GENERAL_fontoffset_x"], VCB_SAVE["DBF_GENERAL_fontoffset_y"])
		getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Duration"):SetTextColor(VCB_SAVE["DBF_TIMER_fontcolor_r"],VCB_SAVE["DBF_TIMER_fontcolor_g"],VCB_SAVE["DBF_TIMER_fontcolor_b"],VCB_SAVE["DBF_TIMER_fontopacity"])
	end
	for i=0,1 do
		getglobal("VCB_BF_WEAPON_BUTTON"..i):ClearAllPoints()
		if VCB_SAVE["WP_GENERAL_verticalmode"] then
			getglobal("VCB_BF_WEAPON_BUTTON"..i):SetPoint("TOPRIGHT", VCB_BF_WEAPON_FRAME, "TOPRIGHT", 0, -(44+VCB_SAVE["WP_GENERAL_padding_v"])*i)
		else
			getglobal("VCB_BF_WEAPON_BUTTON"..i):SetPoint("TOPRIGHT", VCB_BF_WEAPON_FRAME, "TOPRIGHT", -(32+VCB_SAVE["WP_GENERAL_padding_h"])*i, 0)
		end
		if VCB_SAVE["WP_GENERAL_enablebgcolor"] then
			getglobal("VCB_BF_WEAPON_BUTTON"..i.."Icon"):SetVertexColor(VCB_SAVE["WP_GENERAL_bgcolor_r"],VCB_SAVE["WP_GENERAL_bgcolor_g"],VCB_SAVE["WP_GENERAL_bgcolor_b"],VCB_SAVE["WP_GENERAL_bgopacity"])
		else
			getglobal("VCB_BF_WEAPON_BUTTON"..i.."Icon"):SetVertexColor(1,1,1,VCB_SAVE["WP_GENERAL_bgopacity"])
		end
		getglobal("VCB_BF_WEAPON_BUTTON"..i.."Border"):SetTexture(nil)
		if VCB_SAVE["WP_BORDER_enableborder"] then
			if VCB_SAVE["WP_BORDER_usecustomborder"] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Border"):SetTexture(VCB_SAVE["WP_BORDER_customborderpath"])
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Border"):SetTexture(VCB_WEAPONBORDER_ARRAY[VCB_SAVE["WP_BORDER_border"]]) -- why does the debuff border not work :/
			end
			getglobal("VCB_BF_WEAPON_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["WP_BORDER_bordercolor_r"],VCB_SAVE["WP_BORDER_bordercolor_g"],VCB_SAVE["WP_BORDER_bordercolor_b"],VCB_SAVE["WP_BORDER_borderopacity"])
		end
		if VCB_SAVE["Timer_usecfont"] then
			if VCB_SAVE["WP_TIMER_enableborder"] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["WP_TIMER_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["WP_TIMER_fontsize"])
			end
		else
			if VCB_SAVE["WP_TIMER_enableborder"] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["WP_TIMER_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["WP_TIMER_fontsize"])
			end
		end
		if VCB_SAVE["WP_GENERAL_usecfont"] then
			if VCB_SAVE["WP_GENERAL_enableborder"] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_customfont"], VCB_SAVE["WP_GENERAL_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_customfont"], VCB_SAVE["WP_GENERAL_fontsize"])
			end
		else
			if VCB_SAVE["WP_GENERAL_enableborder"] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_font"], VCB_SAVE["WP_GENERAL_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_font"], VCB_SAVE["WP_GENERAL_fontsize"])
			end
		end
		getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetVertexColor(VCB_SAVE["WP_GENERAL_fontcolor_r"],VCB_SAVE["WP_GENERAL_fontcolor_g"],VCB_SAVE["WP_GENERAL_fontcolor_b"],VCB_SAVE["WP_GENERAL_fontopacity"])
		getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetPoint("BOTTOMRIGHT", VCB_SAVE["WP_GENERAL_offset_x"], VCB_SAVE["WP_GENERAL_offset_y"])
		getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetTextColor(VCB_SAVE["WP_TIMER_fontcolor_r"],VCB_SAVE["WP_TIMER_fontcolor_g"],VCB_SAVE["WP_TIMER_fontcolor_b"],VCB_SAVE["WP_TIMER_fontopacity"])
	end
	VCB_BF_CONSOLIDATED_ICON:ClearAllPoints()
	if VCB_SAVE["CF_icon_attach"] then
		VCB_BF_CONSOLIDATED_ICON:SetPoint("TOPRIGHT", 0, 0)
	else
		VCB_BF_CONSOLIDATED_ICON:SetPoint(VCB_ICON_POINT, UIParent, VCB_ICON_POINT, VCB_ICON_POSX, VCB_ICON_POSY)
	end
	if VCB_SAVE["CF_icon_usecfont"] then
		if VCB_SAVE["CF_icon_border"] then
			VCB_BF_CONSOLIDATED_ICONCount:SetFont(VCB_SAVE["CF_icon_customfont"], VCB_SAVE["CF_icon_fontsize"], "OUTLINE")
		else
			VCB_BF_CONSOLIDATED_ICONCount:SetFont(VCB_SAVE["CF_icon_customfont"], VCB_SAVE["CF_icon_fontsize"])
		end
	else
		if VCB_SAVE["CF_icon_border"] then
			VCB_BF_CONSOLIDATED_ICONCount:SetFont(VCB_SAVE["CF_icon_font"], VCB_SAVE["CF_icon_fontsize"], "OUTLINE")
		else
			VCB_BF_CONSOLIDATED_ICONCount:SetFont(VCB_SAVE["CF_icon_font"], VCB_SAVE["CF_icon_fontsize"])
		end
	end
	if (not VCB_BF_PM_FRAME:IsVisible()) then
		VCB_BF_WEAPON_BUTTON_OnEvent(false)
	end
	if VCB_SAVE["WP_GENERAL_attach"] then
		VCB_BF_WEAPON_FRAME:ClearAllPoints()
		VCB_BF_WEAPON_FRAME:SetScale(1)
		VCB_BF_WEAPON_FRAME:SetParent(VCB_BF_BUFF_FRAME)
		VCB_BF_WEAPON_FRAME:SetPoint("TOPRIGHT", VCB_BF_BUFF_FRAME, "TOPRIGHT", 0, 0)
	else
		VCB_BF_WEAPON_FRAME:SetPoint(VCB_WP_POINT, UIParent, VCB_WP_POINT, VCB_WP_POSX, VCB_WP_POSY)
		VCB_BF_WEAPON_FRAME:SetScale(VCB_SAVE["WP_GENERAL_scale"])
	end
	VCB_BF_CONSOLIDATED_BUFFFRAME:SetScale(VCB_SAVE["CF_BF_scale"])
	VCB_BF_BUFF_FRAME:SetScale(VCB_SAVE["BF_GENERAL_scale"])
	VCB_BF_DEBUFF_FRAME:SetScale(VCB_SAVE["DBF_GENERAL_scale"])
	if VCB_SAVE["MISC_disable_CF"] then
		VCB_BF_CONSOLIDATED_ICON:Hide()
	end
	if VCB_MM_ICON then
		VCB_BF_MINIMAP_FRAME:Hide()
	end
end

function VCB_SlashCommandHandler(msg)
	if(msg) then
		VCB_BF_ConfigFrame:Show()
	end
end

function VCB_tablelength(T)
	local count = 0
	for _ in pairs(T) do 
		count = count + 1 
	end 
	return count
end

function VCB_Contains(table, element)
	for _, value in pairs(table) do
		if value == element then
			return true
		end
	end
	return false
end

function VCB_GetKeys(a, b)
	local i = 0
	while true do
		if a[i] == b then
			return i
		end
	end
end

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
	getglobal("VCB_BF_BF_FRAME2"):Hide()
	getglobal("VCB_BF_DBF_FRAME"):Hide()
	getglobal("VCB_BF_DBF_FRAME2"):Hide()
	getglobal("VCB_BF_WP_FRAME"):Hide()
	getglobal("VCB_BF_WP_FRAME2"):Hide()
	getglobal("VCB_BF_MISC_FRAME"):Hide()
	getglobal("VCB_BF_PM_FRAME"):Hide()
	--getglobal("VCB_BF_OM_FRAME"):Hide()
	getglobal("VCB_BF_ABOUT_FRAME"):Hide()
end

function VCB_OPTIONS_SHOW(frame, text)
	getglobal(frame):Show()
	getglobal("VCB_BF_CONFIG_FRAME_TITLE_TEXT"):SetText(text)
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
		getglobal("VCB_BF_TIMER_FRAME_FontSliderText"):SetText(VCB_COMMON_SLIDER_FONT..": "..VCB_SAVE["Timer_font"])
		getglobal("VCB_BF_TIMER_FRAME_CHECKBUTTON8"):SetChecked(VCB_SAVE["Timer_flash"])
		getglobal("VCB_BF_TIMER_FRAME_CHECKBUTTON9"):SetChecked(VCB_SAVE["Timer_below_60"])
		getglobal("VCB_BF_TIMER_FRAME_ColorNormalTexture"):SetVertexColor(VCB_SAVE["Timer_below_60_color_r"], VCB_SAVE["Timer_below_60_color_g"], VCB_SAVE["Timer_below_60_color_b"])
		getglobal("VCB_BF_TIMER_FRAME_Color_SwatchBg").r = VCB_SAVE["Timer_below_60_color_r"]
		getglobal("VCB_BF_TIMER_FRAME_Color_SwatchBg").g = VCB_SAVE["Timer_below_60_color_g"]
		getglobal("VCB_BF_TIMER_FRAME_Color_SwatchBg").b = VCB_SAVE["Timer_below_60_color_b"]
		getglobal("VCB_BF_TIMER_FRAME_CHECKBUTTON_CUSTOMFONT"):SetChecked(VCB_SAVE["Timer_usecfont"])
		getglobal("VCB_BF_TIMER_FRAME_EDITBOX_CUSTOMFONT"):SetText(VCB_SAVE["Timer_customfont"])
	elseif frame == "VCB_BF_CF_FRAME" then	
		getglobal("VCB_BF_CF_FRAME_AnchorSlider"):SetValue(VCB_SAVE["CF_BF_anchor"])
		getglobal("VCB_BF_CF_FRAME_AnchorSliderText"):SetText(VCB_CF_FRAME_BF_ANCHOR..": "..VCB_ANCHOR_ARRAY[VCB_SAVE["CF_BF_anchor"]])
		getglobal("VCB_BF_CF_FRAME_ScaleSlider"):SetValue(VCB_SAVE["CF_BF_scale"])
		getglobal("VCB_BF_CF_FRAME_ScaleSliderText"):SetText(VCB_COMMON_SLIDER_SCALE..": "..VCB_SAVE["CF_BF_scale"])
		getglobal("VCB_BF_CF_FRAME_CHECKBUTTON1"):SetChecked(VCB_SAVE["CF_BF_invert"])
		getglobal("VCB_BF_CF_FRAME_NumPerRowSlider"):SetValue(VCB_SAVE["CF_BF_numperrow"])
		getglobal("VCB_BF_CF_FRAME_NumPerRowSliderText"):SetText(VCB_COMMON_SLIDER_BUFFS_PER_ROW..": "..VCB_SAVE["CF_BF_numperrow"])
		getglobal("VCB_BF_CF_FRAME_ColorNormalTexture"):SetVertexColor(VCB_SAVE["CF_icon_color_r"], VCB_SAVE["CF_icon_color_g"], VCB_SAVE["CF_icon_color_b"])
		getglobal("VCB_BF_CF_FRAME_Color_SwatchBg").r = VCB_SAVE["CF_icon_color_r"]
		getglobal("VCB_BF_CF_FRAME_Color_SwatchBg").g = VCB_SAVE["CF_icon_color_g"]
		getglobal("VCB_BF_CF_FRAME_Color_SwatchBg").b = VCB_SAVE["CF_icon_color_b"]
		getglobal("VCB_BF_CF_FRAME_SizeSlider"):SetValue(VCB_SAVE["CF_icon_fontsize"])
		getglobal("VCB_BF_CF_FRAME_SizeSliderText"):SetText(VCB_COMMON_SLIDER_FONT_SIZE..": "..VCB_SAVE["CF_icon_fontsize"])
		getglobal("VCB_BF_CF_FRAME_FontSlider"):SetValue(VCB_Table_GetKeys(VCB_FONT_ARRAY, VCB_SAVE["CF_icon_font"]))
		getglobal("VCB_BF_CF_FRAME_FontSliderText"):SetText(VCB_COMMON_SLIDER_FONT..": "..VCB_SAVE["CF_icon_font"])
		getglobal("VCB_BF_CF_FRAME_AlphaSlider"):SetValue(VCB_SAVE["CF_icon_opacity"])
		getglobal("VCB_BF_CF_FRAME_AlphaSliderText"):SetText(VCB_CF_FRAME_ICON_OPACITY..": "..VCB_SAVE["CF_icon_opacity"])
		getglobal("VCB_BF_CF_FRAME_FontAlphaSlider"):SetValue(VCB_SAVE["CF_icon_fontopacity"])
		getglobal("VCB_BF_CF_FRAME_FontAlphaSliderText"):SetText(VCB_COMMON_SLIDER_FONT_OPACITY..": "..VCB_SAVE["CF_icon_fontopacity"])
		getglobal("VCB_BF_CF_FRAME_TextureSlider"):SetValue(VCB_Table_GetKeys(VCB_ICON_ARRAY, VCB_SAVE["CF_icon_texture"]))
		getglobal("VCB_BF_CF_FRAME_TextureSliderText"):SetText(VCB_CF_FRAME_ICON_TEXTURE..": "..VCB_SAVE["CF_icon_texture"])
		getglobal("VCB_BF_CF_FRAME_BGOpaSlider"):SetValue(VCB_SAVE["CF_BF_bgopacity"])
		getglobal("VCB_BF_CF_FRAME_BGOpaSliderText"):SetText(VCB_COMMON_SLIDER_BACKGROUND_OPACITY..": "..VCB_SAVE["CF_BF_bgopacity"])
		getglobal("VCB_BF_CF_FRAME_Color3NormalTexture"):SetVertexColor(VCB_SAVE["CF_BF_bgcolor_r"], VCB_SAVE["CF_BF_bgcolor_g"], VCB_SAVE["CF_BF_bgcolor_b"])
		getglobal("VCB_BF_CF_FRAME_Color3_SwatchBg").r = VCB_SAVE["CF_BF_bgcolor_r"]
		getglobal("VCB_BF_CF_FRAME_Color3_SwatchBg").g = VCB_SAVE["CF_BF_bgcolor_g"]
		getglobal("VCB_BF_CF_FRAME_Color3_SwatchBg").b = VCB_SAVE["CF_BF_bgcolor_b"]
		getglobal("VCB_BF_CF_FRAME_Color2NormalTexture"):SetVertexColor(VCB_SAVE["CF_BF_bordercolor_r"], VCB_SAVE["CF_BF_bordercolor_g"], VCB_SAVE["CF_BF_bordercolor_b"])
		getglobal("VCB_BF_CF_FRAME_Color2_SwatchBg").r = VCB_SAVE["CF_BF_bordercolor_r"]
		getglobal("VCB_BF_CF_FRAME_Color2_SwatchBg").g = VCB_SAVE["CF_BF_bordercolor_g"]
		getglobal("VCB_BF_CF_FRAME_Color2_SwatchBg").b = VCB_SAVE["CF_BF_bordercolor_b"]
		getglobal("VCB_BF_CF_FRAME_BFBorderSlider"):SetValue(VCB_SAVE["CF_BF_border"])
		getglobal("VCB_BF_CF_FRAME_BFBorderSliderText"):SetText(VCB_COMMON_SLIDER_BORDER..": "..VCB_SAVE["CF_BF_border"])
		getglobal("VCB_BF_CF_FRAME_CHECKBUTTON4"):SetChecked(VCB_SAVE["CF_BF_customborder"])
		getglobal("VCB_BF_CF_FRAME_EDITBOX_BORDER"):SetText(VCB_SAVE["CF_BF_customborderpath"])
		getglobal("VCB_BF_CF_FRAME_CHECKBUTTON_BORDER"):SetChecked(VCB_SAVE["CF_icon_border"])
		getglobal("VCB_BF_CF_FRAME_BackdropSlider"):SetValue(VCB_SAVE["CF_BF_background"])
		getglobal("VCB_BF_CF_FRAME_BackdropSliderText"):SetText(VCB_CF_FRAME_BF_BACKGROUND..": "..VCB_SAVE["CF_BF_background"])
		getglobal("VCB_BF_CF_FRAME_BorderOpaSlider"):SetValue(VCB_SAVE["CF_BF_borderopacity"])
		getglobal("VCB_BF_CF_FRAME_BorderOpaSliderText"):SetText(VCB_COMMON_SLIDER_BORDER_OPACITY..": "..VCB_SAVE["CF_BF_borderopacity"])
		getglobal("VCB_BF_CF_FRAME_CHECKBUTTON_CBG"):SetChecked(VCB_SAVE["CF_BF_custombackground"])
		getglobal("VCB_BF_CF_FRAME_EDITBOX_BACKGROUND"):SetText(VCB_SAVE["CF_BF_custombackgroundpath"])
		getglobal("VCB_BF_CF_FRAME_CHECKBUTTON2"):SetChecked(VCB_SAVE["CF_icon_possiblebuffs"])
		getglobal("VCB_BF_CF_FRAME_CHECKBUTTON3"):SetChecked(VCB_SAVE["CF_icon_showpbgrayedout"])
		getglobal("VCB_BF_CF_FRAME_CHECKBUTTON_IBO"):SetChecked(VCB_SAVE["CF_BF_invertorientation"])
		getglobal("VCB_BF_CF_FRAME_CHECKBUTTON_ATTACH"):SetChecked(VCB_SAVE["CF_icon_attach"])
		getglobal("VCB_BF_CF_FRAME_CHECKBUTTON_CUSTOMFONT"):SetChecked(VCB_SAVE["CF_icon_usecfont"])
		getglobal("VCB_BF_CF_FRAME_EDITBOX_CUSTOMFONT"):SetText(VCB_SAVE["CF_icon_customfont"])
	elseif frame == "VCB_BF_CF_FRAME2" then
		getglobal("VCB_BF_CF_FRAME2_CHECKBUTTON1"):SetChecked(VCB_SAVE["CF_AURA_enableborder"])
		getglobal("VCB_BF_CF_FRAME2_ColorNormalTexture"):SetVertexColor(VCB_SAVE["CF_AURA_bordercolor_r"], VCB_SAVE["CF_AURA_bordercolor_g"], VCB_SAVE["CF_AURA_bordercolor_b"])
		getglobal("VCB_BF_CF_FRAME2_Color_SwatchBg").r = VCB_SAVE["CF_AURA_bordercolor_r"]
		getglobal("VCB_BF_CF_FRAME2_Color_SwatchBg").g = VCB_SAVE["CF_AURA_bordercolor_g"]
		getglobal("VCB_BF_CF_FRAME2_Color_SwatchBg").b = VCB_SAVE["CF_AURA_bordercolor_b"]
		getglobal("VCB_BF_CF_FRAME2_AuraPaddingHSlider"):SetValue(VCB_SAVE["CF_AURA_padding_h"])
		getglobal("VCB_BF_CF_FRAME2_AuraPaddingHSliderText"):SetText(VCB_COMMON_SLIDER_PADDING_H..": "..VCB_SAVE["CF_AURA_padding_h"])
		getglobal("VCB_BF_CF_FRAME2_AuraPaddingVSlider"):SetValue(VCB_SAVE["CF_AURA_padding_v"])
		getglobal("VCB_BF_CF_FRAME2_AuraPaddingVSliderText"):SetText(VCB_COMMON_SLIDER_PADDING_V..": "..VCB_SAVE["CF_AURA_padding_v"])
		getglobal("VCB_BF_CF_FRAME2_AuraBorderSlider"):SetValue(VCB_SAVE["CF_AURA_border"])
		getglobal("VCB_BF_CF_FRAME2_AuraBorderSliderText"):SetText(VCB_COMMON_SLIDER_BORDER..": "..VCB_SAVE["CF_AURA_border"])
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
		getglobal("VCB_BF_CF_FRAME2_AuraTimerFontSizeSliderText"):SetText(VCB_COMMON_SLIDER_FONT_SIZE..": "..VCB_SAVE["CF_TIMER_fontsize"])
		getglobal("VCB_BF_CF_FRAME2_AuraTimerOpacitySlider"):SetValue(VCB_SAVE["CF_TIMER_fontopacity"])
		getglobal("VCB_BF_CF_FRAME2_AuraTimerOpacitySliderText"):SetText(VCB_COMMON_SLIDER_FONT_OPACITY..": "..VCB_SAVE["CF_TIMER_fontopacity"])
		getglobal("VCB_BF_CF_FRAME2_GFontSlider"):SetValue(VCB_Table_GetKeys(VCB_FONT_ARRAY, VCB_SAVE["CF_AURA_font"]))
		getglobal("VCB_BF_CF_FRAME2_GFontSliderText"):SetText(VCB_COMMON_SLIDER_FONT..": "..VCB_SAVE["CF_AURA_font"])
		getglobal("VCB_BF_CF_FRAME2_GFontOpacitySlider"):SetValue(VCB_SAVE["CF_AURA_fontopacity"])
		getglobal("VCB_BF_CF_FRAME2_GFontOpacitySliderText"):SetText(VCB_COMMON_SLIDER_FONT_OPACITY..": "..VCB_SAVE["CF_AURA_fontopacity"])
		getglobal("VCB_BF_CF_FRAME2_GFontSizeSlider"):SetValue(VCB_SAVE["CF_AURA_fontsize"])
		getglobal("VCB_BF_CF_FRAME2_GFontSizeSliderText"):SetText(VCB_COMMON_SLIDER_FONT_SIZE..": "..VCB_SAVE["CF_AURA_fontsize"])
		getglobal("VCB_BF_CF_FRAME2_GFontOffsetXSlider"):SetValue(VCB_SAVE["CF_AURA_fontoffset_x"])
		getglobal("VCB_BF_CF_FRAME2_GFontOffsetXSliderText"):SetText(VCB_COMMON_SLIDER_FONT_OFFSET_X..": "..VCB_SAVE["CF_AURA_fontoffset_x"])
		getglobal("VCB_BF_CF_FRAME2_GFontOffsetYSlider"):SetValue(VCB_SAVE["CF_AURA_fontoffset_y"])
		getglobal("VCB_BF_CF_FRAME2_GFontOffsetYSliderText"):SetText(VCB_COMMON_SLIDER_FONT_OFFSET_Y..": "..VCB_SAVE["CF_AURA_fontoffset_y"])
		getglobal("VCB_BF_CF_FRAME2_CHECKBUTTON_FBorder"):SetChecked(VCB_SAVE["CF_AURA_enablefontborder"])
		getglobal("VCB_BF_CF_FRAME2_Color_fontcolorNormalTexture"):SetVertexColor(VCB_SAVE["CF_AURA_fontcolor_r"], VCB_SAVE["CF_AURA_fontcolor_g"], VCB_SAVE["CF_AURA_fontcolor_b"])
		getglobal("VCB_BF_CF_FRAME2_Color_fontcolor_SwatchBg").r = VCB_SAVE["CF_AURA_fontcolor_r"]
		getglobal("VCB_BF_CF_FRAME2_Color_fontcolor_SwatchBg").g = VCB_SAVE["CF_AURA_fontcolor_g"]
		getglobal("VCB_BF_CF_FRAME2_Color_fontcolor_SwatchBg").b = VCB_SAVE["CF_AURA_fontcolor_b"]
		getglobal("VCB_BF_CF_FRAME2_GBGOpacitySlider"):SetValue(VCB_SAVE["CF_AURA_bgopacity"])
		getglobal("VCB_BF_CF_FRAME2_GBGOpacitySliderText"):SetText(VCB_COMMON_SLIDER_BACKGROUND_OPACITY..": "..VCB_SAVE["CF_AURA_bgopacity"])
	elseif frame == "VCB_BF_BF_FRAME" then
		getglobal("VCB_BF_BF_FRAME_CHECKBUTTON1"):SetChecked(VCB_SAVE["BF_GENERAL_verticalmode"])
		getglobal("VCB_BF_BF_FRAME_NumPerRowSlider"):SetValue(VCB_SAVE["BF_GENERAL_numperrow"])
		getglobal("VCB_BF_BF_FRAME_NumPerRowSliderText"):SetText(VCB_COMMON_SLIDER_BUFFS_PER_ROW..": "..VCB_SAVE["BF_GENERAL_numperrow"])
		getglobal("VCB_BF_BF_FRAME_AuraPaddingHSlider"):SetValue(VCB_SAVE["BF_GENERAL_padding_h"])
		getglobal("VCB_BF_BF_FRAME_AuraPaddingHSliderText"):SetText(VCB_COMMON_SLIDER_PADDING_H..": "..VCB_SAVE["BF_GENERAL_padding_h"])
		getglobal("VCB_BF_BF_FRAME_AuraPaddingVSlider"):SetValue(VCB_SAVE["BF_GENERAL_padding_v"])
		getglobal("VCB_BF_BF_FRAME_AuraPaddingVSliderText"):SetText(VCB_COMMON_SLIDER_PADDING_V..": "..VCB_SAVE["BF_GENERAL_padding_v"])
		getglobal("VCB_BF_BF_FRAME_ScaleSlider"):SetValue(VCB_SAVE["BF_GENERAL_scale"])
		getglobal("VCB_BF_BF_FRAME_ScaleSliderText"):SetText(VCB_COMMON_SLIDER_SCALE..": "..VCB_SAVE["BF_GENERAL_scale"])
		getglobal("VCB_BF_BF_FRAME_BGOpaSlider"):SetValue(VCB_SAVE["BF_GENERAL_bgopacity"])
		getglobal("VCB_BF_BF_FRAME_BGOpaSliderText"):SetText(VCB_COMMON_SLIDER_BACKGROUND_OPACITY..": "..VCB_SAVE["BF_GENERAL_bgopacity"])
		getglobal("VCB_BF_BF_FRAME_CHECKBUTTON2"):SetChecked(VCB_SAVE["BF_GENERAL_enablebgcolor"])
		getglobal("VCB_BF_BF_FRAME_Color1NormalTexture"):SetVertexColor(VCB_SAVE["BF_GENERAL_bgcolor_r"], VCB_SAVE["BF_GENERAL_bgcolor_g"], VCB_SAVE["BF_GENERAL_bgcolor_b"])
		getglobal("VCB_BF_BF_FRAME_Color1_SwatchBg").r = VCB_SAVE["BF_GENERAL_bgcolor_r"]
		getglobal("VCB_BF_BF_FRAME_Color1_SwatchBg").g = VCB_SAVE["BF_GENERAL_bgcolor_g"]
		getglobal("VCB_BF_BF_FRAME_Color1_SwatchBg").b = VCB_SAVE["BF_GENERAL_bgcolor_b"]
		getglobal("VCB_BF_BF_FRAME_GFontSlider"):SetValue(VCB_Table_GetKeys(VCB_FONT_ARRAY, VCB_SAVE["BF_GENERAL_font"]))
		getglobal("VCB_BF_BF_FRAME_GFontSliderText"):SetText(VCB_COMMON_SLIDER_FONT..": "..VCB_SAVE["BF_GENERAL_font"])
		getglobal("VCB_BF_BF_FRAME_GFontOpacitySlider"):SetValue(VCB_SAVE["BF_GENERAL_fontopacity"])
		getglobal("VCB_BF_BF_FRAME_GFontOpacitySliderText"):SetText(VCB_COMMON_SLIDER_FONT_OPACITY..": "..VCB_SAVE["BF_GENERAL_fontopacity"])
		getglobal("VCB_BF_BF_FRAME_GFontSizeSlider"):SetValue(VCB_SAVE["BF_GENERAL_fontsize"])
		getglobal("VCB_BF_BF_FRAME_GFontSizeSliderText"):SetText(VCB_COMMON_SLIDER_FONT_SIZE..": "..VCB_SAVE["BF_GENERAL_fontsize"])
		getglobal("VCB_BF_BF_FRAME_GFontOffsetXSlider"):SetValue(VCB_SAVE["BF_GENERAL_fontoffset_x"])
		getglobal("VCB_BF_BF_FRAME_GFontOffsetXSliderText"):SetText(VCB_COMMON_SLIDER_FONT_OFFSET_X..": "..VCB_SAVE["BF_GENERAL_fontoffset_x"])
		getglobal("VCB_BF_BF_FRAME_GFontOffsetYSlider"):SetValue(VCB_SAVE["BF_GENERAL_fontoffset_y"])
		getglobal("VCB_BF_BF_FRAME_GFontOffsetYSliderText"):SetText(VCB_COMMON_SLIDER_FONT_OFFSET_Y..": "..VCB_SAVE["BF_GENERAL_fontoffset_y"])
		getglobal("VCB_BF_BF_FRAME_CHECKBUTTON_FBorder"):SetChecked(VCB_SAVE["BF_GENERAL_enableborder"])
		getglobal("VCB_BF_BF_FRAME_Color_fontcolorNormalTexture"):SetVertexColor(VCB_SAVE["BF_GENERAL_fontcolor_r"], VCB_SAVE["BF_GENERAL_fontcolor_g"], VCB_SAVE["BF_GENERAL_fontcolor_b"])
		getglobal("VCB_BF_BF_FRAME_Color_fontcolor_SwatchBg").r = VCB_SAVE["BF_GENERAL_fontcolor_r"]
		getglobal("VCB_BF_BF_FRAME_Color_fontcolor_SwatchBg").g = VCB_SAVE["BF_GENERAL_fontcolor_g"]
		getglobal("VCB_BF_BF_FRAME_Color_fontcolor_SwatchBg").b = VCB_SAVE["BF_GENERAL_fontcolor_b"]
		getglobal("VCB_BF_BF_FRAME_CHECKBUTTON3"):SetChecked(VCB_SAVE["BF_GENERAL_invert"])
		getglobal("VCB_BF_BF_FRAME_CHECKBUTTON_IBO"):SetChecked(VCB_SAVE["BF_GENERAL_invertorientation"])
		getglobal("VCB_BF_BF_FRAME_CHECKBUTTON_CUSTOMFONT"):SetChecked(VCB_SAVE["BF_GENERAL_usecfont"])
		getglobal("VCB_BF_BF_FRAME_EDITBOX_CUSTOMFONT"):SetText(VCB_SAVE["BF_GENERAL_customfont"])
	elseif frame == "VCB_BF_BF_FRAME2" then
		getglobal("VCB_BF_BF_FRAME_CHECKBUTTON5"):SetChecked(VCB_SAVE["BF_BORDER_enableborder"])
		getglobal("VCB_BF_BF_FRAME_Color4NormalTexture"):SetVertexColor(VCB_SAVE["BF_BORDER_bordercolor_r"], VCB_SAVE["BF_BORDER_bordercolor_g"], VCB_SAVE["BF_BORDER_bordercolor_b"])
		getglobal("VCB_BF_BF_FRAME_Color4_SwatchBg").r = VCB_SAVE["BF_BORDER_bordercolor_r"]
		getglobal("VCB_BF_BF_FRAME_Color4_SwatchBg").g = VCB_SAVE["BF_BORDER_bordercolor_g"]
		getglobal("VCB_BF_BF_FRAME_Color4_SwatchBg").b = VCB_SAVE["BF_BORDER_bordercolor_b"]
		getglobal("VCB_BF_BF_FRAME_BorderOpacitySlider"):SetValue(VCB_SAVE["BF_BORDER_borderopacity"])
		getglobal("VCB_BF_BF_FRAME_BorderOpacitySliderText"):SetText(VCB_COMMON_SLIDER_BACKGROUND_OPACITY..": "..VCB_SAVE["BF_BORDER_borderopacity"])
		getglobal("VCB_BF_BF_FRAME_BorderSlider"):SetValue(VCB_SAVE["BF_BORDER_border"])
		getglobal("VCB_BF_BF_FRAME_BorderSliderText"):SetText(VCB_COMMON_SLIDER_BORDER..": "..VCB_SAVE["BF_BORDER_border"])
		getglobal("VCB_BF_BF_FRAME_CHECKBUTTON6"):SetChecked(VCB_SAVE["BF_BORDER_usecustomborder"])
		getglobal("VCB_BF_BF_FRAME_EDITBOX_BORDER"):SetText(VCB_SAVE["BF_BORDER_customborderpath"])
		getglobal("VCB_BF_BF_FRAME_CHECKBUTTON4"):SetChecked(VCB_SAVE["BF_TIMER_border"])
		getglobal("VCB_BF_BF_FRAME_FontSizeSlider"):SetValue(VCB_SAVE["BF_TIMER_fontsize"])
		getglobal("VCB_BF_BF_FRAME_FontSizeSliderText"):SetText(VCB_COMMON_SLIDER_FONT_SIZE..": "..VCB_SAVE["BF_TIMER_fontsize"])
		getglobal("VCB_BF_BF_FRAME_FontOpacitySlider"):SetValue(VCB_SAVE["BF_TIMER_fontopacity"])
		getglobal("VCB_BF_BF_FRAME_FontOpacitySliderText"):SetText(VCB_COMMON_SLIDER_FONT_OPACITY..": "..VCB_SAVE["BF_TIMER_fontopacity"])
		getglobal("VCB_BF_BF_FRAME_Color2NormalTexture"):SetVertexColor(VCB_SAVE["BF_TIMER_fontcolor_r"], VCB_SAVE["BF_TIMER_fontcolor_g"], VCB_SAVE["BF_TIMER_fontcolor_b"])
		getglobal("VCB_BF_BF_FRAME_Color2_SwatchBg").r = VCB_SAVE["BF_TIMER_fontcolor_r"]
		getglobal("VCB_BF_BF_FRAME_Color2_SwatchBg").g = VCB_SAVE["BF_TIMER_fontcolor_g"]
		getglobal("VCB_BF_BF_FRAME_Color2_SwatchBg").b = VCB_SAVE["BF_TIMER_fontcolor_b"]
	elseif frame == "VCB_BF_DBF_FRAME" then
		getglobal("VCB_BF_DBF_FRAME_CHECKBUTTON1"):SetChecked(VCB_SAVE["DBF_GENERAL_verticalmode"])
		getglobal("VCB_BF_DBF_FRAME_NumPerRowSlider"):SetValue(VCB_SAVE["DBF_GENERAL_numperrow"])
		getglobal("VCB_BF_DBF_FRAME_NumPerRowSliderText"):SetText(VCB_COMMON_SLIDER_BUFFS_PER_ROW..": "..VCB_SAVE["DBF_GENERAL_numperrow"])
		getglobal("VCB_BF_DBF_FRAME_AuraPaddingHSlider"):SetValue(VCB_SAVE["DBF_GENERAL_padding_h"])
		getglobal("VCB_BF_DBF_FRAME_AuraPaddingHSliderText"):SetText(VCB_COMMON_SLIDER_PADDING_H..": "..VCB_SAVE["DBF_GENERAL_padding_h"])
		getglobal("VCB_BF_DBF_FRAME_AuraPaddingVSlider"):SetValue(VCB_SAVE["DBF_GENERAL_padding_v"])
		getglobal("VCB_BF_DBF_FRAME_AuraPaddingVSliderText"):SetText(VCB_COMMON_SLIDER_PADDING_V..": "..VCB_SAVE["DBF_GENERAL_padding_v"])
		getglobal("VCB_BF_DBF_FRAME_BGOpaSlider"):SetValue(VCB_SAVE["DBF_GENERAL_bgopacity"])
		getglobal("VCB_BF_DBF_FRAME_BGOpaSliderText"):SetText(VCB_COMMON_SLIDER_BACKGROUND_OPACITY..": "..VCB_SAVE["DBF_GENERAL_bgopacity"])
		getglobal("VCB_BF_DBF_FRAME_ScaleSlider"):SetValue(VCB_SAVE["DBF_GENERAL_scale"])
		getglobal("VCB_BF_DBF_FRAME_ScaleSliderText"):SetText(VCB_COMMON_SLIDER_SCALE..": "..VCB_SAVE["DBF_GENERAL_scale"])
		getglobal("VCB_BF_DBF_FRAME_CHECKBUTTON2"):SetChecked(VCB_SAVE["DBF_GENERAL_enablebgcolor"])
		getglobal("VCB_BF_DBF_FRAME_Color1NormalTexture"):SetVertexColor(VCB_SAVE["DBF_GENERAL_bgcolor_r"], VCB_SAVE["DBF_GENERAL_bgcolor_g"], VCB_SAVE["DBF_GENERAL_bgcolor_b"])
		getglobal("VCB_BF_DBF_FRAME_Color1_SwatchBg").r = VCB_SAVE["DBF_GENERAL_bgcolor_r"]
		getglobal("VCB_BF_DBF_FRAME_Color1_SwatchBg").g = VCB_SAVE["DBF_GENERAL_bgcolor_g"]
		getglobal("VCB_BF_DBF_FRAME_Color1_SwatchBg").b = VCB_SAVE["DBF_GENERAL_bgcolor_b"]
		getglobal("VCB_BF_DBF_FRAME_GFontSlider"):SetValue(VCB_Table_GetKeys(VCB_FONT_ARRAY, VCB_SAVE["DBF_GENERAL_font"]))
		getglobal("VCB_BF_DBF_FRAME_GFontSliderText"):SetText(VCB_COMMON_SLIDER_FONT..": "..VCB_SAVE["DBF_GENERAL_font"])
		getglobal("VCB_BF_DBF_FRAME_GFontOpacitySlider"):SetValue(VCB_SAVE["DBF_GENERAL_fontopacity"])
		getglobal("VCB_BF_DBF_FRAME_GFontOpacitySliderText"):SetText(VCB_COMMON_SLIDER_FONT_OPACITY..": "..VCB_SAVE["DBF_GENERAL_fontopacity"])
		getglobal("VCB_BF_DBF_FRAME_GFontSizeSlider"):SetValue(VCB_SAVE["DBF_GENERAL_fontsize"])
		getglobal("VCB_BF_DBF_FRAME_GFontSizeSliderText"):SetText(VCB_COMMON_SLIDER_FONT_SIZE..": "..VCB_SAVE["DBF_GENERAL_fontsize"])
		getglobal("VCB_BF_DBF_FRAME_GFontOffsetXSlider"):SetValue(VCB_SAVE["DBF_GENERAL_fontoffset_x"])
		getglobal("VCB_BF_DBF_FRAME_GFontOffsetXSliderText"):SetText(VCB_COMMON_SLIDER_FONT_OFFSET_X..": "..VCB_SAVE["DBF_GENERAL_fontoffset_x"])
		getglobal("VCB_BF_DBF_FRAME_GFontOffsetYSlider"):SetValue(VCB_SAVE["DBF_GENERAL_fontoffset_y"])
		getglobal("VCB_BF_DBF_FRAME_GFontOffsetYSliderText"):SetText(VCB_COMMON_SLIDER_FONT_OFFSET_Y..": "..VCB_SAVE["DBF_GENERAL_fontoffset_y"])
		getglobal("VCB_BF_DBF_FRAME_CHECKBUTTON_FBorder"):SetChecked(VCB_SAVE["DBF_GENERAL_enableborder"])
		getglobal("VCB_BF_DBF_FRAME_Color_fontcolorNormalTexture"):SetVertexColor(VCB_SAVE["DBF_GENERAL_fontcolor_r"], VCB_SAVE["DBF_GENERAL_fontcolor_g"], VCB_SAVE["DBF_GENERAL_fontcolor_b"])
		getglobal("VCB_BF_DBF_FRAME_Color_fontcolor_SwatchBg").r = VCB_SAVE["DBF_GENERAL_fontcolor_r"]
		getglobal("VCB_BF_DBF_FRAME_Color_fontcolor_SwatchBg").g = VCB_SAVE["DBF_GENERAL_fontcolor_g"]
		getglobal("VCB_BF_DBF_FRAME_Color_fontcolor_SwatchBg").b = VCB_SAVE["DBF_GENERAL_fontcolor_b"]
		getglobal("VCB_BF_DBF_FRAME_CHECKBUTTON3"):SetChecked(VCB_SAVE["DBF_GENERAL_invert"])
		getglobal("VCB_BF_DBF_FRAME_CHECKBUTTON_IBO"):SetChecked(VCB_SAVE["DBF_GENERAL_invertorientation"])
		getglobal("VCB_BF_DBF_FRAME_CHECKBUTTON_CUSTOMFONT"):SetChecked(VCB_SAVE["DBF_GENERAL_usecfont"])
		getglobal("VCB_BF_DBF_FRAME_EDITBOX_CUSTOMFONT"):SetText(VCB_SAVE["DBF_GENERAL_customfont"])
	elseif frame == "VCB_BF_DBF_FRAME2" then
		getglobal("VCB_BF_DBF_FRAME_CHECKBUTTON5"):SetChecked(VCB_SAVE["DBF_BORDER_enableborder"])
		getglobal("VCB_BF_DBF_FRAME_CHECKBUTTON6"):SetChecked(VCB_SAVE["DBF_BORDER_usecustomborder"])
		getglobal("VCB_BF_DBF_FRAME_EDITBOX_BORDER"):SetText(VCB_SAVE["DBF_BORDER_customborderpath"])
		getglobal("VCB_BF_DBF_FRAME_BorderSlider"):SetValue(VCB_SAVE["DBF_BORDER_border"])
		getglobal("VCB_BF_DBF_FRAME_BorderSliderText"):SetText(VCB_COMMON_SLIDER_BORDER..": "..VCB_SAVE["DBF_BORDER_border"])
		getglobal("VCB_BF_DBF_FRAME_CHECKBUTTON4"):SetChecked(VCB_SAVE["DBF_TIMER_enableborder"])
		getglobal("VCB_BF_DBF_FRAME_Color2NormalTexture"):SetVertexColor(VCB_SAVE["DBF_TIMER_fontcolor_r"], VCB_SAVE["DBF_TIMER_fontcolor_g"], VCB_SAVE["DBF_TIMER_fontcolor_b"])
		getglobal("VCB_BF_DBF_FRAME_Color2_SwatchBg").r = VCB_SAVE["DBF_TIMER_fontcolor_r"]
		getglobal("VCB_BF_DBF_FRAME_Color2_SwatchBg").g = VCB_SAVE["DBF_TIMER_fontcolor_g"]
		getglobal("VCB_BF_DBF_FRAME_Color2_SwatchBg").b = VCB_SAVE["DBF_TIMER_fontcolor_b"]
		getglobal("VCB_BF_DBF_FRAME_FontSizeSlider"):SetValue(VCB_SAVE["DBF_TIMER_fontsize"])
		getglobal("VCB_BF_DBF_FRAME_FontSizeSliderText"):SetText(VCB_COMMON_SLIDER_FONT_SIZE..": "..VCB_SAVE["DBF_TIMER_fontsize"])
		getglobal("VCB_BF_DBF_FRAME_FontOpacitySlider"):SetValue(VCB_SAVE["DBF_TIMER_fontopacity"])
		getglobal("VCB_BF_DBF_FRAME_FontOpacitySliderText"):SetText(VCB_COMMON_SLIDER_FONT_OPACITY..": "..VCB_SAVE["DBF_TIMER_fontopacity"])
		getglobal("VCB_BF_DBF_FRAME_BorderOpacitySlider"):SetValue(VCB_SAVE["DBF_BORDER_borderopacity"])
		getglobal("VCB_BF_DBF_FRAME_BorderOpacitySliderText"):SetText(VCB_COMMON_SLIDER_BACKGROUND_OPACITY..": "..VCB_SAVE["DBF_BORDER_borderopacity"])
		getglobal("VCB_BF_DBF_FRAME_Color_NONENormalTexture"):SetVertexColor(VCB_SAVE["DBF_BORDER_nonecolor_r"], VCB_SAVE["DBF_BORDER_nonecolor_g"], VCB_SAVE["DBF_BORDER_nonecolor_b"])
		getglobal("VCB_BF_DBF_FRAME_Color_NONE_SwatchBg").r = VCB_SAVE["DBF_BORDER_nonecolor_r"]
		getglobal("VCB_BF_DBF_FRAME_Color_NONE_SwatchBg").g = VCB_SAVE["DBF_BORDER_nonecolor_g"]
		getglobal("VCB_BF_DBF_FRAME_Color_NONE_SwatchBg").b = VCB_SAVE["DBF_BORDER_nonecolor_b"]
		getglobal("VCB_BF_DBF_FRAME_Color_POISONNormalTexture"):SetVertexColor(VCB_SAVE["DBF_BORDER_poisoncolor_r"], VCB_SAVE["DBF_BORDER_poisoncolor_g"], VCB_SAVE["DBF_BORDER_poisoncolor_b"])
		getglobal("VCB_BF_DBF_FRAME_Color_POISON_SwatchBg").r = VCB_SAVE["DBF_BORDER_poisoncolor_r"]
		getglobal("VCB_BF_DBF_FRAME_Color_POISON_SwatchBg").g = VCB_SAVE["DBF_BORDER_poisoncolor_g"]
		getglobal("VCB_BF_DBF_FRAME_Color_POISON_SwatchBg").b = VCB_SAVE["DBF_BORDER_poisoncolor_b"]
		getglobal("VCB_BF_DBF_FRAME_Color_MAGICNormalTexture"):SetVertexColor(VCB_SAVE["DBF_BORDER_magiccolor_r"], VCB_SAVE["DBF_BORDER_magiccolor_g"], VCB_SAVE["DBF_BORDER_magiccolor_b"])
		getglobal("VCB_BF_DBF_FRAME_Color_MAGIC_SwatchBg").r = VCB_SAVE["DBF_BORDER_magiccolor_r"]
		getglobal("VCB_BF_DBF_FRAME_Color_MAGIC_SwatchBg").g = VCB_SAVE["DBF_BORDER_magiccolor_g"]
		getglobal("VCB_BF_DBF_FRAME_Color_MAGIC_SwatchBg").b = VCB_SAVE["DBF_BORDER_magiccolor_b"]
		getglobal("VCB_BF_DBF_FRAME_Color_CURSENormalTexture"):SetVertexColor(VCB_SAVE["DBF_BORDER_cursecolor_r"], VCB_SAVE["DBF_BORDER_cursecolor_g"], VCB_SAVE["DBF_BORDER_cursecolor_b"])
		getglobal("VCB_BF_DBF_FRAME_Color_CURSE_SwatchBg").r = VCB_SAVE["DBF_BORDER_cursecolor_r"]
		getglobal("VCB_BF_DBF_FRAME_Color_CURSE_SwatchBg").g = VCB_SAVE["DBF_BORDER_cursecolor_g"]
		getglobal("VCB_BF_DBF_FRAME_Color_CURSE_SwatchBg").b = VCB_SAVE["DBF_BORDER_cursecolor_b"]
		getglobal("VCB_BF_DBF_FRAME_Color_DISEASENormalTexture"):SetVertexColor(VCB_SAVE["DBF_BORDER_diseasecolor_r"], VCB_SAVE["DBF_BORDER_diseasecolor_g"], VCB_SAVE["DBF_BORDER_diseasecolor_b"])
		getglobal("VCB_BF_DBF_FRAME_Color_DISEASE_SwatchBg").r = VCB_SAVE["DBF_BORDER_diseasecolor_r"]
		getglobal("VCB_BF_DBF_FRAME_Color_DISEASE_SwatchBg").g = VCB_SAVE["DBF_BORDER_diseasecolor_g"]
		getglobal("VCB_BF_DBF_FRAME_Color_DISEASE_SwatchBg").b = VCB_SAVE["DBF_BORDER_diseasecolor_b"]
	elseif frame == "VCB_BF_WP_FRAME" then
		getglobal("VCB_BF_WP_FRAME_CHECKBUTTON1"):SetChecked(VCB_SAVE["WP_GENERAL_verticalmode"])
		getglobal("VCB_BF_WP_FRAME_CHECKBUTTON2"):SetChecked(VCB_SAVE["WP_GENERAL_enablebgcolor"])
		getglobal("VCB_BF_WP_FRAME_CHECKBUTTON7"):SetChecked(VCB_SAVE["WP_GENERAL_attach"])
		getglobal("VCB_BF_WP_FRAME_Color1NormalTexture"):SetVertexColor(VCB_SAVE["WP_GENERAL_bgcolor_r"], VCB_SAVE["WP_GENERAL_bgcolor_g"], VCB_SAVE["WP_GENERAL_bgcolor_b"])
		getglobal("VCB_BF_WP_FRAME_Color1_SwatchBg").r = VCB_SAVE["WP_GENERAL_bgcolor_r"]
		getglobal("VCB_BF_WP_FRAME_Color1_SwatchBg").g = VCB_SAVE["WP_GENERAL_bgcolor_g"]
		getglobal("VCB_BF_WP_FRAME_Color1_SwatchBg").b = VCB_SAVE["WP_GENERAL_bgcolor_b"]
		getglobal("VCB_BF_WP_FRAME_AuraPaddingHSlider"):SetValue(VCB_SAVE["WP_GENERAL_padding_h"])
		getglobal("VCB_BF_WP_FRAME_AuraPaddingHSliderText"):SetText(VCB_COMMON_SLIDER_PADDING_H..": "..VCB_SAVE["WP_GENERAL_padding_h"])
		getglobal("VCB_BF_WP_FRAME_FontSizeSlider"):SetValue(VCB_SAVE["WP_GENERAL_fontsize"])
		getglobal("VCB_BF_WP_FRAME_FontSizeSliderText"):SetText(VCB_COMMON_SLIDER_FONT_SIZE..": "..VCB_SAVE["WP_GENERAL_fontsize"])
		getglobal("VCB_BF_WP_FRAME_BGOpaSlider"):SetValue(VCB_SAVE["WP_GENERAL_bgopacity"])
		getglobal("VCB_BF_WP_FRAME_BGOpaSliderText"):SetText(VCB_COMMON_SLIDER_BACKGROUND_OPACITY..": "..VCB_SAVE["WP_GENERAL_bgopacity"])
		getglobal("VCB_BF_WP_FRAME_ScaleSlider"):SetValue(VCB_SAVE["WP_GENERAL_scale"])
		getglobal("VCB_BF_WP_FRAME_ScaleSliderText"):SetText(VCB_COMMON_SLIDER_SCALE..": "..VCB_SAVE["WP_GENERAL_scale"])
		getglobal("VCB_BF_WP_FRAME_FontSlider"):SetValue(VCB_Table_GetKeys(VCB_FONT_ARRAY, VCB_SAVE["WP_GENERAL_font"]))
		getglobal("VCB_BF_WP_FRAME_FontSliderText"):SetText(VCB_COMMON_SLIDER_FONT..": "..VCB_SAVE["WP_GENERAL_font"])
		getglobal("VCB_BF_WP_FRAME_FontOpacitySlider"):SetValue(VCB_SAVE["WP_GENERAL_fontopacity"])
		getglobal("VCB_BF_WP_FRAME_FontOpacitySliderText"):SetText(VCB_COMMON_SLIDER_FONT_OPACITY..": "..VCB_SAVE["WP_GENERAL_fontopacity"])
		getglobal("VCB_BF_WP_FRAME_AuraPaddingVSlider"):SetValue(VCB_SAVE["WP_GENERAL_padding_v"])
		getglobal("VCB_BF_WP_FRAME_AuraPaddingVSliderText"):SetText(VCB_COMMON_SLIDER_PADDING_V..": "..VCB_SAVE["WP_GENERAL_padding_v"])
		getglobal("VCB_BF_WP_FRAME_Color5NormalTexture"):SetVertexColor(VCB_SAVE["WP_GENERAL_fontcolor_r"], VCB_SAVE["WP_GENERAL_fontcolor_g"], VCB_SAVE["WP_GENERAL_fontcolor_b"])
		getglobal("VCB_BF_WP_FRAME_Color5_SwatchBg").r = VCB_SAVE["WP_GENERAL_fontcolor_r"]
		getglobal("VCB_BF_WP_FRAME_Color5_SwatchBg").g = VCB_SAVE["WP_GENERAL_fontcolor_g"]
		getglobal("VCB_BF_WP_FRAME_Color5_SwatchBg").b = VCB_SAVE["WP_GENERAL_fontcolor_b"]
		getglobal("VCB_BF_WP_FRAME_OffsetXSlider"):SetValue(VCB_SAVE["WP_GENERAL_offset_x"])
		getglobal("VCB_BF_WP_FRAME_OffsetXSliderText"):SetText(VCB_COMMON_SLIDER_FONT_OFFSET_X..": "..VCB_SAVE["WP_GENERAL_offset_x"])
		getglobal("VCB_BF_WP_FRAME_OffsetYSlider"):SetValue(VCB_SAVE["WP_GENERAL_offset_y"])
		getglobal("VCB_BF_WP_FRAME_OffsetYSliderText"):SetText(VCB_COMMON_SLIDER_FONT_OFFSET_Y..": "..VCB_SAVE["WP_GENERAL_offset_y"])
		getglobal("VCB_BF_WP_FRAME_CHECKBUTTON8"):SetChecked(VCB_SAVE["WP_GENERAL_enableborder"])
		getglobal("VCB_BF_WP_FRAME_CHECKBUTTON_CUSTOMFONT"):SetChecked(VCB_SAVE["WP_GENERAL_usecfont"])
		getglobal("VCB_BF_WP_FRAME_EDITBOX_CUSTOMFONT"):SetText(VCB_SAVE["WP_GENERAL_customfont"])
	elseif frame == "VCB_BF_WP_FRAME2" then
		getglobal("VCB_BF_WP_FRAME_CHECKBUTTON5"):SetChecked(VCB_SAVE["WP_BORDER_enableborder"])
		getglobal("VCB_BF_WP_FRAME_Color4NormalTexture"):SetVertexColor(VCB_SAVE["WP_BORDER_bordercolor_r"], VCB_SAVE["WP_BORDER_bordercolor_g"], VCB_SAVE["WP_BORDER_bordercolor_b"])
		getglobal("VCB_BF_WP_FRAME_Color4_SwatchBg").r = VCB_SAVE["WP_BORDER_bordercolor_r"]
		getglobal("VCB_BF_WP_FRAME_Color4_SwatchBg").g = VCB_SAVE["WP_BORDER_bordercolor_g"]
		getglobal("VCB_BF_WP_FRAME_Color4_SwatchBg").b = VCB_SAVE["WP_BORDER_bordercolor_b"]
		getglobal("VCB_BF_WP_FRAME_CHECKBUTTON6"):SetChecked(VCB_SAVE["WP_BORDER_usecustomborder"])
		getglobal("VCB_BF_WP_FRAME_EDITBOX_BORDER"):SetText(VCB_SAVE["WP_BORDER_customborderpath"])
		getglobal("VCB_BF_WP_FRAME_BorderSlider"):SetValue(VCB_SAVE["WP_BORDER_border"])
		getglobal("VCB_BF_WP_FRAME_BorderSliderText"):SetText(VCB_COMMON_SLIDER_BORDER..": "..VCB_SAVE["WP_BORDER_border"])
		getglobal("VCB_BF_WP_FRAME_CHECKBUTTON4"):SetChecked(VCB_SAVE["WP_TIMER_enableborder"])
		getglobal("VCB_BF_WP_FRAME_Color2NormalTexture"):SetVertexColor(VCB_SAVE["WP_TIMER_fontcolor_r"], VCB_SAVE["WP_TIMER_fontcolor_g"], VCB_SAVE["WP_TIMER_fontcolor_b"])
		getglobal("VCB_BF_WP_FRAME_Color2_SwatchBg").r = VCB_SAVE["WP_TIMER_fontcolor_r"]
		getglobal("VCB_BF_WP_FRAME_Color2_SwatchBg").g = VCB_SAVE["WP_TIMER_fontcolor_g"]
		getglobal("VCB_BF_WP_FRAME_Color2_SwatchBg").b = VCB_SAVE["WP_TIMER_fontcolor_b"]
		getglobal("VCB_BF_WP_FRAME_TIMER_FontSizeSlider"):SetValue(VCB_SAVE["WP_TIMER_fontsize"])
		getglobal("VCB_BF_WP_FRAME_TIMER_FontSizeSliderText"):SetText(VCB_COMMON_SLIDER_FONT_SIZE..": "..VCB_SAVE["WP_TIMER_fontsize"])
		getglobal("VCB_BF_WP_FRAME_TIMER_FontOpacitySlider"):SetValue(VCB_SAVE["WP_TIMER_fontopacity"])
		getglobal("VCB_BF_WP_FRAME_TIMER_FontOpacitySliderText"):SetText(VCB_COMMON_SLIDER_FONT_OPACITY..": "..VCB_SAVE["WP_TIMER_fontopacity"])
		getglobal("VCB_BF_WP_FRAME_BorderOpacitySlider"):SetValue(VCB_SAVE["WP_BORDER_borderopacity"])
		getglobal("VCB_BF_WP_FRAME_BorderOpacitySliderText"):SetText(VCB_COMMON_SLIDER_BACKGROUND_OPACITY..": "..VCB_SAVE["WP_BORDER_borderopacity"])
	elseif frame == "VCB_BF_MISC_FRAME" then
		getglobal("VCB_BF_MISC_FRAME_CHECKBUTTON1"):SetChecked(VCB_SAVE["MISC_disable_CF"])
		getglobal("VCB_BF_MISC_FRAME_CHECKBUTTON2"):SetChecked(VCB_SAVE["MISC_disable_BB"])
	elseif frame == "VCB_BF_PM_FRAME" then
		getglobal("VCB_BF_PM_FRAME_LEFT_CURRENT_INBOX_TEXT"):SetText(VCB_CUR_PROFILE)
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
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Icon"):SetVertexColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="buffsfont" then
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetTextColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="BFbg" then
		for i=0,31 do
			if VCB_SAVE[VCB_BF_COLOR_TAR] and getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Icon"):SetVertexColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="BFborder" then
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME and VCB_SAVE[VCB_BF_COLOR_TAR] then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetVertexColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="BFfont" then
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetTextColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="DebuffBG" then
		for i=0,15 do
			if VCB_SAVE[VCB_BF_COLOR_TAR] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Icon"):SetVertexColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="DebuffFont" then
		for i=0,15 do
			getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Duration"):SetTextColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
		end
	elseif VCB_BF_COLOR_TYPE=="DebuffGFont" then
		for i=0,15 do
			getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetTextColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
		end
	elseif VCB_BF_COLOR_TYPE=="BuffGFont" then
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetTextColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="CFGFont" then
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetTextColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="WeaponBG" then
		for i=0,1 do
			if VCB_SAVE[VCB_BF_COLOR_TAR] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Icon"):SetVertexColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="WPFont" then
		for i=0,1 do
			getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetVertexColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
		end
	elseif VCB_BF_COLOR_TYPE=="WPBorder" then
		for i=0,1 do
			if VCB_SAVE[VCB_BF_COLOR_TAR] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Border"):SetVertexColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="WPTimer" then
		for i=0,1 do
			getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetTextColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
		end
	elseif VCB_BF_COLOR_TYPE=="DebuffBorderColor" then
		for i=0,15 do
			if VCB_SAVE[VCB_BF_COLOR_TAR] then
				if i < 3 then
					getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["DBF_BORDER_nonecolor_r"],VCB_SAVE["DBF_BORDER_nonecolor_g"],VCB_SAVE["DBF_BORDER_nonecolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
				elseif i >= 3 and i < 6 then
					getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["DBF_BORDER_poisoncolor_r"],VCB_SAVE["DBF_BORDER_poisoncolor_g"],VCB_SAVE["DBF_BORDER_poisoncolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
				elseif i >= 6 and i < 9 then
					getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["DBF_BORDER_magiccolor_r"],VCB_SAVE["DBF_BORDER_magiccolor_g"],VCB_SAVE["DBF_BORDER_magiccolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
				elseif i >= 9 and i < 12 then
					getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["DBF_BORDER_cursecolor_r"],VCB_SAVE["DBF_BORDER_cursecolor_g"],VCB_SAVE["DBF_BORDER_cursecolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["DBF_BORDER_diseasecolor_r"],VCB_SAVE["DBF_BORDER_diseasecolor_g"],VCB_SAVE["DBF_BORDER_diseasecolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
				end
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
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Icon"):SetVertexColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="buffsfont" then
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetTextColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="BFbg" then
		for i=0,31 do
			if VCB_SAVE[VCB_BF_COLOR_TAR] and getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Icon"):SetVertexColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="BFborder" then
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME and VCB_SAVE[VCB_BF_COLOR_TAR] then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetVertexColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="BFfont" then
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetTextColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="DebuffBG" then
		for i=0,15 do
			if VCB_SAVE[VCB_BF_COLOR_TAR] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Icon"):SetVertexColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="DebuffFont" then
		for i=0,15 do
			getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Duration"):SetTextColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
		end
	elseif VCB_BF_COLOR_TYPE=="DebuffGFont" then
		for i=0,15 do
			getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetTextColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
		end
	elseif VCB_BF_COLOR_TYPE=="BuffGFont" then
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetTextColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="CFGFont" then
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetTextColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="WeaponBG" then
		for i=0,1 do
			if VCB_SAVE[VCB_BF_COLOR_TAR] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Icon"):SetVertexColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="WPFont" then
		for i=0,1 do
			getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetVertexColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
		end
	elseif VCB_BF_COLOR_TYPE=="WPBorder" then
		for i=0,1 do
			if VCB_SAVE[VCB_BF_COLOR_TAR] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Border"):SetVertexColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="WPTimer" then
		for i=0,1 do
			getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetTextColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
		end
	elseif VCB_BF_COLOR_TYPE=="DebuffBorderColor" then
		for i=0,15 do
			if VCB_SAVE[VCB_BF_COLOR_TAR] then
				if i < 3 then
					getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["DBF_BORDER_nonecolor_r"],VCB_SAVE["DBF_BORDER_nonecolor_g"],VCB_SAVE["DBF_BORDER_nonecolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
				elseif i >= 3 and i < 6 then
					getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["DBF_BORDER_poisoncolor_r"],VCB_SAVE["DBF_BORDER_poisoncolor_g"],VCB_SAVE["DBF_BORDER_poisoncolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
				elseif i >= 6 and i < 9 then
					getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["DBF_BORDER_magiccolor_r"],VCB_SAVE["DBF_BORDER_magiccolor_g"],VCB_SAVE["DBF_BORDER_magiccolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
				elseif i >= 9 and i < 12 then
					getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["DBF_BORDER_cursecolor_r"],VCB_SAVE["DBF_BORDER_cursecolor_g"],VCB_SAVE["DBF_BORDER_cursecolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["DBF_BORDER_diseasecolor_r"],VCB_SAVE["DBF_BORDER_diseasecolor_g"],VCB_SAVE["DBF_BORDER_diseasecolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
				end
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
				getglobal(tname..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["Timer_fontsize"], "OUTLINE")
			else
				getglobal(tname..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["Timer_fontsize"])
			end
		end
	end
end

function VCB_BF_TIMER_FRAME_FontSliderChange(obj)
	VCB_SAVE["Timer_font"] = VCB_FONT_ARRAY[obj:GetValue()]
	getglobal("VCB_BF_TIMER_FRAME_FontSliderText"):SetText(VCB_COMMON_SLIDER_FONT..": "..VCB_SAVE["Timer_font"])
	for cat, tname in pairs(VCB_BUTTONNAME) do
		for i=VCB_MININDEX[cat], VCB_MAXINDEX[cat] do
			if getglobal(tname..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				getglobal(tname..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["CF_TIMER_fontsize"])
			else
				getglobal(tname..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["CF_TIMER_fontsize"])
			end
		end
	end
end

function VCB_BF_TIMER_FRAME_CHECKBUTTON_CUSTOMFONT_CLICK()
	if VCB_SAVE["Timer_usecfont"] then
		VCB_SAVE["Timer_usecfont"] = false
		for cat, template in pairs(VCB_BUTTONNAME) do
			for i=VCB_MININDEX[cat], VCB_MAXINDEX[cat] do
				local button = getglobal(template..i.."Duration")
				if cat == "buff" then
					if VCB_SAVE["BF_TIMER_enableborder"] then
						button:SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["BF_TIMER_fontsize"], "OUTLINE")
					else
						button:SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["BF_TIMER_fontsize"])
					end
				elseif cat == "debuff" then
					if VCB_SAVE["DBF_TIMER_enableborder"] then
						button:SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["DBF_TIMER_fontsize"], "OUTLINE")
					else
						button:SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["DBF_TIMER_fontsize"])
					end
				else
					if VCB_SAVE["WP_TIMER_enableborder"] then
						button:SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["WP_TIMER_fontsize"], "OUTLINE")
					else
						button:SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["WP_TIMER_fontsize"])
					end
				end
			end
		end
	else
		VCB_SAVE["Timer_usecfont"] = true
		for cat, template in pairs(VCB_BUTTONNAME) do
			for i=VCB_MININDEX[cat], VCB_MAXINDEX[cat] do
				local button = getglobal(template..i.."Duration")
				if cat == "buff" then
					if VCB_SAVE["BF_TIMER_enableborder"] then
						button:SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["BF_TIMER_fontsize"], "OUTLINE")
					else
						button:SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["BF_TIMER_fontsize"])
					end
				elseif cat == "debuff" then
					if VCB_SAVE["DBF_TIMER_enableborder"] then
						button:SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["DBF_TIMER_fontsize"], "OUTLINE")
					else
						button:SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["DBF_TIMER_fontsize"])
					end
				else
					if VCB_SAVE["WP_TIMER_enableborder"] then
						button:SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["WP_TIMER_fontsize"], "OUTLINE")
					else
						button:SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["WP_TIMER_fontsize"])
					end
				end
			end
		end
	end
end

function VCB_BF_TIMER_FRAME_EDITBOX_CUSTOMFONT_CHANGE(obj)
	VCB_SAVE["Timer_customfont"] = obj:GetText()
	if VCB_SAVE["Timer_usecfont"] then
		for cat, template in pairs(VCB_BUTTONNAME) do
			for i=VCB_MININDEX[cat], VCB_MAXINDEX[cat] do
				local button = getglobal(template..i.."Duration")
				if cat == "buff" then
					if VCB_SAVE["BF_TIMER_enableborder"] then
						button:SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["BF_TIMER_fontsize"], "OUTLINE")
					else
						button:SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["BF_TIMER_fontsize"])
					end
				elseif cat == "debuff" then
					if VCB_SAVE["DBF_TIMER_enableborder"] then
						button:SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["DBF_TIMER_fontsize"], "OUTLINE")
					else
						button:SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["DBF_TIMER_fontsize"])
					end
				else
					if VCB_SAVE["WP_TIMER_enableborder"] then
						button:SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["WP_TIMER_fontsize"], "OUTLINE")
					else
						button:SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["WP_TIMER_fontsize"])
					end
				end
			end
		end
	end
end

---------------------------------------END TIMER FRAME-----------------------------------------------------------------------------------------------------------------
---------------------------------------START CONSOLIDATED FRAME-----------------------------------------------------------------------------------------------------------------

function VCB_BF_CF_FRAME_AnchorSliderChange(obj)
	VCB_SAVE["CF_BF_anchor"] = obj:GetValue()
	getglobal("VCB_BF_CF_FRAME_AnchorSliderText"):SetText(VCB_CF_FRAME_BF_ANCHOR..": "..VCB_ANCHOR_ARRAY[VCB_SAVE["CF_BF_anchor"]])
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
	getglobal("VCB_BF_CF_FRAME_ScaleSliderText"):SetText(VCB_COMMON_SLIDER_SCALE..": "..VCB_SAVE["CF_BF_scale"])
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
	getglobal("VCB_BF_CF_FRAME_NumPerRowSliderText"):SetText(VCB_COMMON_SLIDER_BUFFS_PER_ROW..": "..VCB_SAVE["CF_BF_numperrow"])
	VCB_BF_RepositioningAndResizing()
end

function VCB_BF_CF_FRAME_CHANGE_PAGE()
	if VCB_BF_CF_FRAME:IsVisible() then
		VCB_OPTIONS_HIDE_ALL()
		VCB_OPTIONS_SHOW("VCB_BF_CF_FRAME2", VCB_MENU_BUTTON4_LINK2)
	else
		VCB_OPTIONS_HIDE_ALL()
		VCB_OPTIONS_SHOW("VCB_BF_CF_FRAME", VCB_MENU_BUTTON4_LINK)
	end
end

function VCB_BF_CF_FRAME_SizeSliderChange(obj)
	VCB_SAVE["CF_icon_fontsize"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_SIZE..": "..VCB_SAVE["CF_icon_fontsize"])
	if VCB_SAVE["CF_icon_usecfont"] then
		if VCB_SAVE["CF_icon_border"] then
			VCB_BF_CONSOLIDATED_ICONCount:SetFont(VCB_SAVE["CF_icon_customfont"], VCB_SAVE["CF_icon_fontsize"], "OUTLINE")
		else
			VCB_BF_CONSOLIDATED_ICONCount:SetFont(VCB_SAVE["CF_icon_customfont"], VCB_SAVE["CF_icon_fontsize"])
		end
	else
		if VCB_SAVE["CF_icon_border"] then
			VCB_BF_CONSOLIDATED_ICONCount:SetFont(VCB_SAVE["CF_icon_font"], VCB_SAVE["CF_icon_fontsize"], "OUTLINE")
		else
			VCB_BF_CONSOLIDATED_ICONCount:SetFont(VCB_SAVE["CF_icon_font"], VCB_SAVE["CF_icon_fontsize"])
		end
	end
end

function VCB_BF_CF_FRAME_FontSliderChange(obj)
	VCB_SAVE["CF_icon_font"] = VCB_FONT_ARRAY[obj:GetValue()]
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT..": "..VCB_FONT_ARRAY[obj:GetValue()])
	if (not VCB_SAVE["CF_icon_usecfont"]) then
		if VCB_SAVE["CF_icon_border"] then
			VCB_BF_CONSOLIDATED_ICONCount:SetFont(VCB_SAVE["CF_icon_font"], VCB_SAVE["CF_icon_fontsize"], "OUTLINE")
		else
			VCB_BF_CONSOLIDATED_ICONCount:SetFont(VCB_SAVE["CF_icon_font"], VCB_SAVE["CF_icon_fontsize"])
		end
	end
end

function VCB_BF_CF_FRAME_CHECKBUTTON_BORDER_CLICK()
	if VCB_SAVE["CF_icon_border"] then
		VCB_SAVE["CF_icon_border"] = false
		if VCB_SAVE["CF_icon_usecfont"] then
			VCB_BF_CONSOLIDATED_ICONCount:SetFont(VCB_SAVE["CF_icon_customfont"], VCB_SAVE["CF_icon_fontsize"])
		else
			VCB_BF_CONSOLIDATED_ICONCount:SetFont(VCB_SAVE["CF_icon_font"], VCB_SAVE["CF_icon_fontsize"])
		end
	else
		VCB_SAVE["CF_icon_border"] = true
		if VCB_SAVE["CF_icon_usecfont"] then
			VCB_BF_CONSOLIDATED_ICONCount:SetFont(VCB_SAVE["CF_icon_customfont"], VCB_SAVE["CF_icon_fontsize"], "OUTLINE")
		else
			VCB_BF_CONSOLIDATED_ICONCount:SetFont(VCB_SAVE["CF_icon_font"], VCB_SAVE["CF_icon_fontsize"], "OUTLINE")
		end
	end
end

function VCB_BF_CF_FRAME_AlphaSliderChange(obj)
	VCB_SAVE["CF_icon_opacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText("Icon opacity: "..VCB_SAVE["CF_icon_opacity"])
	VCB_BF_CONSOLIDATED_ICON:SetAlpha(VCB_SAVE["CF_icon_opacity"])
end

function VCB_BF_CF_FRAME_FontAlphaSliderChange(obj)
	VCB_SAVE["CF_icon_fontopacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_OPACITY..": "..VCB_SAVE["CF_icon_fontopacity"])
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
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_BACKGROUND_OPACITY..": "..VCB_SAVE["CF_BF_bgopacity"])
	VCB_BF_CONSOLIDATED_BUFFFRAME:SetBackdropColor(VCB_SAVE["CF_BF_bgcolor_r"],VCB_SAVE["CF_BF_bgcolor_g"],VCB_SAVE["CF_BF_bgcolor_b"],VCB_SAVE["CF_BF_bgopacity"])
end

function VCB_BF_CF_FRAME_BFBorderSliderChange(obj)
	VCB_SAVE["CF_BF_border"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_BORDER..": "..VCB_SAVE["CF_BF_border"])
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
	getglobal(obj:GetName().."Text"):SetText(VCB_CF_FRAME_BF_BACKGROUND..": "..VCB_SAVE["CF_BF_background"])
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
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_BORDER_OPACITY..": "..VCB_SAVE["CF_BF_borderopacity"])
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
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_PADDING_H..": "..VCB_SAVE["CF_AURA_padding_h"])
	VCB_BF_RepositioningAndResizing()
end

function VCB_BF_CF_FRAME2_AuraPaddingVSliderChange(obj)
	VCB_SAVE["CF_AURA_padding_v"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_PADDING_V..": "..VCB_SAVE["CF_AURA_padding_v"])
	VCB_BF_RepositioningAndResizing()
end

function VCB_BF_CF_FRAME_AuraBorderSliderChange(obj)
	VCB_SAVE["CF_AURA_border"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_BORDER..": "..VCB_SAVE["CF_AURA_border"])
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
				if VCB_SAVE["Timer_usecfont"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["CF_TIMER_fontsize"])
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["CF_TIMER_fontsize"])
				end
			end
		end
	else
		VCB_SAVE["CF_TIMER_border"] = true
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				if VCB_SAVE["Timer_usecfont"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["CF_TIMER_fontsize"], "OUTLINE")
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["CF_TIMER_fontsize"], "OUTLINE")
				end
			end
		end
	end
end

function VCB_BF_CF_FRAME_AuraTimerFontSizeSliderChange(obj)
	VCB_SAVE["CF_TIMER_fontsize"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_SIZE..": "..VCB_SAVE["CF_TIMER_fontsize"])
	for i=0,31 do
		if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
			if VCB_SAVE["Timer_usecfont"] then
				if VCB_SAVE["CF_TIMER_border"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["CF_TIMER_fontsize"], "OUTLINE")
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["CF_TIMER_fontsize"])
				end
			else
				if VCB_SAVE["CF_TIMER_border"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["CF_TIMER_fontsize"], "OUTLINE")
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["CF_TIMER_fontsize"])
				end
			end
		end
	end
end

function VCB_BF_CF_FRAME_AuraTimerOpacitySliderChange(obj)
	VCB_SAVE["CF_TIMER_fontopacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_OPACITY..": "..VCB_SAVE["CF_TIMER_fontopacity"])
	for i=0,31 do
		if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
			getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetAlpha(VCB_SAVE["CF_TIMER_fontopacity"])
		end
	end
end

function VCB_BF_CF_FRAME2_G_ENABLE_BORDER()
	if VCB_SAVE["CF_AURA_enablefontborder"] then
		VCB_SAVE["CF_AURA_enablefontborder"] = false
		for i=0, 31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				if VCB_SAVE["CF_AURA_usecfont"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["CF_AURA_customfont"], VCB_SAVE["CF_AURA_fontsize"])
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["CF_AURA_font"], VCB_SAVE["CF_AURA_fontsize"])
				end
			end
		end
	else
		VCB_SAVE["CF_AURA_enablefontborder"] = true
		for i=0, 31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				if VCB_SAVE["CF_AURA_usecfont"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["CF_AURA_customfont"], VCB_SAVE["CF_AURA_fontsize"], "OUTLINE")
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["CF_AURA_font"], VCB_SAVE["CF_AURA_fontsize"], "OUTLINE")
				end
			end
		end
	end
end

function VCB_BF_CF_FRAME2_GFontSizeSliderChange(obj)
	VCB_SAVE["CF_AURA_fontsize"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_SIZE..": "..VCB_SAVE["CF_AURA_fontsize"])
	for i=0, 31 do
		if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
			if VCB_SAVE["CF_AURA_enablefontborder"] then
				if VCB_SAVE["CF_AURA_usecfont"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["CF_AURA_customfont"], VCB_SAVE["CF_AURA_fontsize"], "OUTLINE")
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["CF_AURA_font"], VCB_SAVE["CF_AURA_fontsize"], "OUTLINE")
				end
			else
				if VCB_SAVE["CF_AURA_usecfont"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["CF_AURA_font"], VCB_SAVE["CF_AURA_fontsize"])
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["CF_AURA_font"], VCB_SAVE["CF_AURA_fontsize"])
				end
			end
		end
	end
end

function VCB_BF_CF_FRAME2_GFontOffsetXSliderChange(obj)
	VCB_SAVE["CF_AURA_fontoffset_x"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_OFFSET_X..": "..VCB_SAVE["CF_AURA_fontoffset_x"])
	for i=0, 31 do
		if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
			getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):ClearAllPoints()
			getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetPoint("BOTTOMRIGHT", VCB_SAVE["CF_AURA_fontoffset_x"],VCB_SAVE["CF_AURA_fontoffset_y"])
		end
	end
end

function VCB_BF_CF_FRAME2_GFontOffsetYSliderChange(obj)
	VCB_SAVE["CF_AURA_fontoffset_y"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_OFFSET_Y..": "..VCB_SAVE["CF_AURA_fontoffset_y"])
	for i=0, 31 do
		if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
			getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):ClearAllPoints()
			getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetPoint("BOTTOMRIGHT", VCB_SAVE["CF_AURA_fontoffset_x"],VCB_SAVE["CF_AURA_fontoffset_y"])
		end
	end
end

function VCB_BF_CF_FRAME2_GFontSliderChange(obj)
	VCB_SAVE["CF_AURA_font"] = VCB_FONT_ARRAY[obj:GetValue()]
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT..": "..VCB_SAVE["CF_AURA_font"])
	if (not VCB_SAVE["CF_AURA_usecfont"]) then
		for i=0, 31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				if VCB_SAVE["CF_AURA_enablefontborder"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["CF_AURA_font"], VCB_SAVE["CF_AURA_fontsize"], "OUTLINE")
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["CF_AURA_font"], VCB_SAVE["CF_AURA_fontsize"])
				end
			end
		end
	end
end

function VCB_BF_CF_FRAME2_GFontOpacitySliderChange(obj)
	VCB_SAVE["CF_AURA_fontopacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_OPACITY..": "..VCB_SAVE["CF_AURA_fontopacity"])
	for i=0, 31 do
		if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
			getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetAlpha(VCB_SAVE["CF_AURA_fontopacity"])
		end
	end
end

function VCB_BF_CF_FRAME_SHOW_POSSIBLE_BUFFS()
	if VCB_SAVE["CF_icon_possiblebuffs"] then
		VCB_SAVE["CF_icon_possiblebuffs"] = false
	else
		VCB_SAVE["CF_icon_possiblebuffs"] = true
	end
	VCB_BF_RepositioningAndResizing()
end

function VCB_BF_CF_FRAME_SHOW_BUFFS_GRAYED_OUT()
	if VCB_SAVE["CF_icon_showpbgrayedout"] then
		VCB_SAVE["CF_icon_showpbgrayedout"] = false
	else
		VCB_SAVE["CF_icon_showpbgrayedout"] = true
	end
	VCB_BF_RepositioningAndResizing()
end

function VCB_BF_CF_FRAME2_GBGOpacitySliderChange(obj)
	VCB_SAVE["CF_AURA_bgopacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_BACKGROUND_OPACITY..": "..VCB_SAVE["CF_AURA_bgopacity"])
	for i=0,31 do
		if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
			getglobal("VCB_BF_BUFF_BUTTON"..i.."Icon"):SetAlpha(VCB_SAVE["CF_AURA_bgopacity"])
		end
	end
end

function VCB_BF_CF_FRAME_INVERT_BUFF_ORIENTATION()
	if VCB_SAVE["CF_BF_invertorientation"] then
		VCB_SAVE["CF_BF_invertorientation"] = false
	else
		VCB_SAVE["CF_BF_invertorientation"] = true
	end
	VCB_BF_RepositioningAndResizing()
end

function VCB_BF_CF_FRAME_CHECKBUTTON_ATTACH_CLICK()
	if VCB_SAVE["CF_icon_attach"] then
		VCB_SAVE["CF_icon_attach"] = false
		VCB_BF_CONSOLIDATED_ICON:ClearAllPoints()
		VCB_BF_CONSOLIDATED_ICON:SetParent(UIParent)
		VCB_BF_CONSOLIDATED_ICON:SetPoint(VCB_ICON_POINT, UIParent, VCB_ICON_POINT, VCB_ICON_POSX, VCB_ICON_POSY)
		VCB_BF_CONSOLIDATED_ICON:SetScale(1)
	else
		VCB_SAVE["CF_icon_attach"] = true
		VCB_BF_CONSOLIDATED_ICON:ClearAllPoints()
		VCB_BF_CONSOLIDATED_ICON:SetParent(VCB_BF_BUFF_FRAME)
		VCB_BF_CONSOLIDATED_ICON:SetPoint("TOPRIGHT", VCB_BF_BUFF_FRAME, "TOPRIGHT", 0, 0)
		VCB_BF_WEAPON_FRAME:SetScale(1)
	end
	VCB_BF_WEAPON_BUTTON_OnEvent(false)
	VCB_BF_RepositioningAndResizing()
end

function VCB_BF_CF_FRAME_CHECKBUTTON_CUSTOMFONT_CLICK()
	if VCB_SAVE["CF_icon_usecfont"] then
		VCB_SAVE["CF_icon_usecfont"] = false
		if VCB_SAVE["CF_icon_border"] then
			VCB_BF_CONSOLIDATED_ICONCount:SetFont(VCB_SAVE["CF_icon_font"], VCB_SAVE["CF_icon_fontsize"], "OUTLINE")
		else
			VCB_BF_CONSOLIDATED_ICONCount:SetFont(VCB_SAVE["CF_icon_font"], VCB_SAVE["CF_icon_fontsize"])
		end
	else
		VCB_SAVE["CF_icon_usecfont"] = true
		if VCB_SAVE["CF_icon_border"] then
			VCB_BF_CONSOLIDATED_ICONCount:SetFont(VCB_SAVE["CF_icon_customfont"], VCB_SAVE["CF_icon_fontsize"], "OUTLINE")
		else
			VCB_BF_CONSOLIDATED_ICONCount:SetFont(VCB_SAVE["CF_icon_customfont"], VCB_SAVE["CF_icon_fontsize"])
		end
	end
end

function VCB_BF_CF_FRAME_EDITBOX_CUSTOMFONT_CHANGE(obj)
	VCB_SAVE["CF_icon_customfont"] = obj:GetText()
	if VCB_SAVE["CF_icon_usecfont"] then
		if VCB_SAVE["CF_icon_border"] then
			VCB_BF_CONSOLIDATED_ICONCount:SetFont(VCB_SAVE["CF_icon_customfont"], VCB_SAVE["CF_icon_fontsize"], "OUTLINE")
		else
			VCB_BF_CONSOLIDATED_ICONCount:SetFont(VCB_SAVE["CF_icon_customfont"], VCB_SAVE["CF_icon_fontsize"])
		end
	end
end

function VCB_BF_CF_FRAME2_CHECKBUTTON_CUSTOMFONT_CLICK()
	if VCB_SAVE["CF_AURA_usecfont"] then
		VCB_SAVE["CF_AURA_usecfont"] = false
		for i=0, 31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				if VCB_SAVE["CF_AURA_enableborder"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["CF_AURA_font"], VCB_SAVE["CF_AURA_fontsize"], "OUTLINE")
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["CF_AURA_font"], VCB_SAVE["CF_AURA_fontsize"])
				end
			end
		end
	else
		VCB_SAVE["CF_AURA_usecfont"] = true
		for i=0, 31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				if VCB_SAVE["CF_AURA_enableborder"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["CF_AURA_customfont"], VCB_SAVE["CF_AURA_fontsize"], "OUTLINE")
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["CF_AURA_customfont"], VCB_SAVE["CF_AURA_fontsize"])
				end
			end
		end
	end
end

function VCB_BF_CF_FRAME2_EDITBOX_CUSTOMFONT_CHANGE(obj)
	VCB_SAVE["CF_AURA_customfont"] = obj:GetText()
	if VCB_SAVE["CF_AURA_usecfont"] then
		for i=0, 31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				if VCB_SAVE["CF_AURA_enableborder"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["CF_AURA_customfont"], VCB_SAVE["CF_AURA_fontsize"], "OUTLINE")
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["CF_AURA_customfont"], VCB_SAVE["CF_AURA_fontsize"])
				end
			end
		end
	end
end

---------------------------------------END CONSOLIDATED FRAME-----------------------------------------------------------------------------------------------------------------
---------------------------------------START BUFF FRAME-----------------------------------------------------------------------------------------------------------------

function VCB_BF_BF_FRAME_VERTICAL_MODE()
	if VCB_SAVE["BF_GENERAL_verticalmode"] then
		VCB_SAVE["BF_GENERAL_verticalmode"] = false
		if VCB_SAVE["WP_GENERAL_attach"] and VCB_SAVE["WP_GENERAL_verticalmode"] then
			VCB_BF_WP_FRAME_VERTICAL_MODE()
		end
	else
		VCB_SAVE["BF_GENERAL_verticalmode"] = true
		if VCB_SAVE["WP_GENERAL_attach"] and (not VCB_SAVE["WP_GENERAL_verticalmode"]) then
			VCB_BF_WP_FRAME_VERTICAL_MODE()
		end
	end
	VCB_BF_WEAPON_BUTTON_OnEvent(false)
	VCB_BF_RepositioningAndResizing()
end

function VCB_BF_BF_FRAME_NumPerRowSlider_CHANGE(obj)
	VCB_SAVE["BF_GENERAL_numperrow"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_BUFFS_PER_ROW..": "..VCB_SAVE["BF_GENERAL_numperrow"])
	VCB_BF_RepositioningAndResizing()
end

function VCB_BF_BF_FRAME_AuraPaddingHChange(obj)
	VCB_SAVE["BF_GENERAL_padding_h"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_PADDING_H..": "..VCB_SAVE["BF_GENERAL_padding_h"])
	if VCB_SAVE["WP_GENERAL_attach"] and (not VCB_SAVE["WP_GENERAL_verticalmode"]) then
		for i=0,1 do
			getglobal("VCB_BF_WEAPON_BUTTON"..i):ClearAllPoints()
			if VCB_SAVE["BF_GENERAL_invertorientation"] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i):SetPoint("TOPLEFT", (32+VCB_SAVE["BF_GENERAL_padding_h"])*i, 0)
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["BF_GENERAL_padding_h"])*i, 0)
			end
		end
	end
	VCB_BF_RepositioningAndResizing()
end

function VCB_BF_BF_FRAME_AuraPaddingVChange(obj)
	VCB_SAVE["BF_GENERAL_padding_v"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_PADDING_V..": "..VCB_SAVE["BF_GENERAL_padding_v"])
	if VCB_SAVE["WP_GENERAL_attach"] and VCB_SAVE["WP_GENERAL_verticalmode"] then
		for i=0,1 do
			getglobal("VCB_BF_WEAPON_BUTTON"..i):ClearAllPoints()
			if VCB_SAVE["BF_GENERAL_invertorientation"] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i):SetPoint("TOPLEFT", 0, -(44+VCB_SAVE["BF_GENERAL_padding_v"])*i)
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i):SetPoint("TOPRIGHT", 0, -(44+VCB_SAVE["BF_GENERAL_padding_v"])*i)
			end
		end
	end
	VCB_BF_RepositioningAndResizing()
end

function VCB_BF_BF_FRAME_ScaleSliderChange(obj)
	VCB_SAVE["BF_GENERAL_scale"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_SCALE..": "..VCB_SAVE["BF_GENERAL_scale"])
	VCB_BF_BUFF_FRAME:SetScale(VCB_SAVE["BF_GENERAL_scale"])
end

function VCB_BF_BF_FRAME_BGOpaSliderChange(obj)
	VCB_SAVE["BF_GENERAL_bgopacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_BACKGROUND_OPACITY..": "..VCB_SAVE["BF_GENERAL_bgopacity"])
	for i=0,31 do
		if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
			getglobal("VCB_BF_BUFF_BUTTON"..i):SetAlpha(VCB_SAVE["BF_GENERAL_bgopacity"])
		end
	end
end

function VCB_BF_BF_FRAME_ENABLE_BGCOLOR()
	if VCB_SAVE["BF_GENERAL_enablebgcolor"] then
		VCB_SAVE["BF_GENERAL_enablebgcolor"] = false
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Icon"):SetVertexColor(1,1,1,VCB_SAVE["BF_GENERAL_bgopacity"])
			end
		end
	else
		VCB_SAVE["BF_GENERAL_enablebgcolor"] = true
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Icon"):SetVertexColor(VCB_SAVE["BF_GENERAL_bgcolor_r"],VCB_SAVE["BF_GENERAL_bgcolor_g"],VCB_SAVE["BF_GENERAL_bgcolor_b"],VCB_SAVE["BF_GENERAL_bgopacity"])
			end
		end
	end
end

function VCB_BF_BF_FRAME_ENABLE_BORDER()
	if VCB_SAVE["BF_BORDER_enableborder"] then
		VCB_SAVE["BF_BORDER_enableborder"] = false
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetTexture(nil)
			end
		end
	else
		VCB_SAVE["BF_BORDER_enableborder"] = true
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetTexture(nil)
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetTexture(VCB_AURABORDER_ARRAY[VCB_SAVE["BF_BORDER_border"]])
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["BF_BORDER_bordercolor_r"],VCB_SAVE["BF_BORDER_bordercolor_g"],VCB_SAVE["BF_BORDER_bordercolor_b"],VCB_SAVE["BF_BORDER_borderopacity"])
			end
		end
	end
end

function VCB_BF_BF_FRAME_BorderOpacityChange(obj)
	VCB_SAVE["BF_BORDER_borderopacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_BACKGROUND_OPACITY..": "..VCB_SAVE["BF_BORDER_borderopacity"])
	if VCB_SAVE["BF_BORDER_enableborder"] then
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetAlpha(VCB_SAVE["BF_BORDER_borderopacity"])
			end
		end
	end
end

function VCB_BF_BF_FRAME_BorderChange(obj)
	VCB_SAVE["BF_BORDER_border"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_BORDER..": "..VCB_SAVE["BF_BORDER_border"])
	if VCB_SAVE["BF_BORDER_enableborder"] then
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetTexture(nil)
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetTexture(VCB_AURABORDER_ARRAY[VCB_SAVE["BF_BORDER_border"]])
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["BF_BORDER_bordercolor_r"],VCB_SAVE["BF_BORDER_bordercolor_g"],VCB_SAVE["BF_BORDER_bordercolor_b"],VCB_SAVE["BF_BORDER_borderopacity"])
			end
		end
	end
end

function VCB_BF_BF_FRAME_USE_CUSTOM_BORDER()
	if VCB_SAVE["BF_BORDER_usecustomborder"] then
		VCB_SAVE["BF_BORDER_usecustomborder"] = false
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetTexture(nil)
				if VCB_SAVE["BF_BORDER_enableborder"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetTexture(VCB_AURABORDER_ARRAY[VCB_SAVE["BF_BORDER_border"]])
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["BF_BORDER_bordercolor_r"],VCB_SAVE["BF_BORDER_bordercolor_g"],VCB_SAVE["BF_BORDER_bordercolor_b"],VCB_SAVE["BF_BORDER_borderopacity"])
				end
			end
		end
	else
		VCB_SAVE["BF_BORDER_usecustomborder"] = true
		if VCB_SAVE["BF_BORDER_enableborder"] then
			for i=0,31 do
				if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetTexture(nil)
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetTexture(VCB_SAVE["BF_BORDER_customborderpath"])
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["BF_BORDER_bordercolor_r"],VCB_SAVE["BF_BORDER_bordercolor_g"],VCB_SAVE["BF_BORDER_bordercolor_b"],VCB_SAVE["BF_BORDER_borderopacity"])
				end
			end
		end
	end
end

function VCB_BF_BF_FRAME_EDITBOX_BORDERCHANGE(obj)
	VCB_SAVE["BF_BORDER_customborderpath"] = obj:GetText()
	if VCB_SAVE["BF_BORDER_enableborder"] then
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetTexture(nil)
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetTexture(VCB_SAVE["BF_BORDER_customborderpath"])
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["BF_BORDER_bordercolor_r"],VCB_SAVE["BF_BORDER_bordercolor_g"],VCB_SAVE["BF_BORDER_bordercolor_b"],VCB_SAVE["BF_BORDER_borderopacity"])
			end
		end
	end
end

function VCB_BF_BF_FRAME_TIMER_ENABLE_BORDER()
	if VCB_SAVE["BF_TIMER_border"] then
		VCB_SAVE["BF_TIMER_border"] = false
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				if VCB_SAVE["Timer_usecfont"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["BF_TIMER_fontsize"])
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["BF_TIMER_fontsize"])
				end
			end
		end
	else
		VCB_SAVE["BF_TIMER_border"] = true
		for i=0,31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				if VCB_SAVE["Timer_usecfont"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["BF_TIMER_fontsize"], "OUTLINE")
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["BF_TIMER_fontsize"], "OUTLINE")
				end
			end
		end
	end
end

function VCB_BF_BF_FRAME_FontSizeChange(obj)
	VCB_SAVE["BF_TIMER_fontsize"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_SIZE..": "..VCB_SAVE["BF_TIMER_fontsize"])
	for i=0,31 do
		if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
			if VCB_SAVE["BF_TIMER_border"] then
				if VCB_SAVE["Timer_usecfont"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["BF_TIMER_fontsize"], "OUTLINE")
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["BF_TIMER_fontsize"], "OUTLINE")
				end
			else
				if VCB_SAVE["Timer_usecfont"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["BF_TIMER_fontsize"])
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["BF_TIMER_fontsize"])
				end
			end
		end
	end
end

function VCB_BF_BF_FRAME_FontOpacityChange(obj)
	VCB_SAVE["BF_TIMER_fontopacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_OPACITY..": "..VCB_SAVE["BF_TIMER_fontopacity"])
	for i=0,31 do
		if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
			getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetAlpha(VCB_SAVE["BF_TIMER_fontopacity"])
		end
	end
end

function VCB_BF_BF_FRAME_CHANGE_PAGE()
	if VCB_BF_BF_FRAME:IsVisible() then
		VCB_OPTIONS_HIDE_ALL()
		VCB_OPTIONS_SHOW("VCB_BF_BF_FRAME2", VCB_MENU_BUTTON5_LINK2)
	else
		VCB_OPTIONS_HIDE_ALL()
		VCB_OPTIONS_SHOW("VCB_BF_BF_FRAME", VCB_MENU_BUTTON5_LINK)
	end
end

function VCB_BF_BF_FRAME_G_ENABLE_BORDER()
	if VCB_SAVE["BF_GENERAL_enableborder"] then
		VCB_SAVE["BF_GENERAL_enableborder"] = false
		for i=0, 31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				if VCB_SAVE["BF_GENERAL_usecfont"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["BF_GENERAL_customfont"], VCB_SAVE["BF_GENERAL_fontsize"])
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["BF_GENERAL_font"], VCB_SAVE["BF_GENERAL_fontsize"])
				end
			end
		end
	else
		VCB_SAVE["BF_GENERAL_enableborder"] = true
		for i=0, 31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				if VCB_SAVE["BF_GENERAL_usecfont"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["BF_GENERAL_customfont"], VCB_SAVE["BF_GENERAL_fontsize"], "OUTLINE")
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["BF_GENERAL_font"], VCB_SAVE["BF_GENERAL_fontsize"], "OUTLINE")
				end
			end
		end
	end
end

function VCB_BF_BF_FRAME_GFontSizeSliderChange(obj)
	VCB_SAVE["BF_GENERAL_fontsize"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_SIZE..": "..VCB_SAVE["BF_GENERAL_fontsize"])
	for i=0, 31 do
		if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
			if VCB_SAVE["BF_GENERAL_enableborder"] then
				if VCB_SAVE["BF_GENERAL_usecfont"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["BF_GENERAL_customfont"], VCB_SAVE["BF_GENERAL_fontsize"], "OUTLINE")
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["BF_GENERAL_font"], VCB_SAVE["BF_GENERAL_fontsize"], "OUTLINE")
				end
			else
				if VCB_SAVE["BF_GENERAL_usecfont"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["BF_GENERAL_customfont"], VCB_SAVE["BF_GENERAL_fontsize"])
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["BF_GENERAL_font"], VCB_SAVE["BF_GENERAL_fontsize"])
				end
			end
		end
	end
end

function VCB_BF_BF_FRAME_GFontOffsetXSliderChange(obj)
	VCB_SAVE["BF_GENERAL_fontoffset_x"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_OFFSET_X..": "..VCB_SAVE["BF_GENERAL_fontoffset_x"])
	for i=0, 31 do
		if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
			getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):ClearAllPoints()
			getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetPoint("BOTTOMRIGHT", VCB_SAVE["BF_GENERAL_fontoffset_x"],VCB_SAVE["BF_GENERAL_fontoffset_y"])
		end
	end
end

function VCB_BF_BF_FRAME_GFontOffsetYSliderChange(obj)
	VCB_SAVE["BF_GENERAL_fontoffset_y"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_OFFSET_Y..": "..VCB_SAVE["BF_GENERAL_fontoffset_y"])
	for i=0, 31 do
		if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
			getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):ClearAllPoints()
			getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetPoint("BOTTOMRIGHT", VCB_SAVE["BF_GENERAL_fontoffset_x"],VCB_SAVE["BF_GENERAL_fontoffset_y"])
		end
	end
end

function VCB_BF_BF_FRAME_GFontSliderChange(obj)
	VCB_SAVE["BF_GENERAL_font"] = VCB_FONT_ARRAY[obj:GetValue()]
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT..": "..VCB_SAVE["BF_GENERAL_font"])
	if (not VCB_SAVE["BF_GENERAL_usecfont"]) then
		for i=0, 31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				if VCB_SAVE["BF_GENERAL_enableborder"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["BF_GENERAL_font"], VCB_SAVE["BF_GENERAL_fontsize"], "OUTLINE")
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["BF_GENERAL_font"], VCB_SAVE["BF_GENERAL_fontsize"])
				end
			end
		end
	end
end

function VCB_BF_BF_FRAME_GFontOpacitySliderChange(obj)
	VCB_SAVE["BF_GENERAL_fontopacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_OPACITY..": "..VCB_SAVE["BF_GENERAL_fontopacity"])
	for i=0, 31 do
		if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
			getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetAlpha(VCB_SAVE["BF_GENERAL_fontopacity"])
		end
	end
end

function VCB_BF_BF_FRAME_INVERTBUFFMODE()
	if VCB_SAVE["BF_GENERAL_invert"] then
		VCB_SAVE["BF_GENERAL_invert"] = false
	else
		VCB_SAVE["BF_GENERAL_invert"] = true
	end
	VCB_BF_RepositioningAndResizing()
end

function VCB_BF_BF_FRAME_INVERT_AURA_ORIENTATION()
	if VCB_SAVE["BF_GENERAL_invertorientation"] then
		VCB_SAVE["BF_GENERAL_invertorientation"] = false
	else
		VCB_SAVE["BF_GENERAL_invertorientation"] = true
	end
	VCB_BF_WEAPON_BUTTON_OnEvent(false)
	VCB_BF_RepositioningAndResizing()
end

function VCB_BF_BF_FRAME_CHECKBUTTON_CUSTOMFONT_CLICK()
	if VCB_SAVE["BF_GENERAL_usecfont"] then
		VCB_SAVE["BF_GENERAL_usecfont"] = false
		for i=0, 31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				if VCB_SAVE["BF_GENERAL_enableborder"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["BF_GENERAL_font"], VCB_SAVE["BF_GENERAL_fontsize"], "OUTLINE")
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["BF_GENERAL_font"], VCB_SAVE["BF_GENERAL_fontsize"])
				end
			end
		end
	else
		VCB_SAVE["BF_GENERAL_usecfont"] = true
		for i=0, 31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				if VCB_SAVE["BF_GENERAL_enableborder"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["BF_GENERAL_customfont"], VCB_SAVE["BF_GENERAL_fontsize"], "OUTLINE")
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["BF_GENERAL_customfont"], VCB_SAVE["BF_GENERAL_fontsize"])
				end
			end
		end
	end
end

function VCB_BF_BF_FRAME_EDITBOX_CUSTOMFONT_CHANGE(obj)
	VCB_SAVE["BF_GENERAL_customfont"] = obj:GetText()
	if VCB_SAVE["BF_GENERAL_usecfont"] then
		for i=0, 31 do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				if VCB_SAVE["BF_GENERAL_enableborder"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["BF_GENERAL_customfont"], VCB_SAVE["BF_GENERAL_fontsize"], "OUTLINE")
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["BF_GENERAL_customfont"], VCB_SAVE["BF_GENERAL_fontsize"])
				end
			end
		end
	end
end

---------------------------------------END BUFF FRAME-----------------------------------------------------------------------------------------------------------------
---------------------------------------START DEBUFF FRAME-----------------------------------------------------------------------------------------------------------------

function VCB_BF_DBF_FRAME_VERTICAL_MODE()
	if VCB_SAVE["DBF_GENERAL_verticalmode"] then
		VCB_SAVE["DBF_GENERAL_verticalmode"] = false
		for i=0,15 do
			if VCB_SAVE["DBF_GENERAL_invertorientation"] then
				if VCB_SAVE["DBF_GENERAL_invert"] then
					local j = 15-i
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*i - floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPRIGHT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*i - floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			else
				if VCB_SAVE["DBF_GENERAL_invert"] then
					local j = 15-i
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			end
		end
	else
		VCB_SAVE["DBF_GENERAL_verticalmode"] = true
		for i=0,15 do
			if VCB_SAVE["DBF_GENERAL_invertorientation"] then
				if VCB_SAVE["DBF_GENERAL_invert"] then
					local j = 15-i
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				end
			else
				if VCB_SAVE["DBF_GENERAL_invert"] then
					local j = 15-i
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				end
			end
		end
	end
end

function VCB_BF_DBF_FRAME_NumPerRowSliderChange(obj)
	VCB_SAVE["DBF_GENERAL_numperrow"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_BUFFS_PER_ROW..": "..VCB_SAVE["DBF_GENERAL_numperrow"])
	for i=0,15 do
		if VCB_SAVE["DBF_GENERAL_invertorientation"] then
			if VCB_SAVE["DBF_GENERAL_verticalmode"] then
				if VCB_SAVE["DBF_GENERAL_invert"] then
					local j = 15-i
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				end
			else
				if VCB_SAVE["DBF_GENERAL_invert"] then
					local j = 15-i
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*i - floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*i - floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			end
		else
			if VCB_SAVE["DBF_GENERAL_verticalmode"] then
				if VCB_SAVE["DBF_GENERAL_invert"] then
					local j = 15-i
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				end
			else
				if VCB_SAVE["DBF_GENERAL_invert"] then
					local j = 15-i
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			end
		end
	end
end

function VCB_BF_DBF_FRAME_AuraPaddingHSliderChange(obj)
	VCB_SAVE["DBF_GENERAL_padding_h"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_PADDING_H..": "..VCB_SAVE["DBF_GENERAL_padding_h"])
	for i=0,15 do
		if VCB_SAVE["DBF_GENERAL_invertorientation"] then
			if VCB_SAVE["DBF_GENERAL_verticalmode"] then
				if VCB_SAVE["DBF_GENERAL_invert"] then
					local j = 15-i
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				end
			else
				if VCB_SAVE["DBF_GENERAL_invert"] then
					local j = 15-i
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*i - floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*i - floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			end
		else
			if VCB_SAVE["DBF_GENERAL_verticalmode"] then
				if VCB_SAVE["DBF_GENERAL_invert"] then
					local j = 15-i
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				end
			else
				if VCB_SAVE["DBF_GENERAL_invert"] then
					local j = 15-i
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			end
		end
	end
end

function VCB_BF_DBF_FRAME_AuraPaddingVSliderChange(obj)
	VCB_SAVE["DBF_GENERAL_padding_v"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_PADDING_V..": "..VCB_SAVE["DBF_GENERAL_padding_v"])
	for i=0,15 do
		if VCB_SAVE["DBF_GENERAL_invertorientation"] then
			if VCB_SAVE["DBF_GENERAL_verticalmode"] then
				if VCB_SAVE["DBF_GENERAL_invert"] then
					local j = 15-i
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				end
			else
				if VCB_SAVE["DBF_GENERAL_invert"] then
					local j = 15-i
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*i - floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*i - floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			end
		else
			if VCB_SAVE["DBF_GENERAL_verticalmode"] then
				if VCB_SAVE["DBF_GENERAL_invert"] then
					local j = 15-i
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				end
			else
				if VCB_SAVE["DBF_GENERAL_invert"] then
					local j = 15-i
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			end
		end
	end
end

function VCB_BF_DBF_FRAME_BGOpaSliderChange(obj)
	VCB_SAVE["DBF_GENERAL_bgopacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_BACKGROUND_OPACITY..": "..VCB_SAVE["DBF_GENERAL_bgopacity"])
	for i=0,15 do
		getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetAlpha(VCB_SAVE["DBF_GENERAL_bgopacity"])
	end
end

function VCB_BF_DBF_FRAME_ScaleSliderChange(obj)
	VCB_SAVE["DBF_GENERAL_scale"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_SCALE..": "..VCB_SAVE["DBF_GENERAL_scale"])
	VCB_BF_DEBUFF_FRAME:SetScale(VCB_SAVE["DBF_GENERAL_scale"])
end

function VCB_BF_DBF_FRAME_ENABLE_BGCOLOR()
	if VCB_SAVE["DBF_GENERAL_enablebgcolor"] then
		VCB_SAVE["DBF_GENERAL_enablebgcolor"] = false
		for i=0,15 do
			getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Icon"):SetVertexColor(1,1,1,VCB_SAVE["DBF_GENERAL_bgopacity"])
		end
	else
		VCB_SAVE["DBF_GENERAL_enablebgcolor"] = true
		for i=0,15 do
			getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Icon"):SetVertexColor(VCB_SAVE["DBF_GENERAL_bgcolor_r"],VCB_SAVE["DBF_GENERAL_bgcolor_g"],VCB_SAVE["DBF_GENERAL_bgcolor_b"],VCB_SAVE["DBF_GENERAL_bgopacity"])
		end
	end
end

function VCB_BF_DBF_FRAME_ENABLE_BORDER()
	if VCB_SAVE["DBF_BORDER_enableborder"] then
		VCB_SAVE["DBF_BORDER_enableborder"] = false
		for i=0,15 do
			getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetTexture(nil)
		end
	else
		VCB_SAVE["DBF_BORDER_enableborder"] = true
		for i=0,15 do
			getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetTexture(nil)
			if VCB_SAVE["DBF_BORDER_usecustomborder"] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetTexture(VCB_SAVE["DBF_BORDER_customborderpath"])
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetTexture(VCB_AURABORDER_ARRAY[VCB_SAVE["DBF_BORDER_border"]])
			end
			if i < 3 then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["DBF_BORDER_nonecolor_r"],VCB_SAVE["DBF_BORDER_nonecolor_g"],VCB_SAVE["DBF_BORDER_nonecolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
			elseif i >= 3 and i < 6 then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["DBF_BORDER_poisoncolor_r"],VCB_SAVE["DBF_BORDER_poisoncolor_g"],VCB_SAVE["DBF_BORDER_poisoncolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
			elseif i >= 6 and i < 9 then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["DBF_BORDER_magiccolor_r"],VCB_SAVE["DBF_BORDER_magiccolor_g"],VCB_SAVE["DBF_BORDER_magiccolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
			elseif i >= 9 and i < 12 then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["DBF_BORDER_cursecolor_r"],VCB_SAVE["DBF_BORDER_cursecolor_g"],VCB_SAVE["DBF_BORDER_cursecolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["DBF_BORDER_diseasecolor_r"],VCB_SAVE["DBF_BORDER_diseasecolor_g"],VCB_SAVE["DBF_BORDER_diseasecolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
			end
		end
	end
end

function VCB_BF_DBF_FRAME_USE_CUSTOM_BORDER()
	if VCB_SAVE["DBF_BORDER_usecustomborder"] then
		VCB_SAVE["DBF_BORDER_usecustomborder"] = false
		for i=0,15 do
			getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetTexture(nil)
			if VCB_SAVE["DBF_BORDER_enableborder"] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetTexture(VCB_AURABORDER_ARRAY[VCB_SAVE["DBF_BORDER_border"]])
			end
		end
	else
		VCB_SAVE["DBF_BORDER_usecustomborder"] = true
		for i=0,15 do
			getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetTexture(nil)
			if VCB_SAVE["DBF_BORDER_enableborder"] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetTexture(VCB_SAVE["DBF_BORDER_customborderpath"])
			end
		end
	end
end

function VCB_BF_DBF_FRAME_EDITBOX_BORDER_CHANGE(obj)
	VCB_SAVE["DBF_BORDER_customborderpath"] = obj:GetText()
	if VCB_SAVE["DBF_BORDER_enableborder"] and VCB_SAVE["DBF_BORDER_usecustomborder"] then
		for i=0,15 do
			getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetTexture(nil)
			getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetTexture(VCB_SAVE["DBF_BORDER_customborderpath"])
		end
	end
end

function VCB_BF_DBF_FRAME_BorderSliderChange(obj)
	VCB_SAVE["DBF_BORDER_border"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_BORDER..": "..VCB_SAVE["DBF_BORDER_border"])
	if VCB_SAVE["DBF_BORDER_enableborder"] and (not VCB_SAVE["DBF_BORDER_usecustomborder"]) then
		for i=0,15 do
			getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetTexture(nil)
			getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetTexture(VCB_AURABORDER_ARRAY[VCB_SAVE["DBF_BORDER_border"]])
		end
	end
end

function VCB_BF_DBF_FRAME_ENABLE_FONTBORDER()
	if VCB_SAVE["DBF_TIMER_enableborder"] then
		VCB_SAVE["DBF_TIMER_enableborder"] = false
		for i=0,15 do
			if VCB_SAVE["Timer_usecfont"] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["DBF_TIMER_fontsize"])
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["DBF_TIMER_fontsize"])
			end
		end
	else
		VCB_SAVE["DBF_TIMER_enableborder"] = true
		for i=0,15 do
			if VCB_SAVE["Timer_usecfont"] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["DBF_TIMER_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["DBF_TIMER_fontsize"], "OUTLINE")
			end
		end
	end
end

function VCB_BF_DBF_FRAME_FontSizeSliderChange(obj)
	VCB_SAVE["DBF_TIMER_fontsize"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_SIZE..": "..VCB_SAVE["DBF_TIMER_fontsize"])
	for i=0,15 do
		if VCB_SAVE["DBF_TIMER_enableborder"] then
			if VCB_SAVE["Timer_usecfont"] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["DBF_TIMER_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["DBF_TIMER_fontsize"], "OUTLINE")
			end
		else
			if VCB_SAVE["Timer_usecfont"] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["DBF_TIMER_fontsize"])
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["DBF_TIMER_fontsize"])
			end
		end
	end
end

function VCB_BF_DBF_FRAME_FontOpacitySliderChange(obj)
	VCB_SAVE["DBF_TIMER_fontopacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_OPACITY..": "..VCB_SAVE["DBF_TIMER_fontopacity"])
	for i=0,15 do
		getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Duration"):SetAlpha(VCB_SAVE["DBF_TIMER_fontopacity"])
	end
end

function VCB_BF_DBF_FRAME_BorderOpacitySliderChange(obj)
	VCB_SAVE["DBF_BORDER_borderopacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_BACKGROUND_OPACITY..": "..VCB_SAVE["DBF_BORDER_borderopacity"])
	for i=0,15 do
		getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetAlpha(VCB_SAVE["DBF_BORDER_borderopacity"])
	end
end

function VCB_BF_DBF_FRAME_CHANGE_PAGE()
	if VCB_BF_DBF_FRAME:IsVisible() then
		VCB_OPTIONS_HIDE_ALL()
		VCB_OPTIONS_SHOW("VCB_BF_DBF_FRAME2", VCB_MENU_BUTTON6_LINK2)
	else
		VCB_OPTIONS_HIDE_ALL()
		VCB_OPTIONS_SHOW("VCB_BF_DBF_FRAME", VCB_MENU_BUTTON6_LINK)
	end
end

function VCB_BF_DBF_FRAME_G_ENABLE_BORDER()
	if VCB_SAVE["DBF_GENERAL_enableborder"] then
		VCB_SAVE["DBF_GENERAL_enableborder"] = false
		for i=0, 15 do
			if VCB_SAVE["DBF_GENERAL_usecfont"] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["DBF_GENERAL_customfont"], VCB_SAVE["DBF_GENERAL_fontsize"])
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["DBF_GENERAL_font"], VCB_SAVE["DBF_GENERAL_fontsize"])
			end
		end
	else
		VCB_SAVE["DBF_GENERAL_enableborder"] = true
		for i=0, 15 do
			if VCB_SAVE["DBF_GENERAL_usecfont"] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["DBF_GENERAL_customfont"], VCB_SAVE["DBF_GENERAL_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["DBF_GENERAL_font"], VCB_SAVE["DBF_GENERAL_fontsize"], "OUTLINE")
			end
		end
	end
end

function VCB_BF_DBF_FRAME_GFontSizeSliderChange(obj)
	VCB_SAVE["DBF_GENERAL_fontsize"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_SIZE..": "..VCB_SAVE["DBF_GENERAL_fontsize"])
	for i=0, 15 do
		if VCB_SAVE["DBF_GENERAL_enableborder"] then
			if VCB_SAVE["DBF_GENERAL_usecfont"] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["DBF_GENERAL_customfont"], VCB_SAVE["DBF_GENERAL_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["DBF_GENERAL_font"], VCB_SAVE["DBF_GENERAL_fontsize"], "OUTLINE")
			end
		else
			if VCB_SAVE["DBF_GENERAL_usecfont"] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["DBF_GENERAL_customfont"], VCB_SAVE["DBF_GENERAL_fontsize"])
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["DBF_GENERAL_font"], VCB_SAVE["DBF_GENERAL_fontsize"])
			end
		end
	end
end

function VCB_BF_DBF_FRAME_GFontOffsetXSliderChange(obj)
	VCB_SAVE["DBF_GENERAL_fontoffset_x"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_OFFSET_X..": "..VCB_SAVE["DBF_GENERAL_fontoffset_x"])
	for i=0,15 do
		getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):ClearAllPoints()
		getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetPoint("BOTTOMRIGHT", VCB_SAVE["DBF_GENERAL_fontoffset_x"],VCB_SAVE["DBF_GENERAL_fontoffset_y"])
	end
end

function VCB_BF_DBF_FRAME_GFontOffsetYSliderChange(obj)
	VCB_SAVE["DBF_GENERAL_fontoffset_y"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_OFFSET_Y..": "..VCB_SAVE["DBF_GENERAL_fontoffset_y"])
	for i=0,15 do
		getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):ClearAllPoints()
		getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetPoint("BOTTOMRIGHT", VCB_SAVE["DBF_GENERAL_fontoffset_x"],VCB_SAVE["DBF_GENERAL_fontoffset_y"])
	end
end

function VCB_BF_DBF_FRAME_GFontSliderChange(obj)
	VCB_SAVE["DBF_GENERAL_font"] = VCB_FONT_ARRAY[obj:GetValue()]
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT..": "..VCB_SAVE["DBF_GENERAL_font"])
	if (not VCB_SAVE["DBF_GENERAL_usecfont"]) then
		for i=0, 15 do
			if VCB_SAVE["DBF_GENERAL_enableborder"] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["DBF_GENERAL_font"], VCB_SAVE["DBF_GENERAL_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["DBF_GENERAL_font"], VCB_SAVE["DBF_GENERAL_fontsize"])
			end
		end
	end
end

function VCB_BF_DBF_FRAME_GFontOpacitySliderChange(obj)
	VCB_SAVE["DBF_GENERAL_fontopacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_OPACITY..": "..VCB_SAVE["DBF_GENERAL_fontopacity"])
	for i=0,15 do
		getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetAlpha(VCB_SAVE["DBF_GENERAL_fontopacity"])
	end
end

function VCB_BF_DBF_FRAME_INVERTBUFFORDER()
	if VCB_SAVE["DBF_GENERAL_invert"] then
		VCB_SAVE["DBF_GENERAL_invert"] = false
		for i=0,15 do
			getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
			if VCB_SAVE["DBF_GENERAL_invertorientation"] then
				if VCB_SAVE["DBF_GENERAL_verticalmode"] then
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*i - floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			else
				if VCB_SAVE["DBF_GENERAL_verticalmode"] then
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			end
		end
	else
		VCB_SAVE["DBF_GENERAL_invert"] = true
		for i=0,15 do
			local j = 15-i
			getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
			if VCB_SAVE["DBF_GENERAL_invertorientation"] then
				if VCB_SAVE["DBF_GENERAL_verticalmode"] then
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*i - floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			else
				if VCB_SAVE["DBF_GENERAL_verticalmode"] then
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			end
		end
	end
end

function VCB_BF_DBF_FRAME_INVERT_AURA_ORIENTATION()
	if VCB_SAVE["DBF_GENERAL_invertorientation"] then
		VCB_SAVE["DBF_GENERAL_invertorientation"] = false
		for i=0,15 do
			if VCB_SAVE["DBF_GENERAL_invert"] then
				local j = 15-i
				getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
				if VCB_SAVE["DBF_GENERAL_verticalmode"] then
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
				if VCB_SAVE["DBF_GENERAL_verticalmode"] then
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			end
		end
	else
		VCB_SAVE["DBF_GENERAL_invertorientation"] = true
		for i=0,15 do
			if VCB_SAVE["DBF_GENERAL_invert"] then
				local j = 15-i
				getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
				if VCB_SAVE["DBF_GENERAL_verticalmode"] then
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*i - floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
				if VCB_SAVE["DBF_GENERAL_verticalmode"] then
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*i - floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			end
		end
	end
end

function VCB_BF_DBF_FRAME_CHECKBUTTON_CUSTOMFONT_CLICK()
	if VCB_SAVE["DBF_GENERAL_usecfont"] then
		VCB_SAVE["DBF_GENERAL_usecfont"] = false
		for i=0, 15 do
			if VCB_SAVE["DBF_GENERAL_enableborder"] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["DBF_GENERAL_font"], VCB_SAVE["DBF_GENERAL_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["DBF_GENERAL_font"], VCB_SAVE["DBF_GENERAL_fontsize"])
			end
		end
	else
		VCB_SAVE["DBF_GENERAL_usecfont"] = true
		for i=0, 15 do
			if VCB_SAVE["DBF_GENERAL_enableborder"] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["DBF_GENERAL_customfont"], VCB_SAVE["DBF_GENERAL_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["DBF_GENERAL_customfont"], VCB_SAVE["DBF_GENERAL_fontsize"])
			end
		end
	end
end

function VCB_BF_DBF_FRAME_EDITBOX_CUSTOMFONT_CHANGE(obj)
	VCB_SAVE["DBF_GENERAL_customfont"] = obj:GetText()
	if VCB_SAVE["DBF_GENERAL_usecfont"] then
		for i=0, 15 do
			if VCB_SAVE["DBF_GENERAL_enableborder"] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["DBF_GENERAL_customfont"], VCB_SAVE["DBF_GENERAL_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["DBF_GENERAL_customfont"], VCB_SAVE["DBF_GENERAL_fontsize"])
			end
		end
	end
end

---------------------------------------END DEBUFF FRAME-----------------------------------------------------------------------------------------------------------------
---------------------------------------START WP FRAME-----------------------------------------------------------------------------------------------------------------
function VCB_BF_WP_FRAME_VERTICAL_MODE()
	if VCB_SAVE["WP_GENERAL_verticalmode"] then
		VCB_SAVE["WP_GENERAL_verticalmode"] = false
		for i=0,1 do
			getglobal("VCB_BF_WEAPON_BUTTON"..i):ClearAllPoints()
			getglobal("VCB_BF_WEAPON_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["WP_GENERAL_padding_h"])*i, 0)
		end
		if (VCB_SAVE["BF_GENERAL_verticalmode"]) and VCB_SAVE["WP_GENERAL_attach"] then
			VCB_BF_BF_FRAME_VERTICAL_MODE()
		end
	else
		VCB_SAVE["WP_GENERAL_verticalmode"] = true
		for i=0,1 do
			getglobal("VCB_BF_WEAPON_BUTTON"..i):ClearAllPoints()
			getglobal("VCB_BF_WEAPON_BUTTON"..i):SetPoint("TOPRIGHT", 0, -(44+VCB_SAVE["WP_GENERAL_padding_v"])*i)
		end
		if (not VCB_SAVE["BF_GENERAL_verticalmode"]) and VCB_SAVE["WP_GENERAL_attach"] then
			VCB_BF_BF_FRAME_VERTICAL_MODE()
		end
	end
end

function VCB_BF_WP_FRAME_ENABLEBGCOLOR()
	if VCB_SAVE["WP_GENERAL_enablebgcolor"] then
		VCB_SAVE["WP_GENERAL_enablebgcolor"] = false
		for i=0,1 do
			getglobal("VCB_BF_WEAPON_BUTTON"..i.."Icon"):SetVertexColor(1,1,1, VCB_SAVE["WP_GENERAL_bgopacity"])
		end
	else
		VCB_SAVE["WP_GENERAL_enablebgcolor"] = true
		for i=0,1 do
			getglobal("VCB_BF_WEAPON_BUTTON"..i.."Icon"):SetVertexColor(VCB_SAVE["WP_GENERAL_bgcolor_r"],VCB_SAVE["WP_GENERAL_bgcolor_g"],VCB_SAVE["WP_GENERAL_bgcolor_b"],VCB_SAVE["WP_GENERAL_bgopacity"])
		end
	end
end

function VCB_BF_WP_FRAME_ATTACH()
	if VCB_SAVE["WP_GENERAL_attach"] then
		VCB_SAVE["WP_GENERAL_attach"] = false
		VCB_BF_WEAPON_FRAME:ClearAllPoints()
		VCB_BF_WEAPON_FRAME:SetParent(UIParent)
		VCB_BF_WEAPON_FRAME:SetPoint(VCB_WP_POINT, UIParent, VCB_WP_POINT, VCB_WP_POSX, VCB_WP_POSY)
		if VCB_SAVE["CF_icon_attach"] then
			VCB_BF_CONSOLIDATED_ICON:ClearAllPoints()
			VCB_BF_CONSOLIDATED_ICON:SetPoint("TOPRIGHT", 0, 0)
		end
		VCB_BF_WEAPON_FRAME:SetScale(VCB_SAVE["WP_GENERAL_scale"])
	else
		VCB_SAVE["WP_GENERAL_attach"] = true
		local point, relativeTo, relativePoint, xOfs, yOfs = VCB_BF_WEAPON_FRAME:GetPoint()
		VCB_WP_POINT = point
		VCB_WP_POSX = xOfs
		VCB_WP_POSY = yOfs
		VCB_BF_WEAPON_FRAME:ClearAllPoints()
		VCB_BF_WEAPON_FRAME:SetParent(VCB_BF_BUFF_FRAME)
		VCB_BF_WEAPON_FRAME:SetPoint("TOPRIGHT", VCB_BF_BUFF_FRAME, "TOPRIGHT", 0, 0)
		if VCB_SAVE["CF_icon_attach"] then
			VCB_BF_CONSOLIDATED_ICON:ClearAllPoints()
			VCB_BF_CONSOLIDATED_ICON:SetPoint("TOPRIGHT", -2*(32+VCB_SAVE["BF_GENERAL_padding_h"]), 0)
		end
		if (VCB_SAVE["BF_GENERAL_verticalmode"] and (not VCB_SAVE["WP_GENERAL_verticalmode"])) or ((not VCB_SAVE["BF_GENERAL_verticalmode"]) and (VCB_SAVE["WP_GENERAL_verticalmode"])) then
			VCB_BF_BF_FRAME_VERTICAL_MODE()
		end
		VCB_BF_WEAPON_FRAME:SetScale(1)
	end
	VCB_BF_WEAPON_BUTTON_OnEvent(false)
	VCB_BF_RepositioningAndResizing()
end

function VCB_BF_WP_FRAME_AuraPaddingHSliderChange(obj)
	VCB_SAVE["WP_GENERAL_padding_h"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_PADDING_H..": "..VCB_SAVE["WP_GENERAL_padding_h"])
	if (not VCB_SAVE["WP_GENERAL_attach"]) and (not VCB_SAVE["WP_GENERAL_verticalmode"]) then
		for i=0,1 do
			getglobal("VCB_BF_WEAPON_BUTTON"..i):ClearAllPoints()
			getglobal("VCB_BF_WEAPON_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["WP_GENERAL_padding_h"])*i, 0)
		end
	end
end

function VCB_BF_WP_FRAME_FontSizeSliderChange(obj)
	VCB_SAVE["WP_GENERAL_fontsize"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_SIZE..": "..VCB_SAVE["WP_GENERAL_fontsize"])
	for i=0,1 do
		if VCB_SAVE["WP_GENERAL_enableborder"] then
			if VCB_SAVE["WP_GENERAL_usecfont"] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_customfont"], VCB_SAVE["WP_GENERAL_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_font"], VCB_SAVE["WP_GENERAL_fontsize"], "OUTLINE")
			end
		else
			if VCB_SAVE["WP_GENERAL_usecfont"] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_customfont"], VCB_SAVE["WP_GENERAL_fontsize"])
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_font"], VCB_SAVE["WP_GENERAL_fontsize"])
			end
		end
	end
end

function VCB_BF_WP_FRAME_BGOpaSliderChange(obj)
	VCB_SAVE["WP_GENERAL_bgopacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_BACKGROUND_OPACITY..": "..VCB_SAVE["WP_GENERAL_bgopacity"])
	for i=0,1 do
		getglobal("VCB_BF_WEAPON_BUTTON"..i.."Icon"):SetAlpha(VCB_SAVE["WP_GENERAL_bgopacity"])
	end
end

function VCB_BF_WP_FRAME_ScaleSliderChange(obj)
	VCB_SAVE["WP_GENERAL_scale"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_SCALE..": "..VCB_SAVE["WP_GENERAL_scale"])
	if (not VCB_SAVE["WP_GENERAL_attach"]) then
		VCB_BF_WEAPON_FRAME:SetScale(VCB_SAVE["WP_GENERAL_scale"])
	end
end

function VCB_BF_WP_FRAME_FontSliderChange(obj)
	VCB_SAVE["WP_GENERAL_font"] = VCB_FONT_ARRAY[obj:GetValue()]
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT..": "..VCB_SAVE["WP_GENERAL_font"])
	if (not VCB_SAVE["WP_GENERAL_usecfont"]) then
		for i=0,1 do
			if VCB_SAVE["WP_GENERAL_enableborder"] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_font"], VCB_SAVE["WP_GENERAL_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_font"], VCB_SAVE["WP_GENERAL_fontsize"])
			end
		end
	end
end

function VCB_BF_WP_FRAME_ENABLE_BORDER()
	if VCB_SAVE["WP_BORDER_enableborder"] then
		VCB_SAVE["WP_BORDER_enableborder"] = false
		for i=0,1 do
			getglobal("VCB_BF_WEAPON_BUTTON"..i.."Border"):SetTexture(nil)
		end
	else
		VCB_SAVE["WP_BORDER_enableborder"] = true
		for i=0,1 do
			getglobal("VCB_BF_WEAPON_BUTTON"..i.."Border"):SetTexture(nil)
			if VCB_SAVE["WP_BORDER_usecustomborder"] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Border"):SetTexture(VCB_SAVE["WP_BORDER_customborderpath"])
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Border"):SetTexture(VCB_WEAPONBORDER_ARRAY[VCB_SAVE["WP_BORDER_border"]])
			end
			getglobal("VCB_BF_WEAPON_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["WP_BORDER_bordercolor_r"],VCB_SAVE["WP_BORDER_bordercolor_g"],VCB_SAVE["WP_BORDER_bordercolor_b"],VCB_SAVE["WP_BORDER_borderopacity"])
		end
	end
end

function VCB_BF_WP_FRAME_USE_CUSTOM_BORDER()
	if VCB_SAVE["WP_BORDER_usecustomborder"] then
		VCB_SAVE["WP_BORDER_usecustomborder"] = false
		if VCB_SAVE["WP_BORDER_enableborder"] then
			for i=0,1 do
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Border"):SetTexture(VCB_WEAPONBORDER_ARRAY[VCB_SAVE["WP_BORDER_border"]])
			end
		end
	else
		VCB_SAVE["WP_BORDER_usecustomborder"] = true
		if VCB_SAVE["WP_BORDER_enableborder"] then
			for i=0,1 do
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Border"):SetTexture(VCB_SAVE["WP_BORDER_customborderpath"])
			end
		end
	end
end

function VCB_BF_WP_FRAME_EDITBOX_BORDER_CHANGE(obj)
	VCB_SAVE["WP_BORDER_customborderpath"] = obj:GetText()
	if VCB_SAVE["WP_BORDER_enableborder"] and VCB_SAVE["WP_BORDER_usecustomborder"] then
		for i=0,1 do
			getglobal("VCB_BF_WEAPON_BUTTON"..i.."Border"):SetTexture(nil)
			getglobal("VCB_BF_WEAPON_BUTTON"..i.."Border"):SetTexture(VCB_SAVE["WP_BORDER_customborderpath"])
		end
	end
end

function VCB_BF_WP_FRAME_BorderSliderChange(obj)
	VCB_SAVE["WP_BORDER_border"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_BORDER..": "..VCB_SAVE["WP_BORDER_border"])
	if VCB_SAVE["WP_BORDER_enableborder"] and (not VCB_SAVE["WP_BORDER_usecustomborder"]) then
		for i=0,1 do
			getglobal("VCB_BF_WEAPON_BUTTON"..i.."Border"):SetTexture(nil)
			getglobal("VCB_BF_WEAPON_BUTTON"..i.."Border"):SetTexture(VCB_WEAPONBORDER_ARRAY[VCB_SAVE["WP_BORDER_border"]])
		end
	end
end

function VCB_BF_WP_FRAME_TIMER_ENABLE_BORDER()
	if VCB_SAVE["WP_TIMER_enableborder"] then
		VCB_SAVE["WP_TIMER_enableborder"] = false
		for i=0,1 do
			if VCB_SAVE["Timer_usecfont"] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["WP_TIMER_fontsize"])
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["WP_TIMER_fontsize"])
			end
		end
	else
		VCB_SAVE["WP_TIMER_enableborder"] = true
		for i=0,1 do
			if VCB_SAVE["Timer_usecfont"] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["WP_TIMER_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["WP_TIMER_fontsize"], "OUTLINE")
			end
		end
	end
end

function VCB_BF_WP_FRAME_TIMER_FontSizeSliderChange(obj)
	VCB_SAVE["WP_TIMER_fontsize"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_SIZE..": "..VCB_SAVE["WP_TIMER_fontsize"])
	for i=0,1 do
		if VCB_SAVE["WP_TIMER_enableborder"] then
			if VCB_SAVE["Timer_usecfont"] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["WP_TIMER_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["WP_TIMER_fontsize"], "OUTLINE")
			end
		else
			if VCB_SAVE["Timer_usecfont"] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["WP_TIMER_fontsize"])
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["WP_TIMER_fontsize"])
			end
		end
	end
end

function VCB_BF_WP_FRAME_TIMER_FontOpacitySliderChange(obj)
	VCB_SAVE["WP_TIMER_fontopacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_OPACITY..": "..VCB_SAVE["WP_TIMER_fontopacity"])
	for i=0,1 do
		getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetAlpha(VCB_SAVE["WP_TIMER_fontopacity"])
	end
end

function VCB_BF_WP_FRAME_CHANGE_PAGE()
	if VCB_BF_WP_FRAME:IsVisible() then
		VCB_OPTIONS_HIDE_ALL()
		VCB_OPTIONS_SHOW("VCB_BF_WP_FRAME2", "Weapon Frame -2-")
	else
		VCB_OPTIONS_HIDE_ALL()
		VCB_OPTIONS_SHOW("VCB_BF_WP_FRAME", "Weapon Frame -1-")
	end
end

function VCB_BF_WP_FRAME_BorderOpacitySliderChange(obj)
	VCB_SAVE["WP_BORDER_borderopacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_BACKGROUND_OPACITY..": "..VCB_SAVE["WP_BORDER_borderopacity"])
	for i=0,1 do
		getglobal("VCB_BF_WEAPON_BUTTON"..i.."Border"):SetAlpha(VCB_SAVE["WP_BORDER_borderopacity"])
	end
end

function VCB_BF_WP_FRAME_FontOpacitySliderChange(obj)
	VCB_SAVE["WP_GENERAL_fontopacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_OPACITY..": "..VCB_SAVE["WP_GENERAL_fontopacity"])
	for i=0,1 do
		getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetAlpha(VCB_SAVE["WP_GENERAL_fontopacity"])
	end
end

function VCB_BF_WP_FRAME_AuraPaddingVSliderChange(obj)
	VCB_SAVE["WP_GENERAL_padding_v"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_PADDING_V..": "..VCB_SAVE["WP_GENERAL_padding_v"])
	if VCB_SAVE["WP_GENERAL_verticalmode"] and (not VCB_SAVE["WP_GENERAL_attach"]) then
		for i=0,1 do
			getglobal("VCB_BF_WEAPON_BUTTON"..i):ClearAllPoints()
			getglobal("VCB_BF_WEAPON_BUTTON"..i):SetPoint("TOPRIGHT", 0, -(44+VCB_SAVE["WP_GENERAL_padding_v"])*i)
		end
	end
end

function VCB_BF_WP_FRAME_ENABLE_FONT_BORDER()
	if VCB_SAVE["WP_GENERAL_enableborder"] then
		VCB_SAVE["WP_GENERAL_enableborder"] = false
		for i=0,1 do
			if VCB_SAVE["WP_GENERAL_usecfont"] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_customfont"], VCB_SAVE["WP_GENERAL_fontsize"])
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_font"], VCB_SAVE["WP_GENERAL_fontsize"])
			end
		end
	else
		VCB_SAVE["WP_GENERAL_enableborder"] = true
		for i=0,1 do
			if VCB_SAVE["WP_GENERAL_usecfont"] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_customfont"], VCB_SAVE["WP_GENERAL_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_font"], VCB_SAVE["WP_GENERAL_fontsize"], "OUTLINE")
			end
		end
	end
end

function VCB_BF_WP_FRAME_OffsetXSliderChange(obj)
	VCB_SAVE["WP_GENERAL_offset_x"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_OFFSET_X..": "..VCB_SAVE["WP_GENERAL_offset_x"])
	for i=0,1 do
		getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetPoint("BOTTOMRIGHT", VCB_SAVE["WP_GENERAL_offset_x"], VCB_SAVE["WP_GENERAL_offset_y"])
	end
end

function VCB_BF_WP_FRAME_OffsetYSliderChange(obj)
	VCB_SAVE["WP_GENERAL_offset_y"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_OFFSET_Y..": "..VCB_SAVE["WP_GENERAL_offset_y"])
	for i=0,1 do
		getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetPoint("BOTTOMRIGHT", VCB_SAVE["WP_GENERAL_offset_x"], VCB_SAVE["WP_GENERAL_offset_y"])
	end
end

function VCB_BF_WP_FRAME_CHECKBUTTON_CUSTOMFONT_CLICK()
	if VCB_SAVE["WP_GENERAL_usecfont"] then
		VCB_SAVE["WP_GENERAL_usecfont"] = false
		for i=0, 1 do
			if VCB_SAVE["WP_GENERAL_enableborder"] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_font"], VCB_SAVE["WP_GENERAL_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_font"], VCB_SAVE["WP_GENERAL_fontsize"])
			end
		end
	else
		VCB_SAVE["WP_GENERAL_usecfont"] = true
		for i=0, 1 do
			if VCB_SAVE["WP_GENERAL_enableborder"] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_customfont"], VCB_SAVE["WP_GENERAL_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_customfont"], VCB_SAVE["WP_GENERAL_fontsize"])
			end
		end
	end
end

function VCB_BF_WP_FRAME_EDITBOX_CUSTOMFONT_CHANGE(obj)
	VCB_SAVE["WP_GENERAL_customfont"] = obj:GetText()
	if VCB_SAVE["WP_GENERAL_usecfont"] then
		for i=0, 1 do
			if VCB_SAVE["WP_GENERAL_enableborder"] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_customfont"], VCB_SAVE["WP_GENERAL_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_customfont"], VCB_SAVE["WP_GENERAL_fontsize"])
			end
		end
	end
end

---------------------------------------END WP FRAME-----------------------------------------------------------------------------------------------------------------
---------------------------------------START MISC FRAME-----------------------------------------------------------------------------------------------------------------

function VCB_BF_MISC_FRAME_DISABLE_CF()
	if VCB_SAVE["MISC_disable_CF"] then
		VCB_SAVE["MISC_disable_CF"] = false
		VCB_BF_CONSOLIDATED_ICON:Show()
		VCB_BF_CONSOLIDATED_BUFFFRAME:Show()
		VCB_BF_CONSOLIDATED_BUFFFRAME:Hide()
		for i=0, 6 do
			getglobal("VCB_BF_BUFF_BUTTON"..i):SetParent(VCB_BF_CONSOLIDATED_BUFFFRAME)
		end
	else
		VCB_SAVE["MISC_disable_CF"] = true
		VCB_BF_CONSOLIDATED_ICON:Hide()
		for i=0, 6 do
			getglobal("VCB_BF_BUFF_BUTTON"..i):SetParent(VCB_BF_BUFF_FRAME)
			getglobal("VCB_BF_BUFF_BUTTON"..i):Show()
		end
	end
	VCB_BF_RepositioningAndResizing()
end

function VCB_BF_MISC_FRAME_ThemeSliderChange(obj)
	getglobal(obj:GetName().."Text"):SetText(VCB_MISC_FRAME_TEXT_THEME..": "..VCB_THEME_NAME[obj:GetValue()])
end

function VCB_BF_MISC_FRAME_LOAD()
	local value = getglobal("VCB_BF_MISC_FRAME_ThemeSlider"):GetValue()
	for cat, val in pairs(VCB_SAVE) do
		VCB_SAVE[cat] = VCB_THEME[value][cat]
	end
	VCB_INITIALIZE()
	VCB_BF_RepositioningAndResizing()
	VCB_PAGEINIT("VCB_BF_MISC_FRAME")
	VCB_SendMessage(VCB_MISC_FRAME_TEXT_THEME..": "..VCB_THEME_NAME[value]..VCB_HAS_BEEN_LOADED)
end

---------------------------------------END MISC FRAME-----------------------------------------------------------------------------------------------------------------
---------------------------------------START PROFILE MANAGER FRAME-----------------------------------------------------------------------------------------------------------------

function VCB_BF_PM_FRAME_RIGHT_SCROLLFRAME_Update()
	local line -- 1 through 5 of our window to scroll
	local lineplusoffset -- an index into our data calculated from the scroll offset
	local FRAME = getglobal("VCB_BF_PM_FRAME_RIGHT_SCROLLFRAME")
	FauxScrollFrame_Update(FRAME,VCB_tablelength(VCB_Profile_Name),10,40)
	for line=1,10 do
		lineplusoffset = line + FauxScrollFrame_GetOffset(FRAME)
		if VCB_Profile_Name[lineplusoffset] ~= nil then
			getglobal("VCB_PM_ENTRY"..line.."_Text"):SetText(lineplusoffset..". "..VCB_Profile_Name[lineplusoffset])
			getglobal("VCB_PM_ENTRY"..line).name = VCB_Profile_Name[lineplusoffset]
			getglobal("VCB_PM_ENTRY"..line):Show()
		else
			getglobal("VCB_PM_ENTRY"..line):Hide()
		end
	end
end

function VCB_PM_SCROLLFRAME_ENTRY(button)
	getglobal("VCB_BF_PM_FRAME_LEFT_SELECTED_INBOX_TEXT"):SetText(button.name)
end

function VCB_BF_PM_FRAME_SAVE()
	local name = getglobal("VCB_BF_PM_FRAME_EditBox"):GetText()
	local temp = {}
	if (name) then
		for cat, val in pairs(VCB_SAVE) do
			temp[cat] = VCB_SAVE[cat]
		end
		table.insert(VCB_Profile_Name, name)
		table.insert(VCB_Profile, temp)
		getglobal("VCB_BF_PM_FRAME_LEFT_CURRENT_INBOX_TEXT"):SetText(name)
		VCB_CUR_PROFILE = name
		VCB_SendMessage(VCB_TEXT_PROFILE..name..VCB_HAS_BEEN_SAVED)
	end
	VCB_BF_PM_FRAME_RIGHT_SCROLLFRAME_Update()
end

function VCB_BF_PM_FRAME_LOAD()
	local name = getglobal("VCB_BF_PM_FRAME_LEFT_SELECTED_INBOX_TEXT"):GetText()
	if (name) then
		local key = VCB_Table_GetKeys(VCB_Profile_Name, name)
		if (key) then
			for cat, val in pairs(VCB_SAVE) do
				VCB_SAVE[cat] = VCB_Profile[key][cat]
			end
			VCB_INITIALIZE()
			VCB_BF_RepositioningAndResizing()
			getglobal("VCB_BF_PM_FRAME_LEFT_CURRENT_INBOX_TEXT"):SetText(name)
			VCB_CUR_PROFILE = name
			VCB_SendMessage(VCB_TEXT_PROFILE..name..VCB_HAS_BEEN_LOADED)
		end
	end
end

function VCB_BF_PM_FRAME_DELETE()
	local name = getglobal("VCB_BF_PM_FRAME_LEFT_SELECTED_INBOX_TEXT"):GetText()
	if (name) then
		local key = VCB_Table_GetKeys(VCB_Profile_Name, name)
		if (key) then
			table.remove(VCB_Profile_Name, key)
			table.remove(VCB_Profile, key)
			VCB_SendMessage(VCB_TEXT_PROFILE..name..VCB_HAS_BEEN_REMOVED)
		end
	end
	VCB_BF_PM_FRAME_RIGHT_SCROLLFRAME_Update()
end

---------------------------------------END PROFILE MANAGER FRAME-----------------------------------------------------------------------------------------------------------------