--[[
time_translator: 将 `time` 翻译为当前时间
--]]

local conf = {
   weekday = {"星期天", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"}
}

local function getWeekDay()
   local week = os.date("%w")
   return conf.weekday[week + 1]
end

local function translator(input, seg)
   if (input == "o") then
      yield(Candidate("date", seg.start, seg._end, os.date("%H:%M:%S"), "~ej"))
   end
   if (input == "oe") then
      yield(Candidate("date", seg.start, seg._end, os.date("%H:%M:%S"), "~j"))
   end
   if (input == "oej") then
      yield(Candidate("date", seg.start, seg._end, os.date("%H:%M:%S"), ""))
   end
   if (input == "o") then
      yield(Candidate("date", seg.start, seg._end, getWeekDay(), "~xq"))
   end
   if (input == "ox") then
      yield(Candidate("date", seg.start, seg._end, getWeekDay(), "~q"))
   end
   if (input == "oxq") then
      yield(Candidate("date", seg.start, seg._end, getWeekDay(), ""))
   end
end

return translator
