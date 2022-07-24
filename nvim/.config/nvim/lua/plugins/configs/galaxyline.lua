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
  gl.short_line_list = { ' ' }

  local special_filetypes = {
    'packer',
    'vim-plug',
    'NvimTree',
    'CHADTree',
    'coc-explorer',
    'startuptime',
    'fugitive',
    'DiffviewFiles',
  }

  local colors = require('core.highlights').colors
  local gl_active = colors.GalaxylineActive
  local gl_inactive = colors.GalaxylineInactive

  -- Show current line percent of all lines
  local function get_line_percentage()
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
  local function buffer_not_empty()
    if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
      return true
    end
    return false
  end

  -- Get current file name dynamically
  local function get_file_name(readonly_icon)
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

    if not buffer_not_empty() then
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

  local function has_value(tab, val)
    for _, v in ipairs(tab) do
      if v == val then
        return true
      end
    end
    return false
  end

  -- Render normal filetype components
  local function render_nft_c(provider)
    if has_value(special_filetypes, vim.bo.filetype) then
      return ''
    end
    return provider
  end

  -- Render normal filetype components by width
  local function render_nft_c_by_width(provider)
    if has_value(special_filetypes, vim.bo.filetype) then
      return ''
    end
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 50 then
      return provider
    else
      return ''
    end
  end

  -- Render special filetype components
  local function render_sft_c(provider)
    if has_value(special_filetypes, vim.bo.filetype) then
      return provider
    end
    return ''
  end

  gls.left[1] = {
    c_blank_active = {
      provider = function()
        return ' '
      end,
      highlight = { 'NONE', gl_active.bg },
    },
  }

  gls.left[2] = {
    s_filetype_active = {
      provider = function()
        return render_sft_c(buffer.get_buffer_filetype())
      end,
      highlight = { gl_active.fg, gl_active.bg, 'bold' },
    },
  }

  gls.left[3] = {
    n_git_icon = {
      provider = function()
        return render_nft_c(' ')
        -- return get_element " "
      end,
      condition = condition.check_git_workspace,
      highlight = { gl_active.fg, gl_active.bg, 'bold' },
    },
  }

  gls.left[4] = {
    n_git_branch = {
      provider = function()
        return render_nft_c(vcs.get_git_branch())
      end,
      separator = '  ',
      separator_highlight = { 'NONE', gl_active.bg },
      condition = condition.check_git_workspace,
      highlight = { gl_active.fg, gl_active.bg, 'bold' },
    },
  }

  gls.left[5] = {
    n_file_icon_active = {
      provider = function()
        return render_nft_c(fileinfo.get_file_icon())
      end,
      condition = buffer_not_empty,
      highlight = { gl_active.fg, gl_active.bg },
    },
  }

  gls.left[6] = {
    n_file_name_active = {
      provider = function()
        return render_nft_c(get_file_name())
      end,
      highlight = { gl_active.fg, gl_active.bg, 'bold' },
      event = 'VimResized',
    },
  }

  gls.left[7] = {
    n_diag_errors = {
      provider = function()
        return render_nft_c(diagnostic.get_diagnostic_error())
      end,
      icon = '  ',
      highlight = { gl_active.fg, gl_active.bg, 'bold' },
    },
  }

  gls.left[8] = {
    n_diag_warns = {
      provider = function()
        return render_nft_c(diagnostic.get_diagnostic_warn())
      end,
      icon = '  ',
      highlight = { gl_active.fg, gl_active.bg, 'bold' },
    },
  }

  gls.left[9] = {
    n_diag_hints = {
      provider = function()
        return render_nft_c(diagnostic.get_diagnostic_hint())
      end,
      icon = '  ',
      highlight = { gl_active.fg, gl_active.bg, 'bold' },
    },
  }

  gls.left[10] = {
    n_diag_info = {
      provider = function()
        return render_nft_c(diagnostic.get_diagnostic_info())
      end,
      icon = '  ',
      highlight = { gl_active.fg, gl_active.bg, 'bold' },
    },
  }

  gls.right[1] = {
    n_position = {
      provider = function()
        return render_nft_c(fileinfo.line_column())
      end,
      highlight = { gl_active.fg, gl_active.bg, 'bold' },
    },
  }

  gls.right[2] = {
    n_position_right_sep = {
      provider = function()
        return render_nft_c('  ')
      end,
      highlight = { 'NONE', gl_active.bg },
    },
  }

  gls.right[3] = {
    n_filetype = {
      provider = function()
        return render_nft_c_by_width(buffer.get_buffer_filetype())
      end,
      condition = buffer_not_empty,
      highlight = { gl_active.fg, gl_active.bg, 'bold' },
      event = 'VimResized',
    },
  }

  gls.right[4] = {
    n_filetype_right_sep = {
      provider = function()
        return render_nft_c_by_width('   ')
      end,
      condition = buffer_not_empty,
      highlight = { 'NONE', gl_active.bg },
      event = 'VimResized',
    },
  }

  gls.right[5] = {
    n_file_encoding = {
      provider = function()
        return render_nft_c_by_width(fileinfo.get_file_encode())
      end,
      highlight = { gl_active.fg, gl_active.bg, 'bold' },
      event = 'VimResized',
    },
  }

  gls.right[6] = {
    n_file_encoding_right_sep = {
      provider = function()
        return render_nft_c_by_width('   ')
      end,
      highlight = { 'NONE', gl_active.bg },
      event = 'VimResized',
    },
  }

  gls.right[7] = {
    n_file_percentage = {
      provider = function()
        return render_nft_c(get_line_percentage())
      end,
      highlight = { gl_active.fg, gl_active.bg, 'bold' },
    },
  }

  gls.short_line_left[1] = {
    c_blank_inactive = {
      provider = function()
        return ' '
      end,
      highlight = { 'NONE', gl_inactive.bg },
    },
  }

  gls.short_line_left[2] = {
    s_filetype_inactive = {
      provider = function()
        return render_sft_c(buffer.get_buffer_filetype())
      end,
      condition = buffer_not_empty,
      highlight = { gl_inactive.fg, gl_inactive.bg, 'bold' },
    },
  }

  gls.short_line_left[3] = {
    n_file_icon_inactive = {
      provider = function()
        return render_nft_c(fileinfo.get_file_icon())
      end,
      condition = buffer_not_empty,
      highlight = { gl_inactive.fg, gl_inactive.bg },
    },
  }

  gls.short_line_left[4] = {
    n_file_name_inactive = {
      provider = function()
        return render_nft_c(get_file_name())
      end,
      highlight = { gl_inactive.fg, gl_inactive.bg, 'bold' },
      event = 'VimResized',
    },
  }
end

return M
