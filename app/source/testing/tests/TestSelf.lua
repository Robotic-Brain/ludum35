--local t = require("testing.TestSuite")
require("testing.asserts")

return {
    pass = function ()
        test.expect{true, true, "Never fail"}
    end,
    fail1 = function ()
        test.expect{true, false, "Always fail 1"}
    end,
    fail2 = function ()
        test.expect{false, true, "Always fail 2"}
    end
}
