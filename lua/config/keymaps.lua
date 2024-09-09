-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local keybindings = {
  -- general
  { mode = "n", key = "<C-s>", command = ":w<CR>", description = "Save current buffer" },
  -- Move lines
  { mode = "n", key = "<A-j>", command = ":m .+1<CR>==", description = "Move line down" },
  { mode = "n", key = "<A-k>", command = ":m .-2<CR>==", description = "Move line up" },
  -- Center after scrolling
  { mode = "n", key = "<C-d>", command = "<C-d>zz" },
  { mode = "n", key = "<C-u>", command = "<C-u>zz" },
  {
    mode = "n",
    key = "<leader>nd",
    command = "<cmd>Noice dismiss<CR>",
    description = "Noice dismiss",
  },
  -- Buffer navigation
  {
    mode = "n",
    key = "<C-n>",
    command = ":BufferLineCycleNext<CR>",
    description = "Next buffer",
  },
  {
    mode = "n",
    key = "<C-p>",
    command = ":BufferLineCyclePrev<CR>",
    description = "Previous buffer",
  },
  -- Hide search highlight
  {
    mode = "n",
    key = "<leader>H",
    command = ":noh<CR>",
    description = "Hide search highlight",
  },
  -- Close buffer
  -- {
  --   mode = "n",
  --   key = "<leader>c",
  --   command = ":bd<CR>",
  --   description = "Close current buffer",
  -- },
  -- { mode = "n", key = "<leader>q", command = ":q<CR>", description = "Quit" },
  -- -- Splits
  {
    mode = "n",
    key = "|",
    command = ":vsplit<CR>",
    description = "Vertical split",
  },
  {
    mode = "n",
    key = "-",
    command = ":split<CR>",
    description = "Horizontal split",
  },
  {
    mode = "n",
    key = "<M-w>",
    command = ":close<CR>",
    description = "Close current split",
  },
  -- Misc
  {
    mode = "n",
    key = "<leader><CR>",
    command = ":so ~/.config/nvim/init.lua<CR>",
    options = { noremap = true, silent = false, desc = "Reload init.lua" },
  },
  {
    mode = "n",
    key = "<leader>w",
    command = ":w<CR>",
    options = {
      noremap = true,
      silent = true,
      desc = "Write current buffer",
    },
  },
  {
    mode = "n",
    key = "<leader>?",
    command = ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>",
    description = "Open settings",
  },
  -- markdown preview
  {
    mode = "n",
    key = "<leader>mp",
    command = "<cmd>MarkdownPreviewToggle<CR>",
    description = "Markdown preview",
  },
  -- toggle term
  {
    mode = "t",
    key = "<Esc>",
    command = "<C-\\><C-n>",
    description = "Exit terminal mode",
  },
  -- stop running process in toggle term
  {
    mode = "t",
    key = "<C-c",
    command = "<C-\\><C-n>:stop<CR>",
    description = "Stop running process",
  },
  -- copilot
  {
    mode = "n",
    key = "<leader>Ce",
    command = "<cmd>Copilot enable<CR>",
    options = { silent = false, noremap = true, desc = "Enable copilot" },
  },
  {
    mode = "n",
    key = "<leader>Cd",
    command = "<cmd>Copilot disable<CR>",
    options = { silent = false, noremap = true, desc = "Disable copilot" },
  },
  {
    mode = "n",
    key = "<leader>Cs",
    command = "<cmd>Copilot status<CR>",
    options = { silent = false, noremap = true, desc = "Copilot status" },
  },
  -- gitsigns
  {
    mode = "n",
    key = "<leader>gB",
    command = "<cmd>Gitsigns blame_line<CR>",
    description = "Blame line",
  },
  {
    mode = "n",
    key = "<leader>U",
    command = "<cmd>Lazy update<CR>",
    description = "Lazy update",
  },
  {
    mode = "n",
    key = "<leader>W",
    command = "<cmd>set wrap!<CR>",
    description = "Toggle wrap",
  },
  -- -- peek
  -- {
  --   mode = "n",
  --   key = "<leader>po",
  --   command = "<cmd>PeekOpen<CR>",
  --   description = "Open Peek Markdown Viewer",
  -- },
  -- {
  --   mode = "n",
  --   key = "<leader>pc",
  --   command = "<cmd>PeekClose<CR>",
  --   description = "Close Peek Markdown Viewer",
  -- },
}

for _, bind in ipairs(keybindings) do
  vim.keymap.set(bind.mode, bind.key, bind.command, bind.options or { desc = bind.description })
end
