local KEY = "apostrophe"
local kRejected = 0 -- do the OS default processing
local kAccepted = 1 -- consume it
local kNoop     = 2 -- leave it to other processors

local function processor(key_event, env)
    local engine = env.engine
    local schema = engine.schema
    local context = engine.context

    if key_event:release() or key_event:repr() ~= KEY then
        return kNoop
    end

    if context:select(1) then
        context:commit()
        return kAccepted
    end

    if not env.engine.context:get_selected_candidate() then
        context:clear()
    else
        context:commit()
    end
    return kAccepted
end

return { func = processor }
