std = "lua51"
max_line_length = false
codes = true
ignore = {
	"113/Settings", -- (W113) Blizz settings table
	"121/BBH_Logs", -- (W121) Our global SV table
	"122/BBH_Logs", -- (W122) Our global SV table
	"121/BadBoyLog", -- (W121) Global logging function
}
read_globals = {
	"BadBoyLog",
	"BBH_Logs",
	"ChatFontNormal",
	"CreateFrame",
	"date",
	"InterfaceOptions_AddCategory",
	"InterfaceOptionsFramePanelContainer",
	"RESET",
}
