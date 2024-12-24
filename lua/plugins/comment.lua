return {
  "numToStr/Comment.nvim",
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring", -- Para soporte contextual con Treesitter
  },
  config = function()
    require("Comment").setup({
      pre_hook = function(ctx)
        local U = require("Comment.utils")
        local ts_utils = require("ts_context_commentstring.utils")
        local ts_internal = require("ts_context_commentstring.internal")
        local location = nil

        if ctx.ctype == U.ctype.block then
          location = ts_utils.get_cursor_location()
        elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
          location = ts_utils.get_visual_start_location()
        end

        return ts_internal.calculate_commentstring({
          key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
          location = location,
        })
      end,
    })
  end,
}
