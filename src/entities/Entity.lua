local Entity = {}

Entity.__index = Entity

function Entity:isPlayer()
	return false
end

function Entity.new(x, y)
	local self = setmetatable({}, Entity)
	self.x = x or 0
	self.y = y or 0
	return self
end

function Entity:update(dt)
	-- Override in subclasses
end

function Entity:draw()
	-- Override in subclasses
end

return Entity
