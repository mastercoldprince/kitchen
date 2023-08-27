return {
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
    }
  --  {
  --    "rcarriga/nvim-notify",
  --    keys = {
  --      {
  --        "<leader>un",
  --        function()
  --          require("notify").dismiss({ silent = true, pending = true })
  --        end,
  --        desc = "Dismiss all Notifications",
  --      },
  --    },
  --    opts = {
  --      timeout = 3000,
  --      max_height = function()
  --        return math.floor(vim.o.lines * 0.75)
  --      end,
  --      max_width = function()
  --        return math.floor(vim.o.columns * 0.75)
  --      end,
  --    },
  --    init = function()
  --      -- when noice is not enabled, install notify on VeryLazy
  --      local Util = require("plugins.Util")
  --      if not Util.has("noice.nvim") then
  --        Util.on_very_lazy(function()
  --          vim.notify = require("notify")
  --        end)
  --      end
  --    end,
  --  
  --  },
}
