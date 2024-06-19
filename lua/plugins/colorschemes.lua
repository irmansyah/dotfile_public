return {
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    name = 'gruvbox',
    priority = 1000,
    config = function()
      local text = "#D3C6AA"
      local red = "#db5757"
      local green = "#a1a352"
      local yellow = "#d7aa42"
      local blue = "#6A8C7F"
      local purple = "#BA6D82"
      local aqua = "#75A763"
      local orange = "#dd843c"

      require("gruvbox").setup({
        undercurl = true,
        underline = true,
        bold = false,
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
        inverse = true,
        contrast = "hard",
        palette_overrides = {
          bright_red = red,
          bright_green = green,
          bright_yellow = yellow,
          bright_blue = blue,
          bright_purple = purple,
          bright_aqua = aqua,
          bright_orange = orange,
        },
        highlight = {
          enable = true,
        },
        overrides = {
          Directory = { fg = yellow },
          GitSignsChange = { fg = orange },
          markdownCode = { fg = yellow },

          ["@lsp.type.property"] = { fg = text },
          ["@lsp.type.parameter"] = { fg = text },
          ["@lsp.type.namespace"] = { fg = text },
        },
        dim_inactive = false,
      })
      vim.cmd([[colorscheme gruvbox]])
    end
  },
  {
    'shaunsingh/nord.nvim',
    name = "nord",
    lazy = false,
    priority = 1000,
    config = function()
      require("headlines").setup({
        markdown = {
          headline_highlights = {
            "Headline1",
            "Headline2",
            "Headline3",
            "Headline4",
            "Headline5",
            "Headline6",
          },
          codeblock_highlight = "CodeBlock",
          dash_highlight = "Dash",
          quote_highlight = "Quote",
        },
      })
      -- vim.cmd("colorscheme nord")
    end
  },
}
