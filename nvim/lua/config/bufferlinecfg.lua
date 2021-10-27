return function()
  require("bufferline").setup({
    options = {
      numbers = function(opts)
        return string.format("%s", opts.id)
      end,
      indicator_icon = "▎",
      buffer_close_icon = "", -- "",
      modified_icon = "●",
      close_icon = "", -- "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 20,
      max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
      tab_size = 25,
      diagnostics = "coc",
      diagnostics_indicator = function(_, _, diagnostics_dict, _)
        local s = " "
        for e, n in pairs(diagnostics_dict) do
          local sym = e == "error" and "  " or (e == "warning" and "  " or "  ")
          s = s .. n .. sym
        end
        return s
      end,
      -- NOTE: this will be called a lot so don't do any heavy processing here
      custom_filter = function(buf_number)
        if vim.bo[buf_number].filetype ~= "dashboard" then
          return true
        end
      end,
      offsets = {
        -- {
        --   filetype = "NvimTree",
        --   text = "File Explorer",
        --   text_align = "center",
        -- },
        {
          filetype = "minimap",
          text = "Minimap",
          text_align = "center",
        },
        {
          filetype = "Outline",
          text = "Symbols",
          text_align = "center",
        },
        {
          filetype = "packer",
          text = "Plugins manager",
          text_align = "center",
        },
      },
      show_buffer_icons = true,
      show_buffer_close_icons = false,
      show_close_icon = false,
      show_tab_indicators = true,
      persist_buffer_sort = true,
      separator_style = "thick",
      enforce_regular_tabs = true,
      always_show_bufferline = false,
      sort_by = "directory",
    },
  })
end
