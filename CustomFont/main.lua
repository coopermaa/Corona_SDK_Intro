--[[
-- 使用系統預設字型顯示 Text
display.newText("12345", 30, 60, native.systemFont, 90)
display.newText("24680", 30, 180, native.systemFont, 90)
]]

--[[
-- 使用自訂字型 DS-Digital 顯示 Text
display.newText("12345", 30, 60, "DS-Digital", 100)
display.newText("24680", 30, 180, "DS-Digital", 100)
]]

-- 同一套字型，在不同平台下名稱可能會不一樣
-- 底下會根據平台調整字型的名稱
local platform = system.getInfo("platformName")
local font = "DS-Digital"

if platform == "Win" then
	font = "DS-Digital"
elseif platform == "Android" then
	-- filename with no extension, case sensitive
	font = "fonts/DS-DIGI" 
else
	-- Mac and iOS
	font = "DS-DIGI"
end  

-- 使用自訂字型 DS-Digital 顯示 Text
display.newText("12345", 30, 60, font, 100)
display.newText("24680", 30, 180, font, 100)
