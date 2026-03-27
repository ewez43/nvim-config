return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "ruby",
        "c",
        "python",
        "go",
        "typescript",
        "markdown",
      },
      auto_install = true,
      endwise = { enabled = true },
    },
  },
  {
    "RRethy/nvim-treesitter-endwise",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      -- No specific setup() call required, just needs to be loaded
    end,
  },
  {
    "tpope/vim-rails",
  },
  {
    "nat-418/tcl.nvim",
    ft = "tcl",
    dependencies = {
      "mfussenegger/nvim-lint",
    },
    config = function()
      require("tcl").setup()
    end,
  },
  {
    "mfussenegger/nvim-lint",
    config = function()
      local lint = require "lint"

      lint.linters.nagelfar = {
        cmd = "tclsh",
        stdin = false,
        args = {
          vim.fn.expand "~/.local/share/nagelfar/nagelfar.tcl",
          "-s", -- suppress some noise (optional)
        },
        stream = "stdout",
        ignore_exitcode = true,
        parser = function(output, bufnr)
          local diagnostics = {}
          local lines = vim.split(output, "\n")

          for _, line in ipairs(lines) do
            -- Nagelfar output example:
            -- file.tcl:12: warning: something
            local filename, lnum, type, msg = line:match "([^:]+):(%d+): (%w+): (.+)"

            if filename and lnum then
              table.insert(diagnostics, {
                lnum = tonumber(lnum) - 1,
                col = 0,
                message = msg,
                severity = type == "error" and vim.diagnostic.severity.ERROR or vim.diagnostic.severity.WARN,
                source = "nagelfar",
              })
            end
          end

          return diagnostics
        end,
      }

      lint.linters_by_ft = {
        tcl = { "nagelfar" },
      }

      -- auto-run on events
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
  {
    "seandewar/actually-doom.nvim",
  },
}
