local telescope = require("telescope")
local previewers = require("telescope.previewers")
local builtin = require('telescope.builtin')
telescope.setup({
  defaults = {
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,
  },
  pickers = {
    find_files = {
      previewer = true,
    },
    live_grep = {
      previewer = true,
    },
    grep_string = {
      previewer = true,
    },
    buffers = {
      previewer = false,
      initial_mode = 'normal',
    },
    git_files = {
      previewer = true,
    },
    help_tags = {
      previewer = true,
    }
  }
})
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
