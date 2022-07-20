local bind = require("keymaps.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
require("keymaps.config")

local plug_map = {
    ["n|<A-t>"] = map_cr("AerialToggle! right"):with_noremap():with_silent(),
    ["n|ga"] = map_cmd("v:lua.enhance_align('nga')"):with_expr(),
	["x|ga"] = map_cmd("v:lua.enhance_align('xga')"):with_expr(),
    ["v|<leader>r"] = map_cr("SnipRun"):with_noremap():with_silent(),
    ["n|<A-y>"] = map_cr("SymbolsOutline"):with_noremap():with_silent(),
}

bind.nvim_load_mapping(plug_map)
