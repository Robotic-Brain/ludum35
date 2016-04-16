Object = {}

local function my_tostring(o)
    local mt = getmetatable(o)
    local tmp = mt.__tostring
    mt.__tostring = nil
    local res = (mt.__class or "Object")..": "..tostring(o)
    mt.__tostring = tmp
    return res
end

function Object:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.__tostring = my_tostring
    return o
end

function subclass(name, base, staticfields)
    assert(type(name) == 'string', "No Classname given!")
    local c = base:new(staticfields)
    getmetatable(c).__class = name
    return c
end

function Object.instanceof(subject, super)
    -- from https://gist.github.com/paulcuth/1270733
    super = tostring(super)
    local mt = getmetatable(subject)

    while true do
        if mt == nil then return false end
        if tostring(mt) == super then return true end

        mt = getmetatable(mt)
    end
end
