--[[
	Output a new Map from merging all the keys in the Map arguments in left-to-right order.

	The None symbol can be used to remove existing elements.

	@param ... any number of tables
]]
local Dash = script.Parent.Parent
local Types = require(Dash.Types)
local assign = require(Dash.Maps.assign)

local function join<Key, Value>(...: Types.Map<Key, Value>): Types.Map<Key, Value>
	return assign({}, ...)
end

return join
