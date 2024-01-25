return {
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    name = 'gruvbox',
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "hard", -- can be "hard", "soft" or empty string
        palette_overrides = {
          bright_red = "#db5757",
          bright_green = "#a1a352",
          bright_yellow = "#d7aa42",
          bright_blue = "#6A8C7F",
          bright_purple = "#BA6D82",
          bright_aqua = "#75A763",
          bright_orange = "#dd843c",
        },
        highlight = {
          enable = true,
          additional_highlight_groups = {
            NvimTreeFolderName = { fg = '#D79921' }, -- Change folder name color to red
            NvimTreeFolderIcon = { fg = '#D79921' },
          },
        },
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
      })

      vim.cmd.colorscheme "gruvbox"
    end
  }
}
