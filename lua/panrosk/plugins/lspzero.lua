local lsp_zero = require("lsp-zero")
require("lsp-zero")
require("lspconfig").intelephense.setup({})
local rustacean = require("rustaceanvim")
lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
  },
})

require("lspconfig").ts_ls.setup({
  on_attach = lsp_zero.default_on_attach,
  filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact", "svelte" },
})

require("lspconfig").html.setup({
  on_attach = lsp_zero.default_on_attach,
  filetypes = { "html", "svelte", "liquid", "ejs", "jsx", "tsx", "vue", "php" },
})

require("lspconfig").emmet_ls.setup({
  on_attach = lsp_zero.default_on_attach,
  filetypes = { "html", "css", "javascript", "typescript", "svelte", "liquid", "ejs", "jsx", "tsx", "vue", "php" },
})

local cmp = require("cmp")

local cmp_action = require("lsp-zero").cmp_action()
local cmp_format = require("lsp-zero").cmp_format({ details = true })

require("luasnip.loaders.from_vscode").lazy_load()

require("luasnip.loaders.from_vscode").lazy_load({ paths = "./lua/panrosk/plugins/snips/php-awesome-snippets" })
require("luasnip.loaders.from_vscode").lazy_load({ paths = "./lua/panrosk/plugins/snips/sveltekit-snippets" })
require("luasnip.loaders.from_vscode").lazy_load({ paths = "./lua/panrosk/plugins/snips/vscode-golang-snippets" })

require("luasnip.loaders.from_vscode").lazy_load({ paths = "./lua/panrosk/plugins/snips/vscode-Java-Snippets" })
require("luasnip.loaders.from_vscode").lazy_load({ paths = "./lua/panrosk/plugins/snips/lit-snippets" })
require("luasnip.loaders.from_vscode").lazy_load({ paths = "./lua/panrosk/plugins/snips/vue-vscode-snippets" })
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
    ["<C-p>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item({ behavior = "insert" })
      else
        cmp.complete()
      end
    end),
    ["<C-n>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item({ behavior = "insert" })
      else
        cmp.complete()
      end
    end),
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
})

config = function()
  local lspconfig = require("lspconfig")
  lspconfig.sourcekit.setup({})

  vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP Actions",
    callback = function(args)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
    end,
  })
end

config()
require("lspconfig").sourcekit.setup({
  capabilities = {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    },
  },
})

require('mason-lspconfig').setup_handlers {
  ['rust_analyzer'] = function() end,
}

rustaceanvim = {
  server = {
    cmd = function()
      local mason_registry = require('mason-registry')
      local ra_binary = mason_registry.is_installed('rust-analyzer')
          -- This may need to be tweaked, depending on the operating system.
          and mason_registry.get_package('rust-analyzer'):get_install_path() .. "/rust-analyzer"
          or "rust-analyzer"
      return { ra_binary } -- You can add args to the list, such as '--log-file'
    end,
  },
}
-- require("lspconfig").emmet_ls.setup({
-- 	on_attach = lsp_zero.default_on_attach,
-- 	filetypes = { "html", "css", "javascript", "typescript", "svelte", "liquid", "ejs", "jsx", "tsx", "vue", "php" },
-- })
--
-- require("lspconfig").tsserver.setup({
-- 	on_attach = lsp_zero.default_on_attach,
-- 	filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact", "svelte" },
-- })
--
-- require("lspconfig").html.setup({
-- 	on_attach = lsp_zero.default_on_attach,
-- 	filetypes = { "html", "svelte", "liquid", "ejs", "jsx", "tsx", "vue", "php" },
-- })
--
-- print(require("luasnip"))
-- require("luasnip.loaders.from_vscode").lazy_load()
-- local cmp = require("cmp")
-- local cmp_action = require("lsp-zero").cmp_action()
--
-- cmp.setup({
-- 	sources = {
-- 		{ name = "luasnip" },
-- 	},
--
-- 	mapping = cmp.mapping.preset.insert({
-- 		-- `Enter` key to confirm completion
-- 		["<CR>"] = cmp.mapping.confirm({ select = false }),
--
-- 		-- Ctrl+Space to trigger completion menu
-- 		["<C-Space>"] = cmp.mapping.complete(),
--
-- 		-- Navigate between snippet placeholder
-- 		["<C-f>"] = cmp_action.luasnip_jump_forward(),
-- 		["<C-b>"] = cmp_action.luasnip_jump_backward(),
--
-- 		-- Scroll up and down in the completion documentation
-- 		["<C-u>"] = cmp.mapping.scroll_docs(-4),
-- 		["<C-d>"] = cmp.mapping.scroll_docs(4),
-- 	}),
-- 	snippet = {
-- 		expand = function(args)
-- 			require("luasnip").lsp_expand(args.body)
-- 		end,
-- 	},
-- })
