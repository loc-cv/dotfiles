local M = {}

M.setup = function()
  local ok, gl = pcall(require, "galaxyline")
  if not ok then
    return
  end

  local diagnostic = require "galaxyline.providers.diagnostic"
  local vcs = require "galaxyline.providers.vcs"
  local fileinfo = require "galaxyline.providers.fileinfo"
  local buffer = require "galaxyline.providers.buffer"
  local condition = require "galaxyline.condition"

  local gls = gl.section
  local colors = require "core.highlights"

  local bg = colors.GalaxylineBG
  local active_fg = colors.GalaxylineActiveFG
  local inactive_fg = colors.GalaxylineInactiveFG

  gl.short_line_list = { " " }

  -- Show current line percent of all lines
  local function get_current_line_percent()
    local current_line = vim.fn.line "."
    local total_line = vim.fn.line "$"
    local result, _ = math.modf((current_line / total_line) * 100)
    return " " .. result .. "% "
  end

  -- Render read-only file icon
  local function get_file_readonly_icon(readonly_icon)
    if vim.bo.filetype == "help" then
      return ""
    end
    local icon = readonly_icon or ""
    if vim.bo.readonly == true then
      return " " .. icon .. " "
    end
    return ""
  end

  -- Get current file name dynamically
  local function get_current_file_name(readonly_icon)
    local filename
    local squeeze_width = vim.fn.winwidth(0) / 2

    if squeeze_width > 60 then
      filename = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.")
    elseif squeeze_width > 40 then
      filename = vim.fn.pathshorten(vim.fn.fnamemodify(vim.fn.expand "%", ":~:."))
    else
      filename = vim.fn.expand "%:t"
    end

    if vim.fn.empty(vim.fn.expand "%:t") == 1 then
      filename = "Untitled"
    end

    if string.len(get_file_readonly_icon(readonly_icon)) ~= 0 then
      return filename .. get_file_readonly_icon(readonly_icon)
    end

    if vim.bo.modifiable then
      if vim.bo.modified then
        local trail = vim.fn.search("\\s$", "nw")
        if trail ~= 0 then
          return filename .. " " .. " " .. " " .. " " .. "  "
        else
          return filename .. " " .. " " .. "  "
        end
      end
    end

    return filename .. "  "
  end

  -- Simple check for empty buffers
  local function is_buffer_not_empty()
    if vim.fn.empty(vim.fn.expand "%:t") ~= 1 then
      return true
    end
    return false
  end

  local special_file_types = {
    "fugitive",
    "packer",
    "vim-plug",
    "NvimTree",
    "CHADTree",
    "coc-explorer",
  }

  local function has_value(tab, val)
    for _, value in ipairs(tab) do
      if value == val then
        return true
      end
    end
    return false
  end

  local function get_element(provider)
    if has_value(special_file_types, vim.bo.filetype) then
      return ""
    end
    return provider
  end

  local function get_element_with_condition(provider)
    if has_value(special_file_types, vim.bo.filetype) then
      return ""
    end
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 50 then
      return provider
    else
      return ""
    end
  end

  gls.left[1] = {
    ActiveLine = {
      provider = function()
        return " "
      end,
      highlight = { "NONE", bg },
    },
  }

  gls.left[2] = {
    SpecialFileTypeBuffer = {
      provider = function()
        if has_value(special_file_types, vim.bo.filetype) then
          return buffer.get_buffer_filetype()
        end
        return ""
      end,
      highlight = { active_fg, bg, "bold" },
    },
  }

  gls.left[3] = {
    GitIcon = {
      provider = function()
        return get_element " "
      end,
      condition = condition.check_git_workspace,
      highlight = { active_fg, bg, "bold" },
    },
  }

  gls.left[4] = {
    GitBranch = {
      provider = function()
        return get_element(vcs.get_git_branch())
      end,
      separator = "  ",
      separator_highlight = { "NONE", bg },
      condition = condition.check_git_workspace,
      highlight = { active_fg, bg, "bold" },
    },
  }

  gls.left[5] = {
    FileIcon = {
      provider = function()
        return get_element(fileinfo.get_file_icon())
      end,
      condition = is_buffer_not_empty,
      highlight = { active_fg, bg },
    },
  }

  gls.left[6] = {
    FileName = {
      provider = function()
        return get_element(get_current_file_name())
      end,
      highlight = { active_fg, bg, "bold" },
      event = "VimResized",
    },
  }

  gls.left[7] = {
    DiagnosticError = {
      provider = function()
        return get_element(diagnostic.get_diagnostic_error())
      end,
      icon = "  ",
      highlight = { active_fg, bg, "bold" },
    },
  }

  gls.left[8] = {
    DiagnosticWarn = {
      provider = function()
        return get_element(diagnostic.get_diagnostic_warn())
      end,
      icon = "  ",
      highlight = { active_fg, bg, "bold" },
    },
  }

  gls.left[9] = {
    DiagnosticHint = {
      provider = function()
        return get_element(diagnostic.get_diagnostic_hint())
      end,
      icon = "  ",
      highlight = { active_fg, bg, "bold" },
    },
  }

  gls.left[10] = {
    DiagnosticInfo = {
      provider = function()
        return get_element(diagnostic.get_diagnostic_info())
      end,
      icon = "  ",
      highlight = { active_fg, bg, "bold" },
    },
  }

  -- gls.right[1] = {
  --   DiffAdd = {
  --     provider = function() return get_element_with_condition(vcs.diff_add()) end,
  --     icon = ' ',
  --     highlight = { active_fg, bg, 'bold' },
  --     event = 'VimResized'
  --   }
  -- }
  --
  -- gls.right[2] = {
  --   DiffModified = {
  --     provider = function() return get_element_with_condition(vcs.diff_modified()) end,
  --     icon = '柳',
  --     highlight = { active_fg, bg, 'bold' },
  --     event = 'VimResized'
  --   }
  -- }
  --
  -- gls.right[3] = {
  --   DiffRemove = {
  --     provider = function() return get_element_with_condition(vcs.diff_remove()) end,
  --     icon = ' ',
  --     highlight = { active_fg, bg, 'bold' },
  --     event = 'VimResized'
  --   }
  -- }
  --
  -- gls.right[4] = {
  --   GitSpaces = {
  --     provider = function() return get_element_with_condition('  ') end,
  --     highlight = { 'NONE', bg },
  --     event = 'VimResized'
  --   }
  -- }

  gls.right[5] = {
    FileTypeName = {
      provider = function()
        return get_element_with_condition(buffer.get_buffer_filetype())
      end,
      condition = is_buffer_not_empty,
      highlight = { active_fg, bg, "bold" },
      event = "VimResized",
    },
  }

  gls.right[6] = {
    FileTypeNameSpaces = {
      provider = function()
        return get_element_with_condition "   "
      end,
      condition = is_buffer_not_empty,
      highlight = { "NONE", bg },
      event = "VimResized",
    },
  }

  gls.right[7] = {
    FileEncode = {
      provider = function()
        return get_element_with_condition(fileinfo.get_file_encode())
      end,
      highlight = { active_fg, bg, "bold" },
      event = "VimResized",
    },
  }

  gls.right[8] = {
    FileEncodeSpaces = {
      provider = function()
        return get_element_with_condition "   "
      end,
      highlight = { "NONE", bg },
      event = "VimResized",
    },
  }

  gls.right[9] = {
    PerCent = {
      provider = function()
        return get_element(get_current_line_percent())
      end,
      highlight = { active_fg, bg, "bold" },
    },
  }

  gls.short_line_left[1] = {
    InactiveLine = {
      provider = function()
        return " "
      end,
      highlight = { "NONE", bg },
    },
  }

  gls.short_line_left[2] = {
    InactiveBufferType = {
      provider = function()
        return buffer.get_buffer_filetype()
      end,
      condition = is_buffer_not_empty,
      separator = " ",
      separator_highlight = { "NONE", bg },
      highlight = { inactive_fg, bg, "bold" },
    },
  }

  gls.short_line_left[3] = {
    InactiveFileName = {
      provider = function()
        if has_value(special_file_types, vim.bo.filetype) then
          return ""
        end
        return get_current_file_name()
      end,
      highlight = { inactive_fg, bg, "bold" },
      event = "VimResized",
    },
  }
end

return M
