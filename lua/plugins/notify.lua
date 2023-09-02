return {
  {
    "rcarriga/nvim-notify",
    opts = {
      -- level = 3,
      render = "minimal",
      stages = "static",
      timeout = 2000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    },
  },
}
