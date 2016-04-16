Object = {}

function Object:new (o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Object.instanceof(subject, super)
    -- modiefied version of:
    -- https://gist.github.com/paulcuth/1270733
    super = super
    local mt = getmetatable(subject)

    while true do
        if mt == nil then return false end
        if mt == super then return true end

        mt = getmetatable(mt)
    end
end
