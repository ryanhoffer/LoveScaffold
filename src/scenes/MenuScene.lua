local MenuScene = {}
MenuScene.__index = MenuScene

function MenuScene.new(sceneManager, gameScene)
    local self = setmetatable({}, MenuScene)
    self.sceneManager = sceneManager
    self.gameScene = gameScene
    return self
end

function MenuScene:enter()
    -- Called when entering the menu
end

function MenuScene:exit()
    -- Called when leaving the menu
end

function MenuScene:update(dt)
    -- No-op for now
end

function MenuScene:draw()
    love.graphics.setColor(0.1, 0.1, 0.1, 1)
    love.graphics.rectangle('fill', 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
    love.graphics.setColor(0.5, 1, 0, 1)
    love.graphics.printf('MAIN MENU', 0, love.graphics.getHeight() / 2 - 60, love.graphics.getWidth(), 'center')
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.printf('Press ENTER to Start', 0, love.graphics.getHeight() / 2, love.graphics.getWidth(), 'center')
end

function MenuScene:keypressed(key)
    if key == 'return' or key == 'kpenter' then
        self.sceneManager:switch(self.gameScene)
    end
end

return MenuScene
