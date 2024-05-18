---@diagnostic disable: redundant-parameter

local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  api.config.mappings.default_on_attach(bufnr)

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  vim.keymap.set("n", "H", "", { buffer = bufnr })
  vim.keymap.del("n", "H", { buffer = bufnr })

  vim.keymap.set("n", "l", function()
    local lib = require("nvim-tree.lib")
    -- open as vsplit on current node
    local action = "edit"
    local node = lib.get_node_at_cursor()

    -- Just copy what's done normally with vsplit
    if node.link_to and not node.nodes then
      require("nvim-tree.actions.node.open-file").fn(action, node.link_to)
      -- view.close() -- Close the tree if file was opened
    elseif node.nodes ~= nil then
      lib.expand_or_collapse(node)
    else
      require("nvim-tree.actions.node.open-file").fn(action, node.absolute_path)
      -- view.close() -- Close the tree if file was opened
    end
  end, opts("Edit or Open"))
  vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
  vim.keymap.set("n", "<M-v>", api.node.open.vertical, opts("Open: Vertical Split"))
  vim.keymap.set("n", "<M-s>", api.node.open.horizontal, opts("Open: Horizontal Split"))
  vim.keymap.set("n", "<M-t>", api.node.open.tab, opts("Open: New Tab"))
end

return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    cmd = "Explorer",
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>" },
    },
    config = function()
      require("nvim-tree").setup({
        on_attach = on_attach,
        disable_netrw = true,
        sort_by = "name",
        view = {
          adaptive_size = false,
          centralize_selection = false,
          width = 40,
          -- number = true,
          -- relativenumber = true,
        },
        actions = {
          open_file = {
            window_picker = {
              enable = true,
              picker = "default",
              chars = "FJDKSLA;CMRUEIWOQP",
            },
          },
        },
        renderer = {
          group_empty = true,
          highlight_git = true,
          indent_markers = {
            enable = true,
          },
          icons = {
            webdev_colors = true,
            git_placement = "before",
            modified_placement = "after",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
              modified = true,
            },
            glyphs = {
              default = "",
              symlink = "",
              bookmark = "",
              modified = "",
              folder = {
                arrow_closed = "",
                arrow_open = "",
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
                symlink_open = "",
              },
              git = {
                unstaged = "●",
                staged = "✓",
                unmerged = "",
                renamed = "➜",
                untracked = "?",
                deleted = "✗",
                ignored = "!",
              },
            },
          },
          special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
          symlink_destination = true,
        },
        update_focused_file = {
          enable = true,
          update_root = true,
          ignore_list = {},
        },
        diagnostics = {
          enable = true,
          show_on_dirs = true,
          show_on_open_dirs = false,
          debounce_delay = 50,
          severity = {
            min = vim.diagnostic.severity.HINT,
            max = vim.diagnostic.severity.ERROR,
          },
          icons = {
            hint = "H",
            info = "I",
            warning = "W",
            error = "E",
          },
        },
        filesystem_watchers = {
          enable = true,
          debounce_delay = 50,
          ignore_dirs = {},
        },
        git = {
          enable = true,
          ignore = false,
          show_on_dirs = true,
          show_on_open_dirs = false,
          timeout = 400,
        },
        modified = {
          enable = true,
          show_on_dirs = true,
          show_on_open_dirs = false,
        },
      })

      -- Add `Explorer` command
      vim.api.nvim_create_user_command("Explorer", "NvimTreeToggle", { nargs = 0 })
    end,
  },

  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    keys = {
      { "-", "<cmd>Oil<cr>" },
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
        ["<M-e>"] = "actions.close",
      },
      view_options = {
        show_hidden = true,
      },
    },
  },
}
