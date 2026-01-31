-- src/utils/DebugWindow.lua
local DebugWindow = {}
DebugWindow.isVisible = false
DebugWindow.lines = {}

function DebugWindow:toggle()
    self.isVisible = not self.isVisible
end

function DebugWindow:print(line)
    table.insert(self.lines, line)
    local maxLines = _G.DEBUG_WINDOW_MAX_LINES or 10
    if #self.lines > maxLines then
        table.remove(self.lines, 1)
    end
end

function DebugWindow:clear()
    self.lines = {}
end

function DebugWindow:draw()
    if not self.isVisible then return end
    love.graphics.setColor(0, 0, 0, 0.5)
    love.graphics.rectangle('fill', 10, 10, 300, 20 + 18 * #self.lines)
    love.graphics.setColor(1, 1, 1, 1)
    for i, line in ipairs(self.lines) do
        love.graphics.print(line, 20, 20 + (i-1) * 18)
    end
end

return DebugWindow
