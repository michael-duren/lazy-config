local themes = {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        transparent = true,
        -- dimInactive = true,
      })
      vim.cmd("colorscheme kanagawa-dragon")
    end,
  },
  {
    "decaycs/decay.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("decay").setup({
        style = "decayce",
        nvim_tree = {
          contrast = false,
        },
      })

      vim.cmd("colorscheme decay")
    end,
  },
}

return { themes[2] }
