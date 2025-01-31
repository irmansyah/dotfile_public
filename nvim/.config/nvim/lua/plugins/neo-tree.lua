return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1001, -- this plugin needs to run before anything else
    opts = {
      rocks = { "magick" },
    },
  },
  {
    "3rd/image.nvim",
    -- branch = "release-please--branches--master",
    event = "VeryLazy",
    -- dependencies = {
    --   {
    --     "nvim-treesitter/nvim-treesitter",
    --     build = ":TSUpdate",
    --     config = function()
    --       require("nvim-treesitter.configs").setup({
    --         ensure_installed = { "markdown" },
    --         highlight = { enable = true },
    --       })
    --     end,
    --   },
    -- },
    dependencies = { "luarocks.nvim" },
    opts = {
      backend = "kitty",
      -- rocks = {
      --   hererocks = true
      -- },
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
        },
        neorg = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "norg" },
        },
      },
      max_width = nil,
      max_height = nil,
      max_width_window_percentage = nil,
      max_height_window_percentage = 50,
      kitty_method = "normal",
    },
    rocks = {
      hererocks = true,
    },
  },
  -- {
  --   'adelarsq/image_preview.nvim',
  --   -- event = 'VeryLazy',
  --   config = function()
  --     require("image_preview").setup()
  --   end
  -- },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      -- "adelarsq/image_preview.nvim",
      "3rd/image.nvim",
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
        diagnostics = {
          enable = true,
          icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
          },
        },
        window = {
          position = "bottom",
          width = 32,
          height = 20,
          mappings = {
            ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
            ["<esc>"] = "close_window",
            -- ["P"] = { "custom_image_preview", use_float = true },
          },
        },
        commands = {
        },
        filesystem = {
          window = {
            width = 32,
            height = 20,
            mappings = {
              ["<leader>p"] = "image_kitty",
            },
          },
          commands = {
            image_kitty = function(state)
              local node = state.tree:get_node()
              if node.type == "file" then
                print("node : " .. node.path)
                -- vim.fn.system('kitty +kitten icat --clear')
                -- vim.fn.jobstart('kitty +kitten icat ' .. vim.fn.shellescape(node.path), { detach = true })
              end
            end,

            custom_image_preview = function(state)
              local node = state.tree:get_node()
              if not node then
                print("No file selected!")
                return
              end

              local path = node.path
              if not path then
                print("Invalid file path!")
                return
              end

              -- Check if it's an image file
              local is_image = path:match("%.png$") or path:match("%.jpg$") or path:match("%.jpeg$")
                  or path:match("%.gif$") or path:match("%.bmp$") or path:match("%.webp$")

              if is_image then
                -- Display the image using Kitty's icat
                vim.fn.system('kitty +kitten icat ' .. vim.fn.shellescape(path))
              else
                -- Fallback: open text preview in a floating window
                vim.api.nvim_command("edit " .. path)
              end
            end,
          }
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

      function CloseNeoTree()
        vim.cmd("bd") -- Close the current buffer
      end

      -- vim.keymap.set("n", "<C-t>", ":Neotree filesystem reveal toggle<CR>", {})
      -- vim.keymap.set("n", "<C-f>", ":Neotree filesystem toggle<CR>", { noremap = true, silent = true })
      -- setkeymap('n', '<C-t>', 'lua open_neotree_or_close_no_name(":Neotree filesystem reveal toggle")<CR>', {})
      -- setkeymap("n", "<C-f>", ':lua OpenNeoTree(":Neotree filesystem toggle")<CR>', { noremap = true, silent = true })
      -- setkeymap('n', '<C-t>', ':lua OpenNeoTree(":Neotree filesystem reveal toggle")<CR>',

      setkeymap("n", "<C-f>", ':lua OpenNeoTree(":Neotree filesystem toggle")<CR>',
        { noremap = true, silent = true })
      setkeymap('n', '<C-t>', ':lua OpenNeoTree(":Neotree filesystem reveal toggle")<CR>',
        { noremap = true, silent = true })
      setkeymap("n", "<C-g>", ':Neotree float git_status<CR>', {})
    end,
  },
}
