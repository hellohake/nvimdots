local custom = {}

custom["folke/flash.nvim"] = {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		modes = {
			char = {
				enabled = true,
				jump_labels = true,
				keys = {},
			},
		},
	},
	keys = {
		{
			"s",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
		-- {
		-- 	"*",
		-- 	mode = { "n", "x", "o" },
		-- 	function()
		-- 		require("flash").jump({
		-- 			pattern = vim.fn.expand("<cword>"),
		-- 		})
		-- 	end,
		-- 	desc = "Flash Search cursor Word",
		-- },
		{
			"S",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},
		-- {
		-- 	"r",
		-- 	mode = "o",
		-- 	function()
		-- 		require("flash").remote()
		-- 	end,
		-- 	desc = "Remote Flash",
		-- },
		-- {
		-- 	"R",
		-- 	mode = { "o", "x" },
		-- 	function()
		-- 		require("flash").treesitter_search()
		-- 	end,
		-- 	desc = "Treesitter Search",
		-- },
	},
}

return custom
