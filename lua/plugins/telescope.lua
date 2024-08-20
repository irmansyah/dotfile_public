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
      local telescope = require('telescope')
      local action_state = require('telescope.actions.state')
      local actions = require('telescope.actions')
      local pickers = require('telescope.pickers')
      local finders = require('telescope.finders')
      local sorters = require('telescope.sorters')
      local previewers = require('telescope.previewers')

      telescope.setup {
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close
            },
          },
        }
      }

      local function get_lsp_diagnostics()
        local diagnostics = vim.diagnostic.get()
        local files_with_errors = {}

        for _, diagnostic in ipairs(diagnostics) do
          local filename = vim.fn.bufname(diagnostic.bufnr)
          if not files_with_errors[filename] then
            files_with_errors[filename] = true
          end
        end

        local results = {}
        for filename, _ in pairs(files_with_errors) do
          table.insert(results, filename)
        end

        return results
      end

      function show_error_files()
        local results = get_lsp_diagnostics()

        pickers.new({}, {
          prompt_title = "Error Files",
          finder = finders.new_table {
            results = results,
            entry_maker = function(entry)
              return {
                value = entry,
                display = entry,
                ordinal = entry,
                preview_command = function(entry, bufnr)
                  require('telescope.previewers.utils').job_maker({ "cat", entry.value }, bufnr)
                end,
              }
            end,
          },
          sorter = sorters.get_generic_fuzzy_sorter(),
          previewer = previewers.cat.new({}),
          attach_mappings = function(_, map)
            map('i', '<CR>', function(prompt_bufnr)
              local selection = action_state.get_selected_entry()
              actions.close(prompt_bufnr)
              vim.cmd('edit ' .. selection.value)
            end)
            return true
          end,
        }):find()
      end

      vim.api.nvim_set_keymap('n', '<leader>fe', ':lua show_error_files()<CR>', { noremap = true, silent = true })

      -- Other keymaps for built-in Telescope functions
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

      -- Additional keymap for buffers using built-in Telescope function
      vim.api.nvim_set_keymap("n", "<leader>bb", ":Telescope buffers<CR>", { noremap = true, silent = true })


      -- Load the ui-select extension
      require("telescope").load_extension("ui-select")
    end,
  },
}
