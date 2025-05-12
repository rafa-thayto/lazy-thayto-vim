return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    opts = {
      -- Make sure to use the defaults from LazyVim
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      },
      -- Automatically format on save
      autoformat = true,
      -- Customize LSP server settings
      servers = {
        -- Set up your preferred LSP servers here
      },
    },
    config = function(_, opts)
      -- Setup LSP servers
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      for server_name, server_opts in pairs(opts.servers or {}) do
        local server_available, server = pcall(require, "lspconfig." .. server_name)
        if server_available then
          server.setup(vim.tbl_deep_extend("force", {
            capabilities = capabilities,
          }, server_opts or {}))
        end
      end
    end,
  },

  -- Mason - manage LSP servers
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
        "prettier",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      mr:on("package:install:success", function()
        vim.defer_fn(function()
          vim.cmd("LspRestart")
        end, 100)
      end)
      -- Install packages if they're not already installed
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },

  -- Mason LSP config - simplified configuration
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      -- Use basic settings without customizing too much
      ensure_installed = {},
      automatic_installation = false,
    },
    config = function(_, opts)
      -- Simple setup without overriding internal modules
      require("mason-lspconfig").setup(opts)
    end,
  },
}

