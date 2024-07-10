
local BBH = CreateFrame("Frame", "BadBoyHistory", InterfaceOptionsFramePanelContainer)
local tinsert, tconcat, format, sub, date = table.insert, table.concat, string.format, string.sub, date

BBH:RegisterEvent("ADDON_LOADED")
BBH:SetScript("OnEvent", function(frame, event, addonName)
	if addonName ~= "BadBoy_History" then return end

	--[[     Setup DB     ]]--
	if type(BBH_Logs) ~= "table" then
		BBH_Logs = {
			spam = {},
			guild = {},
			cleaner = {},
		}
	end

	--[[     Limits logs to 50     ]]--
	-- BadBoy (spam)
	for i = #BBH_Logs.spam, 50, -1 do
		BBH_Logs.spam[i] = nil
	end

	-- BadBoy_Guilded (guild)
	for i = #BBH_Logs.guild, 50, -1 do
		BBH_Logs.guild[i] = nil
	end

	-- BadBoy_CCleaner (cleaner)
	for i = #BBH_Logs.cleaner, 50, -1 do
		BBH_Logs.cleaner[i] = nil
	end

	--[[     Start BadBoy Frame     ]]--
	frame:Hide()
	frame.name = "BadBoy History"
	if InterfaceOptions_AddCategory then -- XXX compat
		InterfaceOptions_AddCategory(frame)
	else
		local category = Settings.RegisterCanvasLayoutCategory(frame, frame.name)
		frame.settingsCategory = category
		Settings.RegisterAddOnCategory(category)
	end

	local bbhistoryTitle = frame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
	bbhistoryTitle:SetPoint("TOPLEFT", 16, -16)
	bbhistoryTitle:SetText("BadBoy History")

	local bbhistoryScrollArea = CreateFrame("ScrollFrame", "BadBoyHistoryScroll", frame, "UIPanelScrollFrameTemplate")
	bbhistoryScrollArea:SetPoint("TOPLEFT", bbhistoryTitle, "BOTTOMLEFT", 0, -15)
	bbhistoryScrollArea:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -30, 10)

	local bbhistoryEditBox = CreateFrame("EditBox", nil, frame)
	bbhistoryEditBox:SetMultiLine(true)
	bbhistoryEditBox:SetMaxLetters(99999)
	bbhistoryEditBox:EnableMouse(false)
	bbhistoryEditBox:SetAutoFocus(false)
	bbhistoryEditBox:SetFontObject(ChatFontNormal)
	bbhistoryEditBox:SetWidth(575)
	bbhistoryEditBox:SetHeight(500)
	bbhistoryEditBox:Show()

	bbhistoryScrollArea:SetScrollChild(bbhistoryEditBox)

	local bbhistoryBackdrop = frame:CreateTexture()
	bbhistoryBackdrop:SetPoint("TOPLEFT", bbhistoryTitle, "BOTTOMLEFT", -5, -5)
	bbhistoryBackdrop:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -30, 10)
	bbhistoryBackdrop:SetColorTexture(0, 0, 0, 0.6)

	local bbhistoryButton = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
	bbhistoryButton:SetWidth(60)
	bbhistoryButton:SetHeight(25)
	bbhistoryButton:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -35, -7)
	bbhistoryButton:SetText(RESET)
	bbhistoryButton:SetScript("OnClick", function()
		BBH_Logs.spam = {}
		bbhistoryEditBox:SetText("")
	end)

	frame:SetScript("OnShow", function()
		bbhistoryEditBox:SetText(tconcat(BBH_Logs.spam, "\n\n"))
	end)
	--[[     End BadBoy Frame     ]]--




	--[[     Start CCleaner Frame     ]]--
	local bbcchistory = CreateFrame("Frame", nil, frame)
	bbcchistory.name, bbcchistory.parent = "_CCleaner History", "BadBoy History"
	if InterfaceOptions_AddCategory then -- XXX compat
		InterfaceOptions_AddCategory(bbcchistory)
	else
		local subcategory = Settings.RegisterCanvasLayoutSubcategory(frame.settingsCategory, bbcchistory, bbcchistory.name)
		Settings.RegisterAddOnCategory(subcategory)
	end

	local bbcchistoryTitle = bbcchistory:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
	bbcchistoryTitle:SetPoint("TOPLEFT", 16, -16)
	bbcchistoryTitle:SetText("_CCleaner History")

	local bbcchistoryScrollArea = CreateFrame("ScrollFrame", "BadBoyCCleanerHistoryScroll", bbcchistory, "UIPanelScrollFrameTemplate")
	bbcchistoryScrollArea:SetPoint("TOPLEFT", bbcchistoryTitle, "BOTTOMLEFT", 0, -15)
	bbcchistoryScrollArea:SetPoint("BOTTOMRIGHT", bbcchistory, "BOTTOMRIGHT", -30, 10)

	local bbcchistoryEditBox = CreateFrame("EditBox", nil, bbcchistory)
	bbcchistoryEditBox:SetMultiLine(true)
	bbcchistoryEditBox:SetMaxLetters(99999)
	bbcchistoryEditBox:EnableMouse(false)
	bbcchistoryEditBox:SetAutoFocus(false)
	bbcchistoryEditBox:SetFontObject(ChatFontNormal)
	bbcchistoryEditBox:SetWidth(575)
	bbcchistoryEditBox:SetHeight(500)
	bbcchistoryEditBox:Show()

	bbcchistoryScrollArea:SetScrollChild(bbcchistoryEditBox)

	local bbcchistoryBackdrop = bbcchistory:CreateTexture()
	bbcchistoryBackdrop:SetPoint("TOPLEFT", bbcchistoryTitle, "BOTTOMLEFT", -5, -5)
	bbcchistoryBackdrop:SetPoint("BOTTOMRIGHT", bbcchistory, "BOTTOMRIGHT", -30, 10)
	bbcchistoryBackdrop:SetColorTexture(0, 0, 0, 0.6)

	local bbcchistoryButton = CreateFrame("Button", nil, bbcchistory, "UIPanelButtonTemplate")
	bbcchistoryButton:SetWidth(60)
	bbcchistoryButton:SetHeight(25)
	bbcchistoryButton:SetPoint("TOPRIGHT", bbcchistory, "TOPRIGHT", -35, -7)
	bbcchistoryButton:SetText(RESET)
	bbcchistoryButton:SetScript("OnClick", function()
		BBH_Logs.cleaner = {}
		bbcchistoryEditBox:SetText("")
	end)

	bbcchistory:SetScript("OnShow", function()
		bbcchistoryEditBox:SetText(tconcat(BBH_Logs.cleaner, "\n\n"))
	end)
	--[[     End CCleaner Frame     ]]--




	--[[     Start Guilded Frame     ]]--
	local bbghistory = CreateFrame("Frame", nil, frame)
	bbghistory.name, bbghistory.parent = "_Guilded History", "BadBoy History"
	if InterfaceOptions_AddCategory then -- XXX compat
		InterfaceOptions_AddCategory(bbghistory)
	else
		local subcategory = Settings.RegisterCanvasLayoutSubcategory(frame.settingsCategory, bbghistory, bbghistory.name)
		Settings.RegisterAddOnCategory(subcategory)
	end

	local bbghistoryTitle = bbghistory:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
	bbghistoryTitle:SetPoint("TOPLEFT", 16, -16)
	bbghistoryTitle:SetText("_Guilded History")

	local bbghistoryScrollArea = CreateFrame("ScrollFrame", "BadBoyGuildedHistoryScroll", bbghistory, "UIPanelScrollFrameTemplate")
	bbghistoryScrollArea:SetPoint("TOPLEFT", bbghistoryTitle, "BOTTOMLEFT", 0, -15)
	bbghistoryScrollArea:SetPoint("BOTTOMRIGHT", bbghistory, "BOTTOMRIGHT", -30, 10)

	local bbghistoryEditBox = CreateFrame("EditBox", nil, bbghistory)
	bbghistoryEditBox:SetMultiLine(true)
	bbghistoryEditBox:SetMaxLetters(99999)
	bbghistoryEditBox:EnableMouse(false)
	bbghistoryEditBox:SetAutoFocus(false)
	bbghistoryEditBox:SetFontObject(ChatFontNormal)
	bbghistoryEditBox:SetWidth(575)
	bbghistoryEditBox:SetHeight(500)
	bbghistoryEditBox:Show()

	bbghistoryScrollArea:SetScrollChild(bbghistoryEditBox)

	local bbghistoryBackdrop = bbghistory:CreateTexture()
	bbghistoryBackdrop:SetPoint("TOPLEFT", bbghistoryTitle, "BOTTOMLEFT", -5, -5)
	bbghistoryBackdrop:SetPoint("BOTTOMRIGHT", bbghistory, "BOTTOMRIGHT", -30, 10)
	bbghistoryBackdrop:SetColorTexture(0, 0, 0, 0.6)

	local bbghistoryButton = CreateFrame("Button", nil, bbghistory, "UIPanelButtonTemplate")
	bbghistoryButton:SetWidth(60)
	bbghistoryButton:SetHeight(25)
	bbghistoryButton:SetPoint("TOPRIGHT", bbghistory, "TOPRIGHT", -35, -7)
	bbghistoryButton:SetText(RESET)
	bbghistoryButton:SetScript("OnClick", function()
		BBH_Logs.guild = {}
		bbghistoryEditBox:SetText("")
	end)

	bbghistory:SetScript("OnShow", function()
		bbghistoryEditBox:SetText(tconcat(BBH_Logs.guild, "\n\n"))
	end)
	--[[     End Guilded Frame     ]]--

	--[[     Set Global Logging Function     ]]--
	BadBoyLog = function(addon, fullEvent, player, msg)
		local shortEvent = sub(fullEvent, 10)
		local dateTbl = date("*t")
		local spamEntry = format(
			"[%d/%02d/%02d %02d:%02d:%02d][%s][%s]: %s",
			dateTbl.year, dateTbl.month, dateTbl.day,
			dateTbl.hour, dateTbl.min, dateTbl.sec,
			shortEvent, player, msg
		)

		if addon == "BadBoy" then
			tinsert(BBH_Logs.spam, 1, spamEntry)
			bbhistoryEditBox:SetText(format("%s\n\n%s", spamEntry, bbhistoryEditBox:GetText()))
		elseif addon == "Guilded" then
			tinsert(BBH_Logs.guild, 1, spamEntry)
			bbghistoryEditBox:SetText(format("%s\n\n%s", spamEntry, bbghistoryEditBox:GetText()))
		elseif addon == "CCleaner" then
			tinsert(BBH_Logs.cleaner, 1, spamEntry)
			bbcchistoryEditBox:SetText(format("%s\n\n%s", spamEntry, bbcchistoryEditBox:GetText()))
		end
	end

	frame:UnregisterEvent(event)
	frame:SetScript("OnEvent", nil)
end)
