local setup_colors = function(c)
	return {
		["@string.special.proto"] = { fg = c.vscOrange, bg = c.vscNone },
		["@packageIdentifier"] = { fg = c.vscOrange, bg = c.vscNone },
		["@keyword.return"] = { fg = c.vscBlue, bg = c.vscNone },
		["@keyword.proto"] = { fg = c.vscBlue, bg = c.vscNone },
		["@keyword.import.proto"] = { fg = c.vscBlue, bg = c.vscNone },
		["@keyword.modifier.proto"] = { fg = c.vscBlue, bg = c.vscNone },
		["@keyword.type.proto"] = { fg = c.vscBlue, bg = c.vscNone },
		["@rpcFunctionName"] = { fg = c.vscYellow, bg = c.vscNone },
		["@rpcMessageOrEnumType"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@messageBodyFieldType"] = { fg = c.vscBlue, bg = c.vscNone },
		["@messageBodyFieldIdentifier"] = { fg = c.vscLightBlue, bg = c.vscNone },
	}
end

return setup_colors
