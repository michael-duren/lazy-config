if true then
  return {}
end

return {
  {
    "github/copilot.vim",
    keys = {
      {
        "<leader>Ce",
        "<cmd>Copilot enable<CR>",
        silent = false,
        noremap = true,
        desc = "Enable copilot",
      },
      {
        "<leader>Cd",
        "<cmd>Copilot disable<CR>",
        silent = false,
        noremap = true,
        desc = "Disable copilot",
      },
      {
        "<leader>Cs",
        "<cmd>Copilot status<CR>",
        silent = false,
        noremap = true,
        desc = "Copilot status",
      },
    },
    lazy = false,
  },
}
