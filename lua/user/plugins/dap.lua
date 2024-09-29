local custom = {}

custom["leoluz/nvim-dap-go"] = {
	"leoluz/nvim-dap-go",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	config = function()
		require("dap-go").setup({})
	end,
}

custom["rcarriga/nvim-dap-ui"] = {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},
}

custom["theHamsta/nvim-dap-virtual-text"] = {
	"theHamsta/nvim-dap-virtual-text",
	commit = "9578276",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("nvim-dap-virtual-text").setup({
			enabled = true,
			enabled_commands = true,
			highlight_changed_variables = true,
			highlight_new_as_changed = true,
			--virt_text_pos = "eol",
			commented = true,
		})
	end,
}
custom["nvim-telescope/telescope-dap.nvim"] = {
	"nvim-telescope/telescope-dap.nvim",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-treesitter/nvim-treesitter",
	},
}

custom["mfussenegger/nvim-dap"] = {
	"mfussenegger/nvim-dap",
	version = "0.7.0",
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
			desc = "debug configuration telescope",
		},
		{
			"<F6>",
			function()
				require("dap").terminate()
			end,
			mode = { "n" },
			desc = "debug terminate",
		},
		{
			"<F12>",
			function()
				require("dap").step_over()
			end,
			mode = { "n" },
			desc = "debug step over",
		},
		{
			"<F9>",
			function()
				require("dap").continue()
			end,
			mode = { "n" },
			desc = "debug continue",
		},
		{
			"<F10>",
			function()
				require("dap").step_into()
			end,
			mode = { "n" },
			desc = "debug step into",
		},
		{
			"<F11>",
			function()
				require("dap").step_out()
			end,
			mode = { "n" },
			desc = "debug step out",
		},
		{
			"<Leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			mode = { "n" },
			desc = "debug toggle breakpoint",
		},
		{
			"<Leader>dl",
			function()
				require("dap").run_last()
			end,
			mode = { "n" },
			desc = "debug run last",
		},
		{
			"<Leader>do",
			function()
	require("dap").repl.open()
			end,
			mode = { "n" },
			desc = "debug open repl",
		},
		{
			"<Leader>dc",
			function()
	require("dap").run_to_cursor()
			end,
			mode = { "n" },
			desc = "debug run to cursor",
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
		dap.configurations.go = {
			{
				type = "go",
				request = "attach",
				mode = "local",
				name = "hello attach mode",
				processId = require("dap.utils").pick_process,
				showLog = true,
				trace = "trace",
				cwd = "${workspaceFolder}",
			},
		}

		local icons = { dap = require("modules.utils.icons").get("dap") }
		-- We need to override nvim-dap's default highlight groups, AFTER requiring nvim-dap for catppuccin.
		vim.api.nvim_set_hl(0, "DapStopped", { fg = "#AFD700" })

		vim.fn.sign_define(
			"DapBreakpoint",
			{ text = icons.dap.Breakpoint, texthl = "DapBreakpoint", linehl = "", numhl = "" }
		)
		vim.fn.sign_define(
			"DapBreakpointCondition",
			{ text = icons.dap.BreakpointCondition, texthl = "DapBreakpoint", linehl = "", numhl = "" }
		)
		vim.fn.sign_define("DapStopped", { text = icons.dap.Stopped, texthl = "DapStopped", linehl = "", numhl = "" })
		vim.fn.sign_define(
			"DapBreakpointRejected",
			{ text = icons.dap.BreakpointRejected, texthl = "DapBreakpoint", linehl = "", numhl = "" }
		)
		vim.fn.sign_define(
			"DapLogPoint",
			{ text = icons.dap.LogPoint, texthl = "DapLogPoint", linehl = "", numhl = "" }
		)
	end,
}

return custom
