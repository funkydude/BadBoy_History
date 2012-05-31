
local bbhistory = CreateFrame("Frame", "BadBoyHistory", InterfaceOptionsFramePanelContainer)
bbhistory:Hide()
bbhistory.name = "BadBoy_History"

--[[     Start BadBoy Frame     ]]--
local title = bbhistory:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
title:SetPoint("TOPLEFT", 16, -16)
title:SetText("BadBoy_History @project-version@") --wowace magic, replaced with tag version
InterfaceOptions_AddCategory(bbhistory)

local bbhistoryScrollArea = CreateFrame("ScrollFrame", "BadBoyHistoryScroll", bbhistory, "UIPanelScrollFrameTemplate")
bbhistoryScrollArea:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -15)
bbhistoryScrollArea:SetPoint("BOTTOMRIGHT", bbhistory, "BOTTOMRIGHT", -30, 10)

local bbhistoryEditBox = CreateFrame("EditBox", "BadBoyHistoryEditBox", bbhistory)
bbhistoryEditBox:SetMultiLine(true)
bbhistoryEditBox:SetMaxLetters(99999)
bbhistoryEditBox:EnableMouse(false)
bbhistoryEditBox:SetAutoFocus(false)
bbhistoryEditBox:SetFontObject(ChatFontNormal)
bbhistoryEditBox:SetWidth(575)
bbhistoryEditBox:SetHeight(500)
bbhistoryEditBox:Show()

bbhistoryScrollArea:SetScrollChild(bbhistoryEditBox)

local bbhistoryBackdrop = CreateFrame("Frame", "BadBoyHistoryBackdrop", bbhistory)
bbhistoryBackdrop:SetBackdrop({bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
	edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
	tile = true, tileSize = 16, edgeSize = 16,
	insets = {left = 3, right = 3, top = 5, bottom = 3}}
)
bbhistoryBackdrop:SetBackdropColor(0,0,0,1)
bbhistoryBackdrop:SetPoint("TOPLEFT", title, "BOTTOMLEFT", -5, 0)
bbhistoryBackdrop:SetPoint("BOTTOMRIGHT", bbhistory, "BOTTOMRIGHT", -27, 5)

local bbhistoryButton = CreateFrame("Button", "BadBoyHistoryButton", bbhistory, "UIPanelButtonTemplate")
bbhistoryButton:SetWidth(60)
bbhistoryButton:SetHeight(25)
bbhistoryButton:SetPoint("TOPRIGHT", bbhistory, "TOPRIGHT", -35, -7)
bbhistoryButton:SetText(RESET)
bbhistoryButton:SetScript("OnClick", function(frame)
	wipe(BBHISTORY)
	bbhistoryEditBox:SetText("")
end)

bbhistory:SetScript("OnShow", function()
	local text
	for i=1, #BBHISTORY do
		if not text then
			text = BBHISTORY[i]
		else
			text = text.."\n\n"..BBHISTORY[i]
		end
	end
	bbhistoryEditBox:SetText(text or "")
end)
--[[     End BadBoy Frame     ]]--

bbhistory:RegisterEvent("PLAYER_LOGIN")
bbhistory:SetScript("OnEvent", function()
	if type(BBHISTORY) ~= "table" then
		BBHISTORY = {}
	end

	BadBoyLogger = function(addon, event, player, msg)
		event = (event):sub(10)
		if addon == "BadBoy" then
			local dump = "["..BetterDate("%I:%M:%S", time()).."]".."["..event.."]".."["..player.."]: "..msg
			tinsert(BBHISTORY, dump)
			bbhistoryEditBox:SetText(bbhistoryEditBox:GetText().. "\n\n"..dump)
		elseif addon == "Guilded" then
			--print("|cFF33FF99BadBoy_GUILDED|r:", msg, event)
		end
	end
end)

