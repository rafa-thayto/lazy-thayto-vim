return {
  {
    "azorng/goose.nvim",
    config = function()
      -- Default configuration with all available options
      require("goose").setup({
        default_global_keymaps = true, -- If false, disables all default global keymaps
        keymap = {
          global = {
            toggle = "<leader>ag", -- Open goose. Close if opened
            open_input = "<leader>ai", -- Opens and focuses on input window on insert mode
            open_input_new_session = "<leader>aI", -- Opens and focuses on input window on insert mode. Creates a new session
            open_output = "<leader>ao", -- Opens and focuses on output window
            toggle_focus = "<leader>at", -- Toggle focus between goose and last window
            close = "<leader>aq", -- Close UI windows
            toggle_fullscreen = "<leader>af", -- Toggle between normal and fullscreen mode
            select_session = "<leader>as", -- Select and load a goose session
            goose_mode_chat = "<leader>amc", -- Set goose mode to `chat`. (Tool calling disabled. No editor context besides selections)
            goose_mode_auto = "<leader>ama", -- Set goose mode to `auto`. (Default mode with full agent capabilities)
            configure_provider = "<leader>ap", -- Quick provider and model switch from predefined list
            diff_open = "<leader>ad", -- Opens a diff tab of a modified file since the last goose prompt
            diff_next = "<leader>a]", -- Navigate to next file diff
            diff_prev = "<leader>a[", -- Navigate to previous file diff
            diff_close = "<leader>ac", -- Close diff view tab and return to normal editing
            diff_revert_all = "<leader>ara", -- Revert all file changes since the last goose prompt
            diff_revert_this = "<leader>art", -- Revert current file changes since the last goose prompt
          },
          window = {
            submit = "<cr>", -- Submit prompt
            close = "<esc>", -- Close UI windows
            stop = "<C-c>", -- Stop goose while it is running
            next_message = "]]", -- Navigate to next message in the conversation
            prev_message = "[[", -- Navigate to previous message in the conversation
            mention_file = "@", -- Pick a file and add to context. See File Mentions section
            toggle_pane = "<tab>", -- Toggle between input and output panes
            prev_prompt_history = "<up>", -- Navigate to previous prompt in history
            next_prompt_history = "<down>", -- Navigate to next prompt in history
          },
        },
        ui = {
          window_width = 0.35, -- Width as percentage of editor width
          input_height = 0.15, -- Input height as percentage of window height
          fullscreen = false, -- Start in fullscreen mode (default: false)
          layout = "right", -- Options: "center" or "right"
          floating_height = 0.8, -- Height as percentage of editor height for "center" layout
          display_model = true, -- Display model name on top winbar
          display_goose_mode = true, -- Display mode on top winbar: auto|chat
        },
        providers = {
          --[[
    Define available providers and their models for quick model switching
    anthropic|azure|bedrock|databricks|google|groq|ollama|openai|openrouter
    Example:
    openrouter = {
      "anthropic/claude-3.5-sonnet",
      "openai/gpt-4.1",
    },
    ollama = {
      "cogito:14b"
    }
    --]]
        },
      })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          anti_conceal = { enabled = false },
        },
      },
    },
  },
  {
    enabled = false,
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
      -- add any opts here
      -- for example
      provider = "claude",
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-4-sonnet-20250514",
        temperature = 0,
        max_tokens = 4096,
      },
      -- openai = {
      --   endpoint = "https://api.openai.com/v1",
      --   model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
      --   timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
      --   temperature = 0,
      --   max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
      --   --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
      -- },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
