-- gameScreen.lua
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local fish = nil
local bubble = audio.loadSound("bubble.wav")

function scene:createScene( event )
	local group = self.view
	
	display.newImage(group, "bkg.jpg")
	fish = display.newImage(group, "fish.png", 30, 220)
end	

function scene:enterScene(event)
	-- 讓魚花 3.5 秒鐘的時間移動到右上角
	-- 移動時要翻滾 360 度, 快要到達時減速
	transition.to(fish, {time=3500, x=250, y=80,
		rotation=360, transition=easing.outExpo})	
	audio.play(bubble)
end

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)

return scene

