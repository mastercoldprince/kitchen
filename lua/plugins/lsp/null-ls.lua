return function ()
    local tools = {
        "black",
    }

    require("mason-null-ls").setup({
        ensure_installed = tools,
        handlers = {},
    })

    require("null-ls").setup({
        sources = {},
    })
end
