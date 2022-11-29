local M = {}

M.setup = function()
  local cmp_ok, cmp = pcall(require, 'cmp')
  local luasnip_ok, luasnip = pcall(require, 'luasnip')
  local cmp_autopairs_ok, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
  if not (cmp and cmp_ok and luasnip_ok and cmp_autopairs_ok) then
    return
  end

  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

  local mapping = cmp.mapping
  local types = require('cmp.types')
  local kind_icons = require('lsp.icons').kind_icons

  cmp.setup({
    window = {
      documentation = {
        winhighlight = 'Normal:NormalFloat,FloatBorder:WinSeparator,CursorLine:Visual,Search:None',
        border = 'none',
      },
      completion = {
        winhighlight = 'Normal:NormalFloat,FloatBorder:WinSeparator,CursorLine:Visual,Search:None',
        border = 'none',
      },
    },

    preselect = cmp.PreselectMode.Item,

    formatting = {
      fields = { 'abbr', 'kind', 'menu' },
      format = function(entry, vim_item)
        -- Kind icons
        vim_item.kind = string.format(' %s%s ', kind_icons[vim_item.kind], vim_item.kind)

        -- Source
        vim_item.menu = ({
          buffer = '[Buffer]',
          path = '[Path]',
          nvim_lsp = '[LSP]',
          luasnip = '[LuaSnip]',
          nvim_lua = '[Lua]',
        })[entry.source.name]

        return vim_item
      end,
    },

    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },

    mapping = {
      ['<C-k>'] = mapping.select_prev_item(),
      ['<C-j>'] = mapping.select_next_item(),
      ['<C-y>'] = mapping.scroll_docs(-1),
      ['<C-e>'] = mapping.scroll_docs(1),
      ['<C-Space>'] = mapping.complete(),
      ['<C-q>'] = mapping.close(),
      ['<CR>'] = mapping.confirm({ select = true }),
      ['<Tab>'] = mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
    },

    sorting = {
      comparators = {
        cmp.config.compare.scopes,
        -- cmp.config.compare.kind,
        -- cmp.config.compare.offset,
        -- cmp.config.compare.exact,
        -- cmp.config.compare.score,
        -- cmp.config.compare.recently_used,
        -- cmp.config.compare.sort_text,
        -- cmp.config.compare.length,
        -- cmp.config.compare.order,
        -- cmp.config.compare.locality,
      },
    },

    sources = {
      { name = 'nvim_lsp' },
      { name = 'nvim_lua' },
      { name = 'path' },
      {
        name = 'buffer',
        option = {
          get_bufnrs = function()
            return vim.api.nvim_list_bufs()
          end,
        },
      },
      { name = 'luasnip' },
    },
  })
end

return M
