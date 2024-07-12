return {
  {
    "freddiehaddad/feline.nvim",
    branch = "main",
    config = function()
      local feline = require("feline")

      local colors_statusline = {
        active = { fg = "#ffffff", bg = "#0a7aca", style = "NONE" },
        inactive = { fg = "#ffffff", bg = "#373737", style = "NONE" },
      }

      -- local colors_statusline = {
      --   active = { fg = "#eeeeee", bg = "#353535", style = "NONE" },
      --   inactive = { fg = "#353535", bg = "#CFCFCF", style = "NONE" },
      -- }

      local special_filetypes = {
        "packer",
        "vim-plug",
        "NvimTree",
        "CHADTree",
        "coc-explorer",
        "startuptime",
        "fugitive",
        "DiffviewFiles",
        "nnn",
        "floaterm",
        "coctree",
        "list",
        "Trouble",
        "toggleterm",
      }

      local get_coc_diagnostic = function(diag_type)
        local has_info, info = pcall(vim.api.nvim_buf_get_var, 0, "coc_diagnostic_info")
        if not has_info then
          return ""
        end
        if info[diag_type] > 0 then
          return tostring(info[diag_type])
        end
        return ""
      end

      -- Custom conditons
      local conditions = {
        buffer_not_empty = function()
          if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
            return true
          end
          return false
        end,

        filetype_normal = function()
          if vim.tbl_contains(special_filetypes, vim.bo.filetype) then
            return false
          end
          return true
        end,

        filetype_special = function()
          local filetype = vim.bo.filetype
          if vim.tbl_contains(special_filetypes, filetype) then
            if filetype ~= "list" then
              return true
            end
          end
          return false
        end,

        filetype_list = function()
          if vim.bo.filetype == "list" then
            return true
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

        using_session = function()
          return (vim.g.persisting ~= nil)
        end,
      }

      -- Custom providers
      local providers = {
        file_icon = function()
          local icon
          if vim.fn.exists("*WebDevIconsGetFileTypeSymbol") == 1 then
            icon = vim.fn.WebDevIconsGetFileTypeSymbol()
            return icon
          end
          local icons_ok, devicons = pcall(require, "nvim-web-devicons")
          if not icons_ok then
            print("No icon plugin found. Please install 'kyazdani42/nvim-web-devicons'")
            return ""
          end
          icon = devicons.get_icon(vim.fn.expand("%:t"), vim.fn.expand("%:e"))
          if icon == nil then
            icon = ""
          end
          return icon
        end,

        smart_file_name = function()
          local file_name = vim.api.nvim_buf_get_name(0)

          if file_name ~= "" then
            local squeeze_width = vim.fn.winwidth(0) / 2
            if squeeze_width > 60 then
              file_name = vim.fn.fnamemodify(file_name, ":~:.")
            elseif squeeze_width > 40 then
              file_name = vim.fn.pathshorten(vim.fn.fnamemodify(file_name, ":~:."))
            else
              file_name = vim.fn.fnamemodify(file_name, ":t")
            end
          else
            file_name = " Untitled"
          end

          if vim.bo.readonly == true then
            file_name = file_name .. " "
          end

          if vim.bo.modified then
            file_name = file_name .. "  "
          end

          local trail = vim.fn.search("\\s$", "nw")
          if trail ~= 0 then
            file_name = file_name .. "  "
          end

          return file_name
        end,

        coc_diagnostic = function(diag_type)
          if vim.fn.exists("*coc#rpc#start_server") == 1 then
            return get_coc_diagnostic(diag_type)
          end
          return ""
        end,

        coclist_status = function(segment)
          return vim.fn["coc#list#status"](segment)
        end,

        session = function()
          if vim.g.persisting then
            return " "
          elseif vim.g.persisting == false then
            return " "
          end
        end,
      }

      -- utils: render component
      local render_c = function(component, opts)
        opts = opts or {}
        local sep = opts.sep
        local status = opts.status

        -- Default status: 'active' ('active'|'inactive')
        status = status or "active"

        -- Default sep: { position = 'right' ('right'|'left'|'none'), str = ' ' }
        sep = sep or {}
        sep.position = sep.position or "right"
        sep.str = sep.str or " "

        local colors = colors_statusline

        if sep.position ~= "none" then
          sep = vim.tbl_extend("keep", sep, { hl = colors[status] })
          component = vim.tbl_extend("keep", component, {
            hl = colors[status],
            ---@diagnostic disable-next-line: need-check-nil
            [sep.position .. "_sep"] = sep,
          })
        else
          component = vim.tbl_extend("keep", component, { hl = colors[status] })
        end
        return component
      end

      local coclist_c = { -- coclist components
        mode = {
          provider = function()
            return providers.coclist_status("mode") .. " |"
          end,
          enabled = conditions.filetype_list,
        },
        title = {
          provider = "CocList",
          enabled = conditions.filetype_list,
        },
        loading = {
          provider = function()
            return providers.coclist_status("loading")
          end,
          enabled = conditions.filetype_list,
        },
        args = {
          provider = function()
            return providers.coclist_status("args")
          end,
          enabled = conditions.filetype_list,
        },
        total = {
          provider = function()
            local total_line = tostring(vim.fn.line("$"))
            return "(" .. total_line .. "/" .. tostring(providers.coclist_status("total")) .. ")"
          end,
          enabled = conditions.filetype_list,
        },
        path = {
          provider = function()
            return providers.coclist_status("cwd")
          end,
          enabled = conditions.filetype_list,
        },
      }

      local c_c = { -- common components
        blank = {
          provider = " ",
        },
      }

      local sft_c = { -- special filetype components
        filetype = {
          provider = "file_type",
          enabled = conditions.filetype_special,
        },
      }

      local nft_c = { -- normal filetype components
        git_branch = {
          provider = "git_branch",
          icon = "󰊢 ",
          enabled = function()
            return require("feline.providers.git").git_info_exists() and conditions.filetype_normal()
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
          provider = function()
            return providers.coc_diagnostic("error")
          end,
          icon = "E",
          enabled = conditions.filetype_normal,
        },
        diagnostic_warnings = {
          provider = function()
            return providers.coc_diagnostic("warning")
          end,
          icon = "W",
          enabled = conditions.filetype_normal,
        },
        diagnostic_hints = {
          provider = function()
            return providers.coc_diagnostic("hint")
          end,
          icon = "H",
          enabled = conditions.filetype_normal,
        },
        diagnostic_info = {
          provider = function()
            return providers.coc_diagnostic("information")
          end,
          icon = "I",
          enabled = conditions.filetype_normal,
        },
        lsp_client_names = {
          provider = "lsp_client_names",
          enabled = conditions.filetype_normal,
        },
        git_diff_added = {
          provider = "git_diff_added",
          icon = "+",
          enabled = function()
            return require("feline.providers.git").git_info_exists() and conditions.filetype_normal()
          end,
        },
        git_diff_removed = {
          provider = "git_diff_removed",
          icon = "-",
          enabled = function()
            return require("feline.providers.git").git_info_exists() and conditions.filetype_normal()
          end,
        },
        git_diff_changed = {
          provider = "git_diff_changed",
          icon = "~",
          enabled = function()
            return require("feline.providers.git").git_info_exists() and conditions.filetype_normal()
          end,
        },
        position = {
          provider = "position",
          enabled = conditions.filetype_normal,
        },
        filetype = {
          provider = "file_type",
          enabled = function()
            return conditions.hide_by_width() and conditions.filetype_normal()
          end,
        },
        file_encoding = {
          provider = "file_encoding",
          enabled = function()
            return conditions.hide_by_width() and conditions.filetype_normal()
          end,
        },
        line_percentage = {
          provider = "line_percentage",
          enabled = conditions.filetype_normal,
        },
        static_file_name = {
          provider = providers.static_file_name,
          enabled = conditions.filetype_normal,
        },
        session = {
          provider = providers.session,
          enabled = function()
            return conditions.using_session()
          end,
        },
      }

      local sl_components = { -- statusline components
        active = {
          { -- left
            render_c(c_c.blank, { sep = { position = "none" } }),
            render_c(coclist_c.mode),
            render_c(coclist_c.title),
            render_c(coclist_c.loading),
            render_c(coclist_c.args),
            render_c(coclist_c.total),
            render_c(sft_c.filetype),
            render_c(nft_c.file_icon),
            render_c(nft_c.smart_file_name, { sep = { str = "  " } }),
            render_c(nft_c.diagnostic_errors),
            render_c(nft_c.diagnostic_warnings),
            render_c(nft_c.diagnostic_hints),
            render_c(nft_c.diagnostic_info),
          },
          { -- right
            render_c(nft_c.git_branch, { sep = { position = "left" } }),
            render_c(nft_c.git_diff_added, { sep = { position = "left" } }),
            render_c(nft_c.git_diff_removed, { sep = { position = "left" } }),
            render_c(nft_c.git_diff_changed, { sep = { position = "left" } }),
            render_c(nft_c.filetype, { sep = { position = "left", str = "  " } }),
            render_c(nft_c.file_encoding, { sep = { position = "left", str = "  " } }),
            render_c(nft_c.position, { sep = { position = "left", str = "  " } }),
            render_c(nft_c.line_percentage, { sep = { position = "left", str = "  " } }),
            render_c(nft_c.session, { sep = { position = "left", str = "  " } }),
            render_c(coclist_c.path, { sep = { position = "left", str = "  " } }),
            render_c(c_c.blank, { sep = { position = "none" } }),
          },
        },
        inactive = {
          { -- left
            render_c(c_c.blank, { status = "inactive", sep = { position = "none" } }),
            render_c(coclist_c.mode, { status = "inactive" }),
            render_c(coclist_c.title, { status = "inactive" }),
            render_c(coclist_c.loading, { status = "inactive" }),
            render_c(coclist_c.args, { status = "inactive" }),
            render_c(coclist_c.total, { status = "inactive" }),
            render_c(sft_c.filetype, { status = "inactive" }),
            render_c(nft_c.file_icon, { status = "inactive" }),
            render_c(nft_c.smart_file_name, { status = "inactive", sep = { str = "  " } }),
            render_c(nft_c.diagnostic_errors, { status = "inactive" }),
            render_c(nft_c.diagnostic_warnings, { status = "inactive" }),
            render_c(nft_c.diagnostic_hints, { status = "inactive" }),
            render_c(nft_c.diagnostic_info, { status = "inactive" }),
          },
          { -- right
            render_c(coclist_c.path, { status = "inactive", sep = { position = "left", str = "  " } }),
            render_c(nft_c.git_branch, { status = "inactive", sep = { position = "left" } }),
            render_c(c_c.blank, { status = "inactive", sep = { position = "none" } }),
          },
        },
      }

      feline.setup({
        force_inactive = {
          filetypes = {},
          buftypes = {},
        },
        components = sl_components,
      })
    end,
  },
}
