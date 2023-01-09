local M = {}

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
    view.close() -- Close the tree if file was opened
  elseif node.nodes ~= nil then
    lib.expand_or_collapse(node)
  else
    require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)
    view.close() -- Close the tree if file was opened
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

local function natural_cmp(left, right)
  left = left.name:lower()
  right = right.name:lower()

  for i = 1, string.len(left), 1 do
    local l = string.sub(left, i, -1)
    local r = string.sub(right, i, -1)

    if l == r then
      return false
    elseif type(tonumber(string.sub(l, 1, 1))) == 'number' and type(tonumber(string.sub(r, 1, 1))) == 'number' then
      return tonumber(string.match(l, '^[0-9]+')) < tonumber(string.match(r, '^[0-9]+'))
    elseif l[1] == r[1] then
      goto continue
    else
      return l < r
    end
    ::continue::
  end
end

M.setup = function()
  local ok, nvimtree = pcall(require, 'nvim-tree')
  if not ok then
    return
  end

  nvimtree.setup({
    disable_netrw = true,
    -- sort_by = function(nodes)
    --   table.sort(nodes, natural_cmp)
    -- end,
    sort_by = 'name',
    view = {
      adaptive_size = true,
      centralize_selection = true,
      width = 40,
      hide_root_folder = false,
      mappings = {
        custom_only = false,
        list = {
          { key = 'l', action = 'edit', action_cb = edit_or_open },
          { key = 'L', action = 'vsplit_preview', action_cb = vsplit_preview },
          { key = 'h', action = 'close_node' },
          { key = 'H', action = 'collapse_all', action_cb = collapse_all },
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
end

return M
