-- 載入水族箱背景
local background = display.newImage("bkg.jpg")
-- 載入魚的圖檔
local fish = display.newImage("fish.png", 30, 220)

function listener(object)
	print("I am here!!!")
end

-- 讓魚花 3.5 秒鐘的時間移動到右上角
-- 移動時要翻滾 360 度, 快要到達時減速
-- 完成移動後就呼叫 listener()
transition.to(fish, {time=3500, x=250, y=80,
	rotation=360,transition=easing.outExpo,
	onComplete=listener})
