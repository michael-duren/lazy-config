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
  pattern = "json,css,html,typescript,javascript,typescriptreact,javascriptreact,scss,sass,lua",
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
vim.api.nvim_create_autocmd("FileType", {
  pattern = "mmd",
  callback = function()
    -- turn on spell checking for markdown files
    vim.cmd("setlocal spell spelllang=en_us")
  end,
})

local swift_lsp = vim.api.nvim_create_augroup("swift_lsp", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "swift" },
  callback = function()
    local root_dir = vim.fs.dirname(vim.fs.find({
      "Package.swift",
      ".git",
    }, { upward = true })[1])
    local client = vim.lsp.start({
      name = "sourcekit-lsp",
      cmd = { "sourcekit-lsp" },
      root_dir = root_dir,
    })
    vim.lsp.buf_attach_client(0, client)
  end,
  group = swift_lsp,
})

-- TOGGLE DIAGNOSTICS
--
-- vim.g.diagnostics_active = true
-- function _G.toggle_diagnostics()
--   if vim.g.diagnostics_active then
--     vim.g.diagnostics_active = false
--     vim.lsp.diagnostic.clear(0)
--     vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
--   else
--     vim.g.diagnostics_active = true
--     vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--       vim.lsp.diagnostic.on_publish_diagnostics, {
--         virtual_text = true,
--         signs = true,
--         underline = true,
--         update_in_insert = false,
--       }
--     )
--   end
-- end
--
-- vim.api.nvim_set_keymap('n', '<leader>tt', ':call v:lua.toggle_diagnostics()<CR>',  {noremap = true, silent = true})
---- C# indentation settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cs",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = true
  end,
})
