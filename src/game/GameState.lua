local GameState = {}
GameState.__index = GameState

function GameState.new()
	local self = setmetatable({}, GameState)
	self.state = "playing" -- or "menu", etc.
	return self
end

function GameState:set(state)
	self.state = state
end

function GameState:get()
	return self.state
end

return GameState
