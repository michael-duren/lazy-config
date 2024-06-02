return {
  "nvimdev/dashboard-nvim",
  lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
  opts = function()
    local logo = [[
       ....                                                               
   .xH888888Hx.                                                           
 .H8888888888888:       x.    .        .u    .                 u.    u.   
 888*"""?""*88888X    .@88k  z88u    .d88B :@8c       .u     x@88k u@88c. 
'f     d8x.   ^%88k  ~"8888 ^8888   ="8888f8888r   ud8888.  ^"8888""8888" 
'>    <88888X   '?8    8888  888R     4888>'88"  :888'8888.   8888  888R  
 `:..:`888888>    8>   8888  888R     4888> '    d888 '88%"   8888  888R  
        `"*88     X    8888  888R     4888>      8888.+"      8888  888R  
   .xHHhx.."      !    8888 ,888B .  .d888L .+   8888L        8888  888R  
  X88888888hx. ..!    "8888Y 8888"   ^"8888*"    '8888c. .+  "*88*" 8888" 
 !   "*888888888"      `Y"   'YP        "Y"       "88888%      ""   'Y"   
        ^"***"`                                     "YP'                  
                                                                          
                                                                          
                                                                          
    ]]

    logo = string.rep("\n", 8) .. logo .. "\n\n"

    local opts = {
      theme = "doom",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          { action = LazyVim.telescope("files"),                                    desc = " Find File",       icon = " ", key = "f" },
          { action = "ene | startinsert",                                        desc = " New File",        icon = " ", key = "n" },
          { action = "Telescope oldfiles",                                       desc = " Recent Files",    icon = " ", key = "r" },
          { action = "Telescope live_grep",                                      desc = " Find Text",       icon = " ", key = "g" },
          { action = [[lua LazyVim.telescope.config_files()()]], desc = " Config",          icon = " ", key = "c" },
          { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
          { action = "LazyExtras",                                               desc = " Lazy Extras",     icon = " ", key = "x" },
          { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "DashboardLoaded",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    return opts
  end,
}
