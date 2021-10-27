function nmap(t)
    setmetatable(t, {__index={noremap=true, silent=false}})
    local key, action, noremap, silent =
    t[1] or t.key,
    t[2] or t.action,
    t[3] or t.noremap,
    t[4] or t.silent
    vim.api.nvim_set_keymap('n', key, action, { noremap = noremap, silent = silent })
end


return function()
    local wk = require("which-key")

    wk.setup({
        plugins = {
            marks = false,
            registers = false,
            presets = {
                operators = false,
                motions = true,
                text_objects = true,
                windows = true,
                nav = true,
                z = true,
                g = true,
            },
        },
        operators = {
            d = "Delete",
            c = "Change",
            y = "Yank (copy)",
            ["g~"] = "Toggle case",
            ["gu"] = "Lowercase",
            ["gU"] = "Uppercase",
            [">"] = "Indent right",
            ["<lt>"] = "Indent left",
            ["zf"] = "Create fold",
            ["!"] = "Filter though external program",
        },
        icons = {
            breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
            separator = "➜", -- symbol used between a key and it's label
            group = "+", -- symbol prepended to a group
        },
        key_labels = {
            ["<space>"] = "SPC",
            ["<cr>"] = "RET",
            ["<tab>"] = "TAB",
        },
        window = {
            padding = { 0, 0, 0, 0 }, -- extra window padding [top, right, bottom, left]
        },
        layout = {
            height = { min = 1, max = 10 }, -- min and max height of the columns
            spacing = 3,
            align = "left",
        },
        hidden = {
            "<silent>",
            "<Cmd>",
            "<cmd>",
            "<Plug>",
            "call",
            "lua",
            "^:",
            "^ ",
        }, -- hide mapping boilerplate
        show_help = true, -- show help message on the command line when the popup is visible
        triggers = "auto", -- automatically setup triggers
    })

    local mappings = {
        ['q'] = {
            name = "+quit",
            ['q'] = { ':qa!<cr>', 'quit-all'},
            ['w'] = { ':wqa!<cr>', 'write-quit-all'}
        },
        ['/'] = {
            name = "+comment",
            ['/'] = { ':Commentary<cr>', 'comment-line'},
        --     ['.'] = { 'gc', 'comment-verb'},
        --     ['1'] = { 'gc1j', 'comment-one-line-down' },
        --     ['2'] = { 'gc2j', 'comment-two-lines-down' },
        --     ['3'] = { 'gc3j', 'comment-three-lines-down' },
        --     ['4'] = { 'gc4j', 'comment-four-lines-down' },
        --     ['5'] = { 'gc5j', 'comment-five-lines-down' },
        --     ['6'] = { 'gc6j', 'comment-six-lines-down' },
        --     ['7'] = { 'gc7j', 'comment-seven-lines-down' },
        --     ['8'] = { 'gc8j', 'comment-eight-lines-down' },
        --     ['9'] = { 'gc9j', 'comment-nine-lines-down' },
        --     ['0'] = { 'gc10j', 'comment-ten-lines-down' },
        },
        ['p'] = { ':setlocal paste!<cr>', 'set-paste' },
        ['t'] = { ':ToggleTerm<cr>', 'terminal' },
        ['r'] = { '<cmd>lua require("runner").run_code()<CR>', "run-code" },
        -- ['f'] = {
        --     name = '+find',
        --     ['b'] = { ':Clap buffers<cr>', 'buffers' },
        --     ['f'] = { ':Clap files<cr>', 'files' },
        --     ['c'] = { ':Clap commits<cr>', 'commits' },
        --     ['C'] = { ':Clap bcommits<cr>', 'buffer-commits' },
        --     ['l'] = { ':Clap lines<cr>', 'lines' },
        --     ['L'] = { ':Clap blines<cr>', 'buffer-lines' },
        --     ['x'] = { ':Clap command_history<cr>', 'command-history' },
        --     ['/'] = { ':Clap grep2<cr>', 'grep' },
        --     ['y'] = { ':Clap yanks<cr>', 'recent-yanks' },
        --     ['h'] = { ':Clap history<cr>', 'recent-files' },
        --     ['H'] = { ':Clap search_history<cr>', 'search-history' },
        --     ['g'] = { ':Clap gfiles<cr>', 'git-files' },
        --     ['G'] = { ':Clap git_diff_files<cr>', 'git-modified-files' },
        -- },
        ['g'] = {
            name = '+git',
            ['g'] = { ':Neogit<cr>', 'neogit' },
            ['d'] = { ':DiffviewOpen<cr>', 'git-diff' },
            ['D'] = { ':DiffviewOpen master<cr>', 'git-diff-master' },
            ['l'] = { ':Neogit log<cr>', 'git-log' },
            ['p'] = { ':Neogit pull<cr>', 'git-pull' },
            ['P'] = { ':Neogit push<cr>', 'git-push' },

        }
    }


    wk.register(mappings, { prefix = "<leader>" })
end
