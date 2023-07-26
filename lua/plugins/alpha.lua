return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    local logo = [[
    
                         _                           _     _ 
            ___ ___   __| | ___  __      _____  _ __| | __| |
           / __/ _ \ / _` |/ _ \ \ \ /\ / / _ \| '__| |/ _` |
          | (_| (_) | (_| |  __/  \ V  V / (_) | |  | | (_| |
           \___\___/ \__,_|\___|   \_/\_/ \___/|_|  |_|\__,_|
                                                [ @methodboy]            


    ]]
    opts.section.header.val = vim.split(logo, "\n", { trimempty = true })
  end,
}
