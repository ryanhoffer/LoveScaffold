-- Simple class implementation for Lua
local function class(base)
	local c = {}    
	if type(base) == 'table' then
		for k, v in pairs(base) do c[k] = v end
		c._base = base
	end
	c.__index = c
	function c:new(...)
		local instance = setmetatable({}, c)
		if instance.init then instance:init(...) end
		return instance
	end
	return c
end

return class
