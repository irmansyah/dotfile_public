return {
  'numToStr/Comment.nvim',
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
  lazy = false,
}
