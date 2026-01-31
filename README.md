
# 💚 LoveScaffold

> A modular, extensible Love2D project starter with scene management, camera, input, debug window, and more.

---

## 🚀 Getting Started

1. **Install [LÖVE](https://love2d.org/)**
2. **Clone or download this repository.**
3. **Run the game:**

	```sh
	love .
	```

---

## 📁 Project Structure

```
src/
  camera/         -- Camera system (Camera.lua)
  entities/       -- Game entities (Player, etc.)
  game/           -- Core game logic (Game.lua, GameState.lua, SceneManager.lua)
  input/          -- Input management (Keyboard.lua, Mouse.lua, InputManager.lua)
  libs/           -- Utility libraries (e.g., class.lua)
  scenes/         -- Individual scenes (MenuScene.lua, GameScene.lua)
  utils/          -- Helper functions and debug (helpers.lua, DebugWindow.lua, debug.lua)
assets/           -- Images, sounds, etc.
main.lua          -- Entry point
conf.lua          -- LÖVE configuration and debug keybind
README.md         -- Project documentation
```

---

## ✨ Features

- Scene management (menu, game, etc.)
- Camera system with smooth following
- Keyboard & mouse input abstraction
- Modular, organized code structure
- Toggleable debug window (default key: F12, configurable in conf.lua)
- Easily extensible for new features

---

## 🐞 Debug Window

The project includes a built-in debug window for real-time diagnostics and development.

### Usage

- **Toggle the debug window:** Press the debug key (default: F12) in any scene.
- **Display custom info:** Use `debug.print("Your info")` from anywhere in your code. All lines are shown in the debug window for the current frame.
- **Flush debug info:** The system automatically flushes and displays all debug lines each frame.

### What’s Displayed

In the game scene, the debug window shows:

- Player position (X, Y)
- Player velocity (VX, VY)
- Current scene name
- FPS (frames per second)
- Number of entities
- Camera position and zoom
- Input states (keys currently pressed)
- Game state (e.g., playing, menu)
- Lua memory usage (MB)

In the menu scene, it shows:

- Scene name
- FPS
- Lua memory usage


### Customization

- To add more debug info, call `debug.print()` in any update or draw function.
- To change the debug key, edit the `DEBUG_WINDOW_KEY` variable in `conf.lua` (e.g., `DEBUG_WINDOW_KEY = "f1"`).
- To change how many lines the debug window displays, set `DEBUG_WINDOW_MAX_LINES` in `conf.lua` (e.g., `DEBUG_WINDOW_MAX_LINES = 20`).

---

## ⚙️ Configuration

All configuration is handled in `conf.lua`:

- Window title, size, vsync, etc.
- Debug window keybind: `DEBUG_WINDOW_KEY`

Example:

```lua
function love.conf(t)
    t.window.title = "My Love2D Game"
    t.window.width = 1280
    t.window.height = 720
    t.window.resizable = false
    t.window.vsync = 1
end

DEBUG_WINDOW_KEY = "f12"
DEBUG_WINDOW_MAX_LINES = 20
```

---

## 🧩 Extending the Project

- Add new scenes in `src/scenes/` and register them with the scene manager.
- Add new entities in `src/entities/` and manage them in `Game.lua`.
- Add new input types or helpers in `src/input/` or `src/utils/`.
- Use the debug window for rapid prototyping and diagnostics.

---

## 📝 Code Style & Conventions

- Organized by feature (scenes, entities, input, etc.)
- Use `require` for modularity
- Prefer `update(dt)` and `draw()` methods for all objects
- Use the debug window for all runtime diagnostics

---

## ❓ FAQ

**How do I add my own debug info?**

Call `debug.print("Some value: " .. tostring(val))` in any update or draw function. It will appear in the debug window for that frame.

**How do I change the debug key?**

Edit `DEBUG_WINDOW_KEY` in `conf.lua`.

**Can I use this for commercial projects?**

Yes! This scaffold is MIT-licensed and free to use.

---

## 🌱 Future Ideas

- Save/load system
- Pause menu and settings
- Gamepad/controller support
- Particle effects and animations
- Sound/music manager
- Gravity and Physics System

---

Made with ❤️ using [LÖVE](https://love2d.org/)