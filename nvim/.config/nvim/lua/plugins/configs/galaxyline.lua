local M = {}

M.setup = function()
  local ok, gl = pcall(require, 'galaxyline')
  if not ok then
    return
  end

  local diagnostic = require('galaxyline.providers.diagnostic')
  local vcs = require('galaxyline.providers.vcs')
  local fileinfo = require('galaxyline.providers.fileinfo')
  local buffer = require('galaxyline.providers.buffer')
  local condition = require('galaxyline.condition')
  local gls = gl.section

  local colors = require('core.highlights').colors
  local gl_active = colors.GalaxylineActive
  local gl_inactive = colors.GalaxylineInactive

  gl.short_line_list = { ' ' }

  -- Show current line percent of all lines
  local function get_current_line_percent()
    local current_line = vim.fn.line('.')
    local total_line = vim.fn.line('$')
    local result, _ = math.modf((current_line / total_line) * 100)
    return ' ' .. result .. '% '
  end

  -- Render read-only file icon
  local function get_file_readonly_icon(readonly_icon)
    if vim.bo.readonly == true and vim.bo.filetype ~= 'help' then
      local icon = readonly_icon or ''
      return ' ' .. icon .. ' '
    end
    return ''
  end

  -- Simple check for empty buffers
  local function is_buffer_not_empty()
    if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
      return true
    end
    return false
  end

  -- Get current file name dynamically
  local function get_current_file_name(readonly_icon)
    local filename
    local filename_full = vim.fn.fnamemodify(vim.fn.expand('%'), ':~:.')
    local filename_short = vim.fn.pathshorten(vim.fn.fnamemodify(vim.fn.expand('%'), ':~:.'))
    local filename_tail = vim.fn.expand('%:t')

    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 60 then
      filename = filename_full
    elseif squeeze_width > 40 then
      filename = filename_short
    else
      filename = filename_tail
    end

    if not is_buffer_not_empty() then
      filename = ' Untitled'
    end

    if string.len(get_file_readonly_icon(readonly_icon)) ~= 0 then
      return filename .. get_file_readonly_icon(readonly_icon)
    end

    if vim.bo.modifiable then
      if vim.bo.modified then
        local trail = vim.fn.search('\\s$', 'nw')
        if trail ~= 0 then
          return filename .. ' ' .. ' ' .. ' ' .. ' ' .. '  '
        else
          return filename .. ' ' .. ' ' .. '  '
        end
      end
    end

    return filename .. '  '
  end

  local special_file_types = {
    'packer',
    'vim-plug',
    'NvimTree',
    'CHADTree',
    'coc-explorer',
    'startuptime',
    'fugitive',
    'DiffviewFiles',
  }

  local function has_value(tab, val)
    for _, v in ipairs(tab) do
      if v == val then
        return true
      end
    end
    return false
  end

  -- Get element for normal filetype (return nothing if filetype is in special_file_types table)
  local function get_element_for_normal_ft(provider)
    if has_value(special_file_types, vim.bo.filetype) then
      return ''
    end
    return provider
  end

  -- Get element for normal filetype with width condition (return nothing if width is too small)
  local function get_element_for_normal_ft_wc(provider)
    if has_value(special_file_types, vim.bo.filetype) then
      return ''
    end
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 50 then
      return provider
    else
      return ''
    end
  end

  -- Get element for special filetype (return provider only if filetype is in special_file_types table)
  local function get_element_for_special_ft(provider)
    if has_value(special_file_types, vim.bo.filetype) then
      return provider
    end
    return ''
  end

  gls.left[1] = {
    ActiveLine = {
      provider = function()
        return ' '
      end,
      highlight = { 'NONE', gl_active.bg },
    },
  }

  gls.left[2] = {
    SpecialFileTypeBuffer = {
      provider = function()
        return get_element_for_special_ft(buffer.get_buffer_filetype())
      end,
      highlight = { gl_active.fg, gl_active.bg, 'bold' },
    },
  }

  gls.left[3] = {
    GitIcon = {
      provider = function()
        return get_element_for_normal_ft(' ')
        -- return get_element " "
      end,
      condition = condition.check_git_workspace,
      highlight = { gl_active.fg, gl_active.bg, 'bold' },
    },
  }

  gls.left[4] = {
    GitBranch = {
      provider = function()
        return get_element_for_normal_ft(vcs.get_git_branch())
      end,
      separator = '  ',
      separator_highlight = { 'NONE', gl_active.bg },
      condition = condition.check_git_workspace,
      highlight = { gl_active.fg, gl_active.bg, 'bold' },
    },
  }

  gls.left[5] = {
    FileIcon = {
      provider = function()
        return get_element_for_normal_ft(fileinfo.get_file_icon())
      end,
      condition = is_buffer_not_empty,
      highlight = { gl_active.fg, gl_active.bg },
    },
  }

  gls.left[6] = {
    FileName = {
      provider = function()
        return get_element_for_normal_ft(get_current_file_name())
      end,
      highlight = { gl_active.fg, gl_active.bg, 'bold' },
      event = 'VimResized',
    },
  }

  gls.left[7] = {
    DiagnosticError = {
      provider = function()
        return get_element_for_normal_ft(diagnostic.get_diagnostic_error())
      end,
      icon = '  ',
      highlight = { gl_active.fg, gl_active.bg, 'bold' },
    },
  }

  gls.left[8] = {
    DiagnosticWarn = {
      provider = function()
        return get_element_for_normal_ft(diagnostic.get_diagnostic_warn())
      end,
      icon = '  ',
      highlight = { gl_active.fg, gl_active.bg, 'bold' },
    },
  }

  gls.left[9] = {
    DiagnosticHint = {
      provider = function()
        return get_element_for_normal_ft(diagnostic.get_diagnostic_hint())
      end,
      icon = '  ',
      highlight = { gl_active.fg, gl_active.bg, 'bold' },
    },
  }

  gls.left[10] = {
    DiagnosticInfo = {
      provider = function()
        return get_element_for_normal_ft(diagnostic.get_diagnostic_info())
      end,
      icon = '  ',
      highlight = { gl_active.fg, gl_active.bg, 'bold' },
    },
  }

  gls.right[1] = {
    LineInfo = {
      provider = function()
        return get_element_for_normal_ft(fileinfo.line_column())
      end,
      highlight = { gl_active.fg, gl_active.bg, 'bold' },
    },
  }

  gls.right[2] = {
    LineInfoSpaces = {
      provider = function()
        return get_element_for_normal_ft('  ')
      end,
      highlight = { 'NONE', gl_active.bg },
    },
  }

  gls.right[3] = {
    FileTypeName = {
      provider = function()
        return get_element_for_normal_ft_wc(buffer.get_buffer_filetype())
      end,
      condition = is_buffer_not_empty,
      highlight = { gl_active.fg, gl_active.bg, 'bold' },
      event = 'VimResized',
    },
  }

  gls.right[4] = {
    FileTypeNameSpaces = {
      provider = function()
        return get_element_for_normal_ft_wc('   ')
      end,
      condition = is_buffer_not_empty,
      highlight = { 'NONE', gl_active.bg },
      event = 'VimResized',
    },
  }

  gls.right[5] = {
    FileEncode = {
      provider = function()
        return get_element_for_normal_ft_wc(fileinfo.get_file_encode())
      end,
      highlight = { gl_active.fg, gl_active.bg, 'bold' },
      event = 'VimResized',
    },
  }

  gls.right[6] = {
    FileEncodeSpaces = {
      provider = function()
        return get_element_for_normal_ft_wc('   ')
      end,
      highlight = { 'NONE', gl_active.bg },
      event = 'VimResized',
    },
  }

  gls.right[7] = {
    PerCent = {
      provider = function()
        return get_element_for_normal_ft(get_current_line_percent())
      end,
      highlight = { gl_active.fg, gl_active.bg, 'bold' },
    },
  }

  gls.short_line_left[1] = {
    InactiveLine = {
      provider = function()
        return ' '
      end,
      highlight = { 'NONE', gl_inactive.bg },
    },
  }

  gls.short_line_left[2] = {
    InactiveBufferType = {
      provider = function()
        return get_element_for_special_ft(buffer.get_buffer_filetype())
      end,
      condition = is_buffer_not_empty,
      highlight = { gl_inactive.fg, gl_inactive.bg, 'bold' },
    },
  }

  gls.short_line_left[3] = {
    InactiveFileIcon = {
      provider = function()
        return get_element_for_normal_ft(fileinfo.get_file_icon())
      end,
      condition = is_buffer_not_empty,
      highlight = { gl_inactive.fg, gl_inactive.bg },
    },
  }

  gls.short_line_left[4] = {
    InactiveFileName = {
      provider = function()
        return get_element_for_normal_ft(get_current_file_name())
      end,
      highlight = { gl_inactive.fg, gl_inactive.bg, 'bold' },
      event = 'VimResized',
    },
  }
end

return M
