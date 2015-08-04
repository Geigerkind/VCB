-- Title: Vanilla Consolidate Buffs (VCB)
-- Author: Shino <Synced> - Kronos

-- Some predefined variables
VCB = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceDB-2.0", "AceConsole-2.0", "AceDebug-2.0")
VCB_NAME = "Vanilla Consolidate Buffs"
VCB_VERSION = "2.4"
VCB_LOADED = 0 -- default false

-- Global variables

--[[
-- VCB:OnLoad()
-- @returns: Void
-- Use: Initialization and registering events
--]]
function VCB:OnLoad()
	VCB:RegisterEvent("PLAYER_ENTERING_WORLD")
	
	SLASH_VCB1 = "/VanillaConsolidateBuffs"
	SLASH_VCB2 = "/vanillaconsolidatebuffs"
	SLASH_VCB3 = "/VCB"
	SLASH_VCB4 = "/vcb"
	SlashCmdList["VCB"] = function(msg)
		VCB:SlashCommandHandler(msg)
	end
end

--[[
-- VCB:PLAYER_ENTERING_WORLD()
-- @returns: Args
-- Use: Returns if the ADDON has been loaded.
--]]
function VCB:PLAYER_ENTERING_WORLD()
	if VCB_LOADED == false then
		DEFAULT_CHAT_FRAME:AddMessage("VCB "..VCB_VERSION.." is now loaded! Use the command /vcb to configure VCB!")
		VCB_LOADED = true
	end
end

--[[
-- VCB:SlashCommandHandler(string)
-- @returns: Message-Output
-- Use: Handles the incoming commands for VBS and sorts the data to the functions
--]]
function VCB:SlashCommandHandler(msg)
	if(msg) then
		local cmd = string.lower(msg)
		if cmd == "lock" and IsAddOnLoaded("VCB_Buffframe") then
			VCB_BF:Lock()
		elseif cmd == "pcb" and IsAddOnLoaded("VCB_Buffframe") then
			VCB_BF:PostConsolidatedBuffs()
		elseif string.sub(cmd, 1, 3) == "cba" and IsAddOnLoaded("VCB_Buffframe") then
			if string.len(cmd) > 4 then
				local add = string.sub(cmd, 5, string.len(cmd))
				VCB_BF:ConsolidatedAdd(add)
			end
		elseif string.sub(cmd, 1, 3) == "cbr" and IsAddOnLoaded("VCB_Buffframe") then
			if string.len(cmd) > 4 then
				local remove = string.sub(cmd, 5, string.len(cmd))
				VCB_BF:ConsolidatedRemove(remove)
			end
		elseif cmd == "ra" and IsAddOnLoaded("VCB_Buffframe") then
			VCB_BF:RemoveAll()
		elseif string.sub(cmd, 1, 5) == "scale" and IsAddOnLoaded("VCB_Buffframe") then
			if string.len(cmd) > 6 then
				local scale = string.sub(cmd, 7, string.len(cmd))
				VCB_BF:Scale(tonumber(scale))
			end
		elseif cmd == "pbb" and IsAddOnLoaded("VCB_AutoUnbuffer") then
			VCB_AU:PostBannedBuffs()
		elseif string.sub(cmd, 1, 3) == "atb" and IsAddOnLoaded("VCB_AutoUnbuffer") then
			if string.len(cmd) > 4 then
				local atb = string.sub(cmd, 5, string.len(cmd))
				VCB_AU:AddToBanned(atb)
			end
		elseif string.sub(cmd, 1, 3) == "rfb" and IsAddOnLoaded("VCB_AutoUnbuffer") then
			if string.len(cmd) > 4 then
				local rfb = string.sub(cmd, 5, string.len(cmd))
				VCB_AU:RemoveFromBanned(rfb)
			end
		elseif string.sub(cmd, 1, 6) == "unbuff" and IsAddOnLoaded("VCB_AutoUnbuffer") then
			if string.len(cmd) > 7 then
				local unbuff = string.sub(cmd, 8, string.len(cmd))
				VCB_AU:Unbuff(unbuff)
			end
		else
			DEFAULT_CHAT_FRAME:AddMessage("This addon provides the following commands:")
			DEFAULT_CHAT_FRAME:AddMessage("/VCB.*")
			if IsAddOnLoaded("VCB_Buffframe") then
				DEFAULT_CHAT_FRAME:AddMessage(" - lock - Toggles frame lock. If enabled, frame can be moved")
				DEFAULT_CHAT_FRAME:AddMessage(" - pcb - Outputs a list of all consolidated buffs")
				DEFAULT_CHAT_FRAME:AddMessage(" - cba <auraname> - Adds another aura to the list")
				DEFAULT_CHAT_FRAME:AddMessage(" - cbr <auraname> - Deletes an aura from the list")
				DEFAULT_CHAT_FRAME:AddMessage(" - ra - Removes all auras from the list")
				DEFAULT_CHAT_FRAME:AddMessage(" - scale - Scales the module between 0.5 and 3")
			end
			if IsAddOnLoaded("VCB_AutoUnbuffer") then
				DEFAULT_CHAT_FRAME:AddMessage(" - pbb - Outputs a list of all banned buffs")
				DEFAULT_CHAT_FRAME:AddMessage(" - atb <auraname> - Adds an aura to the Banned-List")
				DEFAULT_CHAT_FRAME:AddMessage(" - rfb <auraname> - Removes an aura from the Banned-List")
				DEFAULT_CHAT_FRAME:AddMessage(" - unbuff <auraname> - Cancels this aura once")
			end
		end
	end
end

--[[
-- VCB:tablelength(table/array)
-- @return: int
-- Use: Evaluates the length of a table/array for utility use. F. e. for loops.
--]]
function VCB:tablelength(T)
	local count = 0
	for _ in pairs(T) do 
		count = count + 1 
	end 
	return count
end

--[[
-- VCB:Contains(table/array, obj)
-- @return: Boolean
-- Use: Evaluates if a table or an array contains a specific value/object for utility use.
--]]
function VCB:Contains(table, element)
	for _, value in pairs(table) do
		if value == element then
			return true
		end
	end
	return false
end

--[[
-- VCB:GetKeys(table/array, obj)
-- @return: int
-- Use: Returns the key of a specific value/object in an table/array for utility use.
--]]
function VCB:GetKeys(a, b)
	local i = 0
	while true do
		if a[i] == b then
			return i
		end
	end
end

--[[
-- VCB:GetKeys(table/array, obj)
-- @return: int
-- Use: Returns the key of a specific value/object in an table/array for utility use.
-- Not sure if I will some up those two functions to improve the performance :/
--]]
function VCB:Table_GetKeys(a, b)
	local i = 1
	while true do
		if a[i] == b then
			return i
		end
		i = i + 1
	end
end

function VCB:EmptyTable(t)
	for k in pairs (t) do
		t [k] = nil
	end
end

--[[
-- VCB:PlayerHasBuff(string)
-- @return: Boolean
-- Use: Checks if the player has a buff or not
-- However this function is not being used.
function VCB:PlayerHasBuff(name)
	if UnitBuff("player", 1) then
		local i = 1
		while true do
			GameTooltip:SetOwner(UIParent, "ANCHOR_NONE")
			GameTooltip:SetUnitBuff("player", i)
			local buff = GameTooltipTextLeft1:GetText()
			GameTooltip:Hide()
			i = i + 1
			if strlower(name) == strlower(buff) then
				return true
			end
			if UnitBuff("player", i) == nil then
				return false
			end
		end
	else
		return false
	end
end
--]]

VCB.OnLoad()