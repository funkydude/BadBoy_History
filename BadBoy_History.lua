
--[[     Start BadBoy Frame     ]]--
local bbhistory = CreateFrame("Frame", "BadBoyHistory", InterfaceOptionsFramePanelContainer)
bbhistory:Hide()
bbhistory.name = "BadBoy History"
InterfaceOptions_AddCategory(bbhistory)

local bbhistoryTitle = bbhistory:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
bbhistoryTitle:SetPoint("TOPLEFT", 16, -16)
bbhistoryTitle:SetText("BadBoy History")

local bbhistoryScrollArea = CreateFrame("ScrollFrame", "BadBoyHistoryScroll", bbhistory, "UIPanelScrollFrameTemplate")
bbhistoryScrollArea:SetPoint("TOPLEFT", bbhistoryTitle, "BOTTOMLEFT", 0, -15)
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
bbhistoryBackdrop:SetPoint("TOPLEFT", bbhistoryTitle, "BOTTOMLEFT", -5, 0)
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




--[[     Start CCleaner Frame     ]]--
local bbcchistory = CreateFrame("Frame", "BadBoyCCleanerHistory", bbhistory)
bbcchistory.name, bbcchistory.parent = "_CCleaner History", "BadBoy History"
InterfaceOptions_AddCategory(bbcchistory)

local bbcchistoryTitle = bbcchistory:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
bbcchistoryTitle:SetPoint("TOPLEFT", 16, -16)
bbcchistoryTitle:SetText("_CCleaner History")

local bbcchistoryScrollArea = CreateFrame("ScrollFrame", "BadBoyCCleanerHistoryScroll", bbcchistory, "UIPanelScrollFrameTemplate")
bbcchistoryScrollArea:SetPoint("TOPLEFT", bbcchistoryTitle, "BOTTOMLEFT", 0, -15)
bbcchistoryScrollArea:SetPoint("BOTTOMRIGHT", bbcchistory, "BOTTOMRIGHT", -30, 10)

local bbcchistoryEditBox = CreateFrame("EditBox", "BadBoyCCleanerHistoryEditBox", bbcchistory)
bbcchistoryEditBox:SetMultiLine(true)
bbcchistoryEditBox:SetMaxLetters(99999)
bbcchistoryEditBox:EnableMouse(false)
bbcchistoryEditBox:SetAutoFocus(false)
bbcchistoryEditBox:SetFontObject(ChatFontNormal)
bbcchistoryEditBox:SetWidth(575)
bbcchistoryEditBox:SetHeight(500)
bbcchistoryEditBox:Show()

bbcchistoryScrollArea:SetScrollChild(bbcchistoryEditBox)

local bbcchistoryBackdrop = CreateFrame("Frame", "BadBoyCCleanerHistoryBackdrop", bbcchistory)
bbcchistoryBackdrop:SetBackdrop({bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
	edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
	tile = true, tileSize = 16, edgeSize = 16,
	insets = {left = 3, right = 3, top = 5, bottom = 3}}
)
bbcchistoryBackdrop:SetBackdropColor(0,0,0,1)
bbcchistoryBackdrop:SetPoint("TOPLEFT", bbcchistoryTitle, "BOTTOMLEFT", -5, 0)
bbcchistoryBackdrop:SetPoint("BOTTOMRIGHT", bbcchistory, "BOTTOMRIGHT", -27, 5)

local bbcchistoryButton = CreateFrame("Button", "BadBoyCCleanerHistoryButton", bbcchistory, "UIPanelButtonTemplate")
bbcchistoryButton:SetWidth(60)
bbcchistoryButton:SetHeight(25)
bbcchistoryButton:SetPoint("TOPRIGHT", bbcchistory, "TOPRIGHT", -35, -7)
bbcchistoryButton:SetText(RESET)
bbcchistoryButton:SetScript("OnClick", function(frame)
	wipe(BBCCHISTORY)
	bbcchistoryEditBox:SetText("")
end)

bbcchistory:SetScript("OnShow", function()
	local text
	for i=1, #BBCCHISTORY do
		if not text then
			text = BBCCHISTORY[i]
		else
			text = text.."\n\n"..BBCCHISTORY[i]
		end
	end
	bbcchistoryEditBox:SetText(text or "")
end)
--[[     End CCleaner Frame     ]]--




