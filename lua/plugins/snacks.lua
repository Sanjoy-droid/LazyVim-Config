return {
  "folke/snacks.nvim",
  opts = {
    image = { enabled = true },
    dashboard = {
      sections = {
        {
          section = "terminal",
          cmd = "python3 $HOME/.config/nvim/scripts/year_calendar.py; sleep .1",
          height = 15,
          padding = 1,
          ttl = 60 * 60 * 24,
        },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
      },
    },
  },
  keys = {
    {
      "<leader>gB",
      function()
        Snacks.gitbrowse()
      end,
      desc = "Git Browse",
      mode = { "n", "v" },
    },
    {
      "<leader>gg",
      function()
        Snacks.lazygit({ cwd = LazyVim.root() })
      end,
      desc = "Lazygit",
    },
    {
      "<leader>un",
      function()
        Snacks.notifier.hide()
      end,
      desc = "Dismiss All Notifications",
    },
    {
      "<c-/>",
      function()
        Snacks.terminal()
      end,
      desc = "Toggle Terminal",
    },
    {
      "<c-_>",
      function()
        Snacks.terminal()
      end,
      desc = "which_key_ignore",
    },
  },
}
