vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })

require('mini.cmdline').setup()
require('mini.extra').setup()
require('mini.files').setup()
require('mini.icons').setup()
require('mini.pick').setup()
require('mini.indentscope').setup()
require('mini.pairs').setup()
require('mini.sessions').setup({
  autoread = true,
  file = '.session.vim'
})
require('mini.statusline').setup()
require('mini.surround').setup()
require('mini.tabline').setup()
local ai = require("mini.ai")

ai.setup({
  custom_textobjects = {
    F = ai.gen_spec.treesitter({
      a = "@function.outer",
      i = "@function.inner",
    }),
  },
})
