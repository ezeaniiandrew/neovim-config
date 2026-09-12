vim.keymap.set("n", "<leader>e", "<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<cr>", {
  desc = "Open File Explorer",
});
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", {
  desc = "Save Changes",
});
vim.keymap.set("n", "<leader>wq", "<cmd>wq<cr>", {
  desc = "Save Changes and Quit Neovim",
});
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", {
  desc = "Quit Neovim",
});

vim.keymap.set("i", "<CR>", function()
  if vim.fn["coc#pum#visible"]() ~= 0 then
    return vim.fn["coc#pum#confirm"]()
  else
    return require("mini.pairs").cr()
  end
end, { expr = true, silent = true })


vim.keymap.set("n", "<leader>sw", "<cmd>lua MiniSessions.write('.session.vim')<cr>", {
  desc = "Create a new session",
});
vim.keymap.set("n", "<leader>ss", "<cmd>lua MiniSessions.select()<cr>", {
  desc = "Select a session",
});
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", {
  desc = "Delete buffer",
});
vim.keymap.set("n", "<leader>R", "<cmd>restart<CR>", {
  desc = "Restart Neovim",
});
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", {
  desc = "Next buffer",
})

vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>", {
  desc = "Previous buffer",
})

vim.keymap.set("n", "<leader>gb", "<cmd>lua MiniExtra.pickers.git_branches()<cr>", {
  desc = "List all Git Branches"
})
vim.keymap.set("n", "<leader>gc", "<cmd>lua MiniExtra.pickers.git_commits()<cr>", {
  desc = "List all Git Commits"
})
vim.keymap.set("n", "<leader>c", "<cmd>lua MiniExtra.pickers.commands()<cr>", {
  desc = "List all Neovim Commands"
})
vim.keymap.set("n", "<leader>p", "<cmd>lua MiniExtra.pickers.oldfiles()<cr>", {
  desc = "List Previous Files"
})
vim.keymap.set("n", "<leader>pc", "<cmd>lua MiniExtra.pickers.oldfiles({current_dir = true})<cr>", {
  desc = "List Previous Files For Current Directory"
})
vim.keymap.set("n", "<leader>vl", "<cmd>CocCommand loader.open<cr>", {
  desc = "Open Coc Vscode Loader"
})
