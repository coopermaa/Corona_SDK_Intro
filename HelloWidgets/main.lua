local widget = require( "widget" )

local function btnClicked(event)
	print(event.target.id .. ": Hello World")
end

-- Create a simple button
widget.newButton
{ 
	id = "simple button",
	left = 60,
	top = 120,
	label = "Say Hello",
	onRelease=btnClicked
}

local function onOffSwitchListener(event)	
	print("On/Off Switch\nIs on?: " .. tostring(event.target.isOn))
end

-- Create a default on/off switch
local onOffSwitch = widget.newSwitch
{
    left = 100,
    top = 230,
    initialSwitchState = true,
    onPress = onOffSwitchListener
}