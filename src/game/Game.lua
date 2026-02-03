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
	-- Print number of entities to the console
	print("Number of entities:", #self.entities)
end


function Game:draw()
	for _, entity in ipairs(self.entities) do
		entity:draw()
	end
end

return Game
