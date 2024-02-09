return {
	"nvim-tree/nvim-tree.lua", -- file explorer
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- icons in file explorer
	config = function()
		local nvimtree = require("nvim-tree")

		-- some settings that used to be set on vim.g have been moved to setup: https://github.com/nvim-tree/nvim-tree.lua/issues/674

		-- recommended settings
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- change color for arrows in tree to light blue
		vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

		nvimtree.setup({
			renderer = {
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "", -- arrow when folder is closed
							arrow_open = "", -- arrow when folder is open
						},
					},
				},
				group_empty = true,
			},
			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
					resize_window = false,
				},
			},
			git = {
				enable = true,
				ignore = false,
			},
			update_focused_file = {
				enable = true,
				update_root = false,
				ignore_list = {},
			},
		})
		-- kaymaps
		local keymap = vim.keymap
		keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
	end,
}
