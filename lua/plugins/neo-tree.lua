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
      { text = " ", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn",
      { text = " ", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo",
      { text = " ", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint",
      { text = "󰌵", texthl = "DiagnosticSignHint" })

    require('neo-tree').setup({
      default_component_configs = {
        file_size = {
          enabled = false,
        },
        type = {
          enabled = false,
        },
        last_modified = {
          enabled = false,
        },
        created = {
          enabled = false,
        },
      },
      window = {
        position = "bottom",
        width = 32,
        height = 20,
      },
    })

    local setkeymap = vim.api.nvim_set_keymap

    function OpenNeoTree(neotree_command)
      local bufnrs = vim.api.nvim_list_bufs()
      for _, bufnr in ipairs(bufnrs) do
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        if bufname == "" or bufname == "[No Name]" then
          vim.api.nvim_buf_delete(bufnr, { force = true })
        end
      end
      vim.cmd(neotree_command)
    end


    -- vim.keymap.set("n", "<C-t>", ":Neotree filesystem reveal toggle<CR>", {})
    -- vim.keymap.set("n", "<C-f>", ":Neotree filesystem toggle<CR>", {})
    -- setkeymap('n', '<C-t>', 'lua open_neotree_or_close_no_name(":Neotree filesystem reveal toggle")<CR>', {})
    setkeymap('n', '<C-t>', ':lua OpenNeoTree(":Neotree filesystem reveal toggle")<CR>', { noremap = true, silent = true })
    setkeymap("n", "<C-f>", ':lua OpenNeoTree(":Neotree filesystem toggle")<CR>', { noremap = true, silent = true })
  end,
}
