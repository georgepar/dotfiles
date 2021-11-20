-- Highlight letters based on spritz speed-reading focal points
--
-- Attribution:
-- Most of the code is frankenstein-ed together based on hop.nvim code.
-- https://github.com/phaazon/hop.nvim

M = {}

local function regex_by_word_start()
	local pat = "\\k\\+"
	return {
		oneshot = false,
		match = function(s)
			return vim.regex(pat):match_str(s)
		end,
	}
end

local function word_focus_column_position(wbegin, wend)
	local nchars = wend - wbegin
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
	return wbegin + focus_pos - 1
end

local function find_word_positions_in_line(word_positions, regex, line_nr, line)
	local end_index = nil
	end_index = vim.fn.strdisplaywidth(line)
	local shifted_line = line:sub(1, vim.fn.byteidx(line, end_index))
	local col = 1
	while true do
		local s = shifted_line:sub(col)
		local b, e = regex.match(s)

		if b == nil or (b == 0 and e == 0) then
			break
		end
		local wbegin = math.max(1, col + b)
		local wend = col + e
		local focus = word_focus_column_position(wbegin, wend)
		word_positions[#word_positions + 1] = {
			line = line_nr,
			word_start = wbegin,
			word_end = wend,
			focus_position = focus,
			window = 0,
		}
		col = col + e
	end
end

local function find_word_positions()
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	local word_positions = {}
	local regex = regex_by_word_start()

	find_word_positions_in_line(word_positions, regex, 1, lines[1])
	for i = 2, #lines do
		find_word_positions_in_line(word_positions, regex, i, lines[i])
	end
	return word_positions
end

local function get_focus_points()
	local words = find_word_positions()
	local focus = {}
	for i = 1, #words do
		focus[#focus + 1] = {
			s = words[i].focus_position,
			e = words[i].focus_position + 1,
			line = words[i].line,
		}
	end
	return focus
end

function M.highlight_focus_points()
	local ns_id = vim.api.nvim_create_namespace("SpeedReadSpritz")
	local focus_points = get_focus_points()
	for i = 1, #focus_points do
		local foc = focus_points[i]

		vim.api.nvim_buf_set_extmark(0, ns_id, foc.line - 1, foc.s - 1, {
			end_col = foc.e - 1,
			hl_group = "SpeedReadSpritz",
		})
	end

	-- vim.api.nvim_command("highlight default SpeedReadSpritz gui=bold ctermfg=198 cterm=bold")
	vim.api.nvim_command("highlight default SpeedReadSpritz gui=bold cterm=bold")
end

M.highlight_focus_points()

return M
