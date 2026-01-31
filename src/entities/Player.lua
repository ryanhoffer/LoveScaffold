local Entity = require('src.entities.Entity')

local Player = setmetatable({}, Entity)
Player.__index = Player

function Player.new(x, y)
    local self = setmetatable(Entity.new(x, y), Player)
    self.width = 32
    self.height = 32
    self.speed = 200
    self.vx = 0
    self.vy = 0
    return self
end

function Player:isPlayer()
    return true
end

function Player:update(dt, inputManager)
    local dx, dy = 0, 0
    if inputManager.keyboard:isDown('left') or inputManager.keyboard:isDown('a') then dx = dx - 1 end
    if inputManager.keyboard:isDown('right') or inputManager.keyboard:isDown('d') then dx = dx + 1 end
    if inputManager.keyboard:isDown('up') or inputManager.keyboard:isDown('w') then dy = dy - 1 end
    if inputManager.keyboard:isDown('down') or inputManager.keyboard:isDown('s') then dy = dy + 1 end
    local len = math.sqrt(dx*dx + dy*dy)
    if len > 0 then
        dx, dy = dx/len, dy/len
        self.vx = dx * self.speed
        self.vy = dy * self.speed
        self.x = self.x + self.vx * dt
        self.y = self.y + self.vy * dt
    else
        self.vx = 0
        self.vy = 0
    end
end

function Player:draw()
    love.graphics.setColor(1, 0, 1)
    love.graphics.rectangle('fill', self.x-16, self.y-16, self.width, self.height)
    love.graphics.setColor(1, 1, 1)
end

return Player
