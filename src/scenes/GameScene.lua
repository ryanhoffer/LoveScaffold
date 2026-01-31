local Camera = require('src.camera.Camera')
local InputManager = require('src.input.InputManager')

local Game = require('src.game.Game')

local GameScene = {}
GameScene.__index = GameScene

function GameScene.new()
    local self = setmetatable({}, GameScene)
    self.camera = Camera.new(0, 0, 1)
    self.game = Game.new()
    self.inputManager = InputManager.new()
    return self
end

function GameScene:enter()
    -- Called when entering the game scene
end

function GameScene:exit()
    -- Called when leaving the game scene
end

function GameScene:update(dt)
    self.inputManager:update(dt)
    self.game:update(dt, self.inputManager)
    self.camera:update(dt, self.game.player)
end

function GameScene:draw()
    self.camera:attach()
    self.game:draw()
    self.camera:detach()
end

function GameScene:keypressed(key, scancode, isrepeat)
    self.inputManager:keypressed(key, scancode, isrepeat)
    if self.game.keypressed then
        self.game:keypressed(key, scancode, isrepeat)
    end
end

function GameScene:keyreleased(key, scancode)
    self.inputManager:keyreleased(key, scancode)
    if self.game.keyreleased then
        self.game:keyreleased(key, scancode)
    end
end

function GameScene:mousepressed(x, y, button, istouch, presses)
    self.inputManager:mousepressed(x, y, button, istouch, presses)
    if self.game.mousepressed then
        self.game:mousepressed(x, y, button, istouch, presses)
    end
end

function GameScene:mousereleased(x, y, button, istouch, presses)
    self.inputManager:mousereleased(x, y, button, istouch, presses)
    if self.game.mousereleased then
        self.game:mousereleased(x, y, button, istouch, presses)
    end
end

return GameScene
