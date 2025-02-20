return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      astro = {
        settings = {
          astro = {
            contentIntellisense = true,
          },
        },
      },
    },
  },
}

