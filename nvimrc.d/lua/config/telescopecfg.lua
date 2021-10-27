return function ()
    require('which-key').register({
        ['f'] = {
            name = '+find',
            ['B'] = { ':Telescope buffers<cr>', 'buffers' },
            ['b'] = { ':Telescope current_buffer_fuzzy_find<cr>', 'current-buffer' },
            ['m'] = { ':Telescope man_pages<cr>', 'man-pages' },
            ['f'] = { ':Telescope find_files<cr>', 'files' },
            ['F'] = { ':Telescope file_browser<cr>', 'file-browser' },
            ['c'] = { ':Telescope git_commits<cr>', 'commits' },
            ['C'] = { ':Telescope git_bcommits<cr>', 'buffer-commits' },
            ['s'] = { ':Telescope git_status<cr>', 'modified-files' },
            ['t'] = { ':Telescope treesitter<cr>', 'treesitter' },
            ['l'] = {
                name = "+lsp",
                ['r'] = { ':Telescope lsp_references<cr>', 'references' },
                ['s'] = { ':Telescope lsp_document_symbols<cr>', 'document-symbols' },
                ['S'] = { ':Telescope lsp_workspace_symbols<cr>', 'workspace-symbols' },
                ['a'] = { ':Telescope lsp_code_actions<cr>', 'code-actions' },
                ['e'] = { ':Telescope lsp_document_diagnostics<cr>', 'document-diagnostics' },
                ['E'] = { ':Telescope lsp_workspace_diagnostics<cr>', 'workspace-diagnostics' },
                ['i'] = { ':Telescope lsp_implementations<cr>', 'implementations' },
                ['d'] = { ':Telescope lsp_definitions<cr>', 'definitions' },
                ['D'] = { ':Telescope lsp_type_definitions<cr>', 'type-definitions' },

            },
            ['x'] = { ':Telescope command_history<cr>', 'command-history' },
            ['/'] = { ':Telescope live_grep<cr>', 'grep' },
            ['y'] = { ':Telescope registers<cr>', 'recent-yanks' },
            ['H'] = { ':Telescope help_tags<cr>', 'recent-files' },
            ['h'] = { ':Telescope search_history<cr>', 'search-history' },
            ['g'] = { ':Telescope git_files<cr>', 'git-files' },
        },
    }, {prefix="<leader>"})

end
