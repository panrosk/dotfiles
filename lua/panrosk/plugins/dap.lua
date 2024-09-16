local dap = require("dap")
local dapui = require("dapui")
require("dapui").setup()
require("dap-go").setup()

require("dap-vscode-js").setup({
  adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
})

for _, language in ipairs({ "typescript", "javascript" }) do
  require("dap").configurations[language] = {
    ..., -- see below
  }
end

vim.keymap.set("n", "<leader>b", function()
  require("dap").toggle_breakpoint()
end)

vim.keymap.set("n", "<leader>dr", function()
  require("dap").repl.open()
end)

vim.keymap.set("n", "<leader>dc", function()
  require("dap").continue()
end)

vim.keymap.set("n", "<leader>do", function()
  require("dapui").toggle()
end)

dap.adapters.lldb = {
  type = 'executable',
  command = 'codelldb',
  name = 'lldb'
}
