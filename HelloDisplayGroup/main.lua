-- 載入水族箱背景
local background = display.newImage("bkg.jpg")
-- 載入魚的圖檔
local fish = display.newImage("fish.png", 30, 220)
-- 載入音效檔
local bubble = audio.loadSound("bubble.wav")

-- 開始進行遊戲
function startGame()
	-- 讓魚花 3.5 秒鐘的時間移動到右上角
	-- 移動時要翻滾 360 度, 快要到達時減速
	transition.to(fish, {time=3500, x=250, y=80,
		rotation=360, transition=easing.outExpo})	
	audio.play(bubble)
end	


-- 顯示 titleScreen Display Group
function showTitleScreen()
	-- 建立 titleScreen Display Group
	local titleScreen = display.newGroup()
	
	-- 產生兩個 display objects 並放入 titleScreen
	display.newText(titleScreen, "開心水族箱", 20, 110, "Arial", 50)
	display.newText(titleScreen, "Start", 120, 280, "Arial", 40)
	
	-- 花 1.2 秒把 titleScreen 往上移，1 秒後開始動作
	-- 移動完成時呼叫 startGame()
	transition.to(titleScreen, {time=1200, delay=1000, y=-480,
		onComplete=startGame})	
end

showTitleScreen()

