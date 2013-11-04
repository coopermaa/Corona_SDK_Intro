-- 載入 'ads' library (在 Simualtor 下無法使用廣告)
local ads = require "ads"
-- 發佈商 ID
local appID = "a152396ea402f78"

myText = display.newText( "Hello AdMob", 50, 50, "Arial", 32 )

local function adListener(event)
	-- 收不到廣告時，印出錯誤訊息
	if event.isError then
		print(event.response)
	end
end
  
-- 設定廣告 appID
ads.init( "admob", appID, adListener )
-- 在指定位置顯示廣告，每 60 秒更新一次
ads.show( "banner", { x=0, y=250, interval=60 } )