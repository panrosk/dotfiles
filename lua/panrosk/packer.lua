vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  -- Gestor de plugins
  use("wbthomason/packer.nvim")

  -- Temas
  use("EdenEast/nightfox.nvim")
  use({
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({ style = "night" })
      vim.cmd("colorscheme tokyonight")
    end
  })
  use({ "ellisonleao/gruvbox.nvim" })
  use({ "catppuccin/nvim", as = "catppuccin" })
  use({
    "projekt0n/github-nvim-theme",
    config = function()
      require("github-theme").setup({})
    end
  })
  use("maxmx03/dracula.nvim")
  use({
    "neanias/everforest-nvim",
    config = function()
      require("everforest").setup()
    end
  })
  use({ "nyoom-engineering/oxocarbon.nvim" })

  -- Depuración
  use("leoluz/nvim-dap-go")
  use({ "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } })
  use({ "mfussenegger/nvim-dap" })
  use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } })

  -- Herramientas de desarrollo
  use("tpope/vim-fugitive")

  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    branch = "0.1.x",
    requires = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
      "folke/todo-comments.nvim",
    }
  })
  use("nvim-tree/nvim-web-devicons")
  use({ "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons", opt = true } })
  use("m4xshen/autoclose.nvim")
  use("ThePrimeagen/vim-be-good")
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end
  })
  use("rafamadriz/friendly-snippets")
  use({ "saadparwaiz1/cmp_luasnip" })
  use({
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    requires = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { "WhoIsSethDaniel/mason-tool-installer.nvim" },
      { "neovim/nvim-lspconfig" },
      { "hrsh7th/nvim-cmp" },
      { "L3MON4D3/LuaSnip" },
      { "hrsh7th/cmp-nvim-lsp" },
    }
  })

  -- Plugins específicos de lenguajes
  use("purescript-contrib/purescript-vim")
  use("jonsmithers/vim-html-template-literals")
  use("pangloss/vim-javascript")
  use({ "mrcjkb/rustaceanvim", version = "^5", lazy = false })

  -- Mejoras de productividad
  use({
    "epwalsh/obsidian.nvim",
    tag = "*",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("obsidian").setup({
        workspaces = {
          {
            name = "programmoing learning",
            path = "/Users/oscarfuentes/documents/programming learning",
          },
        },
      })
    end
  })
  use({
    "epwalsh/pomo.nvim",
    tag = "*",
    requires = { "rcarriga/nvim-notify" },
    config = function()
      require("pomo").setup({})
    end
  })
  use("folke/noice.nvim")
  use("rcarriga/nvim-notify")
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end
  })
  use("stevearc/conform.nvim")

  -- Herramientas para diagnóstico
  use({ "cseickel/diagnostic-window.nvim", requires = { "MunifTanjim/nui.nvim" } })
  use("MunifTanjim/nui.nvim")
end)
