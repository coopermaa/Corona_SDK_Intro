local physics = require("physics")
physics.start()

local sky = display.newImage("bkg_clouds.png")
sky.x = 160; sky.y = 195

local ground = display.newImage("ground.png")
ground.x = 160; ground.y = 445

physics.addBody(ground, "static")

local crate = display.newImage("crate.png")
crate.x = 180; crate.y = 50; crate.rotation = 15

physics.addBody(crate)