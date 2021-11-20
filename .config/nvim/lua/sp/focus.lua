local focus_position = function(word)
	local nchars = word:len()

	local focus_pos = 1
	if nchars <= 2 then
		focus_pos = 1
	elseif nchars <= 5 then
		focus_pos = 2
	elseif nchars <= 9 then
		focus_pos = 3
	elseif nchars <= 13 then
		focus_pos = 4
	else
		focus_pos = 5
	end

	return focus_pos
end

local string_meta = getmetatable("")

function string_meta:__index(key)
	local val = string[key]
	if val then
		return val
	elseif tonumber(key) then
		return self:sub(key, key)
	else
		error(
			"attempt to index a string value with bad key ('" .. tostring(key) .. "' is not part of the string library)",
			2
		)
	end
end

local test = function()
	local word = io.read()
	print(word[focus_position(word)])
end

test()
