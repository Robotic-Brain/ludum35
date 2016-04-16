print(love.filesystem.getRequirePath())
love.filesystem.setRequirePath("source/?.lua;source/?/init.lua")
print(love.filesystem.getRequirePath())

local components = {}

function love.load()
    print("Setup complete...")
end

function love.update(dt)
    for i,v in ipairs(components) do
        v.update(dt)
    end
end
