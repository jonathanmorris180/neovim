return {
	-- note: you can lazy load plugins on certain keybinds too with the "keys" property (see :h lazy.nvim)
	{
		"nvim-lua/plenary.nvim",
		init = function()
			require("plenary.filetype").add_file("apex") -- add filetype to plenary so that telescope previewer can use it
			require("plenary.filetype").add_file("visualforce")
		end,
	}, -- Lua functions that many other plugins depend on
	-- {
	-- 	"LunarVim/bigfile.nvim", -- Could be useful for large files
	-- },
	{ "echasnovski/mini.nvim", version = "*" },
	{
		"z0rzi/ai-chat.nvim",
		config = function()
			require("ai-chat").setup()
		end,
	},
	{
		"tpope/vim-surround",
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"zbirenbaum/copilot-cmp",
		config = true,
	},
	{
		"tpope/vim-repeat",
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"folke/which-key.nvim", -- displays a popup with possible key bindings of the command you started typing
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		-- opts = {}, -- uncomment to enable which-key
	},
	{ "sindrets/diffview.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ "christoomey/vim-tmux-navigator", lazy = false },
	{
		"mg979/vim-visual-multi",
		config = function()
			vim.keymap.set("n", "<C-m>", "<Plug>(VM-Find-Under)")
		end,
	},
	"mbbill/undotree",
	"tpope/vim-fugitive",
	-- makes resolving merge conflicts easy ([x maps to next conflict)
	{ "metakirby5/codi.vim", event = { "BufReadPre", "BufNewFile" } },
	{
		"rcarriga/cmp-dap",
		event = { "BufReadPre", "BufNewFile" },
	},
	-- java
	{ "mfussenegger/nvim-jdtls" },
	-- markdown preview
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	-- live server
	{
		"barrett-ruth/live-server.nvim",
		build = "npm install --legacy-peer-deps -g live-server",
		config = true,
	},
}
