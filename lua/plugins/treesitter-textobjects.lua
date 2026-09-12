vim.pack.add({
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
    version = "main",
  },
})

require("nvim-treesitter-textobjects").setup({
  move = {
    set_jumps = true,
  },
})

local move = require("nvim-treesitter-textobjects.move")

vim.keymap.set({ "n", "x", "o" }, "]f", function()
  move.goto_next_start("@function.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "[f", function()
  move.goto_previous_start("@function.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "]c", function()
  move.goto_next_start("@class.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "[c", function()
  move.goto_previous_start("@class.outer", "textobjects")
end)
