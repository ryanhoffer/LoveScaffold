-- Main Love2D entry point
local Camera = require('src.camera.Camera')
local Game = require('src.game.Game')
local GameState = require('src.game.GameState')
local InputManager = require('src.input.InputManager')
local Keyboard = require('src.input.Keyboard')
local Mouse = require('src.input.Mouse')
local helpers = require('src.utils.helpers')

local camera, game, inputManager

function love.load()
	camera = Camera.new(0, 0, 1)
	game = Game.new()
	inputManager = InputManager.new()
end

function love.update(dt)
	inputManager:update(dt)
	game:update(dt, inputManager)
	camera:update(dt, game.player)
end

function love.draw()
	camera:attach()
	game:draw()
	camera:detach()
end

function love.keypressed(key, scancode, isrepeat)
	inputManager:keypressed(key, scancode, isrepeat)
end

function love.keyreleased(key, scancode)
	inputManager:keyreleased(key, scancode)
end

function love.mousepressed(x, y, button, istouch, presses)
	inputManager:mousepressed(x, y, button, istouch, presses)
end

function love.mousereleased(x, y, button, istouch, presses)
	inputManager:mousereleased(x, y, button, istouch, presses)
end
