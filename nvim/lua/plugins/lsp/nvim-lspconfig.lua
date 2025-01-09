return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "Shougo/ddc-source-lsp" },
      { "vim-denops/denops.vim" },
      { "uga-rosa/ddc-source-lsp-setup" },
    },
    config = function()
      -- lspのセットアップ
      local capabilities = require("ddc_source_lsp").make_client_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig["denols"].setup({
        capabilities = capabilities,
      })

      lspconfig["lua_ls"].setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
              pathStrict = true,
              path = { "?.lua", "?/init.lua" },
            },
            workspace = {
              library = vim.list_extend(vim.api.nvim_get_runtime_file("lua", true), {
                "${3rd}/luv/library",
                "${3rd}/busted/library",
                "${3rd}/luassert/library",
              }),
              checkThirdParty = "Disable",
            },
          },
        },
      })
      -- lspconfig["rust-analyzer"].setup({
      --   capabilities = capabilities,
      -- })

      lspconfig["pyright"].setup({
        capabilities = capabilities,
        settings = {
          pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              -- Ignore all files for analysis to exclusively use Ruff for linting
              ignore = { "*" },
            },
          },
        },
      })
      lspconfig["ruff"].setup({})


      lspconfig["bashls"].setup({
        capabilities = capabilities,
        filetypes = { "sh", "bash", "zsh" }, -- シェルスクリプト用のファイルタイプを指定
      })
      lspconfig["clangd"].setup({
        capabilities = capabilities,
        cmd = { "clangd", "--completion-style=detailed", "--header-insertion=never" },
      })

      lspconfig["marksman"].setup({
        capabilities = capabilities,
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })
    end,
  },
}
