return {
  {

    "neovim/nvim-lspconfig",
    opts = {
      -- make sure mason installs the server
      servers = {
        -- Emmet
        emmet_ls = {
          init_options = {
            html = {
              options = {
                -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                ["bem.enabled"] = true,
                ["jsx.enabled"] = true,
                ["jsx.className"] = "class",
              },
            },
          },
        },
      },
    },
  },
}
