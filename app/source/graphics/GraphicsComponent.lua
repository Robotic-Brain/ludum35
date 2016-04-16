require("ComponentBase")

GraphicsComponent = subclass("GraphicsComponent", ComponentBase)


function GraphicsComponent:onLoad()
    ComponentBase.onLoad(self)
end

function GraphicsComponent:draw()
end
