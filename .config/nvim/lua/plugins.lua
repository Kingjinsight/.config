return {
    -- Your plugin list here, e.g.,
    { "rebelot/kanagawa.nvim" },                                                      -- Kanagawa theme plugin
    { "ibhagwan/fzf-lua",     dependencies = { "nvim-tree/nvim-web-devicons" }, opts = {} }, --Fzf-lua
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
    },                         --LSP-config
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
    }, -- completion
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
        },
    }, -- debugger
    {
        "fedepujol/move.nvim",
        opts = {},
    },
    {
        "petertriho/nvim-scrollbar",
        "kevinhwang91/nvim-hlslens",
        "lewis6991/gitsigns.nvim",
    }, --scrollbar
    {
        "karb94/neoscroll.nvim",
        opts = {},
    }, --neoscroll
    --	{
    --		"folke/which-key.nvim",
    --		event = "VeryLazy",
    --		opts = {
    --			-- your configuration comes here
    --			-- or leave it empty to use the default settings
    -- refer to the configuration section below
    --		},
    --		keys = {
    --			{
    --				"<leader>?",
    --				function()
    --					--require("which-key").show({ global = false })
    --				end,
    --				desc = "Buffer Local Keymaps (which-key)",
    --			},
    --		},
    --	},  --which-key
    -- lazy.nvim
    {
        "sontungexpt/url-open",
        event = "VeryLazy",
        cmd = "URLOpenUnderCursor",
        config = function()
            local status_ok, url_open = pcall(require, "url-open")
            if not status_ok then
                return
            end
            url_open.setup({})
        end,
    }, --url-open
    {
        "jghauser/mkdir.nvim",
    }, --mkdir without create
    {
        "gaborvecsei/usage-tracker.nvim",
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
    {
        "dhruvasagar/vim-table-mode",
    }, --vim-table-mode
    {"vimwiki/vimwiki",}, --vimwiki
}

