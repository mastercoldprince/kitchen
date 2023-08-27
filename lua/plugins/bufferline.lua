return {
    {
        'akinsho/bufferline.nvim',
        event = "VeryLazy",
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
       options = {
        },
        config = function()
            require('bufferline').setup{
                options = {
            diagnostics = "nvim_lsp",
            offsets = {{
                filetype = "neo-tree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left"
            }}
                }
            }
        end
    }
}
