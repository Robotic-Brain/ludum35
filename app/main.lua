print(love.filesystem.getRequirePath())
love.filesystem.setRequirePath("source/?.lua;source/?/init.lua")
print(love.filesystem.getRequirePath())

function love.load()
    print("Setup complete...")
end
