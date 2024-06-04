return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
  build = ":MasonUpdate",
  opts = {
    ensure_installed = {
      "astro-language-server",
      "emmet-ls",
      "html-lsp",
      "lua-language-server",
      "shfmt",
      "stylua",
      "tailwindcss-language-server",
      "typescript-language-server",
      "delve",
      "gotests",
      "golangci-lint",
      "gofumpt",
      "goimports",
      "golangci-lint-langserver",
      "impl",
      "gomodifytags",
      "iferr",
      "gotestsum",
      "gopls",
    },
  },
  ---@param opts MasonSettings | {ensure_installed: string[]}
  config = function(_, opts)
    require("mason").setup(opts)
    local mr = require("mason-registry")
    mr:on("package:install:success", function()
      vim.defer_fn(function()
        -- trigger FileType event to possibly load this newly installed LSP server
        require("lazy.core.handler.event").trigger({
          event = "FileType",
          buf = vim.api.nvim_get_current_buf(),
        })
      end, 100)
    end)

    mr.refresh(function()
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end)
  end,
}
