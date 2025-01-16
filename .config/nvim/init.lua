----Linking----
require("config.lazy")
require("config.colors")
require("lazy").setup("plugins")
require ("config.markdown")

---Editor behavior---
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set softtabstop=4")
vim.cmd("set expandtab")
vim.cmd("set inccommand=split")
vim.cmd("set nocompatible")
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
local opts = { noremap = true, silent = true }
vim.g.mapleader = " "
vim.keymap.set("n", ";", ":", opts)
vim.keymap.set("v", "Y", '"+y', opts)
vim.keymap.set("i", "{", "{}<Esc>i", opts)
vim.keymap.set("i", "(", "()<Esc>i", opts)
vim.keymap.set("i", "[", "[]<Esc>i", opts)
vim.keymap.set("i", "'", "''<Esc>i", opts)
vim.keymap.set("i", '"', '""<Esc>i', opts)
vim.keymap.set("n", "J", "5j", opts)
vim.keymap.set("n", "K", "5k", opts)
vim.keymap.set("n", "W", "5w", opts)
vim.keymap.set("n", "B", "5b", opts)
vim.keymap.set("n", "<A-j>", ":MoveLine(1)<CR>", opts)
vim.keymap.set("n", "<A-k>", ":MoveLine(-1)<CR>", opts)
vim.keymap.set("v", "<A-j>", ":MoveBlock(1)<CR>", opts)
vim.keymap.set("v", "<A-k>", ":MoveBlock(-1)<CR>", opts)

---Window management---

-- Disable default 's' key for window splitting
vim.keymap.set("n", "s", "<nop>", { noremap = true })

-- Cycle through windows using <LEADER>w
vim.keymap.set("n", "<LEADER>w", "<C-w>w", { noremap = true })

