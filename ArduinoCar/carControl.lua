local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
	
local tapSound = audio.loadSound("audios/beep.mp3")
local up, down, left, right, settings = nil, nil, nil, nil, nil

local function networkListener(event)
	if (event.isError) then
		print("Network error!")
		print("Status: " .. event.status)
	else
		print("Status: " .. event.status)
		print("Response: " .. event.response)
	end
end

local function onTouch(event)	
	local target = event.target
	local cmd = "S"
	if target == up then cmd = "F"
	elseif target == down then cmd = "B"
	elseif target == left then cmd = "L"
	elseif target == right then cmd = "R"
	else return
	end
	
	if event.phase == "began" then			   
		display.getCurrentStage():setFocus(target)
		target.xScale, target.yScale = 1.1, 1.1
		audio.play(tapSound)
		network.request(_baseUrl .. cmd, "GET", networkListener )		
	elseif event.phase == "ended" then
		display.getCurrentStage():setFocus(nil)
		target.xScale, target.yScale = 1, 1
		audio.play(tapSound)
		network.request(_baseUrl .. "S", "GET", networkListener )	
	end	
	
	return true  -- prevents propagation to underlying objects
end

function scene:createScene( event )
	local group = self.view
	
	display.newImage(group, "images/background.jpg",  0, 0 )	
	
	-- 載入上下左右四張指標圖
	up = display.newImage(group, "images/up.png"); up.x, up.y = _W/2, _H/4
	down = display.newImage(group, "images/down.png"); down.x, down.y = _W/2, _H*3/4
	left = display.newImage(group, "images/left.png"); left.x, left.y = _W/4, _H/2
	right = display.newImage(group, "images/right.png"); right.x, right.y = _W*3/4, _H/2
	settings = display.newImage(group, "images/settings.png")
	settings.x, settings.y = _W*9/10, _H*9/10
	settings.xScale, settings.yScale = 0.6, 0.6
	
	up:addEventListener("touch", onTouch)
	down:addEventListener("touch", onTouch)
	left:addEventListener("touch", onTouch)
	right:addEventListener("touch", onTouch)

	function settings:touch(event)
		if event.phase == "began" then
			self.xScale, self.yScale = 0.8, 0.8
		elseif event.phase == "ended" then
			self.xScale, self.yScale = 0.6, 0.6
			audio.play(tapSound)
			storyboard.showOverlay("settings", {effect = "slideLeft", time=400})
		end
		
		return true
	end	
	
	settings:addEventListener("touch", settings)	
end

function scene:enterScene(event)
	_baseUrl = 'http://' .. _settings.host .. '/cgi-bin/luci/car/state/'
	print(_baseUrl)
end

function scene:overlayBegan(event)
	_baseUrl = 'http://' .. _settings.host .. '/cgi-bin/luci/car/state/'
	print(_baseUrl)
end	

function scene:overlayEnded(event)
	_baseUrl = 'http://' .. _settings.host .. '/cgi-bin/luci/car/state/'
	print(_baseUrl)
end	


scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("overlayBegan", scene)
scene:addEventListener("overlayEnded", scene)

return scene