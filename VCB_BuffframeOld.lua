-- Title: Vanilla Consolidate Buffs (VCB) - Buff Frame
-- Author: Shino <Synced> - KronosT

-- Global variables
VCB_BF = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceDB-2.0", "AceConsole-2.0", "AceDebug-2.0")
f = nil
fb = nil
mf = nil
mfd = nil
fb_STATUS = 0
lock = true
VCB_LOADED = false
UPDATE_INTERVAL = 0.2
TimeSinceLastUpdate = 0
CAT = {}

--[[
-- VCB_BF:Buff_Frame_OnLoad
-- @return: Void
-- Use: Loads all events and initializes the whole frame
--]]
function VCB_BF:Buff_Frame_OnLoad()
	VCB_BF:RegisterEvent("ADDON_LOADED")
	
	VCB_BF:RegisterEvent("PLAYER_ENTERING_WORLD")
	VCB_BF:RegisterEvent("PLAYER_AURAS_CHANGED")
	
	VCB_BF:RegisterEvent("UNIT_INVENTORY_CHANGED")
end

--[[
-- VCB_BF:PLAYER_ENTERING_WORLD
-- @return: Void
-- Use: On PLAYER_ENTERING_WORLD event all auras are updated
--]]
function VCB_BF:PLAYER_ENTERING_WORLD()
	VCB_BF:Update()
end

--[[
-- VCB_BF:UNIT_INVENTORY_CHANGED
-- @return: Void
-- Use: On UNIT_INVENTORY_CHANGED event all auras are updated
--]]
function VCB_BF:UNIT_INVENTORY_CHANGED()
	VCB_BF:Update()
end

--[[
-- VCB_BF:PLAYER_AURAS_CHANGED
-- @return: Void
-- Use: On PLAYER_AURAS_CHANGED event all auras are updated
--]]
function VCB_BF:PLAYER_AURAS_CHANGED()
	VCB_BF:Update()
end

--[[
-- VCB_BF:ADDON_LOADED
-- @return: Void
-- Use: On ADDON_LOADED event the saved variables are initialized
--]]
function VCB_BF:ADDON_LOADED()
	if Consolidated_Buffs == nil then
		Consolidated_Buffs = {}
	end
	if PosX == nil then
		PosX = 0
	end
	if PosY == nil then
		PosY = 0
	end
	if PointMF == nil then
		PointMF = "CENTER"
	end
	if Scale == nil then
		Scale = 1
	end
	if VCB_LOADED == false then
		VCB_BF:CreateMainFrame()
		
		VCB_BF:CreateFrame()
		VCB_BF:CreateBuffFrame()
		VCB_BF:CreateMainDebuffFrame()
		VCB_BF:BuffFrame_Hide()
		
		VCB_BF:DisableBlizzardBuffs()
		
		VCB_BF:CreateAuraFrame()
		
		mf:SetPoint(PointMF,PosX,PosY)
		VCB_BF:Scale_Frames()
	
		VCB_LOADED = true
	end
end

--[[
-- VCB_BF:Update
-- @return: Void
-- Use: Function to run all required functions to update the frame properly
--]]
function VCB_BF:Update()
	local i = 0
	local ci = 1
	local mci = 1
	local hasMainHandEnchant, mainHandExpiration, mainHandCharges, hasOffHandEnchant, offHandExpiration, offHandCharges = GetWeaponEnchantInfo()
	if hasMainHandEnchant then mci = mci + 1 end
	if hasOffHandEnchant then mci = mci + 1 end
	while true do
		GameTooltip:SetOwner(UIParent, "ANCHOR_NONE")
		GameTooltip:SetPlayerBuff(i)
		local name = GameTooltipTextLeft1:GetText()
		local type = GameTooltipTextRight1:GetText()
		
		local hackfix = false
		
		if not name then break end
		for e = 1, VCB_tablelength(Consolidated_Buffs) do
			if not Consolidated_Buffs[e] then break end
			if strfind(strlower(Consolidated_Buffs[e]), strlower(name)) then
				getglobal("Button"..i+1):SetParent(fb)
				VCB_BF:RepositionBuffButton(getglobal("Button"..i+1), ci, true, 6)
				ci = ci + 1
				hackfix = true
				break
			end
		end
		
		if hackfix == false then
			getglobal("Button"..i+1):SetParent(mf)
			VCB_BF:RepositionBuffButton(getglobal("Button"..i+1), mci, false, 15)
			mci = mci + 1
		end
		i = i + 1;
	end
	f.text:SetText(ci-1)
	VCB_BF:ResizeCBFrame(ci-1)
	VCB_BF:UpdateButtons()
	VCB_BF:Reposition()
