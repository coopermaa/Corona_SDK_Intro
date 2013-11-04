local widget = require( "widget" )

local function btnClicked(event)
	-- 讓設備震動
	system.vibrate()
end

-- Create a simple button
widget.newButton
{ 
	left = 60,
	top = 120,
	label = "Vibrate",
	onRelease=btnClicked
}
