return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          settings = {
            typescript = {
              suggest = {
                autoImports = true,
              },
              preferences = {
                includeCompletionsForModuleExports = true,
                importModuleSpecifierPreference = "relative",
              },
            },
            javascript = {
              suggest = {
                autoImports = true,
              },
              preferences = {
                includeCompletionsForModuleExports = true,
                importModuleSpecifierPreference = "relative",
              },
            },
          },
        },
      },
    },
  },
}
