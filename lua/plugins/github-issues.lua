return {
  "juninhopo/issues-neovim",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    require("issues_neovim").setup({
      enabled = true,
      keys = {
        open = "<leader>gi",
        close = "q",
        refresh = "r",
        navigate = { prev = "k", next = "j" },
        view_details = "<CR>",
        create_issue = "c",
        add_comment = "a",
      },
      ui = {
        width = 0.8,
        height = 0.8,
        border = "rounded",
        title = "GitHub Issues",
      },
      github = {
        api_url = "https://api.github.com",
        -- Optional: Set your GitHub username if different from juninhopo
        -- username = "your-github-username",
        -- Optional: Set your GitHub token here or use one of the other methods mentioned in the docs
        -- token = nil, -- Will check environment variables and ~/.config/github_token
      },
    })
  end,
} 