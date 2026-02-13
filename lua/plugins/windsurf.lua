return {
  "Exafunction/windsurf.vim",
  event = "BufEnter",
  config = function()
    -- Disable Tab binding to avoid conflicts with completion
    vim.g.codeium_no_map_tab = 1

    -- Accept suggestion with Ctrl+Enter (or Ctrl+CR)
    vim.keymap.set("i", "<C-CR>", function()
      return vim.fn["codeium#Accept"]()
    end, { expr = true, silent = true })

    -- Alternative: Accept with Ctrl+J
    vim.keymap.set("i", "<C-j>", function()
      return vim.fn["codeium#Accept"]()
    end, { expr = true, silent = true })

    -- Cycle through suggestions
    vim.keymap.set("i", "<M-]>", function()
      return vim.fn["codeium#CycleCompletions"](1)
    end, { expr = true, silent = true })

    vim.keymap.set("i", "<M-[>", function()
      return vim.fn["codeium#CycleCompletions"](-1)
    end, { expr = true, silent = true })

    -- Manually trigger Windsurf
    vim.keymap.set("i", "<M-\\>", function()
      return vim.fn["codeium#Complete"]()
    end, { expr = true, silent = true })

    -- Clear suggestion
    vim.keymap.set("i", "<C-]>", function()
      return vim.fn["codeium#Clear"]()
    end, { expr = true, silent = true })
  end,
}
