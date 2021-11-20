-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = true
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/geopar/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/geopar/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/geopar/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/geopar/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/geopar/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["better-escape.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0026\3\6\0009\3\a\0039\3\b\3=\3\t\2B\0\2\1K\0\1\0\ftimeout\15timeoutlen\6o\bvim\fmapping\1\0\2\tkeys\n<Esc>\22clear_empty_lines\1\1\3\0\0\ajk\akj\nsetup\18better_escape\frequire\0" },
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/better-escape.nvim",
    url = "https://github.com/max397574/better-escape.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n/\0\1\5\0\4\0\0056\1\0\0009\1\1\1'\3\2\0009\4\3\0D\1\3\0\aid\a%s\vformat\vstring�\1\0\4\14\0\a\0\21'\4\0\0006\5\1\0\18\a\2\0B\5\2\4H\b\r�\a\b\2\0X\n\2�'\n\3\0X\v\5�\a\b\4\0X\n\2�'\n\5\0X\v\1�'\n\6\0\18\v\4\0\18\f\t\0\18\r\n\0&\4\r\vF\b\3\3R\b�L\4\2\0\n  \n  \fwarning\n  \nerror\npairs\6 E\0\1\2\0\4\0\t6\1\0\0009\1\1\0018\1\0\0019\1\2\1\6\1\3\0X\1\2�+\1\2\0L\1\2\0K\0\1\0\14dashboard\rfiletype\abo\bvim�\5\1\0\6\0\15\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\r\0005\3\4\0003\4\3\0=\4\5\0033\4\6\0=\4\a\0033\4\b\0=\4\t\0034\4\3\0005\5\n\0>\5\1\0045\5\v\0>\5\2\4=\4\f\3=\3\14\2B\0\2\1K\0\1\0\foptions\1\0\0\foffsets\1\0\3\rfiletype\vpacker\15text_align\vcenter\ttext\20Plugins manager\1\0\3\rfiletype\fOutline\15text_align\vcenter\ttext\fSymbols\18custom_filter\0\26diagnostics_indicator\0\fnumbers\1\0\19\25enforce_regular_tabs\2\16diagnostics\rnvim_lsp\rtab_size\3\25\22max_prefix_length\3\15\20max_name_length\3\20\fsort_by\14directory\23right_trunc_marker\b\22left_trunc_marker\b\15close_icon\5\18modified_icon\b●\22buffer_close_icon\5\19indicator_icon\b▎\27always_show_bufferline\1\20separator_style\nthick\24persist_buffer_sort\2\24show_tab_indicators\2\20show_close_icon\1\28show_buffer_close_icons\1\22show_buffer_icons\2\0\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-latex-symbols"] = {
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/cmp-latex-symbols",
    url = "https://github.com/kdheepak/cmp-latex-symbols"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\n�\14\0\0\6\0\25\00015\0\0\0006\1\1\0009\1\2\0015\2\4\0=\2\3\0016\1\1\0009\1\2\1'\2\6\0=\2\5\0016\1\1\0009\1\a\1'\3\b\0009\4\t\0&\3\4\3B\1\2\0016\1\1\0009\1\a\1'\3\n\0009\4\v\0&\3\4\3B\1\2\0016\1\1\0009\1\a\1'\3\f\0009\4\r\0&\3\4\3B\1\2\0016\1\1\0009\1\a\1'\3\14\0009\4\15\0&\3\4\3B\1\2\0016\1\16\0'\3\17\0B\1\2\0029\1\18\0016\3\16\0'\5\19\0B\3\2\0029\3\20\0039\3\21\0035\4\22\0B\1\3\0016\1\1\0009\1\2\0015\2\24\0=\2\23\1K\0\1\0\1\0\b\14find_file\fSPC s o\rnew_file\fSPC s n\17find_history\fSPC s h\23change_colorscheme\fSPC s c\30Current directory_session\fSPC s l\15book_marks\fSPC s b\17last_session\fSPC s L\14find_word\fSPC s /\30dashboard_custom_shortcut\1\0\1\vprefix\r<leader>\14dashboard\rleaderkm\vkeymap\rregister\14which-key\frequire\17footer_color!hi! dashboardFooter   guifg=\19shortcut_color!hi! dashboardShortcut guifg=\17center_color!hi! dashboardCenter   guifg=\17header_color!hi! dashboardHeader   guifg=\bcmd\14telescope dashboard_default_executive\1\b\0\0�\1███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗�\1████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║�\1██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║�\1██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║�\1██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║�\1██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║�\1╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝\28dashboard_custom_header\6g\bvim\1\0\4\19shortcut_color\f#a9a1e1\17center_color\f#51afef\17footer_color\f#586268\17header_color\f#581298\0" },
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/dashboard-nvim",
    url = "https://github.com/glepnir/dashboard-nvim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["doom-one.vim"] = {
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/doom-one.vim",
    url = "https://github.com/romgrk/doom-one.vim"
  },
  ["format.nvim"] = {
    config = { "\27LJ\2\n#\0\1\5\1\1\0\4-\1\0\0'\3\0\0\18\4\0\0D\1\3\0\0�\14stylua %s\"\0\1\5\1\1\0\4-\1\0\0'\3\0\0\18\4\0\0D\1\3\0\0�\rblack %s\"\0\1\5\1\1\0\4-\1\0\0'\3\0\0\18\4\0\0D\1\3\0\0�\risort %s�\a\1\0\b\0-\0\\6\0\0\0009\0\1\0006\1\2\0'\3\1\0B\1\2\0029\1\3\0015\3\a\0004\4\3\0005\5\5\0005\6\4\0=\6\6\5>\5\1\4=\4\b\0034\4\3\0005\5\n\0004\6\3\0003\a\t\0>\a\1\6=\6\6\5>\5\1\4=\4\v\0034\4\3\0005\5\14\0004\6\3\0003\a\f\0>\a\1\0063\a\r\0>\a\2\6=\6\6\5>\5\1\4=\4\15\0034\4\3\0005\5\17\0005\6\16\0=\6\6\5>\5\1\4=\4\18\0034\4\3\0005\5\20\0005\6\19\0=\6\6\5>\5\1\4=\4\21\0034\4\3\0005\5\23\0005\6\22\0=\6\6\5>\5\1\4=\4\24\0034\4\3\0005\5\26\0005\6\25\0=\6\6\5>\5\1\0045\5\28\0005\6\27\0=\6\6\5>\5\2\4=\4\29\0034\4\3\0005\5\31\0005\6\30\0=\6\6\5>\5\1\4=\4 \0034\4\3\0005\5\"\0005\6!\0=\6\6\5>\5\1\4=\4#\0034\4\3\0005\5%\0005\6$\0=\6\6\5>\5\1\4=\4&\0034\4\3\0005\5(\0005\6'\0=\6\6\5>\5\1\4=\4)\0034\4\3\0005\5+\0005\6*\0=\6\6\5>\5\1\4=\4,\3B\1\2\0012\0\0�K\0\1\0\tyaml\1\0\0\1\2\0\0\30prettier -w --parser yaml\ttoml\1\0\0\1\2\0\0\30prettier -w --parser toml\tjson\1\0\0\1\2\0\0\30prettier -w --parser json\tscss\1\0\0\1\2\0\0\30prettier -w --parser scss\bcss\1\0\0\1\2\0\0\29prettier -w --parser css\rmarkdown\1\0\3\vtarget\fcurrent\18start_pattern\16^```python$\16end_pattern\n^```$\1\2\0\0\nblack\1\0\0\1\2\0\0\"prettier -w --parser markdown\thtml\1\0\0\1\2\0\0\30prettier -w --parser html\15typescript\1\0\0\1\2\0\0$prettier -w --parser typescript\ago\1\0\1\21tempfile_postfix\t.tmp\1\3\0\0\rgofmt -w\17goimports -w\vpython\1\0\0\0\0\blua\1\0\0\0\6*\1\0\0\bcmd\1\0\0\1\2\0\0\24sed -i 's/[ \t]*$//'\nsetup\frequire\vformat\vstring\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/opt/format.nvim",
    url = "https://github.com/lukas-reineke/format.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n�\6\0\0\5\0\20\0%6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\0029\2\5\0025\3\6\0B\0\3\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\0029\2\a\0025\3\b\0B\0\3\0016\0\0\0'\2\t\0B\0\2\0029\0\n\0005\2\v\0005\3\f\0=\3\r\0025\3\14\0005\4\15\0=\4\16\0035\4\17\0=\4\18\3=\3\19\2B\0\2\1K\0\1\0\fkeymaps\tn [c\1\2\1\0H&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'\texpr\2\tn ]c\1\2\1\0H&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'\texpr\2\1\0\5\to ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\fnoremap\2\17v <leader>grT<cmd>lua require\"gitsigns\".reset_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\17v <leader>gsT<cmd>lua require\"gitsigns\".stage_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\tx ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\28current_line_blame_opts\1\0\3\ndelay\3d\18virt_text_pos\beol\14virt_text\2\1\0\3\23current_line_blame\2\nnumhl\1\15signcolumn\2\nsetup\rgitsigns\1\0\2\vprefix\r<leader>\tmode\6v\14gitvisual\1\0\2\vprefix\r<leader>\tmode\6n\bgit\rleaderkm\vkeymap\rregister\14which-key\frequire\0" },
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["glow.nvim"] = {
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/glow.nvim",
    url = "https://github.com/ellisonleao/glow.nvim"
  },
  ["indentpython.vim"] = {
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/indentpython.vim",
    url = "https://github.com/vim-scripts/indentpython.vim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\nn\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\17handler_opts\1\0\1\vborder\vsingle\1\0\1\tbind\2\nsetup\18lsp_signature\frequire\0" },
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n\\\0\0\5\0\5\1\0156\0\0\0009\0\1\0009\0\2\0006\2\0\0009\2\1\0029\2\3\2'\4\4\0B\2\2\0A\0\0\2\t\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\b%:t\vexpand\nempty\afn\bvim\2G\0\0\3\0\3\0\f6\0\0\0009\0\1\0009\0\2\0)\2\0\0B\0\2\2)\1P\0\0\1\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\rwinwidth\afn\bvim�\1\0\0\6\0\a\0\0276\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0026\1\0\0009\1\1\0019\1\4\1'\3\5\0\18\4\0\0'\5\6\0&\4\5\4B\1\3\2\r\2\1\0X\2\v�\21\2\1\0)\3\0\0\1\3\2\0X\2\4�\21\2\1\0\21\3\0\0\0\2\3\0X\2\2�+\2\1\0X\3\1�+\2\2\0L\2\2\0\6;\t.git\ffinddir\n%:p:h\vexpand\afn\bvimI\0\1\5\1\4\0\b6\1\0\0009\1\1\1-\3\0\0009\3\2\0039\3\3\3\18\4\0\0B\1\3\1K\0\1\0\3�\14lualine_c\rsections\vinsert\ntableI\0\1\5\1\4\0\b6\1\0\0009\1\1\1-\3\0\0009\3\2\0039\3\3\3\18\4\0\0B\1\3\1K\0\1\0\3�\14lualine_x\rsections\vinsert\ntable\19\0\0\1\0\1\0\2'\0\0\0L\0\2\0\b▊�\3\0\0\a\1%\0J5\0\1\0-\1\0\0009\1\0\1=\1\2\0-\1\0\0009\1\3\1=\1\4\0-\1\0\0009\1\5\1=\1\6\0-\1\0\0009\1\5\1=\1\a\0-\1\0\0009\1\5\1=\1\b\0-\1\0\0009\1\t\1=\1\n\0-\1\0\0009\1\0\1=\1\v\0-\1\0\0009\1\f\1=\1\r\0-\1\0\0009\1\f\1=\1\14\0-\1\0\0009\1\15\1=\1\16\0-\1\0\0009\1\17\1=\1\18\0-\1\0\0009\1\17\1=\1\19\0-\1\0\0009\1\0\1=\1\20\0-\1\0\0009\1\0\1=\1\21\0-\1\0\0009\1\22\1=\1\23\0-\1\0\0009\1\22\1=\1\24\0-\1\0\0009\1\22\1=\1\25\0-\1\0\0009\1\0\1=\1\26\0-\1\0\0009\1\0\1=\1\27\0006\1\28\0009\1\29\0019\1\30\1'\3\31\0006\4\28\0009\4 \0049\4!\4B\4\1\0028\4\4\0'\5\"\0-\6\0\0009\6#\6&\3\6\3B\1\2\1'\1$\0L\1\2\0\1�\b\abg\f guibg=\tmode\afn\27hi! LualineMode guifg=\17nvim_command\bapi\bvim\6t\6!\ar?\arm\6r\tcyan\ace\acv\aRv\6R\vviolet\aic\vyellow\6S\6s\vorange\ano\6c\fmagenta\6V\5\6v\tblue\6i\ngreen\6n\1\0\0\bred\18\0\0\1\0\1\0\2'\0\0\0L\0\2\0\a%=�\2\0\0\r\0\14\1&'\0\0\0006\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\4\0B\1\3\0026\2\1\0009\2\5\0029\2\6\2B\2\1\0026\3\a\0\18\5\2\0B\3\2\2\v\3\0\0X\3\1�L\0\2\0006\3\b\0\18\5\2\0B\3\2\4X\6\14�9\b\t\a9\b\n\b\15\0\b\0X\t\n�6\t\1\0009\t\v\t9\t\f\t\18\v\b\0\18\f\1\0B\t\3\2\b\t\0\0X\t\2�9\t\r\aL\t\2\0E\6\3\3R\6�L\0\2\0\tname\nindex\afn\14filetypes\vconfig\vipairs\tnext\23get_active_clients\blsp\rfiletype\24nvim_buf_get_option\bapi\bvim\18No Active Lsp����\31\19\0\0\1\0\1\0\2'\0\0\0L\0\2\0\b▊�\14\1\0\f\0f\0�\0016\0\0\0'\2\1\0B\0\2\0025\1\2\0005\2\4\0003\3\3\0=\3\5\0023\3\6\0=\3\a\0023\3\b\0=\3\t\0025\3\22\0005\4\n\0005\5\16\0005\6\14\0005\a\f\0009\b\v\1=\b\v\a9\b\r\1=\b\r\a=\a\15\6=\6\17\0055\6\19\0005\a\18\0009\b\v\1=\b\v\a9\b\r\1=\b\r\a=\a\15\6=\6\20\5=\5\21\4=\4\23\0035\4\24\0004\5\0\0=\5\25\0044\5\0\0=\5\26\0044\5\0\0=\5\27\0044\5\0\0=\5\28\0044\5\0\0=\5\29\0044\5\0\0=\5\30\4=\4\31\0035\4 \0004\5\0\0=\5\25\0044\5\0\0=\5!\0044\5\0\0=\5\27\0044\5\0\0=\5\28\0044\5\0\0=\5\29\0044\5\0\0=\5\30\4=\4\"\0033\4#\0003\5$\0\18\6\4\0005\b(\0003\t%\0>\t\1\b5\t'\0009\n&\1=\n\v\t=\t)\b5\t*\0=\t+\bB\6\2\1\18\6\4\0005\b-\0003\t,\0>\t\1\b5\t.\0=\t+\bB\6\2\1\18\6\4\0005\b/\0009\t\5\2=\t0\bB\6\2\1\18\6\4\0005\b1\0009\t\5\2=\t0\b5\t3\0009\n2\1=\n\v\t=\t)\bB\6\2\1\18\6\4\0005\b4\0B\6\2\1\18\6\4\0005\b5\0005\t6\0009\n\v\1=\n\v\t=\t)\bB\6\2\1\18\6\4\0005\b7\0005\t8\0=\t9\b5\t:\0=\t;\b5\t>\0005\n=\0009\v<\1=\v\v\n=\n?\t5\nA\0009\v@\1=\v\v\n=\nB\t5\nD\0009\vC\1=\v\v\n=\nE\t=\tF\bB\6\2\1\18\6\4\0004\b\3\0003\tG\0>\t\1\bB\6\2\1\18\6\4\0005\bI\0003\tH\0>\t\1\b5\tJ\0=\t)\bB\6\2\1\18\6\5\0005\bK\0006\tL\0009\tM\t=\tN\b9\t\a\2=\t0\b5\tP\0009\nO\1=\n\v\t=\t)\bB\6\2\1\18\6\5\0005\bQ\0006\tL\0009\tM\t=\tN\b5\tR\0009\nO\1=\n\v\t=\t)\bB\6\2\1\18\6\5\0005\bS\0005\tU\0009\nT\1=\n\v\t=\t)\bB\6\2\1\18\6\5\0005\bV\0005\tW\0=\t;\b5\tY\0005\nX\0009\vO\1=\v\v\n=\nZ\t5\n\\\0009\v[\1=\v\v\n=\n]\t5\n^\0009\v<\1=\v\v\n=\n_\t=\t`\b9\t\a\2=\t0\bB\6\2\1\18\6\5\0005\bc\0003\ta\0>\t\1\b5\tb\0009\n&\1=\n\v\t=\t)\b5\td\0=\t+\bB\6\2\0019\6e\0\18\b\3\0B\6\2\0012\0\0�K\0\1\0\nsetup\1\0\1\tleft\3\1\1\0\0\1\0\0\0\15diff_color\fremoved\1\0\0\rmodified\1\0\0\vorange\nadded\1\0\0\1\0\0\1\0\3\rmodified\t柳 \nadded\t \fremoved\t \1\2\0\0\tdiff\1\0\1\bgui\tbold\vviolet\1\2\1\0\vbranch\ticon\b\1\0\1\bgui\tbold\1\2\1\0\15fileformat\18icons_enabled\1\1\0\1\bgui\tbold\ngreen\bfmt\nupper\vstring\1\2\0\0\15o:encoding\1\0\2\bgui\tbold\afg\f#ffffff\1\0\1\ticon\r LSP:\0\0\22diagnostics_color\15color_info\1\0\0\tcyan\15color_warn\1\0\0\vyellow\16color_error\1\0\0\1\0\0\bred\fsymbols\1\0\3\twarn\t \nerror\t \tinfo\t \fsources\1\2\0\0\rnvim_lsp\1\2\0\0\16diagnostics\1\0\1\bgui\tbold\1\2\0\0\rprogress\1\2\0\0\rlocation\1\0\1\bgui\tbold\fmagenta\1\2\0\0\rfilename\tcond\1\2\0\0\rfilesize\1\0\1\nright\3\1\1\0\1\ncolor\16LualineMode\0\fpadding\1\0\2\tleft\3\0\nright\3\1\ncolor\1\0\0\1\0\0\tblue\0\0\0\22inactive_sections\14lualine_v\1\0\0\rsections\14lualine_x\14lualine_c\14lualine_z\14lualine_y\14lualine_b\14lualine_a\1\0\0\foptions\1\0\0\ntheme\rinactive\1\0\0\1\0\0\vnormal\1\0\0\6c\1\0\0\abg\1\0\0\afg\1\0\2\23section_separators\5\25component_separators\5\24check_git_workspace\0\18hide_in_width\0\21buffer_not_empty\1\0\0\0\1\0\v\ngreen\f#98be65\vyellow\f#ECBE7B\bred\f#ec5f67\afg\f#bbc2cf\tblue\f#51afef\fmagenta\f#c678dd\vviolet\f#a9a1e1\vorange\f#FF8800\abg\f#402540\rdarkblue\f#081633\tcyan\f#008080\flualine\frequire\0" },
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  luasnip = {
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/luasnip",
    url = "https://github.com/l3mon4d3/luasnip"
  },
  ["magma-nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\5\0\f\0\0276\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0006\2\3\0'\4\6\0B\2\2\0029\2\a\0029\2\b\0025\3\t\0B\0\3\0016\0\3\0'\2\4\0B\0\2\0029\0\5\0006\2\3\0'\4\6\0B\2\2\0029\2\a\0029\2\n\0025\3\v\0B\0\3\1K\0\1\0\1\0\2\vprefix\r<leader>\tmode\6x\fmagma_x\1\0\2\vprefix\r<leader>\tmode\6n\nmagma\rleaderkm\vkeymap\rregister\14which-key\frequire$magma_automatically_open_output\6g\bvim\0" },
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/magma-nvim",
    url = "https://github.com/dccsillag/magma-nvim"
  },
  ["material.nvim"] = {
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/material.nvim",
    url = "https://github.com/marko-cerovac/material.nvim"
  },
  ["mkdir.nvim"] = {
    config = { "\27LJ\2\n%\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\nmkdir\frequire\0" },
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/mkdir.nvim",
    url = "https://github.com/jghauser/mkdir.nvim"
  },
  ["move.nvim"] = {
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/move.nvim",
    url = "https://github.com/fedepujol/move.nvim"
  },
  neogit = {
    commands = { "neogit" },
    config = { "\27LJ\2\nz\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\17integrations\1\0\1\rdiffview\2\1\0\1 disable_commit_confirmation\2\nsetup\vneogit\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/opt/neogit",
    url = "https://github.com/timuntersberger/neogit"
  },
  neorg = {
    config = { "\27LJ\2\n�\2\0\0\a\0\17\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\15\0005\3\3\0004\4\0\0=\4\4\0034\4\0\0=\4\5\0035\4\a\0005\5\6\0=\5\b\4=\4\t\0035\4\r\0005\5\v\0005\6\n\0=\6\f\5=\5\b\4=\4\14\3=\3\16\2B\0\2\1K\0\1\0\tload\1\0\0\21core.norg.dirman\1\0\0\15workspaces\1\0\0\1\0\1\17my_workspace\f~/neorg\18core.keybinds\vconfig\1\0\0\1\0\2\17neorg_leader\a,o\21default_keybinds\2\24core.norg.concealer\18core.defaults\1\0\0\nsetup\nneorg\frequire\0" },
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/neorg",
    url = "https://github.com/nvim-neorg/neorg"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n�\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\21enable_moveright\2\22enable_afterquote\2\rcheck_ts\2\30enable_check_bracket_line\2\nsetup\19nvim-autopairs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n�\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20�6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2�+\2\1\0X\3\1�+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\0�\tbody\15lsp_expand�\1\0\1\3\3\5\0\29-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\19�-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4�-\1\1\0009\1\3\1B\1\1\1X\1\n�-\1\2\0B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\4\1B\1\1\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\1�\0�\2�\rcomplete\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisible�\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\r�-\1\1\0009\1\2\1)\3��B\1\2\2\15\0\1\0X\2\5�-\1\1\0009\1\3\1)\3��B\1\2\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\1�\0�\tjump\rjumpable\21select_prev_item\fvisible�\v\1\0\14\0M\0�\0016\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0026\1\4\0'\3\6\0B\1\2\0023\2\a\0006\3\4\0'\5\b\0B\3\2\0029\4\t\3B\4\1\0019\4\n\0015\6\f\0005\a\v\0=\a\r\0065\a\14\0=\a\15\0065\a\17\0003\b\16\0=\b\18\a=\a\19\0069\a\20\0019\a\21\a4\t\a\0005\n\22\0>\n\1\t5\n\23\0>\n\2\t5\n\24\0>\n\3\t5\n\25\0>\n\4\t5\n\26\0>\n\5\t5\n\27\0>\n\6\t4\n\3\0005\v\28\0>\v\1\nB\a\3\2=\a\21\0065\a \0009\b\29\0013\n\30\0005\v\31\0B\b\3\2=\b!\a9\b\29\0013\n\"\0005\v#\0B\b\3\2=\b$\a9\b\29\0019\b%\b5\n(\0009\v&\0019\v'\v=\v)\nB\b\2\2=\b*\a9\b\29\0019\b+\b5\n,\0009\v&\0019\v'\v=\v)\nB\b\2\2=\b-\a9\b\29\0019\b.\b)\n��B\b\2\2=\b/\a9\b\29\0019\b.\b)\n\4\0B\b\2\2=\b0\a9\b\29\0019\n\29\0019\n1\n5\f4\0009\r2\0019\r3\r=\r)\fB\n\2\0025\v5\0B\b\3\2=\b6\a9\b\29\0019\b7\bB\b\1\2=\b8\a9\b\29\0019\b1\b5\n:\0009\v2\0019\v9\v=\v)\nB\b\2\2=\b;\a=\a\29\0065\a@\0009\b<\0035\n=\0005\v>\0=\v?\nB\b\2\2=\bA\a=\aB\6B\4\2\0019\4\n\0019\4C\4'\6D\0005\aF\0004\b\3\0005\tE\0>\t\1\b=\b\21\aB\4\3\0019\4\n\0019\4C\4'\6G\0005\aJ\0009\b\20\0019\b\21\b4\n\3\0005\vH\0>\v\1\n4\v\3\0005\fI\0>\f\1\vB\b\3\2=\b\21\aB\4\3\0016\4\0\0009\4K\4'\6L\0B\4\2\0012\0\0�K\0\1\0Yautocmd FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }\bcmd\1\0\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\6:\1\0\0\1\0\1\tname\vbuffer\6/\fcmdline\15formatting\vformat\1\0\0\tmenu\1\0\a\rnvim_lsp\n[LSP]\14gh_issues\r[issues]\vbuffer\n[buf]\fluasnip\v[snip]\atn\14[TabNine]\tpath\v[path]\rnvim_lua\n[api]\1\0\1\14with_text\2\15cmp_format\t<CR>\1\0\1\vselect\2\fReplace\n<C-e>\nclose\n<C-y>\1\3\0\0\6i\6c\1\0\1\vselect\2\vInsert\20ConfirmBehavior\fconfirm\n<C-f>\n<C-d>\16scroll_docs\t<Up>\1\0\0\21select_prev_item\v<Down>\rbehavior\1\0\0\vSelect\19SelectBehavior\21select_next_item\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\0\0\1\3\0\0\6i\6s\0\fmapping\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\18latex_symbols\1\0\1\tname\fcmdline\1\0\1\tname\rnvim_lua\1\0\1\tname\tpath\1\0\1\tname\rnvim_lsp\fsources\vconfig\fsnippet\vexpand\1\0\0\0\15completion\1\0\1\17autocomplete\2\17experimental\1\0\0\1\0\2\19active_preview\2\15ghost_text\2\nsetup\tinit\flspkind\0\bcmp\fluasnip\frequire\26menu,menuone,noselect\16completeopt\6g\bvim\0" },
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\0�\24nvim_buf_set_option\bapi\bvim�\1\1\0\a\0\r\0\0216\0\0\0009\0\1\0003\1\2\0\18\2\1\0'\4\3\0'\5\4\0B\2\3\0016\2\5\0'\4\6\0B\2\2\0029\2\a\0026\4\5\0'\6\b\0B\4\2\0029\4\t\0049\4\n\0045\5\v\0=\0\f\5B\2\3\0012\0\0�K\0\1\0\vbuffer\1\0\1\vprefix\r<leader>\tcode\rleaderkm\vkeymap\rregister\14which-key\frequire\27v:lua.vim.lsp.omnifunc\romnifunc\0\nbufnr\bvim�\2\0\1\v\2\v\0(5\1\0\0-\2\0\0009\2\1\2\n\2\0\0X\2\f�6\2\2\0-\4\0\0009\4\1\4B\2\2\4H\5\5�6\a\3\0009\a\4\a\18\t\1\0\18\n\6\0B\a\3\1F\5\3\3R\5�-\2\1\0009\2\1\0026\4\5\0\18\6\1\0B\4\2\0A\2\0\2\18\4\0\0B\2\2\2\14\0\2\0X\3\5�-\2\1\0009\2\6\0029\2\a\2\18\4\0\0B\2\2\0026\3\b\0009\3\t\0039\3\n\3B\3\1\2\5\2\3\0X\3\1�+\2\0\0L\2\2\0\a�\1�\15os_homedir\tloop\bvim\fdirname\tpath\vunpack\vinsert\ntable\npairs\17root_pattern\1\3\0\0\t.git\rMakefile�\r\1\0\14\0H\0�\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0025\2\5\0005\3\3\0004\4\0\0=\4\4\3=\3\6\0025\3\a\0005\4\b\0=\4\4\3=\3\t\0025\3\n\0005\4\v\0=\4\4\3=\3\f\0025\3\r\0005\4\14\0=\4\4\3=\3\15\0025\3\16\0005\4\17\0=\4\4\3=\3\18\0025\3\19\0005\4\20\0=\4\4\3=\3\21\0025\3\22\0004\4\0\0=\4\4\3=\3\23\0025\3\24\0005\4\25\0=\4\4\3=\3\26\0025\3\27\0=\3\28\0025\3\29\0005\4\30\0=\4\4\3=\3\31\0025\3 \0005\4!\0=\4\4\3=\3\"\0025\3#\0005\4$\0=\4\4\3=\3%\0025\3&\0004\4\0\0=\4\4\3=\3'\0025\3(\0005\4)\0=\4\4\3=\3*\0026\3+\0\18\5\2\0B\3\2\4H\0065�3\b,\0006\t\0\0'\v-\0B\t\2\0029\t.\t6\v/\0009\v0\v9\v1\v9\v2\vB\v\1\0A\t\0\0025\n3\0=\t4\n5\v5\0=\v6\n=\b7\n3\v8\0=\v9\n\a\6\31\0X\v\17�5\v>\0006\f/\0009\f;\f9\f<\fB\f\1\2'\r=\0&\f\r\f>\f\1\v6\f/\0009\f;\f9\f<\fB\f\1\2'\r?\0&\f\r\f>\f\3\v=\v:\nX\v\v�\a\6*\0X\v\t�4\v\3\0006\f/\0009\f;\f9\f<\fB\f\1\2'\r@\0&\f\r\f>\f\1\v=\v:\n8\v\6\0009\vA\v\18\r\n\0B\v\2\0012\6\0�F\6\3\3R\6�6\3/\0009\0030\0039\3B\0036\4/\0009\0040\0049\4D\0046\6/\0009\0060\0069\6E\0069\6F\0065\aG\0B\4\3\2=\4C\0032\0\0�K\0\1\0\1\0\3\21update_in_insert\1\nsigns\2\17virtual_text\1\27on_publish_diagnostics\15diagnostic\twith$textDocument/publishDiagnostics\rhandlers\nsetup\29/opt/bin/zeta-note-linux(/opt/sumneko_lua/bin/Linux/main.lua\1\3\0\0\0\a-E3/opt/sumneko_lua/bin/Linux/lua-language-server\15os_homedir\tloop\bcmd\rroot_dir\0\14on_attach\nflags\1\0\1\26debounce_text_changes\3�\3\17capabilities\1\0\0\29make_client_capabilities\rprotocol\blsp\bvim\24update_capabilities\17cmp_nvim_lsp\0\npairs\14zeta_note\1\3\0\0\14README.md\rindex.md\1\0\1\bcmd\20zeta-note-linux\vyamlls\1\0\1\bcmd\25yaml-language-server\rtsserver\1\2\0\0\17package.json\1\0\1\bcmd\31typescript-language-server\vtexlab\1\3\0\0\rrefs.bib\rmain.tex\1\0\1\bcmd\vtexlab\16sumneko_lua\1\2\0\0\blua\1\0\1\bcmd\24lua-language-server\18rust_analyzer\1\0\2\bcmd\18rust-analyzer\17root_pattern\15Cargo.toml\fpyright\1\6\0\0\rsetup.py\14setup.cfg\19pyproject.toml\23pyrightconfig.json\21requirements.txt\1\0\1\bcmd\23pyright-langserver\vjsonls\1\0\1\bcmd vscode-json-language-server\thtml\1\3\0\0\15index.html\17package.json\1\0\1\bcmd vscode-html-language-server\ngopls\1\2\0\0\rMakefile\1\0\1\bcmd\ngopls\rdockerls\1\2\0\0\15Dockerfile\1\0\1\bcmd\22docker-langserver\ncmake\1\2\0\0\19CMakeLists.txt\1\0\1\bcmd\26cmake-language-server\vclangd\1\3\0\0\19CMakeLists.txt\rMakefile\1\0\1\bcmd\vclangd\vbashls\1\0\0\17root_pattern\1\0\1\bcmd\25bash-language-server\19lspconfig.util\14lspconfig\frequire\0" },
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\b\0\0\6\0*\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\16\0005\4\17\0=\4\18\3=\3\19\0025\3\20\0005\4\21\0=\4\5\3=\3\22\0025\3\25\0005\4\23\0005\5\24\0=\5\5\4=\4\26\0035\4\27\0005\5\28\0=\5\29\4=\4\30\0035\4\31\0005\5 \0=\5!\0045\5\"\0=\5#\0045\5$\0=\5%\0045\5&\0=\5'\4=\4(\3=\3)\2B\0\2\1K\0\1\0\16textobjects\tmove\22goto_previous_end\1\0\2\a[M\20@function.outer\a[]\17@class.outer\24goto_previous_start\1\0\2\a[[\17@class.outer\a[m\20@function.outer\18goto_next_end\1\0\2\a]M\20@function.outer\a][\17@class.outer\20goto_next_start\1\0\2\a]]\17@class.outer\a]m\20@function.outer\1\0\2\venable\2\14set_jumps\2\16lsp_interop\25peek_definition_code\1\0\2\15<leader>cP\17@class.outer\15<leader>cp\20@function.outer\1\0\2\venable\2\vborder\tnone\vselect\1\0\0\1\0\6\aaf\20@function.outer\aal\16@loop.outer\aac\17@class.outer\aif\20@function.inner\aic\17@class.inner\ail\16@loop.inner\1\0\2\venable\2\14lookahead\2\17textsubjects\1\0\2\6;!textsubjects-container-outer\6.\23textsubjects-smart\1\0\1\venable\2\fautotag\14filetypes\1\v\0\0\thtml\15javascript\20javascriptreact\15typescript\20typescriptreact\vsvelte\bvue\vpython\blua\rmarkdown\1\0\1\venable\2\14tree_docs\1\0\1\venable\2\vindent\1\0\1\venable\1\14autopairs\1\0\1\venable\2\14highlight\1\0\1\venable\2\26incremental_selection\1\0\0\fkeymaps\1\0\4\21node_decremental\agH\19init_selection\ags\22scope_incremental\agl\21node_incremental\agh\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\fpattern\1\0\0\fdefault\1\0\0\1\a\0\0\nclass\rfunction\vmethod\bfor\nwhile\aif\nsetup\23treesitter-context\frequire\0" },
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/romgrk/nvim-treesitter-context"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-treesitter-textsubjects"] = {
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textsubjects",
    url = "https://github.com/rrethy/nvim-treesitter-textsubjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["persistence.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\6\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0006\3\3\0009\3\4\0039\3\5\3'\5\6\0B\3\2\2'\4\a\0&\3\4\3=\3\t\2B\0\2\1K\0\1\0\bdir\1\0\0\15/sessions/\tdata\fstdpath\afn\bvim\nsetup\16persistence\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/opt/persistence.nvim",
    url = "https://github.com/folke/persistence.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  sniprun = {
    config = { "\27LJ\2\n�\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\16repl_enable\1\2\0\0\17Python3_fifo\26selected_interpreters\1\0\0\1\2\0\0\17Python3_fifo\nsetup\fsniprun\frequire\0" },
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/sniprun",
    url = "https://github.com/michaelb/sniprun"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n\0\0\5\0\a\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\0029\2\5\0025\3\6\0B\0\3\1K\0\1\0\1\0\1\vprefix\r<leader>\14telescope\rleaderkm\vkeymap\rregister\14which-key\frequire\0" },
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\5\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0025\3\5\0005\4\6\0=\4\a\3=\3\b\2B\0\2\1K\0\1\0\15float_opts\15highlights\1\0\2\15background\vNormal\vborder\fSpecial\1\0\4\vheight\3\15\nwidth\3F\vborder\vcurved\rwinblend\3\0\20shade_filetypes\1\0\b\17open_mapping\t<F4>\tsize\3\15\18close_on_exit\2\14direction\15horizontal\17persist_size\2\20start_in_insert\2\20shade_terminals\2\17hide_numbers\2\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["truezen.nvim"] = {
    config = { "\27LJ\2\n�\5\0\0\6\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\3=\3\v\0025\3\15\0005\4\f\0005\5\r\0=\5\14\4=\4\16\0035\4\17\0=\4\18\3=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\tmisc\1\0\3\25ui_elements_commands\1\20on_off_commands\1\19cursor_by_mode\1\17integrations\1\0\4\ttmux\2\15galaxyline\2\rgitsigns\2\20nvim_bufferline\2\nmodes\nfocus\1\0\2\17focus_method\17experimental\20margin_of_error\3\5\rataraxis\1\0\0\29ideal_writing_area_width\1\2\0\0\3\0\1\0\b\22just_do_it_for_me\2\19bottom_padding\3\0\16top_padding\3\0\18right_padding\3\30\17left_padding\3\30\21bg_configuration\2\15custome_bg\5 keep_default_fold_fillchars\2\aui\1\0\0\tleft\1\0\3\vnumber\1\15signcolumn\ano\19relativenumber\1\btop\1\0\1\16showtabline\3\0\vbottom\1\0\0\1\0\5\nruler\1\14cmdheight\3\1\15laststatus\3\0\fshowcmd\1\rshowmode\1\nsetup\rtrue-zen\frequire\0" },
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/truezen.nvim",
    url = "https://github.com/pocco81/truezen.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-indent-object"] = {
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/vim-indent-object",
    url = "https://github.com/michaeljsmith/vim-indent-object"
  },
  ["vim-printer"] = {
    config = { "\27LJ\2\n�\2\0\0\5\0\16\0\0216\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\6\0'\2\a\0B\0\2\0029\0\b\0005\2\14\0005\3\n\0005\4\t\0=\4\v\0035\4\f\0=\4\r\3=\3\15\2B\0\2\1K\0\1\0\6,\1\0\0\6P\1\2\0\0\28Insert print line above\6p\1\0\0\1\2\0\0\28Insert print line below\rregister\14which-key\frequire\a,P'vim_printer_print_above_keybinding\a,p'vim_printer_print_below_keybinding\6g\bvim\0" },
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/vim-printer",
    url = "https://github.com/meain/vim-printer"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n�\5\0\0\6\0\29\0#6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\3\0005\5\4\0=\5\5\4=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\15\0005\5\14\0=\5\16\4=\4\17\0035\4\19\0005\5\18\0=\5\20\4=\4\21\0035\4\22\0=\4\23\3B\1\2\0019\1\24\0006\3\0\0'\5\25\0B\3\2\0029\3\26\0039\3\27\0035\4\28\0B\1\3\1K\0\1\0\1\0\1\vprefix\r<leader>\tbase\rleaderkm\vkeymap\rregister\vhidden\1\t\0\0\r<silent>\n<Cmd>\n<cmd>\v<Plug>\tcall\blua\a^:\a^ \vlayout\vheight\1\0\2\nalign\tleft\fspacing\3\3\1\0\2\bmax\3\n\bmin\3\1\vwindow\fpadding\1\0\0\1\5\0\0\3\0\3\0\3\0\3\0\15key_labels\1\0\3\t<cr>\bRET\n<tab>\bTAB\f<space>\bSPC\nicons\1\0\3\ngroup\6+\15breadcrumb\a»\14separator\b➜\14operators\1\0\6\6!#Filter though external program\agU\14Uppercase\t<lt>\16Indent left\agu\14Lowercase\ag~\16Toggle case\azf\16Create fold\fplugins\1\0\2\rtriggers\tauto\14show_help\2\fpresets\1\0\a\bnav\1\fwindows\1\17text_objects\1\fmotions\1\14operators\1\6g\2\6z\2\1\0\2\14registers\1\nmarks\1\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/geopar/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^neogit"] = "neogit",
  ["^persistence"] = "persistence.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\nn\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\17handler_opts\1\0\1\vborder\vsingle\1\0\1\tbind\2\nsetup\18lsp_signature\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n�\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20�6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2�+\2\1\0X\3\1�+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\0�\tbody\15lsp_expand�\1\0\1\3\3\5\0\29-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\19�-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4�-\1\1\0009\1\3\1B\1\1\1X\1\n�-\1\2\0B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\4\1B\1\1\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\1�\0�\2�\rcomplete\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisible�\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\r�-\1\1\0009\1\2\1)\3��B\1\2\2\15\0\1\0X\2\5�-\1\1\0009\1\3\1)\3��B\1\2\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\1�\0�\tjump\rjumpable\21select_prev_item\fvisible�\v\1\0\14\0M\0�\0016\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0026\1\4\0'\3\6\0B\1\2\0023\2\a\0006\3\4\0'\5\b\0B\3\2\0029\4\t\3B\4\1\0019\4\n\0015\6\f\0005\a\v\0=\a\r\0065\a\14\0=\a\15\0065\a\17\0003\b\16\0=\b\18\a=\a\19\0069\a\20\0019\a\21\a4\t\a\0005\n\22\0>\n\1\t5\n\23\0>\n\2\t5\n\24\0>\n\3\t5\n\25\0>\n\4\t5\n\26\0>\n\5\t5\n\27\0>\n\6\t4\n\3\0005\v\28\0>\v\1\nB\a\3\2=\a\21\0065\a \0009\b\29\0013\n\30\0005\v\31\0B\b\3\2=\b!\a9\b\29\0013\n\"\0005\v#\0B\b\3\2=\b$\a9\b\29\0019\b%\b5\n(\0009\v&\0019\v'\v=\v)\nB\b\2\2=\b*\a9\b\29\0019\b+\b5\n,\0009\v&\0019\v'\v=\v)\nB\b\2\2=\b-\a9\b\29\0019\b.\b)\n��B\b\2\2=\b/\a9\b\29\0019\b.\b)\n\4\0B\b\2\2=\b0\a9\b\29\0019\n\29\0019\n1\n5\f4\0009\r2\0019\r3\r=\r)\fB\n\2\0025\v5\0B\b\3\2=\b6\a9\b\29\0019\b7\bB\b\1\2=\b8\a9\b\29\0019\b1\b5\n:\0009\v2\0019\v9\v=\v)\nB\b\2\2=\b;\a=\a\29\0065\a@\0009\b<\0035\n=\0005\v>\0=\v?\nB\b\2\2=\bA\a=\aB\6B\4\2\0019\4\n\0019\4C\4'\6D\0005\aF\0004\b\3\0005\tE\0>\t\1\b=\b\21\aB\4\3\0019\4\n\0019\4C\4'\6G\0005\aJ\0009\b\20\0019\b\21\b4\n\3\0005\vH\0>\v\1\n4\v\3\0005\fI\0>\f\1\vB\b\3\2=\b\21\aB\4\3\0016\4\0\0009\4K\4'\6L\0B\4\2\0012\0\0�K\0\1\0Yautocmd FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }\bcmd\1\0\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\6:\1\0\0\1\0\1\tname\vbuffer\6/\fcmdline\15formatting\vformat\1\0\0\tmenu\1\0\a\rnvim_lsp\n[LSP]\14gh_issues\r[issues]\vbuffer\n[buf]\fluasnip\v[snip]\atn\14[TabNine]\tpath\v[path]\rnvim_lua\n[api]\1\0\1\14with_text\2\15cmp_format\t<CR>\1\0\1\vselect\2\fReplace\n<C-e>\nclose\n<C-y>\1\3\0\0\6i\6c\1\0\1\vselect\2\vInsert\20ConfirmBehavior\fconfirm\n<C-f>\n<C-d>\16scroll_docs\t<Up>\1\0\0\21select_prev_item\v<Down>\rbehavior\1\0\0\vSelect\19SelectBehavior\21select_next_item\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\0\0\1\3\0\0\6i\6s\0\fmapping\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\18latex_symbols\1\0\1\tname\fcmdline\1\0\1\tname\rnvim_lua\1\0\1\tname\tpath\1\0\1\tname\rnvim_lsp\fsources\vconfig\fsnippet\vexpand\1\0\0\0\15completion\1\0\1\17autocomplete\2\17experimental\1\0\0\1\0\2\19active_preview\2\15ghost_text\2\nsetup\tinit\flspkind\0\bcmp\fluasnip\frequire\26menu,menuone,noselect\16completeopt\6g\bvim\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n\\\0\0\5\0\5\1\0156\0\0\0009\0\1\0009\0\2\0006\2\0\0009\2\1\0029\2\3\2'\4\4\0B\2\2\0A\0\0\2\t\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\b%:t\vexpand\nempty\afn\bvim\2G\0\0\3\0\3\0\f6\0\0\0009\0\1\0009\0\2\0)\2\0\0B\0\2\2)\1P\0\0\1\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\rwinwidth\afn\bvim�\1\0\0\6\0\a\0\0276\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0026\1\0\0009\1\1\0019\1\4\1'\3\5\0\18\4\0\0'\5\6\0&\4\5\4B\1\3\2\r\2\1\0X\2\v�\21\2\1\0)\3\0\0\1\3\2\0X\2\4�\21\2\1\0\21\3\0\0\0\2\3\0X\2\2�+\2\1\0X\3\1�+\2\2\0L\2\2\0\6;\t.git\ffinddir\n%:p:h\vexpand\afn\bvimI\0\1\5\1\4\0\b6\1\0\0009\1\1\1-\3\0\0009\3\2\0039\3\3\3\18\4\0\0B\1\3\1K\0\1\0\3�\14lualine_c\rsections\vinsert\ntableI\0\1\5\1\4\0\b6\1\0\0009\1\1\1-\3\0\0009\3\2\0039\3\3\3\18\4\0\0B\1\3\1K\0\1\0\3�\14lualine_x\rsections\vinsert\ntable\19\0\0\1\0\1\0\2'\0\0\0L\0\2\0\b▊�\3\0\0\a\1%\0J5\0\1\0-\1\0\0009\1\0\1=\1\2\0-\1\0\0009\1\3\1=\1\4\0-\1\0\0009\1\5\1=\1\6\0-\1\0\0009\1\5\1=\1\a\0-\1\0\0009\1\5\1=\1\b\0-\1\0\0009\1\t\1=\1\n\0-\1\0\0009\1\0\1=\1\v\0-\1\0\0009\1\f\1=\1\r\0-\1\0\0009\1\f\1=\1\14\0-\1\0\0009\1\15\1=\1\16\0-\1\0\0009\1\17\1=\1\18\0-\1\0\0009\1\17\1=\1\19\0-\1\0\0009\1\0\1=\1\20\0-\1\0\0009\1\0\1=\1\21\0-\1\0\0009\1\22\1=\1\23\0-\1\0\0009\1\22\1=\1\24\0-\1\0\0009\1\22\1=\1\25\0-\1\0\0009\1\0\1=\1\26\0-\1\0\0009\1\0\1=\1\27\0006\1\28\0009\1\29\0019\1\30\1'\3\31\0006\4\28\0009\4 \0049\4!\4B\4\1\0028\4\4\0'\5\"\0-\6\0\0009\6#\6&\3\6\3B\1\2\1'\1$\0L\1\2\0\1�\b\abg\f guibg=\tmode\afn\27hi! LualineMode guifg=\17nvim_command\bapi\bvim\6t\6!\ar?\arm\6r\tcyan\ace\acv\aRv\6R\vviolet\aic\vyellow\6S\6s\vorange\ano\6c\fmagenta\6V\5\6v\tblue\6i\ngreen\6n\1\0\0\bred\18\0\0\1\0\1\0\2'\0\0\0L\0\2\0\a%=�\2\0\0\r\0\14\1&'\0\0\0006\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\4\0B\1\3\0026\2\1\0009\2\5\0029\2\6\2B\2\1\0026\3\a\0\18\5\2\0B\3\2\2\v\3\0\0X\3\1�L\0\2\0006\3\b\0\18\5\2\0B\3\2\4X\6\14�9\b\t\a9\b\n\b\15\0\b\0X\t\n�6\t\1\0009\t\v\t9\t\f\t\18\v\b\0\18\f\1\0B\t\3\2\b\t\0\0X\t\2�9\t\r\aL\t\2\0E\6\3\3R\6�L\0\2\0\tname\nindex\afn\14filetypes\vconfig\vipairs\tnext\23get_active_clients\blsp\rfiletype\24nvim_buf_get_option\bapi\bvim\18No Active Lsp����\31\19\0\0\1\0\1\0\2'\0\0\0L\0\2\0\b▊�\14\1\0\f\0f\0�\0016\0\0\0'\2\1\0B\0\2\0025\1\2\0005\2\4\0003\3\3\0=\3\5\0023\3\6\0=\3\a\0023\3\b\0=\3\t\0025\3\22\0005\4\n\0005\5\16\0005\6\14\0005\a\f\0009\b\v\1=\b\v\a9\b\r\1=\b\r\a=\a\15\6=\6\17\0055\6\19\0005\a\18\0009\b\v\1=\b\v\a9\b\r\1=\b\r\a=\a\15\6=\6\20\5=\5\21\4=\4\23\0035\4\24\0004\5\0\0=\5\25\0044\5\0\0=\5\26\0044\5\0\0=\5\27\0044\5\0\0=\5\28\0044\5\0\0=\5\29\0044\5\0\0=\5\30\4=\4\31\0035\4 \0004\5\0\0=\5\25\0044\5\0\0=\5!\0044\5\0\0=\5\27\0044\5\0\0=\5\28\0044\5\0\0=\5\29\0044\5\0\0=\5\30\4=\4\"\0033\4#\0003\5$\0\18\6\4\0005\b(\0003\t%\0>\t\1\b5\t'\0009\n&\1=\n\v\t=\t)\b5\t*\0=\t+\bB\6\2\1\18\6\4\0005\b-\0003\t,\0>\t\1\b5\t.\0=\t+\bB\6\2\1\18\6\4\0005\b/\0009\t\5\2=\t0\bB\6\2\1\18\6\4\0005\b1\0009\t\5\2=\t0\b5\t3\0009\n2\1=\n\v\t=\t)\bB\6\2\1\18\6\4\0005\b4\0B\6\2\1\18\6\4\0005\b5\0005\t6\0009\n\v\1=\n\v\t=\t)\bB\6\2\1\18\6\4\0005\b7\0005\t8\0=\t9\b5\t:\0=\t;\b5\t>\0005\n=\0009\v<\1=\v\v\n=\n?\t5\nA\0009\v@\1=\v\v\n=\nB\t5\nD\0009\vC\1=\v\v\n=\nE\t=\tF\bB\6\2\1\18\6\4\0004\b\3\0003\tG\0>\t\1\bB\6\2\1\18\6\4\0005\bI\0003\tH\0>\t\1\b5\tJ\0=\t)\bB\6\2\1\18\6\5\0005\bK\0006\tL\0009\tM\t=\tN\b9\t\a\2=\t0\b5\tP\0009\nO\1=\n\v\t=\t)\bB\6\2\1\18\6\5\0005\bQ\0006\tL\0009\tM\t=\tN\b5\tR\0009\nO\1=\n\v\t=\t)\bB\6\2\1\18\6\5\0005\bS\0005\tU\0009\nT\1=\n\v\t=\t)\bB\6\2\1\18\6\5\0005\bV\0005\tW\0=\t;\b5\tY\0005\nX\0009\vO\1=\v\v\n=\nZ\t5\n\\\0009\v[\1=\v\v\n=\n]\t5\n^\0009\v<\1=\v\v\n=\n_\t=\t`\b9\t\a\2=\t0\bB\6\2\1\18\6\5\0005\bc\0003\ta\0>\t\1\b5\tb\0009\n&\1=\n\v\t=\t)\b5\td\0=\t+\bB\6\2\0019\6e\0\18\b\3\0B\6\2\0012\0\0�K\0\1\0\nsetup\1\0\1\tleft\3\1\1\0\0\1\0\0\0\15diff_color\fremoved\1\0\0\rmodified\1\0\0\vorange\nadded\1\0\0\1\0\0\1\0\3\rmodified\t柳 \nadded\t \fremoved\t \1\2\0\0\tdiff\1\0\1\bgui\tbold\vviolet\1\2\1\0\vbranch\ticon\b\1\0\1\bgui\tbold\1\2\1\0\15fileformat\18icons_enabled\1\1\0\1\bgui\tbold\ngreen\bfmt\nupper\vstring\1\2\0\0\15o:encoding\1\0\2\bgui\tbold\afg\f#ffffff\1\0\1\ticon\r LSP:\0\0\22diagnostics_color\15color_info\1\0\0\tcyan\15color_warn\1\0\0\vyellow\16color_error\1\0\0\1\0\0\bred\fsymbols\1\0\3\twarn\t \nerror\t \tinfo\t \fsources\1\2\0\0\rnvim_lsp\1\2\0\0\16diagnostics\1\0\1\bgui\tbold\1\2\0\0\rprogress\1\2\0\0\rlocation\1\0\1\bgui\tbold\fmagenta\1\2\0\0\rfilename\tcond\1\2\0\0\rfilesize\1\0\1\nright\3\1\1\0\1\ncolor\16LualineMode\0\fpadding\1\0\2\tleft\3\0\nright\3\1\ncolor\1\0\0\1\0\0\tblue\0\0\0\22inactive_sections\14lualine_v\1\0\0\rsections\14lualine_x\14lualine_c\14lualine_z\14lualine_y\14lualine_b\14lualine_a\1\0\0\foptions\1\0\0\ntheme\rinactive\1\0\0\1\0\0\vnormal\1\0\0\6c\1\0\0\abg\1\0\0\afg\1\0\2\23section_separators\5\25component_separators\5\24check_git_workspace\0\18hide_in_width\0\21buffer_not_empty\1\0\0\0\1\0\v\ngreen\f#98be65\vyellow\f#ECBE7B\bred\f#ec5f67\afg\f#bbc2cf\tblue\f#51afef\fmagenta\f#c678dd\vviolet\f#a9a1e1\vorange\f#FF8800\abg\f#402540\rdarkblue\f#081633\tcyan\f#008080\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\0�\24nvim_buf_set_option\bapi\bvim�\1\1\0\a\0\r\0\0216\0\0\0009\0\1\0003\1\2\0\18\2\1\0'\4\3\0'\5\4\0B\2\3\0016\2\5\0'\4\6\0B\2\2\0029\2\a\0026\4\5\0'\6\b\0B\4\2\0029\4\t\0049\4\n\0045\5\v\0=\0\f\5B\2\3\0012\0\0�K\0\1\0\vbuffer\1\0\1\vprefix\r<leader>\tcode\rleaderkm\vkeymap\rregister\14which-key\frequire\27v:lua.vim.lsp.omnifunc\romnifunc\0\nbufnr\bvim�\2\0\1\v\2\v\0(5\1\0\0-\2\0\0009\2\1\2\n\2\0\0X\2\f�6\2\2\0-\4\0\0009\4\1\4B\2\2\4H\5\5�6\a\3\0009\a\4\a\18\t\1\0\18\n\6\0B\a\3\1F\5\3\3R\5�-\2\1\0009\2\1\0026\4\5\0\18\6\1\0B\4\2\0A\2\0\2\18\4\0\0B\2\2\2\14\0\2\0X\3\5�-\2\1\0009\2\6\0029\2\a\2\18\4\0\0B\2\2\0026\3\b\0009\3\t\0039\3\n\3B\3\1\2\5\2\3\0X\3\1�+\2\0\0L\2\2\0\a�\1�\15os_homedir\tloop\bvim\fdirname\tpath\vunpack\vinsert\ntable\npairs\17root_pattern\1\3\0\0\t.git\rMakefile�\r\1\0\14\0H\0�\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0025\2\5\0005\3\3\0004\4\0\0=\4\4\3=\3\6\0025\3\a\0005\4\b\0=\4\4\3=\3\t\0025\3\n\0005\4\v\0=\4\4\3=\3\f\0025\3\r\0005\4\14\0=\4\4\3=\3\15\0025\3\16\0005\4\17\0=\4\4\3=\3\18\0025\3\19\0005\4\20\0=\4\4\3=\3\21\0025\3\22\0004\4\0\0=\4\4\3=\3\23\0025\3\24\0005\4\25\0=\4\4\3=\3\26\0025\3\27\0=\3\28\0025\3\29\0005\4\30\0=\4\4\3=\3\31\0025\3 \0005\4!\0=\4\4\3=\3\"\0025\3#\0005\4$\0=\4\4\3=\3%\0025\3&\0004\4\0\0=\4\4\3=\3'\0025\3(\0005\4)\0=\4\4\3=\3*\0026\3+\0\18\5\2\0B\3\2\4H\0065�3\b,\0006\t\0\0'\v-\0B\t\2\0029\t.\t6\v/\0009\v0\v9\v1\v9\v2\vB\v\1\0A\t\0\0025\n3\0=\t4\n5\v5\0=\v6\n=\b7\n3\v8\0=\v9\n\a\6\31\0X\v\17�5\v>\0006\f/\0009\f;\f9\f<\fB\f\1\2'\r=\0&\f\r\f>\f\1\v6\f/\0009\f;\f9\f<\fB\f\1\2'\r?\0&\f\r\f>\f\3\v=\v:\nX\v\v�\a\6*\0X\v\t�4\v\3\0006\f/\0009\f;\f9\f<\fB\f\1\2'\r@\0&\f\r\f>\f\1\v=\v:\n8\v\6\0009\vA\v\18\r\n\0B\v\2\0012\6\0�F\6\3\3R\6�6\3/\0009\0030\0039\3B\0036\4/\0009\0040\0049\4D\0046\6/\0009\0060\0069\6E\0069\6F\0065\aG\0B\4\3\2=\4C\0032\0\0�K\0\1\0\1\0\3\21update_in_insert\1\nsigns\2\17virtual_text\1\27on_publish_diagnostics\15diagnostic\twith$textDocument/publishDiagnostics\rhandlers\nsetup\29/opt/bin/zeta-note-linux(/opt/sumneko_lua/bin/Linux/main.lua\1\3\0\0\0\a-E3/opt/sumneko_lua/bin/Linux/lua-language-server\15os_homedir\tloop\bcmd\rroot_dir\0\14on_attach\nflags\1\0\1\26debounce_text_changes\3�\3\17capabilities\1\0\0\29make_client_capabilities\rprotocol\blsp\bvim\24update_capabilities\17cmp_nvim_lsp\0\npairs\14zeta_note\1\3\0\0\14README.md\rindex.md\1\0\1\bcmd\20zeta-note-linux\vyamlls\1\0\1\bcmd\25yaml-language-server\rtsserver\1\2\0\0\17package.json\1\0\1\bcmd\31typescript-language-server\vtexlab\1\3\0\0\rrefs.bib\rmain.tex\1\0\1\bcmd\vtexlab\16sumneko_lua\1\2\0\0\blua\1\0\1\bcmd\24lua-language-server\18rust_analyzer\1\0\2\bcmd\18rust-analyzer\17root_pattern\15Cargo.toml\fpyright\1\6\0\0\rsetup.py\14setup.cfg\19pyproject.toml\23pyrightconfig.json\21requirements.txt\1\0\1\bcmd\23pyright-langserver\vjsonls\1\0\1\bcmd vscode-json-language-server\thtml\1\3\0\0\15index.html\17package.json\1\0\1\bcmd vscode-html-language-server\ngopls\1\2\0\0\rMakefile\1\0\1\bcmd\ngopls\rdockerls\1\2\0\0\15Dockerfile\1\0\1\bcmd\22docker-langserver\ncmake\1\2\0\0\19CMakeLists.txt\1\0\1\bcmd\26cmake-language-server\vclangd\1\3\0\0\19CMakeLists.txt\rMakefile\1\0\1\bcmd\vclangd\vbashls\1\0\0\17root_pattern\1\0\1\bcmd\25bash-language-server\19lspconfig.util\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
try_loadstring("\27LJ\2\n�\14\0\0\6\0\25\00015\0\0\0006\1\1\0009\1\2\0015\2\4\0=\2\3\0016\1\1\0009\1\2\1'\2\6\0=\2\5\0016\1\1\0009\1\a\1'\3\b\0009\4\t\0&\3\4\3B\1\2\0016\1\1\0009\1\a\1'\3\n\0009\4\v\0&\3\4\3B\1\2\0016\1\1\0009\1\a\1'\3\f\0009\4\r\0&\3\4\3B\1\2\0016\1\1\0009\1\a\1'\3\14\0009\4\15\0&\3\4\3B\1\2\0016\1\16\0'\3\17\0B\1\2\0029\1\18\0016\3\16\0'\5\19\0B\3\2\0029\3\20\0039\3\21\0035\4\22\0B\1\3\0016\1\1\0009\1\2\0015\2\24\0=\2\23\1K\0\1\0\1\0\b\14find_file\fSPC s o\rnew_file\fSPC s n\17find_history\fSPC s h\23change_colorscheme\fSPC s c\30Current directory_session\fSPC s l\15book_marks\fSPC s b\17last_session\fSPC s L\14find_word\fSPC s /\30dashboard_custom_shortcut\1\0\1\vprefix\r<leader>\14dashboard\rleaderkm\vkeymap\rregister\14which-key\frequire\17footer_color!hi! dashboardFooter   guifg=\19shortcut_color!hi! dashboardShortcut guifg=\17center_color!hi! dashboardCenter   guifg=\17header_color!hi! dashboardHeader   guifg=\bcmd\14telescope dashboard_default_executive\1\b\0\0�\1███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗�\1████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║�\1██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║�\1██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║�\1██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║�\1██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║�\1╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝\28dashboard_custom_header\6g\bvim\1\0\4\19shortcut_color\f#a9a1e1\17center_color\f#51afef\17footer_color\f#586268\17header_color\f#581298\0", "config", "dashboard-nvim")
time([[Config for dashboard-nvim]], false)
-- Config for: vim-printer
time([[Config for vim-printer]], true)
try_loadstring("\27LJ\2\n�\2\0\0\5\0\16\0\0216\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\6\0'\2\a\0B\0\2\0029\0\b\0005\2\14\0005\3\n\0005\4\t\0=\4\v\0035\4\f\0=\4\r\3=\3\15\2B\0\2\1K\0\1\0\6,\1\0\0\6P\1\2\0\0\28Insert print line above\6p\1\0\0\1\2\0\0\28Insert print line below\rregister\14which-key\frequire\a,P'vim_printer_print_above_keybinding\a,p'vim_printer_print_below_keybinding\6g\bvim\0", "config", "vim-printer")
time([[Config for vim-printer]], false)
-- Config for: better-escape.nvim
time([[Config for better-escape.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0026\3\6\0009\3\a\0039\3\b\3=\3\t\2B\0\2\1K\0\1\0\ftimeout\15timeoutlen\6o\bvim\fmapping\1\0\2\tkeys\n<Esc>\22clear_empty_lines\1\1\3\0\0\ajk\akj\nsetup\18better_escape\frequire\0", "config", "better-escape.nvim")
time([[Config for better-escape.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n�\b\0\0\6\0*\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\16\0005\4\17\0=\4\18\3=\3\19\0025\3\20\0005\4\21\0=\4\5\3=\3\22\0025\3\25\0005\4\23\0005\5\24\0=\5\5\4=\4\26\0035\4\27\0005\5\28\0=\5\29\4=\4\30\0035\4\31\0005\5 \0=\5!\0045\5\"\0=\5#\0045\5$\0=\5%\0045\5&\0=\5'\4=\4(\3=\3)\2B\0\2\1K\0\1\0\16textobjects\tmove\22goto_previous_end\1\0\2\a[M\20@function.outer\a[]\17@class.outer\24goto_previous_start\1\0\2\a[[\17@class.outer\a[m\20@function.outer\18goto_next_end\1\0\2\a]M\20@function.outer\a][\17@class.outer\20goto_next_start\1\0\2\a]]\17@class.outer\a]m\20@function.outer\1\0\2\venable\2\14set_jumps\2\16lsp_interop\25peek_definition_code\1\0\2\15<leader>cP\17@class.outer\15<leader>cp\20@function.outer\1\0\2\venable\2\vborder\tnone\vselect\1\0\0\1\0\6\aaf\20@function.outer\aal\16@loop.outer\aac\17@class.outer\aif\20@function.inner\aic\17@class.inner\ail\16@loop.inner\1\0\2\venable\2\14lookahead\2\17textsubjects\1\0\2\6;!textsubjects-container-outer\6.\23textsubjects-smart\1\0\1\venable\2\fautotag\14filetypes\1\v\0\0\thtml\15javascript\20javascriptreact\15typescript\20typescriptreact\vsvelte\bvue\vpython\blua\rmarkdown\1\0\1\venable\2\14tree_docs\1\0\1\venable\2\vindent\1\0\1\venable\1\14autopairs\1\0\1\venable\2\14highlight\1\0\1\venable\2\26incremental_selection\1\0\0\fkeymaps\1\0\4\21node_decremental\agH\19init_selection\ags\22scope_incremental\agl\21node_incremental\agh\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n\0\0\5\0\a\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\0029\2\5\0025\3\6\0B\0\3\1K\0\1\0\1\0\1\vprefix\r<leader>\14telescope\rleaderkm\vkeymap\rregister\14which-key\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n/\0\1\5\0\4\0\0056\1\0\0009\1\1\1'\3\2\0009\4\3\0D\1\3\0\aid\a%s\vformat\vstring�\1\0\4\14\0\a\0\21'\4\0\0006\5\1\0\18\a\2\0B\5\2\4H\b\r�\a\b\2\0X\n\2�'\n\3\0X\v\5�\a\b\4\0X\n\2�'\n\5\0X\v\1�'\n\6\0\18\v\4\0\18\f\t\0\18\r\n\0&\4\r\vF\b\3\3R\b�L\4\2\0\n  \n  \fwarning\n  \nerror\npairs\6 E\0\1\2\0\4\0\t6\1\0\0009\1\1\0018\1\0\0019\1\2\1\6\1\3\0X\1\2�+\1\2\0L\1\2\0K\0\1\0\14dashboard\rfiletype\abo\bvim�\5\1\0\6\0\15\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\r\0005\3\4\0003\4\3\0=\4\5\0033\4\6\0=\4\a\0033\4\b\0=\4\t\0034\4\3\0005\5\n\0>\5\1\0045\5\v\0>\5\2\4=\4\f\3=\3\14\2B\0\2\1K\0\1\0\foptions\1\0\0\foffsets\1\0\3\rfiletype\vpacker\15text_align\vcenter\ttext\20Plugins manager\1\0\3\rfiletype\fOutline\15text_align\vcenter\ttext\fSymbols\18custom_filter\0\26diagnostics_indicator\0\fnumbers\1\0\19\25enforce_regular_tabs\2\16diagnostics\rnvim_lsp\rtab_size\3\25\22max_prefix_length\3\15\20max_name_length\3\20\fsort_by\14directory\23right_trunc_marker\b\22left_trunc_marker\b\15close_icon\5\18modified_icon\b●\22buffer_close_icon\5\19indicator_icon\b▎\27always_show_bufferline\1\20separator_style\nthick\24persist_buffer_sort\2\24show_tab_indicators\2\20show_close_icon\1\28show_buffer_close_icons\1\22show_buffer_icons\2\0\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: sniprun
time([[Config for sniprun]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\16repl_enable\1\2\0\0\17Python3_fifo\26selected_interpreters\1\0\0\1\2\0\0\17Python3_fifo\nsetup\fsniprun\frequire\0", "config", "sniprun")
time([[Config for sniprun]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\5\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0025\3\5\0005\4\6\0=\4\a\3=\3\b\2B\0\2\1K\0\1\0\15float_opts\15highlights\1\0\2\15background\vNormal\vborder\fSpecial\1\0\4\vheight\3\15\nwidth\3F\vborder\vcurved\rwinblend\3\0\20shade_filetypes\1\0\b\17open_mapping\t<F4>\tsize\3\15\18close_on_exit\2\14direction\15horizontal\17persist_size\2\20start_in_insert\2\20shade_terminals\2\17hide_numbers\2\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n�\6\0\0\5\0\20\0%6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\0029\2\5\0025\3\6\0B\0\3\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\0029\2\a\0025\3\b\0B\0\3\0016\0\0\0'\2\t\0B\0\2\0029\0\n\0005\2\v\0005\3\f\0=\3\r\0025\3\14\0005\4\15\0=\4\16\0035\4\17\0=\4\18\3=\3\19\2B\0\2\1K\0\1\0\fkeymaps\tn [c\1\2\1\0H&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'\texpr\2\tn ]c\1\2\1\0H&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'\texpr\2\1\0\5\to ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\fnoremap\2\17v <leader>grT<cmd>lua require\"gitsigns\".reset_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\17v <leader>gsT<cmd>lua require\"gitsigns\".stage_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\tx ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\28current_line_blame_opts\1\0\3\ndelay\3d\18virt_text_pos\beol\14virt_text\2\1\0\3\23current_line_blame\2\nnumhl\1\15signcolumn\2\nsetup\rgitsigns\1\0\2\vprefix\r<leader>\tmode\6v\14gitvisual\1\0\2\vprefix\r<leader>\tmode\6n\bgit\rleaderkm\vkeymap\rregister\14which-key\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: nvim-treesitter-context
time([[Config for nvim-treesitter-context]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\fpattern\1\0\0\fdefault\1\0\0\1\a\0\0\nclass\rfunction\vmethod\bfor\nwhile\aif\nsetup\23treesitter-context\frequire\0", "config", "nvim-treesitter-context")
time([[Config for nvim-treesitter-context]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n�\5\0\0\6\0\29\0#6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\3\0005\5\4\0=\5\5\4=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\15\0005\5\14\0=\5\16\4=\4\17\0035\4\19\0005\5\18\0=\5\20\4=\4\21\0035\4\22\0=\4\23\3B\1\2\0019\1\24\0006\3\0\0'\5\25\0B\3\2\0029\3\26\0039\3\27\0035\4\28\0B\1\3\1K\0\1\0\1\0\1\vprefix\r<leader>\tbase\rleaderkm\vkeymap\rregister\vhidden\1\t\0\0\r<silent>\n<Cmd>\n<cmd>\v<Plug>\tcall\blua\a^:\a^ \vlayout\vheight\1\0\2\nalign\tleft\fspacing\3\3\1\0\2\bmax\3\n\bmin\3\1\vwindow\fpadding\1\0\0\1\5\0\0\3\0\3\0\3\0\3\0\15key_labels\1\0\3\t<cr>\bRET\n<tab>\bTAB\f<space>\bSPC\nicons\1\0\3\ngroup\6+\15breadcrumb\a»\14separator\b➜\14operators\1\0\6\6!#Filter though external program\agU\14Uppercase\t<lt>\16Indent left\agu\14Lowercase\ag~\16Toggle case\azf\16Create fold\fplugins\1\0\2\rtriggers\tauto\14show_help\2\fpresets\1\0\a\bnav\1\fwindows\1\17text_objects\1\fmotions\1\14operators\1\6g\2\6z\2\1\0\2\14registers\1\nmarks\1\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: neorg
time([[Config for neorg]], true)
try_loadstring("\27LJ\2\n�\2\0\0\a\0\17\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\15\0005\3\3\0004\4\0\0=\4\4\0034\4\0\0=\4\5\0035\4\a\0005\5\6\0=\5\b\4=\4\t\0035\4\r\0005\5\v\0005\6\n\0=\6\f\5=\5\b\4=\4\14\3=\3\16\2B\0\2\1K\0\1\0\tload\1\0\0\21core.norg.dirman\1\0\0\15workspaces\1\0\0\1\0\1\17my_workspace\f~/neorg\18core.keybinds\vconfig\1\0\0\1\0\2\17neorg_leader\a,o\21default_keybinds\2\24core.norg.concealer\18core.defaults\1\0\0\nsetup\nneorg\frequire\0", "config", "neorg")
time([[Config for neorg]], false)
-- Config for: truezen.nvim
time([[Config for truezen.nvim]], true)
try_loadstring("\27LJ\2\n�\5\0\0\6\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\3=\3\v\0025\3\15\0005\4\f\0005\5\r\0=\5\14\4=\4\16\0035\4\17\0=\4\18\3=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\tmisc\1\0\3\25ui_elements_commands\1\20on_off_commands\1\19cursor_by_mode\1\17integrations\1\0\4\ttmux\2\15galaxyline\2\rgitsigns\2\20nvim_bufferline\2\nmodes\nfocus\1\0\2\17focus_method\17experimental\20margin_of_error\3\5\rataraxis\1\0\0\29ideal_writing_area_width\1\2\0\0\3\0\1\0\b\22just_do_it_for_me\2\19bottom_padding\3\0\16top_padding\3\0\18right_padding\3\30\17left_padding\3\30\21bg_configuration\2\15custome_bg\5 keep_default_fold_fillchars\2\aui\1\0\0\tleft\1\0\3\vnumber\1\15signcolumn\ano\19relativenumber\1\btop\1\0\1\16showtabline\3\0\vbottom\1\0\0\1\0\5\nruler\1\14cmdheight\3\1\15laststatus\3\0\fshowcmd\1\rshowmode\1\nsetup\rtrue-zen\frequire\0", "config", "truezen.nvim")
time([[Config for truezen.nvim]], false)
-- Config for: mkdir.nvim
time([[Config for mkdir.nvim]], true)
try_loadstring("\27LJ\2\n%\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\nmkdir\frequire\0", "config", "mkdir.nvim")
time([[Config for mkdir.nvim]], false)
-- Config for: magma-nvim
time([[Config for magma-nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\5\0\f\0\0276\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0006\2\3\0'\4\6\0B\2\2\0029\2\a\0029\2\b\0025\3\t\0B\0\3\0016\0\3\0'\2\4\0B\0\2\0029\0\5\0006\2\3\0'\4\6\0B\2\2\0029\2\a\0029\2\n\0025\3\v\0B\0\3\1K\0\1\0\1\0\2\vprefix\r<leader>\tmode\6x\fmagma_x\1\0\2\vprefix\r<leader>\tmode\6n\nmagma\rleaderkm\vkeymap\rregister\14which-key\frequire$magma_automatically_open_output\6g\bvim\0", "config", "magma-nvim")
time([[Config for magma-nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file neogit lua require("packer.load")({'neogit'}, { cmd = "neogit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au insertenter * ++once lua require("packer.load")({'nvim-autopairs'}, { event = "insertenter *" }, _G.packer_plugins)]]
vim.cmd [[au bufwinenter * ++once lua require("packer.load")({'format.nvim'}, { event = "bufwinenter *" }, _G.packer_plugins)]]
vim.cmd [[au bufreadpre * ++once lua require("packer.load")({'persistence.nvim'}, { event = "bufreadpre *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
