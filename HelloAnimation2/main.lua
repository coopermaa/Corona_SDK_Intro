-- 定義三顆球的參數 (半徑、球速、顏色等)
local params = {
	{ radius=20, xdir=1, ydir=1, xspeed=2.8, yspeed=6.1, r=255, g=0, b=0 },
	{ radius=12, xdir=1, ydir=1, xspeed=3.8, yspeed=4.2, r=255, g=255, b=0 },
	{ radius=15, xdir=1, ydir=-1, xspeed=5.8, yspeed=5.5, r=255, g=0, b=255 },
}

-- 定義畫球的 function，新球都會在畫面中央出現
local function newBall(params)
	local xpos = display.contentWidth*0.5
	local ypos = display.contentHeight*0.5
	local circle = display.newCircle(xpos, ypos, params.radius)
	circle:setFillColor(params.r, params.g, params.b)
	circle.xdir = params.xdir
	circle.ydir = params.ydir
	circle.xspeed = params.xspeed
	circle.yspeed = params.yspeed
	circle.radius = params.radius

	return circle
end

local collection = {}
-- 畫出三顆球，並把球放進 collection 集合
for i=1,#params do
	local ball = newBall(params[i])
	collection[#collection + 1] = ball
end

-- 設定畫面四邊的位置, 這邊是 zoomEven 的算法
local d = display  -- 變數別名，簡化程式碼
local screenTop = d.screenOriginY
local screenBottom = d.viewableContentHeight + d.screenOriginY
local screenLeft = d.screenOriginX
local screenRight = d.viewableContentWidth + d.screenOriginX

-- 加上動畫讓球移動，碰到邊邊時切換方向
function animate(event)
	for _,ball in pairs(collection) do
		local dx = ball.xspeed * ball.xdir
		local dy = ball.yspeed * ball.ydir
		local xNew, yNew = ball.x + dx, ball.y + dy
	
		local radius = ball.radius
		if xNew > screenRight - radius or xNew < screenLeft + radius then
			ball.xdir = -ball.xdir
		end
		if yNew > screenBottom - radius or yNew < screenTop + radius then
			ball.ydir = -ball.ydir
		end
		
		ball:translate(dx, dy)	
	end
end

Runtime:addEventListener("enterFrame", animate)