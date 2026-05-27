-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Always enable wrap globally

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.conceallevel = 2 -- hide markdown syntax markers in normal mode
-- Force disable virtual text after LazyVim loads
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    vim.diagnostic.config({
      virtual_text = false,
      virtual_lines = false,
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })
  end,
})
