local opts = {
	provider = "openai_fim_compatible",
	n_completions = 1,
	context_window = 512,
	provider_options = {
		openai_fim_compatible = {
			api_key = "TERM",
			name = "Ollama",
			end_point = "http://127.0.0.1:11434/v1/completions",
			model = "qwen2.5-coder:7b",
			stream = true,
			optional = {
				max_tokens = 256,
				top_p = 0.9,
			},
		},
	},
	virtualtext = {
		auto_trigger_ft = {},
		keymap = {
			-- accept whole completion
			accept = "<A-A>",
			-- accept one line
			accept_line = "<A-a>",
			-- accept n lines (prompts for number)
			accept_n_lines = "<A-z>",
			-- Cycle to prev completion item, or manually invoke completion
			prev = "<A-[>",
			-- Cycle to next completion item, or manually invoke completion
			next = "<A-]>",
			dismiss = "<A-e>",
		},
	},
}

return opts
