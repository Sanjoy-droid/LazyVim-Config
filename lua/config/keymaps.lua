-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Function to save the file
local function save_file()
  if vim.fn.expand("%") ~= "" then
    vim.cmd("silent! write")
    print("File saved")
  else
    print("Cannot save: No file name")
  end
end

-- Map F9 to save the file in normal mode
vim.keymap.set("n", "<F9>", save_file, { noremap = true, silent = true, desc = "Save file (normal mode)" })

-- Map F9 to save the file in visual mode
vim.keymap.set("v", "<F9>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
  save_file()
end, { noremap = true, silent = true, desc = "Save file (visual mode)" })

-- Map F9 to save the file in insert mode
vim.keymap.set("i", "<F9>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
  save_file()
  vim.api.nvim_feedkeys("a", "n", false)
end, { noremap = true, silent = true, desc = "Save file (insert mode)" })

-- Optionally, you can disable the default ':w' mapping if you want to use F9 exclusively
-- vim.keymap.set('n', ':w', '<Nop>', { noremap = true, silent = true })
