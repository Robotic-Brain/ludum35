require("util.advancedFuncs")

test = {}

--[[
-- expect(want, actual, [m | message])  
function test.expect(t)
    local want = (t[1] == or t.want
    local actual = t[2] or t.actual
    local msg = t[3] or t.m or t.message or ""
    
    assert(
        want == actual,
        "Assert failed!\n"..
        "\tExpected: "..tostring(want)..
        "\n\tGot: "..tostring(actual)..
        "\n\tMdg: "..tostring(msg)
    )
end
--]]
test.expect = fnc(
    {"want", "actual", "msg"},
    {msg=""},
    function (p)
        assert(
            p.want == p.actual,
            "Assert failed!\n"..
            "\tExpected: "..tostring(p.want)..
            "\n\tGot: "..tostring(p.actual)..
            "\n\tMdg: "..tostring(p.msg)
        )
    end
)
