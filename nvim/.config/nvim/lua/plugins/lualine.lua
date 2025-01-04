return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local custom_gruvbox = require 'lualine.themes.gruvbox'
    custom_gruvbox.normal.c.bg = '#1C1C1C'

    require("lualine").setup({
      options = {
        theme = custom_gruvbox,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
          {
            function()
              local cwd = vim.fn.getcwd()                                -- Get the current working directory
              local home = vim.fn.expand("~")                            -- Get the home directory
              local trimmed_path = cwd:gsub("^" .. home .. "/[^/]+", "") -- Remove the home directory and the first-level folder
              local filename = vim.fn.expand("%:t")                      -- Get the current filename (base name only)

              -- Clean up path or fallback to full path and add the filename
              local display_path = (trimmed_path == "" and cwd or trimmed_path:sub(2)) -- Remove leading "/"
              return display_path .. "/" .. filename
            end,
          },
        },
        -- lualine_x = { 'encoding', 'fileformat', 'filetype' },
        -- lualine_y = { 'progress' },
        -- lualine_z = { 'location' }
      }
    })
  end,
}
