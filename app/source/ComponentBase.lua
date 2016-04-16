require("ObjectBase")

ComponentBase = subclass("ComponentBase", Object)


-- Called on component add
function ComponentBase:onLoad()
    print("Loading component: "..tostring(self))
end

-- Called each frame
function ComponentBase:onUpdate(dt)
    -- body
end
