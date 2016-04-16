require("ObjectBase")

TestSuite = subclass("TestSuite", Object, {tests={}})

function TestSuite:a(name)
    local t = require("testing.tests."..name)
    if type(t) == 'table' then
        for k,v in pairs(t) do
            self:add(v, name..':'..k)
        end
    else
        self:add(t, name)
    end
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
    local passed = 0
    local failed = 0
    for i,v in ipairs(self.tests) do
        io.write("Test "..i.."/"..count..": "..tostring(v)..": ")
        local res, msg = pcall(v)
        if res then
            print("pass")
            passed = passed+1
        else
            print("fail")
            print("\t"..msg)
            failed = failed+1
        end
    end
    
    print("Total results:")
    print("  Total:  "..count)
    print(string.format("  Passed: %d (%3d%%)", passed, (passed*100/count)))
    print(string.format("  Failed: %d (%3d%%)", failed, (failed*100/count)))
end
