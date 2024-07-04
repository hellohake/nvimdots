local bind = require("keymap.bind")
local map_cmd = bind.map_cmd
local map_cr = bind.map_cr

return {
	["i|jk"] = map_cmd("<Esc>"):with_noremap():with_silent():with_desc("Esc Mapping"),
	["i|jj"] = map_cmd("<Esc>"):with_noremap():with_silent():with_desc("Esc Mapping"),
	["i|kj"] = map_cmd("<Esc>"):with_noremap():with_silent():with_desc("Esc Mapping"),
	["n|j"] = map_cmd("jzz"):with_noremap():with_silent():with_desc("moving"),
	["n|k"] = map_cmd("kzz"):with_noremap():with_silent():with_desc("moving"),

	["n|J"] = map_cmd("5jzz"):with_noremap():with_silent(),
	["n|K"] = map_cmd("5kzz"):with_noremap():with_silent(),
}
