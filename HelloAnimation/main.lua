_W = display.contentWidth
_H = display.contentHeight

-- 定義球半徑、球速與預設方向
local radius = 20
local xspeed = 7.5
local yspeed = 6.4
local xdirection = 1
local ydirection = 1

-- 在畫面中央畫出一顆黃色的球
local ball = display.newCircle(_W/2, _H/2, radius)
ball:setFillColor(255, 255, 0)

-- 設定畫面四邊的位置
-- 這邊是 letterbox 的算法，zoomEven 算法不一樣
local screenTop = 0
local screenBottom = _H
local screenLeft = 0
local screenRight = _W

-- 加上動畫讓球移動，碰到邊邊時切換方向
function animate(eveent)
	local dx = xspeed * xdirection
	local dy = yspeed * ydirection
	local xNew, yNew = ball.x + dx, ball.y + dy

	if xNew > screenRight - radius or xNew < screenLeft + radius then
		xdirection = -xdirection
	end
	if yNew > screenBottom - radius or yNew < screenTop + radius then
		ydirection = -ydirection
	end
	
	ball:translate(dx, dy)	
end

Runtime:addEventListener("enterFrame", animate)