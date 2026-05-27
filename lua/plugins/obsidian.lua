return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    { "<leader>on", "<cmd>Obsidian new<cr>", desc = "New Note" },
    { "<leader>oo", "<cmd>Obsidian quick_switch<cr>", desc = "Open Note" },
    { "<leader>os", "<cmd>Obsidian search<cr>", desc = "Search Notes" },
    { "<leader>od", "<cmd>Obsidian today<cr>", desc = "Daily Note" },
  },
  opts = {
    legacy_commands = false,
    workspaces = {
      {
        name = "personal",
        path = "~/vaults/personal",
      },
    },
    picker = { name = "telescope.nvim" },
    completion = {
      blink = true,
      nvim_cmp = false,
      min_chars = 2,
    },
    daily_notes = {
      folder = "dailies",
      date_format = "%Y-%m-%d",
      default_tags = { "daily" },
    },
    templates = {
      folder = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      substitutions = {},
    },
    open_notes_in = "vsplit",
    ui = { enabled = false }, -- render-markdown owns all visual rendering
  },
}
