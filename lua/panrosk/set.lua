vim.opt.tabstop = 2 -- Cantidad de espacios que representa un tabulador
vim.opt.softtabstop = 2 -- Cantidad de espacios al pulsar Tab en modo inserción
vim.opt.shiftwidth = 2 -- Cantidad de espacios para la indentación automática
vim.opt.expandtab = true -- Convierte tabs a espacios
vim.opt.smartindent = true -- Habilita indentación inteligente
vim.opt.autoindent = true
vim.opt.relativenumber = true -- Números relativos
vim.opt.number = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.clipboard = "unnamedplus"
vim.opt.updatetime = 50
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.clipboard = "unnamedplus"
vim.opt.updatetime = 50
