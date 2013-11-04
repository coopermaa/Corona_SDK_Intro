local physics = require("physics")
physics.start()
physics.setGravity(0, 1.5)

local sky = display.newImage("bkg_clouds.png")

local borderTop = display.newRect(0, 0, 320, 1)
borderTop:setFillColor(0, 0, 0, 0)		-- make invisible
physics.addBody(borderTop, "static")

local borderBottom = display.newRect(0, 479, 320, 1)
borderBottom:setFillColor(0, 0, 0, 0)	-- make invisible
physics.addBody(borderBottom, "static", {bounce=1})

local borderLeft = display.newRect(0, 1, 1, 480)
borderLeft:setFillColor(0, 0, 0, 0)		-- make invisible
physics.addBody(borderLeft, "static")

local borderRight = display.newRect(319, 1, 1, 480)
borderRight:setFillColor(0, 0, 0, 0)	-- make invisible
physics.addBody(borderRight, "static")

function newCrate(e)
	local crate = display.newImage("crate.png")
	crate.x = math.random(320)
	crate.y = 50; crate.rotation = 7
	physics.addBody(crate, {bounce=1})
end

timer.performWithDelay(500, newCrate, 6)

local backgroundMusic = audio.loadSound("chopin_nocturne_no9.mp3")
audio.play(backgroundMusic, { loops=-1, fadein=5000} )