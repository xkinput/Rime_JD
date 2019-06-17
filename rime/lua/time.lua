--[[
time_translator: 将 `time` 翻译为当前时间
--]]

local function translator(input, seg)
   if (input == "oej") then
      yield(Candidate("date", seg.start, seg._end, os.date("%H:%M:%S"), " 时间"))
   end
   if (input == "oxq") then
      yield(Candidate("date", seg.start, seg._end, os.date("%dddd"), " 星期"))
   end
end

return translator
