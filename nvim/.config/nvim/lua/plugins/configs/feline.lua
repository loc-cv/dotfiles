local M = {}

M.setup = function()
  local ok, feline = pcall(require, 'feline')
  if not ok then
    return
  end

  local colors = {
    active = { fg = '#0a0a0a', bg = '#adadad', style = 'bold' },
    inactive = { fg = '#c0c0c0', bg = '#323232', style = 'bold' },
  }

  local special_filetypes = { 'packer', 'fugitive' }

  local conditions = {
    buffer_not_empty = function()
      if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
        return true
      end
      return false
    end,

    normal_filetypes = function()
      local current_ft = vim.bo.filetype
      for _, ft in ipairs(special_filetypes) do
        if current_ft == ft then
          return false
        end
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

    file_name = function()
      local filename = vim.api.nvim_buf_get_name(0)

      if filename ~= '' then
        local squeeze_width = vim.fn.winwidth(0) / 2
        if squeeze_width > 60 then
          filename = vim.fn.fnamemodify(filename, ':~:.')
        elseif squeeze_width > 40 then
          filename = vim.fn.pathshorten(vim.fn.fnamemodify(filename, ':~:.'))
        else
          filename = vim.fn.fnamemodify(filename, ':t')
        end
      else
        filename = ' Untitled'
      end

      if vim.bo.readonly == true then
        filename = filename .. ' '
      elseif vim.bo.modified then
        filename = filename .. '  '
      end

      local trail = vim.fn.search('\\s$', 'nw')
      if trail ~= 0 then
        filename = filename .. '  '
      end

      return filename
    end,
  }

  local render_component = function(component, opts)
    opts = opts or {}
    local sep = opts.sep
    local status = opts.status

    -- Default status: 'active'
    status = status or 'active'

    -- Default sep: { position = 'right', str = ' ' }
    sep = sep or {}
    sep.position = sep.position or 'right'
    sep.str = sep.str or ' '

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
    file_type = {
      provider = 'file_type',
      enabled = function()
        return not conditions.normal_filetypes()
      end,
    },
  }

  local nft_c = { -- normal filetype componets
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
    file_name = {
      provider = providers.file_name,
      -- update = { 'VimResized' },
      enabled = conditions.normal_filetypes,
    },
    diagnostic_errors = {
      provider = 'diagnostic_errors',
      icon = ' ',
      enabled = function()
        return require('feline.providers.lsp').diagnostics_exist() and conditions.normal_filetypes()
      end,
    },
    diagnostic_warnings = {
      provider = 'diagnostic_warnings',
      icon = ' ',
      enabled = function()
        return require('feline.providers.lsp').diagnostics_exist() and conditions.normal_filetypes()
      end,
    },
    diagnostic_hints = {
      provider = 'diagnostic_hints',
      icon = ' ',
      enabled = function()
        return require('feline.providers.lsp').diagnostics_exist() and conditions.normal_filetypes()
      end,
    },
    diagnostic_info = {
      provider = 'diagnostic_info',
      icon = ' ',
      enabled = function()
        return require('feline.providers.lsp').diagnostics_exist() and conditions.normal_filetypes()
      end,
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
    file_type = {
      provider = 'file_type',
      enabled = function()
        return conditions.buffer_not_empty() and conditions.hide_by_width() and conditions.normal_filetypes()
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

  local components = {
    active = {
      { -- left
        render_component(c_c.blank, { sep = { position = 'none' } }),
        render_component(sft_c.file_type),
        render_component(nft_c.git_branch, { sep = { str = '  ' } }),
        render_component(nft_c.file_icon),
        render_component(nft_c.file_name, { sep = { str = '  ' } }),
        render_component(nft_c.diagnostic_errors),
        render_component(nft_c.diagnostic_warnings),
        render_component(nft_c.diagnostic_hints),
        render_component(nft_c.diagnostic_info),
      },
      { -- right
        render_component(nft_c.git_diff_added, { sep = { position = 'left' } }),
        render_component(nft_c.git_diff_removed, { sep = { position = 'left' } }),
        render_component(nft_c.git_diff_changed, { sep = { position = 'left' } }),
        render_component(nft_c.file_encoding, { sep = { position = 'left', str = '  ' } }),
        render_component(nft_c.file_type, { sep = { position = 'left', str = '  ' } }),
        render_component(nft_c.position, { sep = { position = 'left', str = '  ' } }),
        render_component(nft_c.line_percentage, { sep = { position = 'left', str = '  ' } }),
        render_component(c_c.blank, { sep = { position = 'none' } }),
      },
    },
    inactive = {
      { -- left
        render_component(c_c.blank, { status = 'inactive', sep = { position = 'none' } }),
        render_component(sft_c.file_type, { status = 'inactive' }),
        render_component(nft_c.file_icon, { status = 'inactive' }),
        render_component(nft_c.file_name, { status = 'inactive' }),
      },
      {}, -- right
    },
  }

  feline.setup({
    force_inactive = {
      filetypes = {},
      buftypes = {},
    },
    components = components,
  })
end

return M
