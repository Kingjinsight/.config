----Linking----
require("config.lazy")
require("config.colors")
require("lazy").setup("plugins")

---Editor behavior---
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set softtabstop=4")
vim.cmd("set expandtab")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set incsearch")
vim.cmd("set smartcase")
vim.cmd("set ignorecase")
vim.cmd("set cursorline")
vim.cmd("set splitright")
vim.cmd("set splitbelow")
vim.cmd("set autochdir")
vim.cmd("set autoindent")
vim.cmd("set smartindent")
vim.cmd("set smarttab")
vim.cmd("set wrap")
vim.cmd("colorscheme kanagawa")

---Basic Mappings---
vim.g.mapleader = " "

---Fzf-lua---
vim.keymap.set("n", "<C-p>", function()
	require("fzf-lua").files()
end, { silent = true })
vim.keymap.set("n", "<leader>fg", function()
	require("fzf-lua").live_grep()
end, { silent = true })
require("fzf-lua").setup({
	winopts = { ... }, -- UI Options
	keymap = { ... }, -- Neovim keymaps / fzf binds
	actions = { ... }, -- Fzf "accept" binds
	fzf_opts = { ... }, -- Fzf CLI flags
	fzf_colors = { ... }, -- Fzf `--color` specification
	hls = { ... }, -- Highlights
	previewers = { ... }, -- Previewers options
})

---Neotree---
require("neo-tree").setup({
	filesystem = {
		filtered_items = {
			hide_dotfiles = false, -- Set this to `false` to enable viewing hidden files
			-- Add additional options if necessary
			-- hide_gitignored = false,
		},
	},
})

vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", { silent = true })

---Lualine---
require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "codedark",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		always_show_tabline = true,
		globalstatus = false,
		refresh = {
			statusline = 100,
			tabline = 100,
			winbar = 100,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})

---LSP-config---
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "jdtls", "pyright" },
	automatic_installation = true,
})
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({})
lspconfig.jdtls.setup({})
lspconfig.pyright.setup({})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

---None-ls---
local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.google-java-format,
		null_ls.builtins.diagnostics.checkstyle,
		null_ls.builtins.diagnostics.flake8,
	},
})
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
