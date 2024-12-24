return {

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requiere hrsh7th/nvim-cmp
				},
			},
			presets = {
				bottom_search = false, -- Desactiva la barra de búsqueda clásica en la parte inferior
				command_palette = true, -- Usa el command palette combinado con popupmenu
				long_message_to_split = true, -- Los mensajes largos se envían a un split
				inc_rename = false, -- Habilita diálogos para inc-rename.nvim
				lsp_doc_border = true, -- Agrega un borde a los documentos de LSP
			},
			cmdline = {
				format = {
					cmdline = {
						opts = {
							position = { row = 2, col = "85%" }, -- Ubicación arriba a la derecha
							size = { width = "auto", height = 1 }, -- Ancho y alto
						},
					},
				},
			},
			views = {
				cmdline_popup = {
					position = {
						row = 2, -- Segunda fila
						col = "85%", -- Parte derecha
					},
					size = {
						width = "auto", -- Ancho en caracteres
						height = "auto", -- Ajuste automático del alto
					},
					border = {
						style = "rounded", -- Bordes redondeados
					},
				},
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify", -- Opcional: Notificaciones avanzadas
		},
	},
}
