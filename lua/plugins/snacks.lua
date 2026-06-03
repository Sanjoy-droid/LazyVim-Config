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
          width = 120,
          indent = -25,
          ttl = 60 * 60 * 24,
        },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
      },
    },
  },
  keys = (function()
    local function smart_cwd()
      local bufname = vim.api.nvim_buf_get_name(0)
      if bufname ~= "" and vim.fn.filereadable(bufname) == 1 then
        return LazyVim.root()
      end
      return vim.fn.getcwd()
    end

    return {
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
      {
        "<leader>e",
        function()
          Snacks.explorer({ cwd = smart_cwd() })
        end,
        desc = "Explorer (cwd)",
      },
      {
        "<leader><space>",
        function()
          Snacks.picker.smart({ cwd = smart_cwd() })
        end,
        desc = "Smart Find Files",
      },
      {
        "<leader>ff",
        function()
          Snacks.picker.files({ cwd = smart_cwd() })
        end,
        desc = "Find Files",
      },
    }
  end)(),
}
