return {
  'numToStr/Comment.nvim',
  lazy = false,
  opts = {
      -- add any options here
  },
  config = function()
    require('Comment').setup({
      ignore = '^$',
      toggler = {
        line = '<leader>cc',
        block = '<leader>bc',
      },
      opleader = {
        line = '<leader>cc',
        block = '<leader>bc',
      },
    })
  end,
}
