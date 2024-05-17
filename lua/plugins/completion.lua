return {
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<c-a>",
          clear_suggestion = "<c-x>",
          accept_word = "<c-q>",
        },
        ignore_filetypes = { cpp = true },
        color = {
          suggestion_color = "#DDDDDD",

          cterm = 244,
        },
      })
    end,
  },
}
