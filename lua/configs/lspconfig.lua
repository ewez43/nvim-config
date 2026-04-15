require("nvchad.configs.lspconfig").defaults()

vim.lsp.config("ts_ls", {
  settings = {
    typescript = {
      suggest = {
        autoImports = true,
      },
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
    javascript = {
      suggest = {
        autoImports = true,
      },
    },
  },
})

vim.lsp.config("lua_ls", {
  cmd = { "/home/ewez05/lua-lsp/bin/lua-language-server" }, -- REPLACEABLE insert your own bin
})

local servers = { "html", "cssls", "clangd", "ruby_lsp", "ts_ls", "pylsp", "gopls", "lua_ls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
