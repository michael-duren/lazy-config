return {
  "rest-nvim/rest.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "http")
    end,
    config = function()
      require("rest-nvim")
    end,
    keys = {
      {
        "<leader>rh",
        "<cmd>Rest run<cr>",
        desc = "Run REST request",
        ft = "http",
      },
    },
  },
}
