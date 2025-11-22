local opts = {
	strategies = {
		chat = {
			adapter = {
				name = "copilot",
				model = "claude-sonnet-4.5",
			},
		},
		inline = {
			adapter = "copilot",
		},
		cmd = {

			adapter = "copilot",
		},
	},
}

return opts
