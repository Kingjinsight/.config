return {
	-- Your plugin list here, e.g.,
	{ "rebelot/kanagawa.nvim" }, -- Kanagawa theme plugin
	{ "ibhagwan/fzf-lua", dependencies = { "nvim-tree/nvim-web-devicons" }, opts = {} }, --Fzf-lua
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	}, --Treesitter
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	}, -- Neotree
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	}, --Lualine
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}, --LSP-config
	{ "nvimtools/none-ls.nvim" }, -- none-ls
	{
		"goolord/alpha-nvim",
		"BlakeJC94/alpha-nvim-fortune",
	}, --alpha-nvim
	{ "hrsh7th/nvim-cmp" },
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" },
	},
	{
		"hrsh7th/cmp-nvim-lsp",
	},  -- completion
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
		},
	},  -- debugger
    {
        'fedepujol/move.nvim',
        opts = {}
    },
}
