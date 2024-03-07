return {
  {
    "telescope.nvim",

    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = "^1.0.0",
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
