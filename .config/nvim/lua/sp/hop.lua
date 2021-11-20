M = {}

function M.get_window_context()
	-- get a bunch of information about the window and the cursor
	local win_info = vim.fn.getwininfo(vim.api.nvim_get_current_win())[1]
	local win_view = vim.fn.winsaveview()
	local top_line = win_info.topline - 1
	local bot_line = win_info.botline
	local cursor_pos = vim.api.nvim_win_get_cursor(0)

	-- NOTE: due to an (unknown yet) bug in neovim, the sign_width is not correctly reported when shifting the window
	-- view inside a non-wrap window, so we can’t rely on this; for this reason, we have to implement a weird hack that
	-- is going to disable the signs while hop is running (I’m sorry); the state is restored after jump
	-- local left_col_offset = win_info.variables.context.number_width + win_info.variables.context.sign_width
	local win_width = nil

	-- hack to get the left column offset in nowrap
	if not vim.wo.wrap then
		vim.api.nvim_win_set_cursor(0, { cursor_pos[1], 0 })
		local left_col_offset = vim.fn.wincol() - 1
		vim.fn.winrestview(win_view)
		win_width = win_info.width - left_col_offset
	end

	return {
		cursor_pos = cursor_pos,
		top_line = top_line,
		bot_line = bot_line,
		win_width = win_width,
		col_offset = win_view.leftcol,
	}
end

-- Regex by searching a pattern.
function M.regex_by_searching(pat, plain_search)
	if plain_search then
		pat = vim.fn.escape(pat, "\\/.$^~[]")
	end
	return {
		oneshot = false,
		match = function(s)
			return vim.regex(pat):match_str(s)
		end,
	}
end

-- Word regex.
function M.regex_by_word_start()
	return M.regex_by_searching("\\k\\+")
end

return M
