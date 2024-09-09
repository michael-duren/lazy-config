return {
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- call trasparent enable when starts
      vim.cmd([[TransparentEnable]])
    end,
  },
}
