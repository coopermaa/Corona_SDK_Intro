
-- 載入齒輪 gear 於畫面中央
local gear = display.newImage("gear.png")
gear.x = display.contentWidth / 2
gear.y = display.contentHeight / 2

-- 讓齒輪每一個 Frame 旋轉 1 度
local function animate(event)
 	gear.rotation = gear.rotation + 1
end

Runtime:addEventListener("enterFrame", animate)

-- 可以利用 xScale, yScale 調整齒輪的縮放比例
gear.xScale, gear.yScale = 0.8, 0.8

