vim.cmd [[set packpath^=~/.local/share/nvim/site]]
require("panrosk.packer")
require("panrosk.keymaps")

require("panrosk.python")
require("panrosk.plugins.telescope")
require("panrosk.plugins.tresitter")
require("panrosk.plugins.nvim-three")
require("panrosk.set")
require("panrosk.plugins.noice")
require("lualine").setup()
require("autoclose").setup()
require("panrosk.plugins.dap")
require("panrosk.plugins.lspzero")
require("panrosk.plugins.formatting")

require("panrosk.colorscheme")
print("Panrosk's config loaded")

vim.cmd([[
  augroup TransparentBackground
    autocmd!
    autocmd VimEnter * highlight Normal guibg=none
    autocmd VimEnter * highlight NonText guibg=none
  augroup END
]])
