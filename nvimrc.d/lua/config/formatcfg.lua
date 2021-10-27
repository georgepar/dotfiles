return function()
	local fmt = string.format
	require("format").setup({
		["*"] = {
			-- remove trailing whitespaces
			{
				cmd = {
					"sed -i 's/[ \t]*$//'",
				},
			},
		},
		lua = {
			{
				cmd = {
					function(file)
						return fmt("stylua %s", file)
					end,
				},
			},
		},
		python = {
			{
				cmd = {
					function(file)
						return fmt("black %s", file)
					end,
					function(file)
						return fmt("isort %s", file)
					end,
				},
			},
		},
		go = {
			{
				cmd = {
					"gofmt -w",
					"goimports -w",
				},
				tempfile_postfix = ".tmp",
			},
		},
		typescript = {
			{
				cmd = { "prettier -w --parser typescript" },
			},
		},
		html = {
			{
				cmd = { "prettier -w --parser html" },
			},
		},
		markdown = {
			{
				cmd = { "prettier -w --parser markdown" },
			},
			{
				cmd = {
					"black",
				},
				start_pattern = "^```python$",
				end_pattern = "^```$",
				target = "current",
			},
		},
		css = {
			{
				cmd = { "prettier -w --parser css" },
			},
		},
		scss = {
			{
				cmd = { "prettier -w --parser scss" },
			},
		},
		json = {
			{
				cmd = { "prettier -w --parser json" },
			},
		},
		toml = {
			{
				cmd = { "prettier -w --parser toml" },
			},
		},
		yaml = {
			{
				cmd = { "prettier -w --parser yaml" },
			},
		},
	})
end
