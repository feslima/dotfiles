local default_schemas = nil
local status_ok, jsonls_settings = pcall(require, "nlspsettings")
if not status_ok then
	vim.notify("Couldn't load 'nlspsettings' plugin for jsonls!")
	return
end
default_schemas = jsonls_settings.get_default_schemas()

local schemas = {
	{
		description = "Packer template JSON configuration",
		fileMatch = {
			"packer.json",
		},
		url = "https://json.schemastore.org/packer.json",
	},
	{
		description = "NPM configuration file",
		fileMatch = {
			"package.json",
		},
		url = "https://json.schemastore.org/package.json",
	},
	{
		description = "TypeScript compiler configuration file",
		fileMatch = {
			"tsconfig.json",
			"tsconfig.*.json",
		},
		url = "https://json.schemastore.org/tsconfig.json",
	},
	{
		description = "ESLint config",
		fileMatch = {
			".eslintrc.json",
			".eslintrc",
		},
		url = "https://json.schemastore.org/eslintrc.json",
	},
	{
		description = "Prettier config",
		fileMatch = {
			".prettierrc",
			".prettierrc.json",
			"prettier.config.json",
		},
		url = "https://json.schemastore.org/prettierrc",
	},
	{
		description = "Cypress.io test runner configuration file",
		fileMatch = { "cypress.json" },
		url = "https://on.cypress.io/cypress.schema.json",
	},
}

local function extend(tab1, tab2)
  for _, value in ipairs(tab2) do
    table.insert(tab1, value)
  end
  return tab1
end

local extended_schemas = extend(schemas, default_schemas)

local opts = {
	settings = {
		json = {
			schemas = extended_schemas,
		},
	},
	setup = {
		commands = {
			Format = {
				function()
					vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
				end,
			},
		},
	},
}

return opts
