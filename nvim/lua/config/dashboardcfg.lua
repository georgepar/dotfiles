return function()
    dashboard_custom_colors = {
      header_color = "#581298",
      center_color = "#51afef",
      shortcut_color = "#a9a1e1",
      footer_color = "#586268",
    }
    vim.g.dashboard_custom_header = {
        "███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
        "████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
        "██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
        "██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
        "██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
        "██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
        "╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝"
    }
    vim.g.dashboard_default_executive = "clap"

  vim.cmd("hi! dashboardHeader   guifg=" .. dashboard_custom_colors.header_color)
  vim.cmd("hi! dashboardCenter   guifg=" .. dashboard_custom_colors.center_color)
  vim.cmd("hi! dashboardShortcut guifg=" .. dashboard_custom_colors.shortcut_color)
  vim.cmd("hi! dashboardFooter   guifg=" .. dashboard_custom_colors.footer_color)

end
