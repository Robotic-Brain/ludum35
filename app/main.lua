print(love.filesystem.getRequirePath())
love.filesystem.setRequirePath("source/?.lua;source/?/init.lua")
print(love.filesystem.getRequirePath())

require("util.tprint")

local components = {}

function love.load()
    -- ## Component order
    -- input
    -- logic
    -- physics
    -- graphics
    
    print("Components: ")
    tprint(components)
    print("Setup complete...")
end

function love.update(dt)
    for i,v in ipairs(components) do
        v.update(dt)
    end
end
