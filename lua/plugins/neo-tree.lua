return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  init = function()
    vim.g.neo_tree_remove_legacy_commands = true
  end,
  opts = {
    commands = {
      system_open = function(state)
        -- TODO: just use vim.ui.open when dropping support for Neovim <0.10
        (vim.ui.open.system_open)(state.tree:get_node():get_id())
      end,
      parent_or_close = function(state)
        local node = state.tree:get_node()
        if (node.type == "directory" or node:has_children()) and node:is_expanded() then
          state.commands.toggle_node(state)
        else
          require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
        end
      end,
      child_or_open = function(state)
        local node = state.tree:get_node()
        if node.type == "directory" or node:has_children() then
          if not node:is_expanded() then -- if unexpanded, expand
            state.commands.toggle_node(state)
          else -- if expanded and has children, seleect the next child
            require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
          end
        else -- if not a directory just open it
          state.commands.open(state)
        end
      end,
    },
    window = {
      width = 30,
      mappings = {
        -- ["<space>"] = false, -- disable space until we figure out which-key disabling
        -- ["[b"] = "prev_source",
        -- ["]b"] = "next_source",
        -- F = utils.is_available "telescope.nvim" and "find_in_dir" or nil,
        O = "system_open",
        Y = "copy_selector",
        h = "parent_or_close",
        l = "child_or_open",
        o = "open",
      },
    },
  },
}
