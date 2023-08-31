-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- map("n")
-- ui
map("n", "<leader>uT", "<cmd>TransparentEnable<cr>", { desc = "Enable background transparency" })
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<C-p>", "<cmd>Telescope fd<cr>")
map("n", "<leader>e", "<cmd>Oil<cr>")
-- map("n", "<leader>ss", "<cmd>%s/<<C-r><C-w>>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "Search and Replace RegExp" })
