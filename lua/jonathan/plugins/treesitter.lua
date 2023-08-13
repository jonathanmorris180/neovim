-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

local treesitter_configs_status, treesitter_configs = pcall(require, "nvim-treesitter.parsers")
if not treesitter_configs_status then
	return
end

local parser_config = treesitter_configs.get_parser_configs()

parser_config.apex = {
	install_info = {
		url = "/Users/jonathanmorris/Documents/neovim/tree-sitter-sfapex/apex", -- local path or git repo
		files = { "src/parser.c" },
		-- optional entries:
		generate_requires_npm = false, -- if stand-alone parser without npm dependencies
		requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
	},
}

parser_config.soql = {
	install_info = {
		url = "/Users/jonathanmorris/Documents/neovim/tree-sitter-sfapex/soql", -- local path or git repo
		files = { "src/parser.c" },
		generate_requires_npm = false, -- if stand-alone parser without npm dependencies
		requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
	},
}

parser_config.sosl = {
	install_info = {
		url = "/Users/jonathanmorris/Documents/neovim/tree-sitter-sfapex/sosl", -- local path or git repo
		files = { "src/parser.c" },
		generate_requires_npm = false, -- if stand-alone parser without npm dependencies
		requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
	},
}

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
	},
	-- enable indentation
	indent = { enable = true },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	-- ensure these language parsers are installed
	ensure_installed = {
		"json",
		"javascript",
		"typescript",
		"apex",
		"sosl",
		"soql",
		"tsx",
		"yaml",
		"html",
		"css",
		"markdown",
		"markdown_inline",
		"graphql",
		"bash",
		"lua",
		"vim",
		"dockerfile",
		"gitignore",
	},
	-- auto install above language parsers
	auto_install = true,
})
