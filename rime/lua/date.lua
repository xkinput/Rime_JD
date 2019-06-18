--[[
date_translator: 将 `date` 翻译为当前日期

translator 的功能是将分好段的输入串翻译为一系列候选项。

欲定义的 translator 包含三个输入参数：
 - input: 待翻译的字符串
 - seg: 包含 `start` 和 `_end` 两个属性，分别表示当前串在输入框中的起始和结束位置
 - env: 可选参数，表示 translator 所处的环境（本例没有体现）

translator 的输出是若干候选项。
与通常的函数使用 `return` 返回不同，translator 要求您使用 `yield` 产生候选项。

`yield` 每次只能产生一个候选项。有多个候选时，可以多次使用 `yield` 。

请看如下示例：
--]]

local conf = {
   number = {"〇", "一", "二", "三", "四", "五", "六", "七", "八", "九"},
}

local function translateDateSuffix(text, type)
   for i = 1, string.len(text) do
      text = string.gsub(text, '〇', '', 1)
      if (type == 'day' and i == 1) then
         text = string.gsub(text, '^二', '二十', 1)
         text = string.gsub(text, '^三', '三十', 1)
      end
      if (type == 'month' or (type == 'day' and i == 2)) then
         text = string.gsub(text, '^一', '十', 1)
      end
   end
   return text
end

local function translateDate(text)
   local i = 0
   for key,value in ipairs(conf.number) do
      text = string.gsub(text, i, value)
      i = i + 1
   end
   return text
end

local function getUpDate()
   local h = os.date('%Y')
   local m = os.date('%m')
   local d = os.date('%d')
   
   local hour = translateDate(h)
   local month = translateDate(m)
   local month = translateDateSuffix(month, 'month')
   local day = translateDate(d)
   local day = translateDateSuffix(day, 'day')
   local res = string.format("%s年%s月%s日", hour, month, day)
   return res
end

local function translator(input, seg)
   if (input == "o") then
      yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), "~rq"))
   end
   if (input == "or") then
      yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), "~q"))
   end
   if (input == "orq") then
      --[[ 用 `yield` 产生一个候选项
           候选项的构造函数是 `Candidate`，它有五个参数：
            - type: 字符串，表示候选项的类型
            - start: 候选项对应的输入串的起始位置
            - _end:  候选项对应的输入串的结束位置
            - text:  候选项的文本
            - comment: 候选项的注释
       --]]
      yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), ""))
      yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), ""))
      yield(Candidate("date", seg.start, seg._end, getUpDate(), ""))
   end
end

-- 将上述定义导出
return translator
