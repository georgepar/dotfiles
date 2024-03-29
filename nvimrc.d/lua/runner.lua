local log = require("log")

local M = {}

local term

if vim.fn.getenv("NVIM_RUNNING_FIRST_TIME_SETUP") == vim.NIL then
	term = require("toggleterm.terminal").Terminal
else
	M.run_code = function() end
end

-- Currently supported languages,
-- filetype → binary to execute
local languages = {
	vlang = "v",
	lua = "lua",
	ruby = "ruby",
	python = "python3",
	javascript = "node",
	typescript = "ts-node",
}

-- start_repl starts a REPL for the current filetype, e.g. a Python file
-- will open a Python3 REPL
M.start_repl = function()
	local filetype = vim.bo.filetype
	local repl_cmd = languages[filetype]

	local opened_repl, err = pcall(function()
		if repl_cmd then
			local repl = term:new({ cmd = repl_cmd, hidden = true })
			repl:open()
		else
			log.error(
				"There is no REPL for " .. filetype .. ". Maybe it is not yet supported in the Doom runner plugin?"
			)
		end
	end)

	if not opened_repl then
		log.error("Error while trying to opening a repl for " .. filetype .. ". Traceback:\n" .. err)
	end
end

-- run_code runs the current file
M.run_code = function()
	local filetype = vim.bo.filetype
	local lang_bin = languages[filetype]

	local run_code, err = pcall(function()
		if lang_bin then
			local runner = term:new({
				cmd = lang_bin .. " " .. vim.fn.expand("%"),
				hidden = true,
				close_on_exit = false,
			})
			runner:open()
		else
			log.error(
				"There is no available executable for "
					.. filetype
					.. ". Maybe it is not yet supported in the Doom runner plugin?"
			)
		end
	end)

	if not run_code then
		log.error("Error while trying to run the current file. Traceback:\n" .. err)
	end
end

return M
