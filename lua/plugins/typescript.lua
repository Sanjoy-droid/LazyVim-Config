return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          settings = {
            typescript = {
              tsserver = { maxTsServerMemory = 1024 },
              suggest = {
                autoImports = true,
              },
              preferences = {
                includeCompletionsForModuleExports = true,
                importModuleSpecifierPreference = "relative",
              },
            },
            javascript = {
              tsserver = { maxTsServerMemory = 1024 },
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
