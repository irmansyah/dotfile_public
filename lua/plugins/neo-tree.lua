return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    -- If you want icons for diagnostic errors, you'll need to define them somewhere:
    vim.fn.sign_define("DiagnosticSignError",
      {text = " ", texthl = "DiagnosticSignError"})
    vim.fn.sign_define("DiagnosticSignWarn",
      {text = " ", texthl = "DiagnosticSignWarn"})
    vim.fn.sign_define("DiagnosticSignInfo",
      {text = " ", texthl = "DiagnosticSignInfo"})
    vim.fn.sign_define("DiagnosticSignHint",
      {text = "󰌵", texthl = "DiagnosticSignHint"})

    require('neo-tree').setup({
      window = {
        width = 32
      }
    })
		vim.keymap.set("n", "<leader>[", ":Neotree filesystem focus<CR>", {})
		vim.keymap.set("n", "<C-t>", ":Neotree filesystem reveal left<CR>", {})
		vim.keymap.set("n", "<C-f>", ":Neotree filesystem toggle<CR>", {})
		vim.keymap.set("n", "<C-n>", ":Neotree buffers reveal float<CR>", {})
	end,
}
