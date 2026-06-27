return {
  "folke/snacks.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    scratch = {
      ft = "markdown",
    },
  },
  keys = {
    {
      "ns",
      function()
        local scratch_dir = vim.fn.stdpath("data") .. "/scratch"
        vim.fn.mkdir(scratch_dir, "p")
        local common_files = {
          "draft.md",
          "draft-1.md",
          "draft-2.md",
          "draft-3.md",
          "draft-4.md",
          "draft-5.md",
          "draft-6.md",
          "draft-7.md",
          "draft-8.md",
          "draft-9.md",
          "draft-10.md",
          "draft-11.md",
          "draft-12.md",
          "draft-13.md",
        }
        for _, file in ipairs(common_files) do
          local filepath = scratch_dir .. "/" .. file
          if vim.fn.filereadable(filepath) == 0 then
            vim.fn.writefile({ "# " .. file:gsub("%.md$", ""):upper(), "" }, filepath)
          end
        end
        require("telescope.builtin").find_files({
          prompt_title = "Select Scratch File",
          cwd = scratch_dir,
          find_command = { "rg", "--files", "--glob", "draft*.md", "--glob", "!*.meta" },
          attach_mappings = function(prompt_bufnr, map)
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")
            actions.select_default:replace(function()
              local selection = action_state.get_selected_entry()
              actions.close(prompt_bufnr)
              if selection then
                local filename = selection.value:gsub("%.md$", "")
                require("snacks").scratch({
                  name = filename,
                  ft = "markdown",
                })
              end
            end)
            return true
          end,
        })
      end,
      desc = "Select Scratch File",
    },
    {
      "ng",
      function()
        require("telescope.builtin").live_grep({
          prompt_title = "Search Scratch Files",
          cwd = vim.fn.stdpath("data") .. "/scratch",
        })
      end,
      desc = "Search in Scratch Files",
    },
  },
}
