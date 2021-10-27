
local function nmap(key, action)
    vim.api.nvim_set_keymap('n', key, action, {})
end

return function()
    vim.g.vim_better_default_fold_key_mapping = 0
    vim.g.vim_better_default_file_key_mapping = 0
    vim.g.vim_better_default_basic_key_mapping = 0
    vim.g.vim_better_default_buffer_key_mapping = 1
    vim.g.vim_better_default_window_key_mapping = 1

end
