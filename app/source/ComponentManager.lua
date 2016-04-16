require("ObjectBase")
require("ComponentBase")

--[[

The Component manager, manages an internal ordered list
of compontents

]]--


ComponentManager = Object:new{components={}}

-- Adds component to end of internal list
function ComponentManager:add(component)
    assert(Object.instanceof(component, ComponentBase))
    
    -- check duplicates
    for i,v in ipairs(self.components) do
        assert(v ~= component, "Component already added at "..i)
    end
    
    table.insert(self.components, component)
    component:onLoad()
end

-- Called each frame
function ComponentManager:update(dt)
    for i,v in ipairs(self.components) do
        v:onUpdate(dt)
    end
end
