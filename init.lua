-- bootstrap lazy.nvim, LazyVim and your plugins
vim.filetype.add({
  extension = {
    mdx = "mdx",
  },
})
require("config.lazy")
