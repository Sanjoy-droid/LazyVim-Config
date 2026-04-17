-- lua/plugins/colorizer.lua
return {
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      filetypes = { "css", "scss", "html", "javascript", "typescript", "javascriptreact", "typescriptreact" },
      user_default_options = {
        css = true, -- enables oklch(), hsl(), etc.
        css_fn = true, -- enables color functions
        mode = "background", -- or "foreground" / "virtualtext"
        tailwind = true, -- keeps your existing tailwind colors working
      },
    },
  },
}
