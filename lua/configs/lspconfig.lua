require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "clangd", "ruby_lsp", "tsserver", "pylsp",
  "gopls", "lua_ls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
