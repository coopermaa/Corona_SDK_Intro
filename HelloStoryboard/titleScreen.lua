-- titleScreen.lua

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

function scene:createScene( event )
	local group = self.view
	
	display.newText(group, "開心水族箱", 20, 110, "Arial", 50)
	display.newText(group, "Start", 120, 280, "Arial", 40)	
end

function scene:enterScene(event)
	local function showGameScreen()
		-- 切換場景，花 1.2 秒把 titleScreen 往上移
		storyboard.gotoScene("gameScreen", "slideUp", 1200)
	end
	
	timer.performWithDelay(1000, showGameScreen, 1)
end

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)

return scene