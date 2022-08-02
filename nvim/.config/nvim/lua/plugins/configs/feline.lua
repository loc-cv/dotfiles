local M = {}

M.setup = function()
  local feline_ok, feline = pcall(require, 'feline')
  if not feline_ok then
    return
  end

  local colors_statusline = {
    active = { fg = '#0a0a0a', bg = '#adadad', style = 'bold' },
    inactive = { fg = '#c0c0c0', bg = '#323232', style = 'bold' },
  }

  local colors_winbar = {
    active = { fb = '#d4d4d4', bg = '#1e1e1e', style = 'bold' },
    inactive = { fb = '#d4d4d4', bg = '#1e1e1e', style = 'bold' },
  }

  local special_filetypes = {
    'packer',
    'vim-plug',
    'NvimTree',
    'CHADTree',
    'coc-explorer',
    'startuptime',
    'fugitive',
    'DiffviewFiles',
    'nnn',
    'floaterm',
  }

  local get_coc_diagnostic = function(diag_type)
    local has_info, info = pcall(vim.api.nvim_buf_get_var, 0, 'coc_diagnostic_info')
    if not has_info then
      return ''
    end
    if info[diag_type] > 0 then
      return tostring(info[diag_type])
    end
    return ''
  end

  -- Custom conditons
  local conditions = {
    buffer_not_empty = function()
      if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
        return true
      end
      return false
    end,

    normal_filetypes = function()
      if vim.tbl_contains(special_filetypes, vim.bo.filetype) then
        return false
      end
      return true
    end,

    hide_by_width = function()
      local squeeze_width = vim.fn.winwidth(0) / 2
      if squeeze_width > 50 then
        return true
      else
        return false
      end
    end,
  }

  -- Custom providers
  local providers = {
    file_icon = function()
      local icon
      if vim.fn.exists('*WebDevIconsGetFileTypeSymbol') == 1 then
        icon = vim.fn.WebDevIconsGetFileTypeSymbol()
        return icon
      end
      local icons_ok, devicons = pcall(require, 'nvim-web-devicons')
      if not icons_ok then
        print("No icon plugin found. Please install 'kyazdani42/nvim-web-devicons'")
        return ''
      end
      icon = devicons.get_icon(vim.fn.expand('%:t'), vim.fn.expand('%:e'))
      if icon == nil then
        icon = ''
      end
      return icon
    end,

    smart_file_name = function()
      local file_name = vim.api.nvim_buf_get_name(0)

      if file_name ~= '' then
        local squeeze_width = vim.fn.winwidth(0) / 2
        if squeeze_width > 60 then
          file_name = vim.fn.fnamemodify(file_name, ':~:.')
        elseif squeeze_width > 40 then
          file_name = vim.fn.pathshorten(vim.fn.fnamemodify(file_name, ':~:.'))
        else
          file_name = vim.fn.fnamemodify(file_name, ':t')
        end
      else
        file_name = ' Untitled'
      end

      if vim.bo.readonly == true then
        file_name = file_name .. ' '
      elseif vim.bo.modified then
        file_name = file_name .. '  '
      end

      local trail = vim.fn.search('\\s$', 'nw')
      if trail ~= 0 then
        file_name = file_name .. '  '
      end

      return file_name
    end,

    coc_diagnostic = function(diag_type)
      if vim.fn.exists('*coc#rpc#start_server') == 1 then
        return get_coc_diagnostic(diag_type)
      end
      return ''
    end,
  }

  -- utils: render component
  local render_c = function(component, opts)
    opts = opts or {}
    local type = opts.type
    local sep = opts.sep
    local status = opts.status

    -- Default type: 'statusline' ('statusline'|'winbar')
    type = type or 'statusline'

    -- Default status: 'active' ('active'|'inactive')
    status = status or 'active'

    -- Default sep: { position = 'right' ('right'|'left'|'none'), str = ' ' }
    sep = sep or {}
    sep.position = sep.position or 'right'
    sep.str = sep.str or ' '

    local colors
    if type == 'statusline' then
      colors = colors_statusline
    elseif type == 'winbar' then
      colors = colors_winbar
    end

    if sep.position ~= 'none' then
      sep = vim.tbl_extend('keep', sep, { hl = colors[status] })
      component = vim.tbl_extend('keep', component, {
        hl = colors[status],
        [sep.position .. '_sep'] = sep,
      })
    else
      component = vim.tbl_extend('keep', component, { hl = colors[status] })
    end
    return component
  end

  local c_c = { -- common components
    blank = {
      provider = ' ',
    },
  }

  local sft_c = { -- special filetype components
    filetype = {
      provider = 'file_type',
      enabled = function()
        return not conditions.normal_filetypes()
      end,
    },
  }

  local nft_c = { -- normal filetype components
    git_branch = {
      provider = 'git_branch',
      icon = ' ',
      enabled = function()
        return require('feline.providers.git').git_info_exists() and conditions.normal_filetypes()
      end,
    },
    file_icon = {
      provider = providers.file_icon,
      enabled = function()
        return conditions.buffer_not_empty() and conditions.normal_filetypes()
      end,
    },
    smart_file_name = {
      provider = providers.smart_file_name,
      -- update = { 'VimResized' },
      enabled = conditions.normal_filetypes,
    },
    diagnostic_errors = {
      provider = function()
        return providers.coc_diagnostic('error')
      end,
      icon = 'E',
      enabled = conditions.normal_filetypes,
    },
    diagnostic_warnings = {
      provider = function()
        return providers.coc_diagnostic('warning')
      end,
      icon = 'W',
      enabled = conditions.normal_filetypes,
    },
    diagnostic_hints = {
      provider = function()
        return providers.coc_diagnostic('hint')
      end,
      icon = 'H',
      enabled = conditions.normal_filetypes,
    },
    diagnostic_info = {
      provider = function()
        return providers.coc_diagnostic('information')
      end,
      icon = 'I',
      enabled = conditions.normal_filetypes,
    },
    git_diff_added = {
      provider = 'git_diff_added',
      icon = '+',
      enabled = function()
        return require('feline.providers.git').git_info_exists() and conditions.normal_filetypes()
      end,
    },
    git_diff_removed = {
      provider = 'git_diff_removed',
      icon = '-',
      enabled = function()
        return require('feline.providers.git').git_info_exists() and conditions.normal_filetypes()
      end,
    },
    git_diff_changed = {
      provider = 'git_diff_changed',
      icon = '~',
      enabled = function()
        return require('feline.providers.git').git_info_exists() and conditions.normal_filetypes()
      end,
    },
    position = {
      provider = 'position',
      enabled = conditions.normal_filetypes,
    },
    filetype = {
      provider = 'file_type',
      enabled = function()
        return conditions.hide_by_width() and conditions.normal_filetypes()
      end,
    },
    file_encoding = {
      provider = 'file_encoding',
      enabled = function()
        return conditions.hide_by_width() and conditions.normal_filetypes()
      end,
    },
    line_percentage = {
      provider = 'line_percentage',
      enabled = conditions.normal_filetypes,
    },
  }

  local sl_components = { -- statusline components
    active = {
      { -- left
        render_c(c_c.blank, { sep = { position = 'none' } }),
        render_c(sft_c.filetype),
        render_c(nft_c.git_branch, { sep = { str = '  ' } }),
        render_c(nft_c.file_icon),
        render_c(nft_c.smart_file_name, { sep = { str = '  ' } }),
        render_c(nft_c.diagnostic_errors),
        render_c(nft_c.diagnostic_warnings),
        render_c(nft_c.diagnostic_hints),
        render_c(nft_c.diagnostic_info),
      },
      { -- right
        render_c(nft_c.git_diff_added, { sep = { position = 'left' } }),
        render_c(nft_c.git_diff_removed, { sep = { position = 'left' } }),
        render_c(nft_c.git_diff_changed, { sep = { position = 'left' } }),
        render_c(nft_c.file_encoding, { sep = { position = 'left', str = '  ' } }),
        render_c(nft_c.filetype, { sep = { position = 'left', str = '  ' } }),
        render_c(nft_c.position, { sep = { position = 'left', str = '  ' } }),
        render_c(nft_c.line_percentage, { sep = { position = 'left', str = '  ' } }),
        render_c(c_c.blank, { sep = { position = 'none' } }),
      },
    },
    inactive = {
      { -- left
        render_c(c_c.blank, { status = 'inactive', sep = { position = 'none' } }),
        render_c(sft_c.filetype, { status = 'inactive' }),
        render_c(nft_c.file_icon, { status = 'inactive' }),
        render_c(nft_c.smart_file_name, { status = 'inactive' }),
      },
      {}, -- right
    },
  }

  feline.setup({
    force_inactive = {
      filetypes = {},
      buftypes = {},
    },
    components = sl_components,
  })
end

return M
