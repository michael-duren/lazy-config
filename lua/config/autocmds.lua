-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "markdown",
--   callback = function()
--     local bufnr = vim.api.nvim_get_current_buf()
--
--     -- Check if the LSP client is already attached to the buffer
--     if vim.b[bufnr].markdown_lsp_attached then
--       return
--     end
--
--     -- Start the LSP client
--     local client_id = vim.lsp.start({
--       name = "markdown-awesome-server",
--       cmd = { "/Users/michaelduren/Code/learning/go-meetups/demo-proj/demo_lsp" },
--     })
--
--     -- Mark the buffer as having the LSP client attached
--     if client_id then
--       vim.b[bufnr].markdown_lsp_attached = true
--     end
--   end,
-- })

-- set tab size to 2 for json, css, html files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "json,css,html,typescript,javascript,typescriptreact,javascriptreact,scss,sass",
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "mdx",
  callback = function()
    -- turn on spell checking for markdown files
    vim.cmd("setlocal spell spelllang=en_us")
  end,
})
