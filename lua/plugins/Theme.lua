return {
{
    "hardhackerlabs/theme-vim",
    config = function()
    vim.cmd.colorscheme("hardhacker")
    require('lualine').setup({
                options = {
                    theme = 'hardhacker'
                },
            })
  end,
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
}
}

