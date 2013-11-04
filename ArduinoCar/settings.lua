local widget = require( "widget" )
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local txtHost = nil

function scene:createScene( event )
	local group = self.view

	display.newImage(group, "images/wood_bg.jpg")
	
	local titleLabel = display.newText(group, "Configurations", 0, 0, native.systemFontBold, 24 )
	titleLabel.x, titleLabel.y = display.contentCenterX, 30
	titleLabel:setTextColor(255, 255, 0)
	
	display.newText(group, "Arduino-Wrt Host:", 20, 60, "Arial", 18)
	txtHost = native.newTextField(15, 90, 280, 40)	
	group:insert(txtHost)
	
	local function btnClicked(event)
		_settings.host = txtHost.text
		_loadsave.saveTable(_settings, "settings.json")
		native.setKeyboardFocus( nil )
		storyboard.hideOverlay("slideRight", 400)
	end

	local okBtn = widget.newButton
	{ 
		defaultFile = "images/btnBlue.png",
		overFile = "images/btnBlueOver.png",
		left = 20,
		top = 150,
		width = 90,
		height = 40,
		label = "OK",
		labelColor = 
		{ 
			default = { 255, 255, 255 },
		},		
		onRelease=btnClicked
	}
	group:insert(okBtn)

	local function btnCancelClicked(event)
		native.setKeyboardFocus( nil )
		storyboard.hideOverlay("slideRight", 400)
	end
	
	local cancelBtn = widget.newButton
	{ 
		defaultFile = "images/btnBlue.png",
		overFile = "images/btnBlueOver.png",
		left = 110,
		top = 150,
		width = 90,
		height = 40,
		label = "Cancel",
		labelColor = 
		{ 
			default = { 255, 255, 255 },
		},		
		onRelease=btnCancelClicked
	}
	group:insert(cancelBtn)	
end

function scene:enterScene(event)
	txtHost.text = _settings.host
	print("settings:enterScene -> " .. _settings.host)
	
	local function onKeyEvent( event )
		-- If the "back" key was pressed on Android, then prevent it from backing out of your app.
		if (event.keyName == "back") and (system.getInfo("platformName") == "Android") then
			Runtime:removeEventListener( "key", onKeyEvent );		
			storyboard.hideOverlay("slideRight", 400)			
			return true
		end
	
		-- Return false to indicate that this app is *not* overriding the received key.
		-- This lets the operating system execute its default handling of this key.
		return false
	end	
	-- Add the key event listener.
	Runtime:addEventListener( "key", onKeyEvent );			
end

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)

return scene