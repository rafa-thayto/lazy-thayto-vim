return {
  "juninhopo/issues-neovim",
  dependencies = {
    "folke/which-key.nvim",
    "voldikss/vim-floaterm",
    "nvim-lua/plenary.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require('issues-neovim').setup({
      -- Default keybinding settings
      keymaps = {
        -- Open issues-neovim
        open = "<leader>gi",
      },
      
      -- Default UI settings
      ui = {
        -- Float window settings
        float = {
          height = 0.9,
          width = 0.9,
          title = "GitHub Issues",
        },
      },
      
      -- GitHub related settings
      github = {
        token = nil, -- Will use GITHUB_TOKEN env var if nil
        owner = nil, -- Will detect from current repository if nil
        repo = nil,  -- Will detect from current repository if nil
      },
      
      -- API settings
      api = {
        url = "https://api.github.com",
        cache_enabled = true,
        cache_duration = 5 * 60 * 1000, -- 5 minutes in milliseconds
        request_retries = 3,
        request_retry_delay = 1000, -- 1 second
      },
    })
  end
}