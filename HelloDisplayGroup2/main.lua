-- 載入背景圖
display.newImage( "world.jpg" )

-- 顯示 "Hello World"
local myText = display.newText("Hello, World!", 0, 0, nil, 40)
myText.x = display.contentWidth / 2
myText.y = display.contentWidth / 4
myText:setTextColor( 255,110,110 )

-- current stage 是最上層的 Display Group
stage = display.getCurrentStage()

-- 花 1.2 秒把 stage 往上移，1 秒後開始動作
transition.to(stage, {time=1200, delay=1000, y=-480})
-- 花 1.2 秒把 stage 移回原位，2.5 秒後開始動作
transition.to(stage, {time=1200, delay=2500, y=0})	