local physics = require("physics")
physics.start()

local sky = display.newImage("bkg_clouds.png")
sky.x = 160; sky.y = 195

local ground = display.newImage("ground.png")
ground.x = 160; ground.y = 445

physics.addBody(ground, "static")

local balloon = display.newImage("balloon.png")
balloon.x = 180; balloon.y = -50

physics.addBody(balloon)

-- 使用者拍氣球時，就推動一下氣球讓它往上飛
function balloon:tap(e)
	balloon:applyLinearImpulse(0, -0.8, balloon.x, balloon.y)	
end

balloon:addEventListener("tap", balloon)
