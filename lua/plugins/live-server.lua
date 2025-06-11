return {
  "barrett-ruth/live-server.nvim",
  build = "npm add -g live-server",
  cmd = { "LiveServerStart", "LiveServerStop" },
  config = {
    args = {
      "--port=8080",
    },
  },
  keys = {
    { "<leader>Ss", "<cmd>LiveServerStart<cr>", desc = "Start Live Server" },
    { "<leader>SS", "<cmd>LiveServerStop<cr>", desc = "Stop Live Server" },
  },
}
