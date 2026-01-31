
local Camera = require('src.camera.Camera')
local Game = require('src.game.Game')
local GameState = require('src.game.GameState')
local InputManager = require('src.input.InputManager')
local Keyboard = require('src.input.Keyboard')
local Mouse = require('src.input.Mouse')
local helpers = require('src.utils.helpers')
local SceneManager = require('src.game.SceneManager')
local MenuScene = require('src.scenes.MenuScene')
local GameScene = require('src.scenes.GameScene')

local sceneManager, menuScene, gameScene

function love.load()
	sceneManager = SceneManager.new()
	gameScene = GameScene.new()
	menuScene = MenuScene.new(sceneManager, gameScene)
	sceneManager:switch(menuScene)
end

function love.update(dt)
	if sceneManager.current and sceneManager.current.update then
		sceneManager.current:update(dt)
	end
end

function love.draw()
	if sceneManager.current and sceneManager.current.draw then
		sceneManager.current:draw()
	end
end

function love.keypressed(key, scancode, isrepeat)
	if sceneManager.current and sceneManager.current.keypressed then
		sceneManager.current:keypressed(key, scancode, isrepeat)
	end
end

function love.keyreleased(key, scancode)
	if sceneManager.current and sceneManager.current.keyreleased then
		sceneManager.current:keyreleased(key, scancode)
	end
end

function love.mousepressed(x, y, button, istouch, presses)
	if sceneManager.current and sceneManager.current.mousepressed then
		sceneManager.current:mousepressed(x, y, button, istouch, presses)
	end
end

function love.mousereleased(x, y, button, istouch, presses)
	if sceneManager.current and sceneManager.current.mousereleased then
		sceneManager.current:mousereleased(x, y, button, istouch, presses)
	end
end
