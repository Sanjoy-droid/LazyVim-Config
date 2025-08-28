return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- show hidden files
        hide_dotfiles = false, -- show .files
        hide_gitignored = false, -- show .gitignored
      },
    },
  },
}
