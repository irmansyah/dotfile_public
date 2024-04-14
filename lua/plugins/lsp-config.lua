return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    'simrat39/rust-tools.nvim',
    lazy = false,
    config = function()
      local rt = require("rust-tools")
      rt.setup({
        -- dap = {
        --   adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
        -- },
        server = {
          -- capabilities = require("cmp_nvim_lsp").default_capabilities(),
          -- on_attach = function(_, _)
          --   -- vim.keymap.set("n", "<leader>k", rt.hover_actions.hover_actions, { buffer = bufnr })
          --   -- vim.keymap.set("n", "<leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
          -- end,
        },
        tools = {
          hover_actions = {
            auto_focus = true,
          },
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.tsserver.setup({
        capabilities = capabilities
      })
      lspconfig.html.setup({
        capabilities = capabilities
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.dartls.setup({
        capabilities = capabilities
      })
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities
      })

      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, {})
      vim.keymap.set('n', '[e', vim.diagnostic.goto_prev, {})
      vim.keymap.set('n', ']e', vim.diagnostic.goto_next, {})
      vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, {})

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
    end,
  },
}
