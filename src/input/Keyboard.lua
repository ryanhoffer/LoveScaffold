local Keyboard = {}
Keyboard.__index = Keyboard

function Keyboard.new()
	local self = setmetatable({}, Keyboard)
	self.keysDown = {}
	return self
end

function Keyboard:update(dt)
	-- Could handle key repeat, etc.
end

function Keyboard:keypressed(key, scancode, isrepeat)
	self.keysDown[key] = true
end

function Keyboard:keyreleased(key, scancode)
	self.keysDown[key] = false
end

function Keyboard:isDown(key)
	return self.keysDown[key] or false
end

return Keyboard
