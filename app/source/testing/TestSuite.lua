require("ObjectBase")

TestSuite = Object:new{tests={}}

function TestSuite:a(name)
    local t = require("testing.tests."..name)
    self:add(t, name)
end

-- (test, name)
function TestSuite:add(test, name)
    assert(type(test) == 'function')
    local t = {}
    setmetatable(t, {
        __call = test,
        __tostring = function ()
            return name
        end
        })
    table.insert(self.tests, t)
end

function TestSuite:run()
    print("Running TestSuite...")
    local count = #self.tests
    for i,v in ipairs(self.tests) do
        io.write("Test "..i.."/"..count..": "..tostring(v)..": ")
        local res, msg = pcall(v)
        if res then
            print("pass")
        else
            print("fail")
            print("\t"..msg)
        end
    end
end
