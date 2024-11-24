-- Configuración inicial de lsp-zero y dependencias
local lsp_zero = require("lsp-zero")
lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- Configuración de Mason
require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = {
    -- Servidores LSP y herramientas
    "intelephense", },
  handlers = {
    lsp_zero.default_setup,
  },
})

-- Configuración específica de LSPs
local lspconfig = require("lspconfig")

lspconfig.intelephense.setup({
  root_dir = lspconfig.util.root_pattern("composer.json", ".git", "package.json"),
})


lspconfig.rust_analyzer.setup({
  on_attach = lsp_zero.default_on_attach,
  filetypes = { "rust" },
  root_dir = lspconfig.util.root_pattern("Cargo.toml", ".git"),
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
        loadOutDirsFromCheck = true,
        runBuildScripts = true,
      },
      checkOnSave = {
        allFeatures = true,
        command = "clippy",
        extraArgs = {
          "--",
          "--no-deps",
          "-Dclippy::correctness",
          "-Dclippy::complexity",
          "-Wclippy::perf",
          "-Wclippy::pedantic",
        },
      },
      procMacro = {
        enable = true,
        ignored = {
          ["async-trait"] = { "async_trait" },
          ["napi-derive"] = { "napi" },
          ["async-recursion"] = { "async_recursion" },
        },
      },
    },
  },
})

lspconfig.ts_ls.setup({
  on_attach = lsp_zero.default_on_attach,
  filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact", "svelte", "vue" },
  root_dir = lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json", ".git", "package.json"),
})

lspconfig.html.setup({
  on_attach = lsp_zero.default_on_attach,
  filetypes = { "html", "svelte", "liquid", "ejs", "jsx", "tsx", "vue", "php" },
  root_dir = lspconfig.util.root_pattern("index.html", ".git", "package.json"),
})

lspconfig.emmet_ls.setup({
  on_attach = lsp_zero.default_on_attach,
  filetypes = { "html", "css", "javascript", "typescript", "svelte", "liquid", "ejs", "jsx", "tsx", "vue", "php" },
  root_dir = lspconfig.util.root_pattern(".git", "package.json", "index.html"),
})

-- Configuración de Rust
-- Configuración de autocompletado con nvim-cmp
local cmp = require("cmp")
local cmp_action = lsp_zero.cmp_action()
local cmp_format = lsp_zero.cmp_format({ details = true })

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

-- Cargar snippets adicionales
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({
  paths = {
    "./lua/panrosk/plugins/snips/php-awesome-snippets",
    "./lua/panrosk/plugins/snips/sveltekit-snippets",
    "./lua/panrosk/plugins/snips/vscode-golang-snippets",
    "./lua/panrosk/plugins/snips/vscode-Java-Snippets",
    "./lua/panrosk/plugins/snips/lit-snippets",
    "./lua/panrosk/plugins/snips/vue-vscode-snippets",
  }
})

-- Configuración global de LSP
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP Actions",
  callback = function(args)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true, silent = true })
    vim.keymap.set("n", "rn", vim.lsp.buf.rename, { noremap = true, silent = true })
    vim.keymap.set("n", "ca", vim.lsp.buf.code_action, { noremap = true, silent = true })
  end,
})
