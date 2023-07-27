local custom_terms = {}

function custom_terms.toggle(name)
	if custom_terms[name] then
		custom_terms[name]:toggle()
	end
end

return {
	{
		"akinsho/toggleterm.nvim",
		event = "VeryLazy",
		version = "*",
		keys = {
			{
				"<leader>gg",
				function()
					custom_terms.toggle("lazygit")
				end,
				desc = "Toggle lazygit",
			},
			{
				"<leader>tg",
				function()
					custom_terms.toggle("lazygit")
				end,
				desc = "Toggle lazygit",
			},
			{
				"<leader>th",
				function()
					custom_terms.toggle("btm")
				end,
				desc = "Toggle btm",
			},
		},
		opts = {
			size = function(term)
				if term.direction == "horizontal" then
					return 15
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				end
			end,
			open_mapping = [[<c-t>]],
			hide_numbers = true,
			shade_filetypes = {},
			autochdir = true,
			shade_terminals = false,
			start_in_insert = true,
			insert_mappings = true,
			terminal_mappings = true,
			persist_size = true,
			persist_mode = true,
			direction = "horizontal",
			close_on_exit = true,
			shell = vim.o.shell,
			auto_scroll = true,
			float_opts = {
				border = "curved",
				winblend = 3,
			},
			winbar = {
				enabled = false,
				name_formatter = function(term)
					return term.name
				end,
			},
		},
		config = function(_, opts)
			require("toggleterm").setup(opts)
			local Terminal = require("toggleterm.terminal").Terminal
			local cmds = { "lazygit", "btm" }
			for _, cmd in pairs(cmds) do
				custom_terms[cmd] = Terminal:new({
					cmd = cmd,
					dir = "git_dir",
					direction = "tab",
				})
			end
		end,
	},
}
