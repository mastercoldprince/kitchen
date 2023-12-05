return function ()
    require("copilot").setup({
        panel = {
            enabled = true,
            auto_refresh = true,
            keymap = {
                jump_prev = "[[",
                jump_next = "]]",
                accept = "<CR>",
                refresh = "gr",
                open = "<M-CR>",
            },
            layout = {
                position = "bottom", -- | top | left | right
                ratio = 0.4,
            },
        },
        suggestion = {
            enabled = true,
            auto_trigger = true,
            debounce = 75,
            keymap = {
                accept = "<c-l>",
                -- accept_word = false,
                -- accept_line = false,
                next = "<M-j>",
                prev = "<M-k>",
                dismiss = "<c-h>",
            },
        },
        filetypes = {
            yaml = false,
            markdown = true,
            help = false,
            gitcommit = false,
            gitrebase = false,
            hgcommit = false,
            svn = false,
            cvs = false,
            ["."] = false,
        },
        copilot_node_command = "node", -- Node.js version must be > 16.x
        server_opts_overrides = {},
    })
end
