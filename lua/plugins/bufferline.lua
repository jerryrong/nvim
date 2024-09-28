return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          color_icons = true,
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          show_tab_indicators = true,
          buffer_close_icon = "󰅖",
          modified_icon = "●",
          close_icon = "",
          left_trunc_marker = "",
          right_trunc_marker = "",
          diagnostics = false,
          separator_style = "thick",
          enforce_regular_tabs = false,
          indicator = {
            icon = "▎",
            style = "icon",
          },
        },
        highlights = {
          buffer_selected = {
            italic = false,
          },
          duplicate_selected = {
            italic = false,
          },
          duplicate_visible = {
            italic = false,
          },
          duplicate = {
            italic = false,
          },
        },
      })
    end,
  },
}
