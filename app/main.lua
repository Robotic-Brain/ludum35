print(love.filesystem.getRequirePath())
love.filesystem.setRequirePath("source/?.lua;source/?/init.lua")
print(love.filesystem.getRequirePath())

require("ComponentManager")
require("graphics.GraphicsComponent")

require("util.tprint")

local components = ComponentManager:new()

local graphics = {}

function love.load()
    graphics = GraphicsComponent:new()
    
    require("testing.main")()
    
    -- ## Component order
    -- input
    -- pre_phys_logic
    -- physics
    -- post_phys_logic
    components:add(graphics)
    
    print("Components: ")
    tprint(components)
    print("Setup complete...")
end

function love.update(dt)
    components:update(dt)
end

function love.draw()
    graphics:draw()
end
