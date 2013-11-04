local timeDelay = 500		-- Timer delay 時間
local iterations = 20       -- 重複次數

-- 畫出白色的 Text
text = display.newText("0", 115, 105, "Arial", 160)
text:setTextColor(255, 255, 255)

-- 定義 function listener
function listener(event)
	local count = event.count
	text.text = count

	if count >= iterations then
		timer.performWithDelay(timeDelay, listener, iterations)
	end	
end

-- 在 timer up 時呼叫 listener，重複指定次數
timerID = timer.performWithDelay(timeDelay, listener, iterations)