end

--[[
-- VCB_BF:UpdateButtons
-- @return: Void
-- Use: Function to show all buttons again, causing the OnUpdate event to trigger and update the buttons
--]]
function VCB_BF:UpdateButtons()
	for i=1, 32 do
		if UnitBuff("player", i) then
			VCB_BF:AuraFrame_OnUpdate(0, getglobal("Button"..i), true)
		else
			getglobal("Button"..i):Hide()
		end
	end
	
	for i=1, 16 do
		if UnitDebuff("player", i) then
			VCB_BF:AuraFrame_OnUpdate(0, getglobal("DeVCBButton"..i), true)
		else
			getglobal("DeVCBButton"..i):Hide()
		end
	end
end

--[[
-- VCB_BF:Reposition
-- @return: Void
-- Use: Repositions the consolidated frame if temp. weapon enchants are applied
--]]
function VCB_BF:Reposition()
	local hasMainHandEnchant, mainHandExpiration, mainHandCharges, hasOffHandEnchant, offHandExpiration, offHandCharges = GetWeaponEnchantInfo()
	local k = 0
	if hasMainHandEnchant then k = k + 1 end
	if hasOffHandEnchant then k = k + 1 end
	f:SetPoint("TOPRIGHT",Scale*(-2-(k*34)),0)
end

--[[
-- VCB_BF:RepositionBuffButton(button, int, boolean, int)
-- @return: Void
-- Use: Repositions the buttons if they are applied, regarding their parent
--]]
function VCB_BF:RepositionBuffButton(button, i, frame, k)
	if frame == true then
		button:SetPoint("TOPRIGHT", fb, "TOPRIGHT", Scale*((-34*i)+26),Scale*(-44*floor(i/k)-8))
	else
		button:SetPoint("TOPRIGHT", mf, "TOPRIGHT", Scale*((-34*i)-2),Scale*(-44*floor(i/k)))
	end
end

--[[
-- VCB_BF:ResizeCBFrame
-- @return: Void
-- Use: Depending on buffs displayed in the consolidated frame, the frame will be resized
--]]
function VCB_BF:ResizeCBFrame(i)
	local p = i
	if p >= 6 then p = 6 end
	fb:SetWidth(Scale*(14+(p*34)))
	fb:SetHeight(Scale*(14+(ceil(i/6)*44)))
	fb:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", Scale*(-6),Scale*(-(16+(ceil(i/6)*44))))
end

--[[
-- VCB_BF:CreateFrame
-- @return: Void
-- Use: Creates the consolidated frame
--]]
function VCB_BF:CreateFrame()
	f = CreateFrame("Frame",nil,mf)
	f:SetFrameStrata("BACKGROUND")
	f:SetWidth(32)
	f:SetHeight(32)

	local t = f:CreateTexture(nil,"BACKGROUND")
	t:SetTexture("Interface\\AddOns\\VCB_Buffframe\\images\\icon.tga")
	t:SetAllPoints(f)
	f.texture = t
	
	f:SetPoint("TOPRIGHT",-2,0)
	
	f.text = f:CreateFontString(nil, nil, "GameFontNormal")
	f.text:SetPoint("bottomright", -5, 4)
	f.text:SetText(0)
	
	f:EnableMouse()
	f:SetScript('OnEnter', function() 
		VCB_BF:BuffFrame_Show()
	end)
	f:SetScript('OnLeave', function() 
		VCB_BF:BuffFrame_Hide()
	end)
	
	f:Show()
end

--[[
-- VCB_BF:CreateMainDebuffFrame
-- @return: Void
-- Use: Creates main debuff frame
--]]
function VCB_BF:CreateMainDebuffFrame()
	mfd = CreateFrame("Frame", nil, mf)
	mfd:SetFrameStrata("BACKGROUND")
	mfd:SetWidth(510)
	mfd:SetHeight(88)
	
	mfd:SetPoint("TOPLEFT",0,-88)
	
	mfd:Show()
	CAT[1] = mfd
