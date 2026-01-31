
local Camera = require('src.camera.Camera')
local InputManager = require('src.input.InputManager')
local Game = require('src.game.Game')
local DebugWindow = require('src.utils.DebugWindow')
local debug = require('src.utils.debug')

local GameScene = {}
GameScene.__index = GameScene


function GameScene.new()
    local self = setmetatable({}, GameScene)
    self.camera = Camera.new(0, 0, 1)
    self.game = Game.new()
    self.inputManager = InputManager.new()
    self.debugWindow = DebugWindow
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

    -- Debug info
    local player = self.game.player
    debug.print(string.format("Player X: %.2f", player.x))
    debug.print(string.format("Player Y: %.2f", player.y))
    debug.print(string.format("Player VX: %.2f", player.vx))
    debug.print(string.format("Player VY: %.2f", player.vy))

    -- Scene name
    debug.print("Scene: GameScene")

    -- FPS
    debug.print(string.format("FPS: %d", love.timer.getFPS()))

    -- Number of entities
    debug.print(string.format("Entities: %d", #self.game.entities))

    -- Camera position and zoom
    debug.print(string.format("Camera X: %.2f", self.camera.x))
    debug.print(string.format("Camera Y: %.2f", self.camera.y))
    debug.print(string.format("Camera Zoom: %.2f", self.camera.scale))

    -- Input states (show all currently pressed keys)
    local keysDown = {}
    for k, v in pairs(self.inputManager.keyboard.keysDown) do
        if v then table.insert(keysDown, k) end
    end
    debug.print("Keys Down: " .. (next(keysDown) and table.concat(keysDown, ", ") or "none"))

    -- Game state
    debug.print("Game State: " .. tostring(self.game.state:get()))

    -- Memory usage (in MB)
    local mem = collectgarbage("count") / 1024
    debug.print(string.format("Lua Mem: %.2f MB", mem))

    debug.flush()
end


function GameScene:draw()
    self.camera:attach()
    -- Draw an infinite dotted grid based on camera and screen size
    love.graphics.setColor(0.5, 1, 0, 0.5) -- lime green
    local gridSize = 64
    local camX = self.game.player.x - love.graphics.getWidth() / 2
    local camY = self.game.player.y - love.graphics.getHeight() / 2
    local left = math.floor((camX - love.graphics.getWidth()) / gridSize) * gridSize
    local right = math.ceil((camX + love.graphics.getWidth() * 2) / gridSize) * gridSize
    local top = math.floor((camY - love.graphics.getHeight()) / gridSize) * gridSize
    local bottom = math.ceil((camY + love.graphics.getHeight() * 2) / gridSize) * gridSize

    local plusSize = 4
    for x = left, right, gridSize do
        for y = top, bottom, gridSize do
            -- Draw a plus sign: vertical and horizontal lines crossing at (x, y)
            love.graphics.line(x - plusSize, y, x + plusSize, y)
            love.graphics.line(x, y - plusSize, x, y + plusSize)
        end
    end
    love.graphics.setColor(1, 1, 1)
    self.game:draw()
    self.camera:detach()
    self.debugWindow:draw()
end


function GameScene:keypressed(key, scancode, isrepeat)
    if key == (DEBUG_WINDOW_KEY) then
        self.debugWindow:toggle()
        return
    end
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
