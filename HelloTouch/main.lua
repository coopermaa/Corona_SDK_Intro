_RADIUS = 20
local tapSound = audio.loadSound("beep.mp3")

-- 在 touch 的位置畫出一顆黃色的球
local function onTouch(e)
    -- 有 began, moved, ended 和 cancelled 四種 touch events
	-- 這裏只處理 began event
	if e.phase == "began" then
		local circle = display.newCircle(e.x, e.y, _RADIUS)
		circle:setFillColor(255, 255, 0)
		audio.play(tapSound)
		return true
	end
end

Runtime:addEventListener("touch", onTouch)