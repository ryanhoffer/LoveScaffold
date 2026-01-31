-- src/utils/debug.lua
local DebugWindow = require('src.utils.DebugWindow')

local debug = {}
debug._lines = {}

debug.enabled = true

function debug.print(line)
    table.insert(debug._lines, line)
end

function debug.clear()
    debug._lines = {}
end

function debug.flush()
    if DebugWindow.isVisible then
        DebugWindow:clear()
        for _, line in ipairs(debug._lines) do
            DebugWindow:print(line)
        end
    end
    debug.clear()
end

return debug
