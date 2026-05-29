return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        tailwindcss = {
          root_dir = require("lspconfig.util").root_pattern(
            "tailwind.config.js",
            "tailwind.config.ts",
            "tailwind.config.mjs",
            "postcss.config.js"
          ),
          settings = {
            tailwindCSS = {
              experimental = { classRegex = {} },
              files = {
                exclude = {
                  "**/.git/**",
                  "**/node_modules/**",
                  "**/.next/**",
                  "**/dist/**",
                },
              },
            },
          },
        },
      },
    },
  },
}
