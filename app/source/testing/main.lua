require("testing.TestSuite")

return function ()
    print("Setup tests...")
    TestSuite:a("TestSelf")
    print("Testing...")
    TestSuite:run()
end
