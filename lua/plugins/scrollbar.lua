-- ~/.config/nvim/lua/plugins/scrollbar.lua
return {
  "petertriho/nvim-scrollbar",
  dependencies = {
    "kevinhwang91/nvim-hlslens", -- optional but 🔥 for search highlights
  },
  config = function()
    require("scrollbar").setup({
      show = true,
      handle = {
        text = " ",
        color = "#555555",
      },
      marks = {
        Cursor = { text = "•" },
        Search = { text = { "-", "=" } },
        Error = { text = { "" } },
        Warn = { text = { "" } },
        Info = { text = { "" } },
        Hint = { text = { "" } },
        GitAdd = { text = "│" },
        GitChange = { text = "│" },
        GitDelete = { text = "_" },
      },
    })

    -- integrate with search
    require("scrollbar.handlers.search").setup()
  end,
}
