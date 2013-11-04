--[[
TODO:
 1) Add commands configuration page
 2) Check network connection on startup
 3) Video Streaming?
]]
local storyboard = require( "storyboard" )
_loadsave = require("loadsave")

_W = display.contentWidth
_H = display.contentHeight
_defaultHost = "192.168.10.1"

_settings = _loadsave.loadTable("settings.json")
if _settings == nil then
	_settings = { host = _defaultHost }
	_loadsave.saveTable(_settings, "settings.json")
end

_baseUrl = 'http://' .. _settings.host .. '/cgi-bin/luci/car/state/'
storyboard.gotoScene("carControl", {effect = "fade", time=300})
