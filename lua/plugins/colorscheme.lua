return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        transparent = false,
        dimInactive = true,
        colors = {
          palette = {
            sumiInk0 = "#000000",
            sumiInk1 = "#141414",
            sumiInk2 = "#141414",
            sumiInk3 = "#000000",
            sumiInk4 = "#000000",
          },
        },
      })
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
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "moon",
      transparent = false,

      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    opts = {
      transparent_background = true,
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "oxfist/night-owl.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      require("night-owl").setup()
    end,
  },
  {
    "uloco/bluloco.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
    config = function()
      require("bluloco").setup({
        style = "dark",
        italics = true,
        terminal = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
        guicursor = true,
      })
    end,
  },
  {
    "sho-87/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      undercurl = true,
      dimInactive = false,
      terminalColors = true,
      commentStyle = { italic = true },
      functionStyle = { italic = false },
      keywordStyle = { italic = false, bold = true },
      statementStyle = { italic = false, bold = false },
      typeStyle = { italic = false },
    },
    config = function(opts)
      require("kanagawa-paper").setup(opts)
    end,
  },
  {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function(opts)
      -- vim.cmd.colorscheme("lackluster")
      -- vim.cmd.colorscheme("lackluster-night") -- my favorite
      -- vim.cmd.colorscheme("lackluster-mint")
      local lackluster = require("lackluster")

      local color = lackluster.color
      lackluster.setup({
        tweak_syntax = {
          comment = lackluster.color.gray4, -- or gray5
          string = color.green,
          string_escape = color.red,
        },
        tweak_background = {
          normal = "none",
          telescope = "none",
          menu = lackluster.color.gray3,
          popup = "default",
        },
      })
    end,
  },
  {
    "tiagovla/tokyodark.nvim",
    opts = {
      transparent_background = true,
    },
    config = function(_, opts)
      require("tokyodark").setup(opts) -- calling setup is optional
    end,
  },
  {
    "craftzdog/solarized-osaka.nvim",
  },
  {
    "navarasu/onedark.nvim",
  },
  {
    "sainnhe/everforest",
  },
  {
    "marko-cerovac/material.nvim",
  },
  {
    "olimorris/onedarkpro.nvim",
  },
  {
    "AlexvZyl/nordic.nvim",
  },
  {
    "sainnhe/edge",
  },
  {
    "mcchrish/zenbones.nvim",
  },
  {
    "rafamadriz/neon",
  },
  {
    "olivercederborg/poimandres.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("poimandres").setup({
        disable_background = true,
      })
    end,
  },
  {
    "rose-pine/neovim",
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "moon", -- auto, main, moon, or dawn
        dark_variant = "moon", -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = true,
        styles = {
          transparent = true,
        },
      })
    end,
  },
}

-- color themes:
-- 1. kanagawa
-- 2. decay
-- 3. gruvbox
-- 4. tokyonight
-- 5. catppuccin
-- 6. nord
-- 8. night-owl
-- 9. bluloco
-- 10. kanagawa-paper
-- 11. lackluster (somewhat broken)
-- 12. tokyodark
-- 13. poimandres
-- 14. rose

-- local colorTheme = "tokyonight"
-- local chosenTheme = themes[4]
--
-- return chosenTheme
