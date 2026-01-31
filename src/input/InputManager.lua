local Keyboard = require('src.input.Keyboard')
local Mouse = require('src.input.Mouse')

local InputManager = {}
InputManager.__index = InputManager

function InputManager.new()
	local self = setmetatable({}, InputManager)
	self.keyboard = Keyboard.new()
	self.mouse = Mouse.new()
	return self
end

function InputManager:update(dt)
	self.keyboard:update(dt)
	self.mouse:update(dt)
end

function InputManager:keypressed(key, scancode, isrepeat)
	self.keyboard:keypressed(key, scancode, isrepeat)
end

function InputManager:keyreleased(key, scancode)
	self.keyboard:keyreleased(key, scancode)
end

function InputManager:mousepressed(x, y, button, istouch, presses)
	self.mouse:mousepressed(x, y, button, istouch, presses)
end

function InputManager:mousereleased(x, y, button, istouch, presses)
	self.mouse:mousereleased(x, y, button, istouch, presses)
end

return InputManager
