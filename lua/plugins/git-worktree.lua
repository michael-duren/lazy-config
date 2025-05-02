return {
  {
    "nooproblem/git-worktree.nvim", -- Use the fork instead of ThePrimeagen's
    -- branch = "fix/telescope-hl-error", -- Use the branch that contains the fix
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      -- Load the git-worktree extension for telescope
      require("telescope").load_extension("git_worktree")

      -- Basic setup
      require("git-worktree").setup({
        change_directory_command = "cd",
        update_on_change = true,
        update_on_change_command = "e .",
        clearjumps_on_change = true,
        autopush = false,
      })
    end,
    keys = {
      {
        "<leader>gwl",
        "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
        desc = "List Worktrees",
      },
      {
        "<leader>gwc",
        "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
        desc = "Create Worktree",
      },
    },
  },
}
