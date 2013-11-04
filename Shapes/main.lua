_W = display.contentWidth
_H = display.contentHeight

-- 利用 newLine() 畫出三角形, 框線寬度為 3，框線顏色為白色
-- 語法: display.newLine([parentGroup], x1, y1, x2, y2)
local l = display.newLine(_W/2, 0, 0, _H/4)
l.width = 3
l:setColor(255, 255, 255)

-- 畫出三角形另外兩條邊
-- 語法: lineObject:append(x, y, [x2, y2...])
l:append(_W, _H/4, _W/2, 0)

-- 利用 newRect() 畫出矩形，填充顏色為黃色，白色筆刷，寬度為 3
-- 語法: display.newRect([parentGroup], left, top, width, height)
local r = display.newRect(0, _H/4, _W, _H*3/4)
r:setFillColor(255, 255, 0)
r.strokeWidth = 3
r:setStrokeColor(255, 255, 255)

-- 利用 newCircle() 畫圓，半徑為 80，填充色為綠色，黑色筆刷，寬度為 4
-- 語法: display.newCircle([parentGroup,] xCenter, yCenter, radius)
local c = display.newCircle(_W/2, _H*3/5, 80)
c:setFillColor(0, 255, 0)
c.strokeWidth = 4
c:setStrokeColor(0, 0, 0)
