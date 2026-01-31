local Camera = {}
Camera.__index = Camera

function Camera.new(x, y, scale)
	local self = setmetatable({}, Camera)
	self.x = x or 0
	self.y = y or 0
	self.scale = scale or 1
	return self
end


function Camera:update(dt, target)
	-- Follow target (e.g., player)
	if target and target.x and target.y then
		self.x = target.x - love.graphics.getWidth() / 2 / self.scale
		self.y = target.y - love.graphics.getHeight() / 2 / self.scale
	end
end

function Camera:attach()
	love.graphics.push()
	love.graphics.scale(self.scale)
	love.graphics.translate(-self.x, -self.y)
end

function Camera:detach()
	love.graphics.pop()
end

return Camera
