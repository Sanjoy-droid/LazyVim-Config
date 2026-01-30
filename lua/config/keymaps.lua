-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Custom keymaps

vim.keymap.set("n", "<F9>", "<cmd>w<cr>", { desc = "Save file" })

vim.keymap.set("n", "<leader>uw", function()
  vim.wo.wrap = not vim.wo.wrap
  vim.wo.linebreak = vim.wo.wrap
  vim.wo.breakindent = vim.wo.wrap
end, { desc = "Universal Word Wrap Toggle" })
