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
				env = {
					url = "http://100.103.120.34:11434",
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
