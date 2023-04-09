---@diagnostic disable: redundant-parameter

return {
  {
    'nvim-tree/nvim-tree.lua',
    version = 'nightly',
    cmd = 'NvimTreeToggle',
    keys = {
      { '<leader>e', '<cmd>NvimTreeToggle<cr>' },
    },
    config = function()
      local nvimtree = require('nvim-tree')
      local lib = require('nvim-tree.lib')
      local view = require('nvim-tree.view')

      local function collapse_all()
        require('nvim-tree.actions.tree-modifiers.collapse-all').fn()
      end

      local function edit_or_open()
        -- open as vsplit on current node
        local action = 'edit'
        local node = lib.get_node_at_cursor()

        -- Just copy what's done normally with vsplit
        if node.link_to and not node.nodes then
          require('nvim-tree.actions.node.open-file').fn(action, node.link_to)
        -- view.close() -- Close the tree if file was opened
        elseif node.nodes ~= nil then
          lib.expand_or_collapse(node)
        else
          require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)
          -- view.close() -- Close the tree if file was opened
        end
      end

      local function vsplit_preview()
        -- open as vsplit on current node
        local action = 'vsplit'
        local node = lib.get_node_at_cursor()

        -- Just copy what's done normally with vsplit
        if node.link_to and not node.nodes then
          require('nvim-tree.actions.node.open-file').fn(action, node.link_to)
        elseif node.nodes ~= nil then
          lib.expand_or_collapse(node)
        else
          require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)
        end

        -- Finally refocus on tree if it was lost
        view.focus()
      end

      nvimtree.setup({
        disable_netrw = true,
        -- sort_by = function(nodes)
        --   table.sort(nodes, natural_cmp)
        -- end,
        sort_by = 'name',
        view = {
          adaptive_size = false,
          centralize_selection = false,
          width = 40,
          hide_root_folder = false,
          number = true,
          relativenumber = true,
          mappings = {
            custom_only = false,
            list = {
              { key = 'l', action = 'edit', action_cb = edit_or_open },
              { key = 'L', action = 'vsplit_preview', action_cb = vsplit_preview },
              { key = 'h', action = 'close_node' },
              { key = 'H', action = 'collapse_all', action_cb = collapse_all },
              { key = '<C-v>', action = 'vsplit' },
              { key = '<C-s>', action = 'split' },
              { key = '<C-t>', action = 'tabnew' },
            },
          },
        },
        actions = {
          open_file = {
            window_picker = {
              enable = true,
              picker = 'default',
              chars = 'FJDKSLA;CMRUEIWOQP',
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
            git_placement = 'before',
            modified_placement = 'after',
            padding = ' ',
            symlink_arrow = ' ➛ ',
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
              modified = true,
            },
            glyphs = {
              default = '',
              symlink = '',
              bookmark = '',
              modified = '',
              folder = {
                arrow_closed = '',
                arrow_open = '',
                default = '',
                open = '',
                empty = '',
                empty_open = '',
                symlink = '',
                symlink_open = '',
              },
              git = {
                unstaged = '●',
                staged = '✓',
                unmerged = '',
                renamed = '➜',
                untracked = '?',
                -- deleted = '',
                deleted = '✗',
                ignored = '!',
              },
            },
          },
          special_files = { 'Cargo.toml', 'Makefile', 'README.md', 'readme.md' },
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
            hint = 'H',
            info = 'I',
            warning = 'W',
            error = 'E',
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
    end,
  },
}
