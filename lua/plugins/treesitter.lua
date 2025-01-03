return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    vim.g.skip_ts_context_commentstring_module = true

    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "javascript",
        "rust",
        "typescript",
        "elixir",
        "svelte",
        "php",
        "purescript",
        "vue",
        "haskell",
        "json",
        "yaml",
        "python",
        "go",
        "agda"
      },

      sync_install = false,
      auto_install = false,

      highlight = {
        enable = true,
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },

      indent = {
        enable = true,
      },

      textobjects = {
        select = {
          enable = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
      },

      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
      },

      autotag = {
        enable = true,
      },
    })

    require("ts_context_commentstring").setup({
      enable = true,
      enable_autocmd = false, -- Desactiva autocmd para evitar conflictos
    })
  end,
}
