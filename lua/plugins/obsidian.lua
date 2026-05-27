return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false,

    workspaces = {
      {
        name = "personal",
        path = "~/vaults/personal",
      },
    },

    -- use telescope for all pickers
    picker = {
      name = "telescope.nvim",
    },

    -- use blink.cmp for completion
    completion = {
      blink = true,
      nvim_cmp = false,
      min_chars = 2,
    },

    -- daily notes config
    daily_notes = {
      folder = "dailies",
      date_format = "%Y-%m-%d",
      default_tags = { "daily" },
    },

    -- where templates live inside the vault
    templates = {
      folder = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
    },

    -- when you hit <CR> on a link it follows it,
    -- on a checkbox it toggles it
    mappings = {
      ["<CR>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
    },

    -- open in vsplit instead of current window
    open_notes_in = "vsplit",

    ui = {
      enable = true,
    },
  },
}
