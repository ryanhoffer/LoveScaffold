# 💚 LoveScaffold

> A modular Love2D project starter with scene management, camera, input, and more.

## 🚀 Getting Started

1. **Install [LÖVE](https://love2d.org/)**
2. **Run the game:**

	 ```sh
	 love .
	 ```

## 📁 Project Structure

```
src/
	camera/         -- Camera system
	entities/       -- Game entities (Player, etc.)
	game/           -- Core game logic
	input/          -- Input management
	libs/           -- Utility libraries
	scenes/         -- Individual scenes (Menu, Game, etc.)
	utils/          -- Helper functions
assets/           -- Images, sounds, etc.
main.lua          -- Entry point
conf.lua          -- LÖVE configuration
```

## ✨ Features

- Scene management (menu, game, etc.)
- Camera system
- Keyboard & mouse input
- Modular code structure
- Toggleable debug window (default key: F12, configurable in conf.lua)

### Debug Window

- Press the debug key (default: F12) to toggle the debug window in any scene.
- To change the key, edit the `DEBUG_WINDOW_KEY` variable in `conf.lua`.

## 🌱 Future Ideas

- Save/load system
- Pause menu and settings
- Gamepad/controller support
- Particle effects and animations
- Sound/music manager
- Level editor integration
- Online high scores or multiplayer

---

Made with ❤️ using [LÖVE](https://love2d.org/)