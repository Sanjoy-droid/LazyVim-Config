-- ~/.config/nvim/lua/plugins/copilot-toggle.lua
local COPILOT_ENABLED = false -- Change to true next month

return {
  {
    "zbirenbaum/copilot.lua",
    enabled = COPILOT_ENABLED,
  },
  {
    "zbirenbaum/copilot-cmp",
    enabled = COPILOT_ENABLED,
  },
}
