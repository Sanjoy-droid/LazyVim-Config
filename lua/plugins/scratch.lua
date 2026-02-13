return {
  "folke/snacks.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    scratch = {
      ft = "text",
    },
  },
  keys = {
    -- Default scratch
    {
      ".",
      function()
        require("snacks").scratch()
      end,
      desc = "Toggle Scratch Buffer",
    },
    -- Telescope selector for scratch files
    {
      "ns",
      function()
        local scratch_dir = vim.fn.stdpath("data") .. "/scratch"
        -- Ensure scratch directory exists
        vim.fn.mkdir(scratch_dir, "p")

        -- Pre-create common scratch files if they don't exist
        local common_files = {
          "todo.txt",
          "project.txt",
          "ideas.txt",
          "work.txt",
          "daily.txt",
        }

        for _, file in ipairs(common_files) do
          local filepath = scratch_dir .. "/" .. file
          if vim.fn.filereadable(filepath) == 0 then
            vim.fn.writefile({ "# " .. file:gsub("%.txt$", ""):upper(), "" }, filepath)
          end
        end

        -- Open telescope to select scratch file
        require("telescope.builtin").find_files({
          prompt_title = "Select Scratch File",
          cwd = scratch_dir,
          find_command = { "rg", "--files", "--glob", "!*.meta" }, -- Hide .meta files
          attach_mappings = function(prompt_bufnr, map)
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")

            -- Override default selection to open with Snacks.scratch
            actions.select_default:replace(function()
              local selection = action_state.get_selected_entry()
              actions.close(prompt_bufnr)
              if selection then
                local filename = selection.value:gsub("%.txt$", "")
                require("snacks").scratch({
                  name = filename,
                  ft = "text",
                })
              end
            end)
            return true
          end,
        })
      end,
      desc = "Select Scratch File",
    },
    -- Search across all scratch files
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
