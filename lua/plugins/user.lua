-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
return {
  -- change trouble config
  -- {
  --   "folke/trouble.nvim",
  --   -- opts will be merged with the parent spec
  --   opts = { use_diagnostic_signs = true },
  --   enabled = false,
  -- },

  -- disable trouble
  -- { "folke/trouble.nvim", enabled = false },

  -- transparent
  {
    "xiyaowong/transparent.nvim",
    cmd = {
      "TransparentEnable",
      "TransparentDisable",
      "TransparentToggle",
    },
  },

  {
    "mg979/vim-visual-multi",
    event = "VeryLazy"
  }
}
