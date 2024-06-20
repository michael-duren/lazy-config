local themes = {
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
      vim.cmd("colorscheme kanagawa-wave")
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
  { "ellisonleao/gruvbox.nvim" },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
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
    "baliestri/aura-theme",
    lazy = false,
    priority = 1000,
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
      vim.cmd([[colorscheme aura-dark]])
    end,
  },
  {
    "oxfist/night-owl.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      require("night-owl").setup()
      vim.cmd.colorscheme("night-owl")
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
      vim.cmd("colorscheme bluloco")
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
      vim.cmd("colorscheme kanagawa-paper")
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
-- 7. aura-dark
-- 8. night-owl
-- 9. bluloco
-- 10. kanagawa-paper

local chosenTheme = themes[8]

return { chosenTheme }
