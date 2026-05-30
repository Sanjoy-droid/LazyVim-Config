vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  pattern = { "*.tsx", "*.ts", "*.jsx", "*.js", "*.css" },
  callback = function()
    local root = vim.fs.root(0, {
      "postcss.config.mjs",
      "postcss.config.js",
      "tailwind.config.js",
      "tailwind.config.ts",
      "tailwind.config.mjs",
    })
    if root then
      vim.lsp.start({
        name = "tailwindcss",
        cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/tailwindcss-language-server"), "--stdio" },
        root_dir = root,
        settings = {
          tailwindCSS = {
            experimental = { classRegex = {} },
            files = {
              exclude = { "**/.git/**", "**/node_modules/**", "**/.next/**", "**/dist/**" },
            },
          },
        },
      })
    end
  end,
})

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
}
