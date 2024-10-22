-- bootstrap lazy.nvim, LazyVim and your plugins
-- Initialize a variable to keep track of ESLint status
local eslint_enabled = true -- Start with ESLint enabled

-- Function to toggle ESLint
function ToggleESLint()
  if eslint_enabled then
    -- Disable ESLint
    vim.cmd("let g:neoformat_enabled_eslint = 0")
    print("ESLint is now disabled")
  else
    -- Enable ESLint
    vim.cmd("let g:neoformat_enabled_eslint = 1")
    print("ESLint is now enabled")
  end
  -- Toggle the state
  eslint_enabled = not eslint_enabled
end

-- Create a user command to toggle ESLint
vim.api.nvim_create_user_command("ToggleESLint", ToggleESLint, {})

require("config.lazy")

--hello world
