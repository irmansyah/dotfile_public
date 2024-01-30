-- return {
--   {
--     "nvim-telescope/telescope-ui-select.nvim",
--   },
--   {
--     "nvim-telescope/telescope.nvim",
--     tag = "0.1.5",
--     dependencies = { "nvim-lua/plenary.nvim" },
--     config = function()
--       require("telescope").setup({
--         extensions = {
--           ["ui-select"] = {
--             require("telescope.themes").get_dropdown({}),
--           },
--         },
--       })
--       local builtin = require("telescope.builtin")
--       vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
--       vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
--       vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
--       vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
--       vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

--       vim.api.nvim_set_keymap("n", "<leader>b", ":Telescope buffers<CR>", { noremap = true, silent = true })

--       require("telescope").load_extension("ui-select")
--     end,
--   },
-- }
--



return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })

      local builtin = require("telescope.builtin")
      -- -- Set up LSP references keymap with ui-select theme
      -- vim.keymap.set('n', 'gr', function()
      --   require('telescope').extensions['ui-select'].lsp_references({
      --     prompt_title = 'LSP References',
      --     layout_strategy = 'horizontal',
      --     finder = require('telescope.finders').new_table({
      --       results = vim.lsp.buf.references(),
      --       entry_maker = function(entry)
      --         return {
      --           value = entry.uri,
      --           display = entry.uri,
      --           ordinal = entry.uri,
      --           filename = vim.fn.fnamemodify(entry.uri, ':p'),
      --         }
      --       end,
      --     }),
      --   })
      -- end, { noremap = true, silent = true })

      -- Other keymaps for built-in Telescope functions
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

      -- Additional keymap for buffers using built-in Telescope function
      vim.api.nvim_set_keymap("n", "<leader>b", ":Telescope buffers<CR>", { noremap = true, silent = true })

      -- Load the ui-select extension
      require("telescope").load_extension("ui-select")
    end,
  },
}
