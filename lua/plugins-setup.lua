local completion = {}
local editor = {}
local tool = {}
local ui = {}
-- local use_copilot = require("config.options").use_copilot
local use_copilot = true

completion = {

    {
        "neovim/nvim-lspconfig",
        cmd = { "Mason", "Neoconf" },
        event = { "BufReadPost", "BufNewFile" },
        config = require("plugins.lsp.nvim-lspconfig"),
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig",
            "folke/neoconf.nvim",
            "folke/neodev.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            {
                "j-hui/fidget.nvim",
                tag = "legacy",
            },
        },
    },

    -- {
    --     "neovim/nvim-lspconfig",
    --     lazy = true,
    --     event = { "CursorHold", "CursorHoldI" },
    --     -- config = require("completion.lsp"),
    -- config = require("plugins.lsp.nvim-lspconfig"),
    --     dependencies = {
    --         { "williamboman/mason.nvim" },
    --         { "williamboman/mason-lspconfig.nvim" },
    --         {
    --             "Jint-lzxy/lsp_signature.nvim",
    --             -- config = require("completion.lsp-signature"),
    --         },
    --     },
    -- },

    {
        "nvimdev/lspsaga.nvim",
        lazy = true,
        event = "LspAttach",
        -- config = require("plugins.lsp.lspsaga"),
        -- dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    {
        "dnlhc/glance.nvim",
        lazy = true,
        event = "LspAttach",
        -- config = require("plugins.lsp.glance"),
    },

    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },

    {
        "simrat39/symbols-outline.nvim",
        lazy = true,
        event = "LspAttach",
        -- config = require("plugins.lsp.symbols-outline"),
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        lazy = true,
        event = { "CursorHold", "CursorHoldI" },
        config = require("plugins.lsp.null-ls"),
        dependencies = {
            "nvim-lua/plenary.nvim",
            "jay-babu/mason-null-ls.nvim",
        },
    },

    {
        "hrsh7th/nvim-cmp",
        lazy = true,
        event = "InsertEnter",
        config = require("plugins.lsp.cmp"),
        dependencies = {
            {
                "L3MON4D3/LuaSnip",
                dependencies = { "rafamadriz/friendly-snippets" },
                -- config = require("plugins.lsp.luasnip"),
            },
            { "lukas-reineke/cmp-under-comparator" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },
            { "andersevenrud/cmp-tmux" },
            { "hrsh7th/cmp-path" },
            { "f3fora/cmp-spell" },
            { "hrsh7th/cmp-buffer" },
            { "kdheepak/cmp-latex-symbols" },
            { "ray-x/cmp-treesitter", commit = "c8e3a74" },
            -- { "tzachar/cmp-tabnine", build = "./install.sh", config = require("completion.tabnine") },
            -- {
            -- 	"jcdickinson/codeium.nvim",
            -- 	dependencies = {
            -- 		"nvim-lua/plenary.nvim",
            -- 		"MunifTanjim/nui.nvim",
            -- 	},
            -- 	config = require("completion.codeium"),
            -- },
        },
    },

    {
        "zbirenbaum/copilot.lua",
        lazy = true,
        cmd = "Copilot",
        event = "InsertEnter",
        config = true,
        -- config = require("completion.copilot"),
        dependencies = {
            {
                "zbirenbaum/copilot-cmp",
                config = true,
                -- config = require("completion.copilot-cmp"),
            },
        },
    },
}
tool = {
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
        },
        config = require("plugins.test.lazygit")
    }
}
-- return completion,editor,tool,ui
return { completion,tool,editor,ui }
