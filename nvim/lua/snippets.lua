-- require("luasnip/loaders/from_vscode").load({ include = { "python" } }) -- Load only python snippets
require("luasnip/loaders/from_vscode").load({}) -- Load only python snippets
-- region_check_events = CursorMoved

local ls = require('luasnip')
ls.config.set_config({
	region_check_events = "CursorMoved",
	-- region_check_events = "InsertEnter",
	delete_check_events = "TextChanged,InsertLeave",
})
