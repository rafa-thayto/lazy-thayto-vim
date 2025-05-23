return {
  {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        columns = {
          "icon",
          "size",
        },
        buf_options = {
          buflisted = false,
        },
        win_options = {
          wrap = false,
          signcolumn = "no",
          cursorcolumn = false,
          foldcolumn = "0",
          spell = false,
          list = false,
          conceallevel = 3,
          concealcursor = "n",
        },
        keymaps = {
          ["<CR>"] = "actions.select",
          ["<C-c>"] = "actions.close",
          ["<C-l>"] = "actions.refresh",
          ["-"] = "actions.parent",
          ["g."] = "actions.toggle_hidden",
        },
        use_default_keymaps = false,
        view_options = {
          show_hidden = false,
        },
      })
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
  },
}
