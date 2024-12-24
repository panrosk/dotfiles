local M = {}

M.setup = function() end

---@class Slide
---@field slides table[] Lista de diapositivas

---@param lines string[] Las líneas que serán procesadas
---@return Slide
local parse_slides = function(lines)
	---@type Slide
	local slides = { slides = {} }
	local current_slide = {}
	local separator = "^#"

	for _, line in ipairs(lines) do
		print(line, "found", line:find(separator), "|")
		-- Aquí puedes agregar lógica para procesar cada línea
	end

	return slides
end

-- Ejemplo de uso
parse_slides({
	"#1",
	"sasas",
	"#Hola",
	"adios",
})

return M
