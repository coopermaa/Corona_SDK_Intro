local physics = require("physics")
physics.start()

local sky = display.newImage("bkg_clouds.png")
sky.x = 160; sky.y = 195

local ground = display.newImage("ground.png")
ground.x = 160; ground.y = 445

physics.addBody(ground, "static")

-- 定義產生箱子的 function
function newCrate()
	local crate = display.newImage("crate.png")
	crate.x = math.random(320)
	crate.y = -50; crate.rotation = 5

	physics.addBody(crate)
end

-- 每 0.5 秒跑一次 newCrate() 產生箱子
-- 設定 timer 執行 50 次，設成 0 表示無窮
timer.performWithDelay(500, newCrate, 50)