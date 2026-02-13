-- ~/.config/nvim/lua/plugins/scratch-no-warnings.lua
return {
  {
    "LazyVim/LazyVim",
    opts = function()
      vim.api.nvim_create_autocmd("BufEnter", {
        callback = function(ev)
          local filepath = vim.api.nvim_buf_get_name(ev.buf)

          -- Only disable if file is in scratch directory
          if filepath:match("/scratch/") then
            -- Disable diagnostics
            vim.diagnostic.enable(false, { bufnr = ev.buf })

            -- Also disable diagnostic signs in gutter
            vim.diagnostic.config({
              signs = false,
              virtual_text = false,
              underline = false,
            }, vim.api.nvim_create_namespace("scratch_diagnostics"))
          end
        end,
      })
    end,
  },
}