--[[     Start Guilded Frame     ]]--
local bbghistory = CreateFrame("Frame", "BadBoyGuildedHistory", bbhistory)
bbghistory.name, bbghistory.parent = "_Guilded History", "BadBoy History"
InterfaceOptions_AddCategory(bbghistory)

local bbghistoryTitle = bbghistory:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
bbghistoryTitle:SetPoint("TOPLEFT", 16, -16)
bbghistoryTitle:SetText("_Guilded History")

local bbghistoryScrollArea = CreateFrame("ScrollFrame", "BadBoyGuildedHistoryScroll", bbghistory, "UIPanelScrollFrameTemplate")
bbghistoryScrollArea:SetPoint("TOPLEFT", bbghistoryTitle, "BOTTOMLEFT", 0, -15)
bbghistoryScrollArea:SetPoint("BOTTOMRIGHT", bbghistory, "BOTTOMRIGHT", -30, 10)

local bbghistoryEditBox = CreateFrame("EditBox", "BadBoyGuildedHistoryEditBox", bbghistory)
bbghistoryEditBox:SetMultiLine(true)
bbghistoryEditBox:SetMaxLetters(99999)
bbghistoryEditBox:EnableMouse(false)
bbghistoryEditBox:SetAutoFocus(false)
bbghistoryEditBox:SetFontObject(ChatFontNormal)
bbghistoryEditBox:SetWidth(575)
bbghistoryEditBox:SetHeight(500)
bbghistoryEditBox:Show()

bbghistoryScrollArea:SetScrollChild(bbghistoryEditBox)

local bbghistoryBackdrop = CreateFrame("Frame", "BadBoyGuildedHistoryBackdrop", bbghistory)
bbghistoryBackdrop:SetBackdrop({bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
	edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
	tile = true, tileSize = 16, edgeSize = 16,
	insets = {left = 3, right = 3, top = 5, bottom = 3}}
)
bbghistoryBackdrop:SetBackdropColor(0,0,0,1)
bbghistoryBackdrop:SetPoint("TOPLEFT", bbghistoryTitle, "BOTTOMLEFT", -5, 0)
bbghistoryBackdrop:SetPoint("BOTTOMRIGHT", bbghistory, "BOTTOMRIGHT", -27, 5)

local bbghistoryButton = CreateFrame("Button", "BadBoyGuildedHistoryButton", bbghistory, "UIPanelButtonTemplate")
bbghistoryButton:SetWidth(60)
bbghistoryButton:SetHeight(25)
bbghistoryButton:SetPoint("TOPRIGHT", bbghistory, "TOPRIGHT", -35, -7)
bbghistoryButton:SetText(RESET)
bbghistoryButton:SetScript("OnClick", function(frame)
	wipe(BBGHISTORY)
	bbghistoryEditBox:SetText("")
end)

bbghistory:SetScript("OnShow", function()
	local text
	for i=1, #BBGHISTORY do
		if not text then
			text = BBGHISTORY[i]
		else
			text = text.."\n\n"..BBGHISTORY[i]
		end
	end
	bbghistoryEditBox:SetText(text or "")
end)
--[[     End Guilded Frame     ]]--

bbhistory:RegisterEvent("PLAYER_LOGIN")
bbhistory:SetScript("OnEvent", function()
	if type(BBHISTORY) ~= "table" then
		BBHISTORY = {}
	end
	if type(BBGHISTORY) ~= "table" then
		BBGHISTORY = {}
	end
	if type(BBCCHISTORY) ~= "table" then
		BBCCHISTORY = {}
	end

	BadBoyLog = function(addon, event, player, msg)
		event = (event):sub(10)
		local dump = "["..BetterDate("%I:%M:%S", time()).."]".."["..event.."]".."["..player.."]: "..msg
		if addon == "BadBoy" then
			tinsert(BBHISTORY, dump)
			bbhistoryEditBox:SetText(bbhistoryEditBox:GetText().. "\n\n"..dump)
		elseif addon == "Guilded" then
			tinsert(BBGHISTORY, dump)
			bbghistoryEditBox:SetText(bbghistoryEditBox:GetText().. "\n\n"..dump)
		elseif addon == "CCleaner" then
			tinsert(BBCCHISTORY, dump)
			bbcchistoryEditBox:SetText(bbcchistoryEditBox:GetText().. "\n\n"..dump)
		end
	end
end)

