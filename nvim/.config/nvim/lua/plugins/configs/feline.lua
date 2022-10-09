local M = {}

M.setup = function()
  local feline_ok, feline = pcall(require, 'feline')
  if not feline_ok then
    return
  end

  local colors_statusline = {
    active = { fg = '#0a0a0a', bg = '#adadad', style = 'bold' },
    inactive = { fg = '#d4d4d4', bg = '#373737', style = 'bold' },
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
    'coctree',
    'list',
    'Trouble',
  }

  -- Custom conditons
  local conditions = {
    buffer_not_empty = function()
      if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
        return true
      end
      return false
    end,

    filetype_normal = function()
      if vim.tbl_contains(special_filetypes, vim.bo.filetype) or vim.bo.buftype ~= '' then
        return false
      end
      return true
    end,

    filetype_special = function()
      local filetype = vim.bo.filetype
      if vim.tbl_contains(special_filetypes, filetype) or vim.bo.buftype ~= '' then
        if filetype ~= 'list' then
          return true
        end
      end
      return false
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
      end

      if vim.bo.modified then
        file_name = file_name .. '  '
      end

      local trail = vim.fn.search('\\s$', 'nw')
      if trail ~= 0 then
        file_name = file_name .. '  '
      end

      return file_name
    end,

    static_file_name = function()
      local file_name = vim.api.nvim_buf_get_name(0)
      if file_name ~= '' then
        file_name = vim.fn.fnamemodify(file_name, ':t')
        return file_name
      end
      return ' Untitled'
    end,
  }

  -- utils: render component
  local render_c = function(component, opts)
    opts = opts or {}
    local sep = opts.sep
    local status = opts.status

    -- Default status: 'active' ('active'|'inactive')
    status = status or 'active'

    -- Default sep: { position = 'right' ('right'|'left'|'none'), str = ' ' }
    sep = sep or {}
    sep.position = sep.position or 'right'
    sep.str = sep.str or ' '

    local colors = colors_statusline

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
      enabled = conditions.filetype_special,
    },
  }

  local nft_c = { -- normal filetype components
    git_branch = {
      provider = 'git_branch',
      icon = ' ',
      enabled = function()
        return require('feline.providers.git').git_info_exists() and conditions.filetype_normal()
      end,
    },
    file_icon = {
      provider = providers.file_icon,
      enabled = function()
        return conditions.buffer_not_empty() and conditions.filetype_normal()
      end,
    },
    smart_file_name = {
      provider = providers.smart_file_name,
      -- update = { 'VimResized' },
      enabled = conditions.filetype_normal,
    },
    diagnostic_errors = {
      provider = 'diagnostic_errors',
      icon = 'E',
      enabled = function()
        return require('feline.providers.lsp').diagnostics_exist() and conditions.filetype_normal()
      end,
    },
    diagnostic_warnings = {
      provider = 'diagnostic_warnings',
      icon = 'W',
      enabled = function()
        return require('feline.providers.lsp').diagnostics_exist() and conditions.filetype_normal()
      end,
    },
    diagnostic_hints = {
      provider = 'diagnostic_hints',
      icon = 'H',
      enabled = function()
        return require('feline.providers.lsp').diagnostics_exist() and conditions.filetype_normal()
      end,
    },
    diagnostic_info = {
      provider = 'diagnostic_info',
      icon = 'I',
      enabled = function()
        return require('feline.providers.lsp').diagnostics_exist() and conditions.filetype_normal()
      end,
    },
    lsp_client_names = {
      provider = 'lsp_client_names',
      enabled = conditions.filetype_normal,
    },
    git_diff_added = {
      provider = 'git_diff_added',
      icon = '+',
      enabled = function()
        return require('feline.providers.git').git_info_exists() and conditions.filetype_normal()
      end,
    },
    git_diff_removed = {
      provider = 'git_diff_removed',
      icon = '-',
      enabled = function()
        return require('feline.providers.git').git_info_exists() and conditions.filetype_normal()
      end,
    },
    git_diff_changed = {
      provider = 'git_diff_changed',
      icon = '~',
      enabled = function()
        return require('feline.providers.git').git_info_exists() and conditions.filetype_normal()
      end,
    },
    position = {
      provider = 'position',
      enabled = conditions.filetype_normal,
    },
    filetype = {
      provider = 'file_type',
      enabled = function()
        return conditions.hide_by_width() and conditions.filetype_normal()
      end,
    },
    file_encoding = {
      provider = 'file_encoding',
      enabled = function()
        return conditions.hide_by_width() and conditions.filetype_normal()
      end,
    },
    line_percentage = {
      provider = 'line_percentage',
      enabled = conditions.filetype_normal,
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
        render_c(nft_c.filetype, { sep = { position = 'left', str = '  ' } }),
        render_c(nft_c.file_encoding, { sep = { position = 'left', str = '  ' } }),
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

  -- Custom winbar
  local navic_ok, navic = pcall(require, 'nvim-navic')
  if not navic_ok then
    return
  end
  vim.api.nvim_create_autocmd({ 'CursorHold', 'WinEnter', 'BufWinEnter' }, {
    pattern = '*',
    callback = function()
      if vim.bo.buftype == '' then -- if current buffer is normal buffer
        local navic_data = navic.get_data()
        if navic_data == nil or next(navic_data) == nil then
          local file_icon = providers.file_icon()
          local file_name = providers.static_file_name()
          if conditions.buffer_not_empty() then
            vim.opt_local.winbar = ' ' .. file_icon .. ' ' .. file_name
          else
            vim.opt_local.winbar = ''
          end
          return
        end
        vim.opt_local.winbar = " %{%v:lua.require'nvim-navic'.get_location()%}"
      else
        vim.opt_local.winbar = ''
      end
    end,
  })
end

return M
