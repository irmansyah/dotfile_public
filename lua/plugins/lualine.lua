return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local custom_gruvbox = require'lualine.themes.gruvbox'
    custom_gruvbox.normal.c.bg = '#1C1C1C'

    require("lualine").setup({
      options = {
        theme = custom_gruvbox,
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      }
    })
  end,
}
