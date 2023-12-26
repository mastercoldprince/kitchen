local completion = {}
local theme = {}
local editor = {}
local tool = {}
local ui = {}
local ai = {}
local game = {}
-- local use_copilot = require("config.options").use_copilot
local use_copilot = true

ai = {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = require("plugins.copilot"),
    },

    -- 直接启动即可,实际上不需要集成到cmp中
    {
        "zbirenbaum/copilot-cmp",
        config = require("plugins.copilot-cmp"),
    },
}
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
        -- dependencies = { "nvim-tree/nvim-web-devicons" },
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
    {'akinsho/toggleterm.nvim', version = "*", config = require("plugins.toogleterm") },
    {
        "LintaoAmons/easy-commands.nvim",
        event = "VeryLazy",
        opts = {},
    },
    {
        "stevearc/aerial.nvim",
        opts = {},
        -- Optional dependencies
        config = require("plugins.lsp.aerial"),
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        version = false, -- last release is way too old and doesn't work on Windows
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            {
                "nvim-treesitter/nvim-treesitter-textobjects",
                init = function()
                    -- disable rtp plugin, as we only need its queries for mini.ai
                    -- In case other textobject modules are enabled, we will load them
                    -- once nvim-treesitter is loaded
                    require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
                    load_textobjects = true
                end,
            },
            {
                "p00f/nvim-ts-rainbow",
            },
        },
        cmd = { "TSUpdateSync" },
        keys = {
            { "<c-space>", desc = "Increment selection" },
            { "<bs>",      desc = "Decrement selection", mode = "x" },
        },
        ---@type TSConfig
        opts = {
            highlight = { enable = true },
            indent = { enable = true, disable = { "python" } },
            ensure_installed = {
                "bash",
                "c",
                "html",
                "javascript",
                "json",
                "lua",
                "luadoc",
                "luap",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "yaml",
                "cpp",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
            rainbow = {
                enable = true,
                extended_mode = true,
                max_file_lines = nil,
            },
        },
        ---@param opts TSConfig
        config = function(_, opts)
            if type(opts.ensure_installed) == "table" then
                ---@type table<string, boolean>
                local added = {}
                opts.ensure_installed = vim.tbl_filter(function(lang)
                    if added[lang] then
                        return false
                    end
                    added[lang] = true
                    return true
                end, opts.ensure_installed)
            end
            require("nvim-treesitter.configs").setup(opts)

            if load_textobjects then
                -- PERF: no need to load the plugin, if we only need its queries for mini.ai
                if opts.textobjects then
                    for _, mod in ipairs({ "move", "select", "swap", "lsp_interop" }) do
                        if opts.textobjects[mod] and opts.textobjects[mod].enable then
                            local Loader = require("lazy.core.loader")
                            Loader.disabled_rtp_plugins["nvim-treesitter-textobjects"] = nil
                            local plugin = require("lazy.core.config").plugins["nvim-treesitter-textobjects"]
                            require("lazy.core.loader").source_runtime(plugin.dir, "plugin")
                            break
                        end
                    end
                end
            end
        end,
    },

    {
        "christoomey/vim-tmux-navigator",
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-media-files.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
        },
        keys = {
            { "<leader>?",       "<cmd>lua require('telescope.builtin').oldfiles()<cr>" },
            { "<leader><space>", "<cmd>lua require('telescope.builtin').buffers({ sort_mru = true })<cr>" },
            {
                "<leader>/",
                function()
                    -- You can pass additional configuration to telescope to change theme, layout, etc.
                    require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                        winblend = 10,
                        previewer = false,
                    }))
                end,
            },
            { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>" },
            { "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>" },
            { "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>" },
            { "<leader>fp", "<cmd>lua require('telescope.builtin').builtin()<cr>" },
            { "<leader>fm", "<cmd>lua require('telescope.builtin').marks()<cr>" },
            { "<leader>qf", "<cmd>lua require('telescope.builtin').quickfix()<cr>" },
            { "<leader>km", "<cmd>lua require('telescope.builtin').keymaps()<cr>" },
            { "<c-p>",      "<cmd>lua require('telescope.builtin').commands()<cr>" },
            { "<leader>mf", "<cmd> lua require('telescope').extensions.media_files.media_files()<cr>" },
        },
        config = function()
            require("telescope").setup({
                extensions = {
                    fzf = {
                        fuzzy = true,       -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true, -- override the file sorter
                        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    },
                    media_files = {
                        filetype = { "png", "webp", "jpg", "jpeg" },
                        find_cmd = "rg",
                    },
                },
            })
            require("telescope").load_extension("fzf")
            require("telescope").load_extension("media_files")
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
    },
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
        },
        config = require("plugins.test.lazygit"),
    },
    {
        "sindrets/diffview.nvim",
    },
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        config = function()
            vim.g.startuptime_tries = 10
        end,
    },
    {
        "rhysd/accelerated-jk",
        keys = {
            { "j", "<Plug>(accelerated_jk_gj)" },
            { "k", "<Plug>(accelerated_jk_gk)" },
        },
    },
    { "nvim-lua/plenary.nvim", lazy = true },
    {
        "folke/persistence.nvim",
        keys = {
            { "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]] },
            { "<leader>ql", [[<cmd>lua require("persistence").load({ last = true})<cr>]] },
            { "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]] },
        },
        config = true,
    },
    {
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        opts = {
            enable_check_bracket_line = false,
        },
    },
}
game = {
    {
        { "johngrib/vim-game-snake",         on = "VimGameSnake" },
        { "koron/nyancat-vim",               on = { "Nyancat", "Nyancat2" } },
        { "uguu-org/vim-matrix-screensaver", on = "Matrix" },
    },
}

editor = {
    {
        "numToStr/Comment.nvim",
        opts = {
            -- add any options here
        },
        lazy = false,
    },
    {
        {
            "kylechui/nvim-surround",
            lazy = true,
            keys = { "cs", "ds", "ys" },
            config = function()
                require("nvim-surround").setup({})
            end,
        },
        {

            "folke/todo-comments.nvim",
            dependencies = { "nvim-lua/plenary.nvim" },
            opts = {},
            config = require("plugins.todo-comments"),
        },
        {
            { "lervag/vimtex" },
        },
        {
            "hrsh7th/nvim-cmp",
            event = { "BufReadPost", "BufNewFile" },
            dependencies = {
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-cmdline",
                "saadparwaiz1/cmp_luasnip",
                {
                    "saadparwaiz1/cmp_luasnip",
                    dependencies = {
                        "L3MON4D3/LuaSnip",
                        dependencies = {
                            "rafamadriz/friendly-snippets",
                        },
                    },
                },
            },
            config = function()
                local has_words_before = function()
                    unpack = unpack or table.unpack
                    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                    return col ~= 0 and
                        vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
                end
                require("luasnip.loaders.from_vscode").lazy_load()
                local luasnip = require("luasnip")
                local cmp = require("cmp")
                cmp.setup({
                    snippet = {
                        expand = function(args)
                            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                        end,
                    },
                    sources = cmp.config.sources({
                        { name = "nvim_lsp" },
                        { name = "path" },
                        { name = "luasnip" },
                        { name = "buffer" },
                    }),
                    mapping = cmp.mapping.preset.insert({
                        ["<Tab>"] = cmp.mapping(function(fallback)
                            if cmp.visible() then
                                cmp.select_next_item()
                                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                                -- they way you will only jump inside the snippet region
                            elseif luasnip.expand_or_jumpable() then
                                luasnip.expand_or_jump()
                            elseif has_words_before() then
                                cmp.complete()
                            else
                                fallback()
                            end
                        end, { "i", "s" }),

                        ["<S-Tab>"] = cmp.mapping(function(fallback)
                            if cmp.visible() then
                                cmp.select_prev_item()
                            elseif luasnip.jumpable(-1) then
                                luasnip.jump(-1)
                            else
                                fallback()
                            end
                        end, { "i", "s" }),
                        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    }),
                    experimental = {
                        ghost_text = true,
                    },
                })

                cmp.setup.cmdline("/", {
                    mapping = cmp.mapping.preset.cmdline(),
                    sources = {
                        { name = "buffer" },
                    },
                })

                cmp.setup.cmdline(":", {
                    mapping = cmp.mapping.preset.cmdline(),
                    sources = cmp.config.sources({
                        { name = "path" },
                        { name = "cmdline" },
                    }),
                })
            end,
        },
    },
}

theme = {

    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        -- config = function()
        --     vim.cmd.colorscheme("tokyonight-storm")
        --     require('lualine').setup({
        --         options = {
        --             theme = 'tokyonight'
        --         },
        --     })
        -- end
    },
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            vim.cmd.colorscheme("gruvbox")
            require("lualine").setup({
                options = {
                    theme = "gruvbox",
                },
            })
        end,
    },
}
ui = {
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("bufferline").setup({
                options = {
                    diagnostics = "nvim_lsp",
                    offsets = {
                        {
                            filetype = "neo-tree",
                            text = "File Explorer",
                            highlight = "Directory",
                            text_align = "left",
                        },
                    },
                },
            })
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { text = "│" },
                    change = { text = "│" },
                    delete = { text = "_" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                    untracked = { text = "┆" },
                },
                signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
                numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
                linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
                word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
                watch_gitdir = {
                    follow_files = true,
                },
                attach_to_untracked = true,
                current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
                    delay = 100,
                    ignore_whitespace = true,
                },
                current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
                sign_priority = 6,
                update_debounce = 100,
                status_formatter = nil, -- Use default
                max_file_length = 40000, -- Disable if file is longer than this (in lines)
                preview_config = {
                    -- Options passed to nvim_open_win
                    border = "single",
                    style = "minimal",
                    relative = "cursor",
                    row = 0,
                    col = 1,
                },
                yadm = {
                    enable = false,
                },
            })
        end,
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        keys = {
            { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Open the neo-tree", mode = { "n", "v" } },
            {
                "<leader>fE",
                function()
                    require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
                end,
                desc = "Explorer NeoTree (cwd)",
            },
        },
        config = function()
            vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
            vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
            vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
            vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
            require("neo-tree").setup({
                default_component_configs = {
                    container = {
                        enable_character_fade = true,
                    },
                    indent = {
                        indent_size = 2,
                        padding = 1, -- extra padding on left hand side
                        -- indent guides
                        with_markers = true,
                        indent_marker = "│",
                        last_indent_marker = "└",
                        highlight = "NeoTreeIndentMarker",
                        -- expander config, needed for nesting files
                        with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
                        expander_collapsed = "",
                        expander_expanded = "",
                        expander_highlight = "NeoTreeExpander",
                    },
                    icon = {
                        folder_closed = "",
                        folder_open = "",
                        folder_empty = "󰜌",
                        -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
                        -- then these will never be used.
                        default = "*",
                        highlight = "NeoTreeFileIcon",
                    },
                    modified = {
                        symbol = "[+]",
                        highlight = "NeoTreeModified",
                    },
                    name = {
                        trailing_slash = false,
                        use_git_status_colors = true,
                        highlight = "NeoTreeFileName",
                    },
                    git_status = {
                        symbols = {
                            -- Change type
                            added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
                            modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
                            deleted = "✖", -- this can only be used in the git_status source
                            renamed = "󰁕", -- this can only be used in the git_status source
                            -- Status type
                            untracked = "",
                            ignored = "",
                            unstaged = "󰄱",
                            staged = "",
                            conflict = "",
                        },
                    },
                    -- If you don't want to use these columns, you can set `enabled = false` for each of them individually
                    file_size = {
                        enabled = true,
                        required_width = 64, -- min width of window required to show this column
                    },
                    type = {
                        enabled = true,
                        required_width = 122, -- min width of window required to show this column
                    },
                    last_modified = {
                        enabled = true,
                        required_width = 88, -- min width of window required to show this column
                    },
                    created = {
                        enabled = true,
                        required_width = 110, -- min width of window required to show this column
                    },
                    symlink_target = {
                        enabled = false,
                    },
                },
            })
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
        -- options = {
        --         theme = 'hardhacker'
        --     },
        -- config = function()
        --         require('lualine').setup()
        -- end
        -- }
        config = true,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        config = require("plugins.indent-blankline")
        -- config = function()
        --     require("indent_blankline").setup({
        --         -- for example, context is off by default, use this to turn it on
        --         show_current_context = true,
        --         show_current_context_start = true,
        --     })
        -- end,
    },

    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        opts = {
            -- configurations go here
        },
    },
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        opts = function()
            local dashboard = require("alpha.themes.dashboard")
            local logo = [[
                             _                           _     _
                ___ ___   __| | ___  __      _____  _ __| | __| |
               / __/ _ \ / _` |/ _ \ \ \ /\ / / _ \| '__| |/ _` |
              | (_| (_) | (_| |  __/  \ V  V / (_) | |  | | (_| |
               \___\___/ \__,_|\___|   \_/\_/ \___/|_|  |_|\__,_|
                                                    [ @methodboy]
        ]]
            dashboard.section.header.val = vim.split(logo, "\n")
            dashboard.section.buttons.val = {
                dashboard.button("f", "- " .. " Find file", ":Telescope find_files <CR>"),
                dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
                dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
                dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
                dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
                dashboard.button("s", " " .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
                dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
                dashboard.button("t", "@ " .. " Enter server", ""),
                dashboard.button("q", " " .. " Quit", ":qa<CR>"),
            }
            for _, button in ipairs(dashboard.section.buttons.val) do
                button.opts.hl = "AlphaButtons"
                button.opts.hl_shortcut = "AlphaShortcut"
            end
            dashboard.section.header.opts.hl = "AlphaHeader"
            dashboard.section.buttons.opts.hl = "AlphaButtons"
            dashboard.section.footer.opts.hl = "AlphaFooter"
            dashboard.opts.layout[1].val = 8
            return dashboard
        end,
        config = function(_, dashboard)
            -- close Lazy and re-open when the dashboard is ready
            if vim.o.filetype == "lazy" then
                vim.cmd.close()
                vim.api.nvim_create_autocmd("User", {
                    pattern = "AlphaReady",
                    callback = function()
                        require("lazy").show()
                    end,
                })
            end
            require("alpha").setup(dashboard.opts)
            vim.api.nvim_create_autocmd("User", {
                pattern = "LazyVimStarted",
                callback = function()
                    local stats = require("lazy").stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
                    pcall(vim.cmd.AlphaRedraw)
                end,
            })
        end,
    },
}
-- return completion,editor,tool,ui
return { completion, tool, editor, ui, game, theme, ai }
