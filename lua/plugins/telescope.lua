return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local previewers = require("telescope.previewers")
		local builtin = require("telescope.builtin")
		local running_picker = false

		local function safe_picker(picker_func, opts)
			if running_picker then
				vim.notify("Telescope picker ya está ejecutándose...", vim.log.levels.WARN)
				return
			end
			running_picker = true
			pcall(picker_func, opts)
			running_picker = false
		end

		telescope.setup({
			defaults = {
				file_previewer = previewers.vim_buffer_cat.new,
				grep_previewer = previewers.vim_buffer_vimgrep.new,
				qflist_previewer = previewers.vim_buffer_qflist.new,
				layout_strategy = "horizontal",
				layout_config = {
					width = 0.95,
					height = 0.85,
					prompt_position = "top",
					preview_cutoff = 0,
					horizontal = {
						preview_width = 0.6,
					},
				},
				sorting_strategy = "ascending",
				color_devicons = true,
			},
			pickers = {
				find_files = {
					previewer = true,
					hidden = true,
					follow = true,
					layout_config = {
						horizontal = {
							preview_width = 0.5,
						},
					},
				},
				live_grep = {
					previewer = true,
				},
				grep_string = {
					previewer = true,
				},
				buffers = {
					previewer = false,
					initial_mode = "normal",
				},
				git_files = {
					previewer = true,
				},
				help_tags = {
					previewer = true,
				},
			},
		})

		-- Keymaps
		vim.keymap.set("n", "<leader>pf", function()
			safe_picker(builtin.find_files)
		end, { desc = "Find files" })
		vim.keymap.set("n", "<C-p>", function()
			safe_picker(builtin.git_files)
		end, { desc = "Git files" })
		vim.keymap.set("n", "<leader>ps", function()
			safe_picker(builtin.grep_string, { search = vim.fn.input("Grep > ") })
		end, { desc = "Find string" })
		vim.keymap.set("n", "<leader>fg", function()
			safe_picker(builtin.live_grep)
		end, { desc = "Live grep" })
		vim.keymap.set("n", "<leader>vh", function()
			safe_picker(builtin.help_tags)
		end, { desc = "Help tags" })
	end,
}
