-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3

-- set default tab size to 4
-- opt.tabstop = 4
-- opt.softtabstop = 4
-- opt.shiftwidth = 4
opt.background = "dark"
opt.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:block,o:block"

vim.g.copilot_assume_mapped = true

-- disable all animations hopefully
vim.g.snacks_animate = false
vim.filetype.add({
  extension = {
    mdx = "mdx",
  },
})

vim.filetype.add({
  extension = {
    templ = "templ",
  },
})

vim.api.nvim_set_keymap("i", "<Tab>", "<Tab>", { noremap = true, silent = true })
