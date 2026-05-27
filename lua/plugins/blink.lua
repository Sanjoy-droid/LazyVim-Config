return {
  {
    "saghen/blink.cmp",
    opts = {
      enabled = function()
        return not vim.tbl_contains({ "text", "markdown" }, vim.bo.filetype)
      end,
      keymap = {
        preset = "default",
        ["<Tab>"] = { "select_and_accept" },
        ["<S-Tab>"] = { "select_prev" },
      },
    },
  },
}
