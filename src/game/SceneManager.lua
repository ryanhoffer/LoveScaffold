local SceneManager = {}
SceneManager.__index = SceneManager

function SceneManager.new()
    local self = setmetatable({}, SceneManager)
    self.current = nil
    return self
end

function SceneManager:switch(scene)
    if self.current and self.current.exit then
        self.current:exit()
    end
    self.current = scene
    if self.current and self.current.enter then
        self.current:enter()
    end
end

function SceneManager:update(dt, ...)
    if self.current and self.current.update then
        self.current:update(dt, ...)
    end
end

function SceneManager:draw()
    if self.current and self.current.draw then
        self.current:draw()
    end
end


return SceneManager
