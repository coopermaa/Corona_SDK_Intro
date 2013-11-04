-- print 會把字串印到 Corona Simulator Output 視窗
--print("Hello World")

-- 建立 "Hello World" 文字
-- 語法: display.newText([parentGroup], string, left, top, font, size)
local myText = display.newText( "Hello World!", 50, 50, "Arial", 60 )

-- 設定文字顏色為紅色
-- 語法: [object]:setTextColor (R, G, B)
myText:setTextColor( 255, 0, 0 )
