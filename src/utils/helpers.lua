local helpers = {}

function helpers.clamp(val, min, max)
	if val < min then return min end
	if val > max then return max end
	return val
end

return helpers
