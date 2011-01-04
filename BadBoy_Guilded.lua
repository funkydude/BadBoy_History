
BadBoyLogger = function(addon, event, player, msg)
	event = gsub(event, ".*%_(%L)", "%1")
	if addon == "BadBoy" then
		print("|cFF33FF99BadBoy_REPORT|r: ", msg, event)
	elseif addon == "Guilded" then
		print("|cFF33FF99BadBoy_GUILDED|r:", msg, event)
	end
end

