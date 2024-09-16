vim.opt.background = "dark" --set this to dark or light

--
-- vim.cmd.colorscheme("catppuccin")
--
--
local status, _ = pcall(vim.cmd, "colorscheme catppuccin-mocha")

if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end
