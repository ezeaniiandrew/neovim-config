vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" },

  filetypes = { "lua" },

  root_markers = {
    ".luarc.json",
    ".luarc.jsonc",
    ".git",
  },

  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },

      diagnostics = {
        enable = true,
        globals = { "vim" },
      },

      completion = {
        enable = true,
      },

      workspace = {
        library = {
          vim.fn.expand("$PREFIX/share/nvim/runtime/lua"),
        },
        checkThirdParty = false,
      },

      telemetry = {
        enable = false,
      },
    },
  },
})

vim.lsp.enable("lua_ls")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client and client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, args.buf, {
        autotrigger = true,
      })
    end
  end,
})

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  severity_sort = true,

  float = {
    border = "rounded",
    source = "if_many",
    focusable = false,
  },
})

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, {
      focus = false,
      scope = "cursor",
      border = "rounded",
    })
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.lua",
  callback = function(args)
    vim.lsp.buf.format({
      bufnr = args.buf,
      async = false,
    })
  end,
})