end

--[[
-- VCB_BF:Lock
-- @return: Void
-- Use: Toggles the Drag-Mode to move the frame around
--]]
function VCB_BF:Lock()
	if lock == true then
		DEFAULT_CHAT_FRAME:AddMessage("VCB is now movable!")
		lock = false
	else
		DEFAULT_CHAT_FRAME:AddMessage("VCB is not movable anymore!")
		lock = true
	end
end

--[[
-- VCB_BF:DisableBlizzardBuffs
-- @return: Void
-- Use: Disables the blizzard buff frames
--]]
function VCB_BF:DisableBlizzardBuffs()
	BuffFrame:Hide()
	for i=0,23 do
		button = getglobal("BuffButton"..i)
		button:UnregisterEvent("PLAYER_AURAS_CHANGED")
		button:Hide()
	end
	
	TemporaryEnchantFrame:SetParent(mf)
	TemporaryEnchantFrame:SetPoint("TOPRIGHT", mf,-2, 0)
	TemporaryEnchantFrame.SetPoint = function() end
end

--[[
-- VCB_BF:CreateMainFrame
-- @return: Void
-- Use: Creates the main frame
--]]
function VCB_BF:CreateMainFrame()
	mf = CreateFrame("Frame", "MainFrame", UIParent)
	mf:SetFrameStrata("BACKGROUND")
	mf:SetWidth(510)
	mf:SetHeight(88)
	
	mf:SetPoint("CENTER",0,0)
	
	mf:SetMovable(true)
	mf:EnableMouse(true)
	mf:RegisterForDrag("LeftButton")
	mf:SetScript("OnDragStart", function()
		if lock == false then
			mf:StartMoving()
		end
	end)
	mf:SetScript("OnDragStop", function()
		if lock == false then
			mf:StopMovingOrSizing()
			local point, relativeTo, relativePoint, xOfs, yOfs = mf:GetPoint()
			PointMF = point
			PosX = xOfs
			PosY = yOfs
		end
	end)
	
	mf:Show()
	CAT[2] = mf
end

--[[
-- VCB_BF:CreateBuffFrame
-- @return: Void
-- Use: Creates the frame to display all consolidated buffs
--]]
function VCB_BF:CreateBuffFrame()
	fb = CreateFrame("Frame","CBuffFrame",f)
	fb:SetWidth(48)
	fb:SetHeight(58)
	
	fb:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
					edgeFile = "Interface/Tooltips/UI-Tooltip-Border", 
					tile = true, tileSize = 16, edgeSize = 16, 
					insets = { left = 4, right = 4, top = 4, bottom = 4 }})
	fb:SetBackdropColor(0,0,0,1)
	
	fb:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", -6,-45)
	
	fb:EnableMouse()
	fb:SetScript('OnEnter', function() 
		VCB_BF:BuffFrame_Show()
	end)
	fb:SetScript('OnLeave', function() 
		VCB_BF:BuffFrame_Hide()
	end)
end

function VCB_BF:BuffFrame_Hide()
	for _, child in ipairs({ fb:GetChildren() }) do
		if child == nil then break end
		child:Hide()
	end
	fb:Hide()
end

function VCB_BF:BuffFrame_Show()
	fb:Show()
	for _, child in ipairs({ fb:GetChildren() }) do
		if child == nil or ( not UnitBuff("player", child:GetID())) then break end
		child:Show()
	end
end

