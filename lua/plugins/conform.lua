return {
  {
    "stevearc/conform.nvim",
    config = function()
      local c = require("conform")

      c.setup({
        formatters_by_ft = {
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          sveltekit = { "prettier" },
          svelte = { "prettier" },
          css = { "prettier" },
          html = { "prettier", "htmlhint" }, -- Se agregó htmlhint
          json = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
          graphql = { "prettier" },
          liquid = { "prettier" },
          lua = { "stylua" },
          python = { "ruff" },
          elixir = { "prettier", "mix_format" },
          php = { "phpcbf" },
          swift = { "swift_format" },
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 10000,
        },
        format_options = {
          prettier = {
            command = "prettier",
            args = { "--config", "~/.config/nvim/defaults/.prettierrc" },
          },
          stylua = {
            command = "stylua",
            args = { "--config-path", vim.fn.expand("~/.config/nvim/defaults/stylua.toml") },
          },
          htmlhint = {
            command = "htmlhint",
            args = { "--config", vim.fn.expand("~/.config/nvim/.htmlhintrc") }, -- Se agrega configuración personalizada
            stdin = true,                                                       -- Permite que el linter procese la entrada estándar
          },
        },
      })

      -- Crear un comando personalizado para formateo manual
      vim.api.nvim_create_user_command("Format", function(args)
        local range = nil
        if args.count ~= -1 then
          local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
          range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
          }
        end
        require("conform").format({ async = true, lsp_fallback = true, range = range })
      end, { range = true })
    end,
  },
}
