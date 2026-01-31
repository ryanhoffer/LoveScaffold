local Mouse = {}
Mouse.__index = Mouse

function Mouse.new()
	local self = setmetatable({}, Mouse)
	self.buttonsDown = {}
	self.x, self.y = 0, 0
	return self
end

function Mouse:update(dt)
	self.x, self.y = love.mouse.getPosition()
end

function Mouse:mousepressed(x, y, button, istouch, presses)
	self.buttonsDown[button] = true
end

function Mouse:mousereleased(x, y, button, istouch, presses)
	self.buttonsDown[button] = false
end

function Mouse:isDown(button)
	return self.buttonsDown[button] or false
end

return Mouse