-- Move between windows: up, down, left, right
vim.keymap.set("n", "<LEADER>k", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<LEADER>j", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<LEADER>h", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<LEADER>l", "<C-w>l", { noremap = true })

-- Split window above current one (toggle splitbelow temporarily)
vim.keymap.set("n", "sk", ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>", { noremap = true })

-- Split window below current one
vim.keymap.set("n", "sj", ":set splitbelow<CR>:split<CR>", { noremap = true })

-- Split window to the left of current one (toggle splitright temporarily)
vim.keymap.set("n", "sh", ":set nosplitright<CR>:vsplit<CR>:set splitright<CR>", { noremap = true })

-- Split window to the right of current one
vim.keymap.set("n", "sl", ":set splitright<CR>:vsplit<CR>", { noremap = true })

-- Resize windows: increase/decrease height
vim.keymap.set("n", "<up>", ":res +5<CR>", { noremap = true })
vim.keymap.set("n", "<down>", ":res -5<CR>", { noremap = true })

-- Resize windows: increase/decrease width
vim.keymap.set("n", "<left>", ":vertical resize -5<CR>", { noremap = true })
vim.keymap.set("n", "<right>", ":vertical resize +5<CR>", { noremap = true })

---Tab management---

-- Open a new tab
vim.keymap.set("n", "tk", ":tabe<CR>", { noremap = true })

-- Split the current buffer into a new tab
vim.keymap.set("n", "tK", ":tab split<CR>", { noremap = true })

-- Move to the previous tab
vim.keymap.set("n", "th", ":-tabnext<CR>", { noremap = true })

-- Move to the next tab
vim.keymap.set("n", "tl", ":+tabnext<CR>", { noremap = true })

-- Move the current tab to the left
vim.keymap.set("n", "tmh", ":-tabmove<CR>", { noremap = true })

-- Move the current tab to the right
vim.keymap.set("n", "tml", ":+tabmove<CR>", { noremap = true })

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
vim.keymap.set("n", "<leader>gk", vim.lsp.buf.hover, {})
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
	dashboard.button("f", "  > Find file", ":cd . | lua require'fzf-lua'.files()<CR>"),
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

---Move---
require("move").setup({
	line = {
		enable = true, -- Enables line movement
		indent = true, -- Toggles indentation
	},
	block = {
		enable = true, -- Enables block movement
		indent = true, -- Toggles indentation
	},
	word = {
		enable = true, -- Enables word movement
	},
	char = {
		enable = false, -- Enables char movement
	},
})

---nvim-scrollbar---
require("scrollbar").setup({
	show = true,
	show_in_active_only = false,
	set_highlights = true,
	folds = 1000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
	max_lines = false, -- disables if no. of lines in buffer exceeds this
	hide_if_all_visible = false, -- Hides everything if all lines are visible
	throttle_ms = 100,
	handle = {
		text = " ",
		blend = 30, -- Integer between 0 and 100. 0 for fully opaque and 100 to full transparent. Defaults to 30.
		color = nil,
		color_nr = nil, -- cterm
		highlight = "CursorColumn",
		hide_if_all_visible = true, -- Hides handle if all lines are visible
	},
	marks = {
		Cursor = {
			text = "•",
			priority = 0,
			gui = nil,
			color = nil,
			cterm = nil,
			color_nr = nil, -- cterm
			highlight = "Normal",
		},
		Search = {
			text = { "-", "=" },
			priority = 1,
			gui = nil,
			color = nil,
			cterm = nil,
			color_nr = nil, -- cterm
			highlight = "Search",
		},
		Error = {
			text = { "-", "=" },
			priority = 2,
			gui = nil,
			color = nil,
			cterm = nil,
			color_nr = nil, -- cterm
			highlight = "DiagnosticVirtualTextError",
		},
		Warn = {
			text = { "-", "=" },
			priority = 3,
			gui = nil,
			color = nil,
			cterm = nil,
			color_nr = nil, -- cterm
			highlight = "DiagnosticVirtualTextWarn",
		},
		Info = {
			text = { "-", "=" },
			priority = 4,
			gui = nil,
			color = nil,
			cterm = nil,
			color_nr = nil, -- cterm
			highlight = "DiagnosticVirtualTextInfo",
		},
		Hint = {
			text = { "-", "=" },
			priority = 5,
			gui = nil,
			color = nil,
			cterm = nil,
			color_nr = nil, -- cterm
			highlight = "DiagnosticVirtualTextHint",
		},
		Misc = {
			text = { "-", "=" },
			priority = 6,
			gui = nil,
			color = nil,
			cterm = nil,
			color_nr = nil, -- cterm
			highlight = "Normal",
		},
		GitAdd = {
			text = "┆",
			priority = 7,
			gui = nil,
			color = nil,
			cterm = nil,
			color_nr = nil, -- cterm
			highlight = "GitSignsAdd",
		},
		GitChange = {
			text = "┆",
			priority = 7,
			gui = nil,
			color = nil,
			cterm = nil,
			color_nr = nil, -- cterm
			highlight = "GitSignsChange",
		},
		GitDelete = {
			text = "▁",
			priority = 7,
			gui = nil,
			color = nil,
			cterm = nil,
			color_nr = nil, -- cterm
			highlight = "GitSignsDelete",
		},
	},
	excluded_buftypes = {
		"terminal",
	},
	excluded_filetypes = {
		"dropbar_menu",
		"dropbar_menu_fzf",
		"DressingInput",
		"cmp_docs",
		"cmp_menu",
		"noice",
		"prompt",
		"TelescopePrompt",
	},
	autocmd = {
		render = {
			"BufWinEnter",
			"TabEnter",
			"TermEnter",
			"WinEnter",
			"CmdwinLeave",
			"TextChanged",
			"VimResized",
			"WinScrolled",
		},
		clear = {
			"BufWinLeave",
			"TabLeave",
			"TermLeave",
			"WinLeave",
		},
	},
	handlers = {
		cursor = true,
		diagnostic = true,
		gitsigns = false, -- Requires gitsigns
		handle = true,
		search = false, -- Requires hlslens
		ale = false, -- Requires ALE
	},
})

require("gitsigns").setup()
require("scrollbar.handlers.gitsigns").setup()

require("scrollbar.handlers.search").setup({
	-- hlslens config overrides
})

---neoscroll---
require("neoscroll").setup({
	mappings = { -- Keys to be mapped to their corresponding default scrolling animation
		"<C-u>",
		"<C-d>",
		"<C-b>",
		"<C-f>",
		"<C-y>",
		"<C-e>",
		"zt",
		"zz",
		"zb",
	},
	hide_cursor = true, -- Hide cursor while scrolling
	stop_eof = true, -- Stop at <EOF> when scrolling downwards
	respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
	cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
	duration_multiplier = 1.0, -- Global duration multiplier
	easing = "linear", -- Default easing function
	pre_hook = nil, -- Function to run before the scrolling animation starts
	post_hook = nil, -- Function to run after the scrolling animation ends
	performance_mode = false, -- Disable "Performance Mode" on all buffers.
	ignored_events = { -- Events ignored while scrolling
		"WinScrolled",
		"CursorMoved",
	},
})

---url-open---
-- default values
require("url-open").setup({
    open_app = "default",
    open_only_when_cursor_on_url = false,
    highlight_url = {
        all_urls = {
            enabled = false,
            fg = "#21d5ff", -- "text" or "#rrggbb"
            -- fg = "text", -- text will set underline same color with text
            bg = nil, -- nil or "#rrggbb"
            underline = true,
        },
        cursor_move = {
            enabled = true,
            fg = "#199eff", -- "text" or "#rrggbb"
            -- fg = "text", -- text will set underline same color with text
            bg = nil, -- nil or "#rrggbb"
            underline = true,
        },
    },
    deep_pattern = false,
    -- a list of patterns to open url under cursor
    extra_patterns = {
    },
})
vim.keymap.set("n", "gx", "<esc>:URLOpenUnderCursor<cr>")





---usage-tracker---
require('usage-tracker').setup({
    keep_eventlog_days = 14,
    cleanup_freq_days = 7,
    event_wait_period_in_sec = 5,
    inactivity_threshold_in_min = 5,
    inactivity_check_freq_in_sec = 5,
    verbose = 0,
    telemetry_endpoint = "" -- you'll need to start the restapi for this feature
})





---vimi-table-mode---
vim.g.table_mode_corner = '|'
vim.g.table_mode_header_fillchar = '-'
vim.g.table_mode_align_char = ':'





---vimwiki---
vim.g.vimwiki_list = {{
  path = '~/Documents/vimwiki/',
  syntax = 'markdown',
  ext = '.md'
}}






