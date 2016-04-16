require("testing.TestSuite")

return function ()
    print("Setup tests...")
    
    TestSuite:a("TestSelf")
    TestSuite:a("TestInstanceOf")
    
    print("Testing...")
    TestSuite:run()
end
