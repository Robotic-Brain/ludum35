print(love.filesystem.getRequirePath())
love.filesystem.setRequirePath("source/?.lua;source/?/init.lua")
print(love.filesystem.getRequirePath())

require("util.tprint")

local components = {}

function love.load()
    -- ## Component order
    -- input
    -- pre_phys_logic
    -- physics
    -- post_phys_logic
    -- graphics
    
    require("testing.main")()
    
    print("Components: ")
    tprint(components)
    print("Setup complete...")
end

function love.update(dt)
    
end
