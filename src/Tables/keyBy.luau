--[[
	Assigns values in the _input_ Table by their _getKey_ value.

	If _getKey_ is a function, it is called with each `(child, key)` entry and uses the return
	value as the corresponding key to assign to in the result Table. Otherwise, the _getKey_ value
	is used directly as the key itself.
]]

local Dash = script.Parent.Parent
local collect = require(Dash.Tables.collect)

export type KeyByHandler<Key, Value, NewKey> = (Value, Key) -> NewKey

local function keyBy<Key, Value, NewKey>(input: { [Key]: Value }, getKey: KeyByHandler<Key, Value, NewKey> | NewKey): { [NewKey]: Value }
	return collect(input, function(key, child)
		local newKey
		if typeof(getKey) == "function" then
			newKey = getKey(child, key)
		else
			newKey = child[getKey]
		end
		return newKey, child
	end)
end
return keyBy
