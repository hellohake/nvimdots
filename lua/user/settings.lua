local settings = {}

settings["colorscheme"] = "elflord"

-- Filetypes in this list will skip lsp formatting if rhs is true.
---@type table<string, boolean>
settings["formatter_block_list"] = {
	--lua = false, -- example
	thrift = false,
}

return settings
