return function ()
    require('which-key').register({
        ['f'] = {
            name = '+find',
            ['b'] = { ':Clap buffers<cr>', 'buffers' },
            ['f'] = { ':Clap files<cr>', 'files' },
            ['c'] = { ':Clap commits<cr>', 'commits' },
            ['C'] = { ':Clap bcommits<cr>', 'buffer-commits' },
            ['l'] = { ':Clap lines<cr>', 'lines' },
            ['L'] = { ':Clap blines<cr>', 'buffer-lines' },
            ['x'] = { ':Clap command_history<cr>', 'command-history' },
            ['/'] = { ':Clap grep2<cr>', 'grep' },
            ['y'] = { ':Clap yanks<cr>', 'recent-yanks' },
            ['h'] = { ':Clap history<cr>', 'recent-files' },
            ['H'] = { ':Clap search_history<cr>', 'search-history' },
            ['g'] = { ':Clap gfiles<cr>', 'git-files' },
            ['G'] = { ':Clap git_diff_files<cr>', 'git-modified-files' },
        },
    }, {prefix="<leader>"})

end
