-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.lsp.start({
      name = "markdown-awesome-server",
      cmd = { "/Users/michaelduren/Code/learning/go/go_educational_lsp/main" },
    })
  end,
})

-- set tab size to 2 for json, css, html files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "json,css,html,typescript,javascript,typescriptreact,javascriptreact,scss,sass",
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
  end,
})
