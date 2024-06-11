return {
  {
    "nvim-telescope/telescope.nvim",

    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = "^1.0.0",
      },
    },
    keys = {
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
    },
    cmd = "Telescope",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("live_grep_args")
    end,
  },
}
