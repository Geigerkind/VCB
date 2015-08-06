-- Title: Vanilla Consolidate Buffs (VCB)
-- Author: Shino <Synced> - Kronos

-- Global variables
VCB_NAME = "Vanilla Consolidate Buffs"
VCB_VERSION = "2.4"

--[[
-- VCB_OnLoad()
-- @returns: Void
-- Use: Initialization and registering events
--]]
function VCB_OnLoad()
	SLASH_VCB1 = "/VanillaConsolidateBuffs"
	SLASH_VCB2 = "/vanillaconsolidatebuffs"
	SLASH_VCB3 = "/VCB"
	SLASH_VCB4 = "/vcb"
	SlashCmdList["VCB"] = function(msg)
		VCB_SlashCommandHandler(msg)
	end
	
	DEFAULT_CHAT_FRAME:AddMessage("VCB "..VCB_VERSION.." is now loaded! Use the command /vcb to configure VCB!")
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
			VCB_OPTIONS_OnShow()
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

---------------------------------------OPTION FRAME BEGIN-----------------------------------------------------------------------------------------------------------------

function VCB_OPTIONS_OnShow()
	if getglobal("VCB_BF_CONSOLIDATED_FRAME"):IsVisible() then
		VCB_BF_CONSOLIDATED_FRAME_RIGHT_SCROLLFRAME_Update()
	elseif getglobal("VCB_BF_BANNED_FRAME"):IsVisible() then
		VCB_BF_BANNED_FRAME_RIGHT_SCROLLFRAME_Update()
	end
	getglobal("VCB_BF_ConfigFrame"):Show()
end

function VCB_OPTIONS_HIDE_ALL()
	getglobal("VCB_BF_CONSOLIDATED_FRAME"):Hide()
	getglobal("VCB_BF_BANNED_FRAME"):Hide()
	getglobal("VCB_BF_TIMER_FRAME"):Hide()
	getglobal("VCB_BF_DBF_COLOR_FRAME"):Hide()
	getglobal("VCB_BF_CF_COLOR_FRAME"):Hide()
	getglobal("VCB_BF_BF_COLOR_FRAME"):Hide()
	getglobal("VCB_BF_CF_FRAME"):Hide()
	getglobal("VCB_BF_BF_FRAME"):Hide()
	getglobal("VCB_BF_DBF_FRAME"):Hide()
	getglobal("VCB_BF_ABOUT_FRAME"):Hide()
end

function VCB_OPTIONS_SHOW(frame, text)
	getglobal(frame):Show()
	getglobal("VCB_BF_CONFIG_FRAME_TITLE_FONTSTRING"):SetText(text)
	PlaySound("igMainMenuOptionCheckBoxOff")
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
	VCB_BF_RemoveAll()
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
	VCB_AU:RemoveFromBanned(getglobal("VCB_BF_BANNED_FRAME_LEFT_DELETE_INBOX_TEXT"):GetText())
	VCB_BF_BANNED_FRAME_RIGHT_SCROLLFRAME_Update()
end

function VCB_BANNED_BUFFS_ADD()
	VCB_AU:AddToBanned(getglobal("VCB_BF_BANNED_FRAME_EditBox"):GetText())
	VCB_BF_BANNED_FRAME_RIGHT_SCROLLFRAME_Update()
end

function VCB_BANNED_BUFFS_REMOVE_ALL()
	VCB_AU:RemoveAll()
	VCB_BF_BANNED_FRAME_RIGHT_SCROLLFRAME_Update()
end

---------------------------------------END BANNED BUFFS FRAME-----------------------------------------------------------------------------------------------------------------