local Player = require('src.entities.Player')
local GameState = require('src.game.GameState')

local Game = {}
Game.__index = Game


function Game.new()
	local self = setmetatable({}, Game)
	self.state = GameState.new()
	self.entities = {}
	self.player = Player.new(100, 100)
	table.insert(self.entities, self.player)
	return self
end

function Game:update(dt, inputManager)
	for _, entity in ipairs(self.entities) do
		entity:update(dt, inputManager)
	end
end


function Game:draw()
	-- Draw an infinite dotted grid based on camera and screen size
	love.graphics.setColor(0.5, 1, 0, 0.5) -- lime green
	local gridSize = 64
	local camX = self.player.x - love.graphics.getWidth() / 2
	local camY = self.player.y - love.graphics.getHeight() / 2
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
	for _, entity in ipairs(self.entities) do
		entity:draw()
	end
end

return Game
