return {
  {
    "stevearc/oil.nvim",
    keys = {
      { "<leader>e", "<cmd>Oil<cr>" },
    },
    opts = {
      columns = {
        "icon",
        "permissions",
        "size",
      },
      keymaps = {
        ["<CR>"] = "actions.select",
        ["<C-v>"] = "actions.select_vsplit",
        ["<C-s>"] = "actions.select_split",
        ["<C-t>"] = "actions.select_tab",
        ["<C-e>"] = "actions.close",
      },
      view_options = {
        show_hidden = true,
      },
    },
  },
}
