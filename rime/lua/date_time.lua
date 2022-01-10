local conf = {
    weekday = {"星期天", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"},
    number = {"〇", "一", "二", "三", "四", "五", "六", "七", "八", "九"},
}

local function toUp(text)
    for i, v in ipairs(conf.number) do
        text = text:gsub(i-1, v)
    end
    return text
end

local function getUpDate()
    local m = tonumber(os.date("%m"))
    local d = tonumber(os.date("%d"))

    local year = toUp(os.date("%Y"))
    local month = toUp(tostring(m))
    if m == 10 then
        month = "十"
    elseif m > 10 then
        month = month:gsub("^一", "十")
    end
    local date = toUp(tostring(d))
    if d == 10 then
        date = "十"
    elseif d % 10 == 0 then
        date = date:gsub("〇", "十")
    elseif d > 10 and d < 20 then
        -- common hanzi's lenth is 3 in UTF-8
        date = "十" .. date:sub(4)
    elseif d > 20 then
        date = date:sub(1, 3) .. "十" .. date:sub(4)
    end
    return year .. "年" .. month .. "月" .. date .. "日"
end

local function getWeekDay()
   local week = os.date("%w")
   return conf.weekday[week + 1]
end

local function translator(input, seg)
    if input == "o" then
        yield(Candidate("date", seg.start, seg._end, os.date("%H:%M:%S"), "~ej"))
        yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), "~rq"))
        yield(Candidate("date", seg.start, seg._end, getWeekDay(), "~xq"))
    elseif input == "oe" then
        yield(Candidate("date", seg.start, seg._end, os.date("%H:%M:%S"), "~j"))
    elseif input == "or" then
        yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), "~q"))
    elseif input == "ox" then
        yield(Candidate("date", seg.start, seg._end, getWeekDay(), "~q"))
    elseif input == "oej" then
        yield(Candidate("date", seg.start, seg._end, os.date("%H:%M:%S"), ""))
    elseif input == "orq" then
        yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), ""))
        yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), ""))
        yield(Candidate("date", seg.start, seg._end, getUpDate(), ""))
    elseif input == "oxq" then
        yield(Candidate("date", seg.start, seg._end, getWeekDay(), ""))
    end
end

return translator
