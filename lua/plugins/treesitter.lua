vim.pack.add({
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter',
    version = 'main',
  },
});

local treesitter = require('nvim-treesitter')

treesitter.setup({
  install_dir = vim.fn.stdpath('data') .. '/site'
})

local languages = {
  'lua',
  'javascript',
  'typescript',
  'tsx',
  'html',
  'css',
  'json',
  'bash',
  'python',
  'yaml',
  'markdown',
  'markdown_inline',
  'toml',
  'gitcommit',
  'git_rebase',
}

treesitter.install(languages)

vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    local language = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)

    if language and vim.tbl_contains(languages, language) then
      vim.treesitter.start(args.buf, language)
    end
  end,
})
