return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.erb_lint,
        -- null_ls.builtins.diagnostics.eslint_d, -- Add eslint_d for diagnostics
        -- null_ls.builtins.code_actions.eslint_d, -- Optional: eslint_d for code actions
        null_ls.builtins.formatting.prettier, -- Optional: Prettier for formatting
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
