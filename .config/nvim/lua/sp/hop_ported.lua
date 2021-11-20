M = {}

-- Word regex.
function M.regex_by_word_start()
	local pat = "\\k\\+"
	return {
		oneshot = false,
		match = function(s)
			return vim.regex(pat):match_str(s)
		end,
	}
end

return M
