local opts = {
	strategies = {
		chat = {
			adapter = "ollama",
		},
		inline = {
			adapter = "ollama",
		},
	},
	adapters = {
		ollama = function()
			return require("codecompanion.adapters").extend("ollama", {
				schema = {
					model = {
						default = "deepseek-r1:8b",
					},
				},
				env = {
					url = "http://127.0.0.1:11434",
				},
				headers = {
					["Content-Type"] = "application/json",
				},
				parameters = {
					sync = true,
				},
			})
		end,
	},
}

return opts