--[[
-- VCB_BF:CreateAuraFrame
-- @return: Void
-- Use: Creates an aura frame for buffs and debuffs
--]]
function VCB_BF:CreateAuraFrame()
	for p=1,2 do
		for i=1, p*16 do
			local button = nil
			if p == 2 then
				button = CreateFrame("Button","Button"..i,CAT[p])
			else
				button = CreateFrame("Button","DeVCBButton"..i,CAT[p])
				button:SetPoint("TOPRIGHT",Scale*((-34*i)+32),Scale*(-44*floor(i/15)))
			end
			
			button:SetID(i)
			
			button:SetWidth(32)
			button:SetHeight(32)
			
			button:EnableMouse()
			button:RegisterForClicks("RightButtonUp")
			
			button.text = button:CreateFontString(nil, nil, "GameFontNormalSmall")
			button.text:SetPoint("CENTER",0,-20)
			
			button.text2 = button:CreateFontString(nil, nil, "GameFontNormalSmall")
			button.text2:SetPoint("BOTTOMRIGHT",-5,5)

			button:SetScript("OnEnter", function()
				GameTooltip:SetOwner(this, "ANCHOR_BOTTOMLEFT")
				if VCB_BF:IsButton(button) then
					GameTooltip:SetPlayerBuff(GetPlayerBuff(button:GetID()-1, "HELPFUL"))
				else
					GameTooltip:SetPlayerBuff(GetPlayerBuff(button:GetID()-1, "HARMFUL"))
				end
				GameTooltip:Show()
				if button:GetParent() == fb then VCB_BF:BuffFrame_Show() end
			end)
			
			button:SetScript("OnLeave", function()
				GameTooltip:Hide()
			end)
			
			button:SetScript("OnClick", function()
				if VCB_BF:IsButton(button) then CancelPlayerBuff(button:GetID()-1) end
			end)
			
			button:SetScript("OnUpdate", function()
				VCB_BF:AuraFrame_OnUpdate(arg1, button, false)
			end)
		end
	end
end

function VCB_BF:IsButton(button)
	if not strfind(strlower(button:GetName()), strlower("DeVCBButton")) then
		return true
	else
		return false
	end
end

function VCB_BF:AuraFrame_OnUpdate(elapsed, button, ignore)
	TimeSinceLastUpdate = TimeSinceLastUpdate + elapsed
	if (TimeSinceLastUpdate > UPDATE_INTERVAL) or (ignore == true) then
		local buffIndex = nil
		local untilCancelled = nil
		if VCB_BF:IsButton(button) then
			buffIndex, untilCancelled = GetPlayerBuff(button:GetID()-1, "HELPFUL")
		else
			buffIndex, untilCancelled = GetPlayerBuff(button:GetID()-1, "HARMFUL")
		end
		button.buffIndex = buffIndex
		button.untilCancelled = untilCancelled
		local timeLeft = GetPlayerBuffTimeLeft(buffIndex)
		if untilCancelled == 0 and timeLeft > 0 then
			if timeLeft > 60 then
				button.text:SetText((floor(timeLeft/60)).."m")
			else
				button.text:SetText((floor(timeLeft)).."s")
			end
		else
			button.text:SetText("")
		end
		
		button:SetBackdrop({bgFile = GetPlayerBuffTexture(buffIndex), edgeFile = "Interface/Tooltips/UI-Tooltip-Border", tile=false, tileSize=36, edgeSize=16, insets = { left = 3, right = 3, top = 3, bottom = 3 }})
		if not VCB_BF:IsButton(button) then
			local type = GetPlayerBuffDispelType(buffIndex)
			if type == "Poison" then
				button:SetBackdropBorderColor(0,153,0,1)
			elseif type == "Magic" then
				button:SetBackdropBorderColor(51,153,255,1)
			elseif type == "Curse" then
				button:SetBackdropBorderColor(153,0,255,1)
			elseif type == "Disease" then
				button:SetBackdropBorderColor(153,102,0,1)
			else
				button:SetBackdropBorderColor(204,0,0,1)
			end
		else
			button:SetBackdropBorderColor(51,153,255,1)
		end
		
		local count = GetPlayerBuffApplications(buffIndex);
		if count > 1 then
			button.text2:SetText(count)
		else
			button.text2:SetText()
		end
		
		if buffIndex < 0 then
			button:Hide()
		else
			button:Show()
		end
		
		if GameTooltip:IsOwned(button) then
			if VCB_BF:IsButton(button) then
				GameTooltip:SetPlayerBuff(GetPlayerBuff(button:GetID()-1, "HELPFUL"))
			else
				GameTooltip:SetPlayerBuff(GetPlayerBuff(button:GetID()-1, "HARMFUL"))
			end
		end
		
		TimeSinceLastUpdate = 0
	end
end

