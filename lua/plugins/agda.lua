return {
  -- Otros plugins aquí...

  {
    "ashinkarov/nvim-agda",
    config = function()
      require("nvim-agda").setup({
        agda_executable = "agda",            -- Ruta al ejecutable de Agda
        agda_lib_path = "~/.agda/libraries", -- Ruta al archivo de bibliotecas de Agda
      })
    end,
    ft = "agda", -- Opcional: carga solo para archivos Agda
  },
}
