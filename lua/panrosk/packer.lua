vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  use("leoluz/nvim-dap-go")
  use("tpope/vim-fugitive")
  use("nvim-telescope/telescope-fugitive.nvim")
  use("EdenEast/nightfox.nvim")

  use('purescript-contrib/purescript-vim')
  use 'jonsmithers/vim-html-template-literals'
  use 'pangloss/vim-javascript'

  use {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended version
    lazy = false,   -- This plugin is already lazy
  }


  use({
    "epwalsh/obsidian.nvim",
    tag = "*", -- recommended, use latest release instead of latest commit
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("obsidian").setup({
        workspaces = {
          {
            name = "programmoing learning",
            path = "/Users/oscarfuentes/documents/programming learning",
          },
        },

        -- see below for full list of options 👇
      })
    end,
  })

  use({ "catppuccin/nvim", as = "catppuccin" })

  use({ "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } })
  use({
    "projekt0n/github-nvim-theme",
    config = function()
      require("github-theme").setup({
        -- ...
      })
    end,
  })

  use("maxmx03/dracula.nvim")
  use({
    "neanias/everforest-nvim",
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require("everforest").setup()
    end,
  })
  use({
    "epwalsh/pomo.nvim",
    tag = "*", -- Recommended, use latest release instead of latest commit
    requires = {
      -- Optional, but highly recommended if you want to use the "Default" timer
      "rcarriga/nvim-notify",
    },
    config = function()
      require("pomo").setup({
        -- See below for full list of options ??
      })
    end,
  })

  use({
    "cseickel/diagnostic-window.nvim",
    requires = { "MunifTanjim/nui.nvim" },
  })

  use("nvim-tree/nvim-web-devicons")

  use("ThePrimeagen/vim-be-good")

  use({
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true },
  })

  use("m4xshen/autoclose.nvim")

  use({ "nyoom-engineering/oxocarbon.nvim" })

  use("MunifTanjim/nui.nvim")

  use("rcarriga/nvim-notify")

  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    branch = "0.1.x",
    requires = { { "nvim-lua/plenary.nvim" } }
  })

  use("nvim-lua/plenary.nvim") -- don't forget to add this one if you don't have it yet!

  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })
  -- lazy.nvimi
  use("folke/noice.nvim")

  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  use("rafamadriz/friendly-snippets")

  use({
    "mfussenegger/nvim-dap",
  })

  use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } })

  use({
    "stevearc/conform.nvim",
  })

  use({ "saadparwaiz1/cmp_luasnip" })
  use({
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    requires = {
      --- Uncomment these if you want to manage LSP servers from neovim
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { "WhoIsSethDaniel/mason-tool-installer.nvim" },
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "L3MON4D3/LuaSnip" },
      { "hrsh7th/cmp-nvim-lsp" },
    },
  })
end)
