return {
	"simrat39/rust-tools.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"mfussenegger/nvim-dap",
		"neovim/nvim-lspconfig",
	},
	config = function()
		local rt = require("rust-tools")

		rt.setup({
			tools = {
				hover_actions = {
					auto_focus = true,
				},
			},
			server = {
				on_attach = function(_, bufnr)
					-- Hover actions
					vim.keymap.set("n", "<Leader>d", rt.hover_actions.hover_actions, { buffer = bufnr })
					-- Code action groups
					vim.keymap.set("n", "<Leader>s", rt.code_action_group.code_action_group, { buffer = bufnr })
				end,
			},
		})
	end,
}
