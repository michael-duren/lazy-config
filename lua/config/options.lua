-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- set default tab size to 4
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

vim.g.copilot_assume_mapped = true
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
vim.opt.background = "dark"
