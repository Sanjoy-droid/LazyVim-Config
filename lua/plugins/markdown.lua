return {
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = { "markdown" },
    config = function()
      vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreview<CR>", { desc = "Markdown Preview" })
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      latex = { enabled = false },
    },
  },
}
