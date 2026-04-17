-- lua/plugins/ccc.lua
return {
  {
    "uga-rosa/ccc.nvim",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "CccPick", "CccHighlighterToggle", "CccHighlighterEnable", "CccConvert" },
    keys = {
      { "<leader>cp", "<cmd>CccPick<cr>", desc = "Color Picker" },
      { "<leader>ct", "<cmd>CccHighlighterToggle<cr>", desc = "Toggle Color Highlight" },
      { "<leader>cc", "<cmd>CccConvert<cr>", desc = "Convert Color" },
    },
    config = function()
      local ccc = require("ccc")

      ccc.setup({
        highlighter = {
          auto_enable = true,
          lsp = true,
          filetypes = {
            "css",
            "scss",
            "sass",
            "html",
            "javascript",
            "typescript",
            "javascriptreact",
            "typescriptreact",
          },
        },
        inputs = {
          ccc.input.oklch,
          ccc.input.hsl,
          ccc.input.rgb,
        },
        outputs = {
          ccc.output.css_oklch, -- fix
          ccc.output.hex,
          ccc.output.css_hsl,
          ccc.output.css_rgb,
        },
        pickers = {
          ccc.picker.oklch,
          ccc.picker.hex,
          ccc.picker.css_rgb,
          ccc.picker.css_hsl,
          ccc.picker.css_name,
        },
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "css", "scss", "sass", "html", "javascript", "typescript", "javascriptreact", "typescriptreact" },
        callback = function()
          vim.cmd("CccHighlighterEnable")
        end,
      })
    end,
  },
}