--[[
-- VCB_BF:ConsolidatedAdd
-- @return: Void
-- Use: Adds an aura to the consolidated list
--]]
function VCB_BF:ConsolidatedAdd(name)
	if not VCB_Contains(Consolidated_Buffs, name) then
		table.insert(Consolidated_Buffs, name)
		VCB_BF:Update()
		DEFAULT_CHAT_FRAME:AddMessage(name.." has been added!")
	else
		DEFAULT_CHAT_FRAME:AddMessage(name.." is already in the list!")
	end
end

--[[
-- VCB_BF:ConsolidatedRemove
-- @return: Void
-- Use: Removes an aura from the consolidated list
--]]
function VCB_BF:ConsolidatedRemove(name)
	if VCB_Contains(Consolidated_Buffs, name) then
		table.remove(Consolidated_Buffs, VCB_Table_GetKeys(Consolidated_Buffs, name))
		VCB_BF:Update()
		DEFAULT_CHAT_FRAME:AddMessage(name.." has been removed!")
	else
		DEFAULT_CHAT_FRAME:AddMessage(name.." is not in the list!")
	end
end

--[[
-- VCB_BF:PostConsolidatedBuffs
-- @return: Void
-- Use: Posts all auras from the consolidated list
--]]
function VCB_BF:PostConsolidatedBuffs()
	if VCB_tablelength(Consolidated_Buffs) == 0 then
		DEFAULT_CHAT_FRAME:AddMessage("The Consolidated Buffs list is empty!")
	else
		DEFAULT_CHAT_FRAME:AddMessage("The Consolidated Buffs list contains the following Buffs:")
		for i = 1, VCB_tablelength(Consolidated_Buffs) do
			DEFAULT_CHAT_FRAME:AddMessage(i..". "..Consolidated_Buffs[i])
		end
	end
end

--[[
-- VCB_BF:RemoveAll
-- @return: Void
-- Use: Clears the whole consolidated aura list
--]]
function VCB_BF:RemoveAll()
	Consolidated_Buffs = {}
	DEFAULT_CHAT_FRAME:AddMessage("The Consolidated Buffs list was emptied!")
end

--[[
-- VCB_BF:Scale(int)
-- @return: Void
-- Use: Scales the module
--]]
function VCB_BF:Scale(num)
	if num < 0.5 then
		Scale = 0.5
		DEFAULT_CHAT_FRAME:AddMessage("Scale has been set to 0.5!")
	elseif num > 3 then
		Scale = 3
		DEFAULT_CHAT_FRAME:AddMessage("Scale has been set to 3!")
	else
		Scale = num
		DEFAULT_CHAT_FRAME:AddMessage("Scale has been set to "..num.."!")
	end
	
	-- Actual scaling
	VCB_BF:Scale_Frames()
	VCB_BF:Update()
end

--[[
-- VCB_BF:Scale_Frames
-- @return: Void
-- Use: Scales all frames
--]]
function VCB_BF:Scale_Frames()
	-- Consolidated Frame
	f:SetWidth(Scale*32)
	f:SetHeight(Scale*32)
	f.text:SetPoint("bottomright", Scale*(-5), Scale*4)
	f.text:SetTextHeight(Scale*12)
	
	-- Consolidated Buff Frame
	fb:SetWidth(Scale*48)
	fb:SetHeight(Scale*58)
	fb:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", Scale*(-6),Scale*(-56))
	
	-- Main Frame
	mf:SetWidth(Scale*510)
	mf:SetHeight(Scale*88)
	
	-- Main Debuff Frame
	mfd:SetWidth(Scale*510)
	mfd:SetHeight(Scale*88)
	mfd:SetPoint("TOPLEFT",0,Scale*(-88))
	
	-- Buffs
	for i=1, 32 do
		button = getglobal("Button"..i)
		button:SetWidth(Scale*32)
		button:SetHeight(Scale*32)
	end
	
	-- Debuffs
	for i=1, 16 do
		button = getglobal("DeVCBButton"..i)
		button:SetWidth(Scale*32)
		button:SetHeight(Scale*32)
	end
	
	-- TemporaryEnchantFrame
	--TempEnchant1:SetWidth(Scale*32)
	--TempEnchant2:SetHeight(Scale*32)
end

VCB_BF.Buff_Frame_OnLoad()