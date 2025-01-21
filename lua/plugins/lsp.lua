return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "intelephense",
        "rust_analyzer",
        "ts_ls",
        "html",
        "emmet_ls",
        "lua_ls",
        "gopls",
        "eslint",
      },
    })

    local lspconfig = require("lspconfig")
    local cmp = require("cmp")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_vscode").lazy_load({
      paths = {
        "./lua/plugins/snips/php-awesome-snippets",
        "./lua/plugins/snips/sveltekit-snippets",
        "./lua/plugins/snips/vscode-golang-snippets",
        "./lua/plugins/snips/vscode-Java-Snippets",
        "./lua/plugins/snips/lit-snippets",
        "./lua/plugins/snips/vue-vscode-snippets",
      },
    })

    local on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "k", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "rn", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "ca", vim.lsp.buf.code_action, opts)

      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ async = false })
          end,
        })
      end
    end

    cmp.setup({
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
      },
      mapping = {
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<Up>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
        ["<Down>"] = cmp.mapping.select_next_item({ behavior = "select" }),
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
    })

    local mason_registry = require("mason-registry")
    local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
        .. "/node_modules/@vue/language-server"

    lspconfig.intelephense.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      root_dir = lspconfig.util.root_pattern("composer.json", ".git", "package.json"),
    })

    lspconfig.html.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "html", "svelte", "vue", "php" },
      root_dir = lspconfig.util.root_pattern("index.html", ".git", "package.json"),
    })

    lspconfig.emmet_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "html", "css", "javascript", "typescript", "svelte", "vue", "php" },
      root_dir = lspconfig.util.root_pattern(".git", "package.json", "index.html"),
    })

    lspconfig.tailwindcss.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      root_dir = lspconfig.util.root_pattern("tailwind.config.js", "tailwind.config.ts", ".git"),
      settings = {
        tailwindCSS = {
          experimental = {
            classRegex = {
              "tw`([^`]*)",
              "tw\\(([^)]*)\\)",
              "cx\\(([^)]*)\\)",
              "clsx\\(([^)]*)\\)",
            },
          },
          includeLanguages = {
            typescript = "html",
            javascript = "html",
            javascriptreact = "html",
            typescriptreact = "html",
            vue = "html",
            svelte = "html",
          },
          validate = true,
        },
      },
    })

    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
            path = vim.split(package.path, ";"),
          },
          diagnostics = {
            globals = { "vim", "use" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          completion = {
            callSnippet = "Both",
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })

    lspconfig.ts_ls.setup({
      init_options = {
        plugins = {
          {
            name = "@vue/typescript-plugin",
            location = vue_language_server_path,
            languages = { "vue" },
          },
        },
      },
      filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "svelte" },
    })

    lspconfig.volar.setup({})
    lspconfig.gopls.setup({})
    lspconfig.rust_analyzer.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          checkOnSave = {
            command = "clippy",
          },
        },
      },
    })

    lspconfig.pylsp.setup({
      settings = {
        pylsp = {
          plugins = {
            pylint = { enabled = false },
            pyflakes = { enabled = false },
            flake8 = { enabled = false },
            mccabe = { enabled = false },
          },
        },
      },
    })


    lspconfig.ruff.setup({})

    lspconfig.sonarlint.setup({
      settings = {
        sonarlint = {
          rules = {
            enable = true,
          },
          pathToNodeExecutable = vim.fn.exepath('node'), -- Automáticamente encuentra node
          analyzers = {
            python = { enabled = true },
            javascript = { enabled = true },
            typescript = { enabled = true },
            java = { enabled = true },
            go = { enabled = true },
            php = { enabled = true }
          }
        }
      },
      filetypes = {
        'python',
        'javascript',
        'typescript',
        'java',
        'go',
        'php'
      }
    })

    lspconfig.svelte.setup({})
  end,
}
