local custom = {}

custom["leoluz/nvim-dap-go"] = {
	"leoluz/nvim-dap-go",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	config = function()
		require("dap-go").setup()
	end,
}

custom["rcarriga/nvim-dap-ui"] = {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"nvim-neotest/nvim-nio",
	},
}

custom["theHamsta/nvim-dap-virtual-text"] = {
	"theHamsta/nvim-dap-virtual-text",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-treesitter/nvim-treesitter",
	},
	init = function()
		require("nvim-dap-virtual-text").setup({
			enabled = true,
			enabled_commands = true,
			highlight_changed_variables = true,
			highlight_new_as_changed = true,
			virt_text_pos = "eol",
			commented = true,
		})
	end,
}
custom["nvim-telescope/telescope-dap.nvim"] = {
	"nvim-telescope/telescope-dap.nvim",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
}

custom["mfussenegger/nvim-dap"] = {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
	},
	keys = {
		{
			"<F5>",
			function()
				require("telescope").extensions.dap.configurations()
			end,
			mode = { "n" },
			desc = "debug",
		},
		{
			"<F6>",
			function()
				require("dap").terminate()
			end,
			mode = { "n" },
			desc = "debug",
		},
		{
			"<F12>",
			function()
				require("dap").step_over()
			end,
			mode = { "n" },
			desc = "debug",
		},
		{
			"<F10>",
			function()
				require("dap").step_into()
			end,
			mode = { "n" },
			desc = "debug",
		},
		{
			"<F11>",
			function()
				require("dap").step_out()
			end,
			mode = { "n" },
			desc = "debug",
		},
		{
			"<Leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			mode = { "n" },
			desc = "debug",
		},
		{
			"<Leader>dl",
			function()
				require("dap").run_last()
			end,
			mode = { "n" },
			desc = "debug",
		},
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		dapui.setup()
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
}

return custom
