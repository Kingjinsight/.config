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
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({ capabilities = capabilities })
lspconfig.jdtls.setup({ capabilities = capabilities })
lspconfig.pyright.setup({ capabilities = capabilities })
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})





---None-ls---
local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.black,
		null_ls.builtins.diagnostics.checkstyle,
	},
})
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})





---Alpha-nvim---
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local fortune = require("alpha.fortune")

-- Set header
dashboard.section.header.val = {
	"                                                                              ",
	"████████╗██╗  ██╗███████╗██╗  ██╗ ██████╗    ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
	"╚══██╔══╝██║  ██║██╔════╝██║ ██╔╝██╔════╝    ████╗  ██║██║   ██║██║████╗ ████║",
	"   ██║   ███████║█████╗  █████╔╝ ██║         ██╔██╗ ██║██║   ██║██║██╔████╔██║",
	"   ██║   ██╔══██║██╔══╝  ██╔═██╗ ██║         ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
	"   ██║   ██║  ██║███████╗██║  ██╗╚██████╗    ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
	"   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝    ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
	"                                                                              ",
}

dashboard.section.header.opts = {
	hl = "DashboardHeader",
	position = "center",
}

vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#ff9033", bg = "NONE" })

-- Set menu
dashboard.section.buttons.val = {
	dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", "  > Find file", ":cd $HOME/Documents/Coding | lua require'fzf-lua'.files()<CR>"),
	dashboard.button("r", "  > Recent", ":lua require'fzf-lua'.oldfiles()<CR>"),
	dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | pwd<CR>"),
	dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
}

-- Set footer
dashboard.section.footer.val = fortune()

-- Send config to alpha
alpha.setup(dashboard.opts)
require("luasnip.loaders.from_vscode").lazy_load()





---Completions---
local cmp = require("cmp")

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" }, -- For luasnip users.
	}, {
		{ name = "buffer" },
	}),
})





---Debugger---
local dap = require("dap")
local dapui = require("dapui")
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

vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, {})
vim.keymap.set("n", "<leader>dc", dap.continue, {})
