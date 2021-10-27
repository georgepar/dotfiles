local map = vim.api.nvim_set_keymap
map('n', 'Q', 'q', { noremap = true})
map('n', 'q', '<Nop>', { noremap = true})
map('n', 'qq', ':q<CR>', { noremap = true, silent = true })
map('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
map('n', 'wq', ':wqa!<CR>', { noremap = true, silent = true })
map('n', ',v', ':vs<space>', { noremap = true})
map('n', ',b', ':tabnew<space>', { noremap = true})
map('n', ',n', ':split<space>', { noremap = true})
map('n', 'H', '^', { noremap = true})
map('n', 'L', '$', { noremap = true})
map('n', 'U', '<C-r>', { noremap = true})
-- map('n','<C-t>',':NvimTreeToggle<CR>', { noremap = true})

map("i", "<Tab>", [[pumvisible() ? '<C-n>' : '<Tab>']], {silent = true, expr = true}) -- next selection on autocomplete menu
map("i", "<S-Tab>", [[pumvisible() ? '<C-p>' : '<S-Tab>']], {silent = true, expr = true}) -- previous selection on autocomplete menu

map('i', '<M-h>', '<Left>', { noremap = true })
map('i', '<M-l>', '<Right>', { noremap = true })
map('i', '<M-j>', '<Down>', { noremap = true })
map('i', '<M-k>', '<Up>', { noremap = true })
map('i', '<C-a>', '<Home>', { noremap = true })
map('i', '<C-e>', '<End>', { noremap = true })
map('n', '<C-F>', 'za', { noremap = true })

map('c', '<M-h>', '<Left>', { noremap = true })
map('c', '<M-l>', '<Right>', { noremap = true })
map('c', '<M-j>', '<Down>', { noremap = true })
map('c', '<M-k>', '<Up>', { noremap = true })
map('c', '<C-a>', '<Home>', { noremap = true })
map('c', '<C-e>', '<End>', { noremap = true })


map('v', 'v', '<Esc>', { noremap = true })
map('i', 'kj', '<Esc><Right>', { noremap = true })
map('i', 'jk', '<Esc><Right>', { noremap = true })
map('c', 'kj', '<C-c>', { noremap = true })
map('c', 'jk', '<C-c>', { noremap = true })
