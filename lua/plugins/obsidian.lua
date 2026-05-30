return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    -- tabnew BEFORE the obsidian command = note opens in that tab
    {
      "<leader>on",
      function()
        vim.cmd("tabnew")
        vim.cmd("Obsidian new")
      end,
      desc = "New Note",
    },
    {
      "<leader>oo",
      function()
        vim.cmd("tabnew")
        vim.cmd("Obsidian quick_switch")
      end,
      desc = "Open Note",
    },
    {
      "<leader>od",
      function()
        vim.cmd("tabnew")
        vim.cmd("Obsidian today")
      end,
      desc = "Daily Note",
    },
    { "<leader>os", "<cmd>Obsidian search<cr>", desc = "Search Notes" },
    { "<leader>ob", "<cmd>Obsidian backlinks<cr>", desc = "Backlinks" },
    { "<leader>ot", "<cmd>Obsidian tags<cr>", desc = "Tags" },
    { "<leader>ol", "<cmd>Obsidian links<cr>", desc = "Links in Note" },
    { "<leader>oL", "<cmd>Obsidian link_new<cr>", desc = "Link to New Note" },
    {
      "<CR>",
      function()
        return require("obsidian").util.smart_action()
      end,
      desc = "Smart Action (follow link / toggle checkbox)",
      ft = "markdown",
      expr = true,
      buffer = true,
    },
  },
  opts = {
    legacy_commands = false,
    workspaces = {
      {
        name = "personal",
        path = "~/vaults/personal",
      },
    },

    -- Human-readable IDs from title instead of random strings
    -- "My Note" → "my-note.md" instead of "1780038747-SCDK.md"
    note_id_func = function(title)
      if title ~= nil then
        return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        return tostring(os.time())
      end
    end,

    -- Adds title as alias so quick_switch can find it by name
    frontmatter = {
      func = function(note)
        if note.title ~= nil then
          note:add_alias(note.title)
        end
        local out = { id = note.id, aliases = note.aliases, tags = note.tags }
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end
        return out
      end,
    },

    -- Most recently modified notes first in picker
    search = {
      sort_by = "modified",
      sort_reversed = true,
    },
    picker = {
      name = "telescope.nvim",
      note_mappings = {
        new = "<C-x>",
        insert_link = "<C-l>",
      },
      tag_mappings = {
        tag_note = "<C-x>",
        insert_tag = "<C-l>",
      },
    },

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

    attachments = {
      folder = "attachments", -- saves pasted images here instead of vault root
    },

    -- "tab" is NOT valid. Tab behavior handled by keymaps above.
    open_notes_in = "current",

    ui = { enabled = false },

    checkbox = {
      order = { " ", "x" },
    },
  },
}
