return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "stevearc/conform.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
    "rafamadriz/friendly-snippets", -- optional snippets
  },
  config = function()
    -- Conform setup
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_format" },
        rust = { "rustfmt" },
        typescript = { "prettier" },
        javascript = { "prettier" },
        css = { "prettier" },
        go = { "gofmt" },
      },
      format_on_save = {
        timeout_ms = 1000,
        lsp_fallback = true,
      },
    })
    -- CMP capabilities
    local cmp = require('cmp')
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_lsp.default_capabilities()
    )
    -- Fidget (LSP status)
    require("fidget").setup({})
    -- Mason setup
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "pyright",
        "ruff",       -- Added: Ruff LSP for linting/import-sorting
        "ts_ls",
        "tailwindcss",
        "clangd",
        "zls",
        "gopls",
      },
      handlers = {
        -- Default handler
        function(server_name)
          require("lspconfig")[server_name].setup { capabilities = capabilities }
        end,
        -- Lua
        ["lua_ls"] = function()
          require("lspconfig").lua_ls.setup {
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = { globals = { "vim" } },
                format = {
                  enable = true,
                  defaultConfig = { indent_style = "space", indent_size = "2" },
                },
              },
            }
          }
        end,
        -- Pyright: type checking, go-to-def, hover
        -- Import sorting is disabled here since Ruff handles that
        ["pyright"] = function()
          require("lspconfig").pyright.setup({
            capabilities = capabilities,
            settings = {
              pyright = {
                disableOrganizeImports = true,
              },
            },
          })
        end,
        -- Ruff: linting + import sorting (formatting is handled by conform above)
        ["ruff"] = function()
          require("lspconfig").ruff.setup({
            capabilities = capabilities,
          })
        end,
        -- TailwindCSS
        ["tailwindcss"] = function()
          require("lspconfig").tailwindcss.setup({
            capabilities = capabilities,
            filetypes = { "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact" },
          })
        end,
        -- Zig (optional)
        ["zls"] = function()
          require("lspconfig").zls.setup({
            root_dir = require("lspconfig").util.root_pattern(".git", "build.zig", "zls.json"),
            settings = { zls = { enable_inlay_hints = true, enable_snippets = true, warn_style = true } },
          })
          vim.g.zig_fmt_parse_errors = 0
          vim.g.zig_fmt_autosave = 0
        end,
      }
    })
    -- CMP configuration
    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }, {
        { name = 'buffer' },
        { name = 'path' },
      }),
    })
    -- Diagnostics config
    vim.diagnostic.config({
      float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })
  end
}
