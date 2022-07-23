local M = {}

M.setup = function()
  local cmp_ok, cmp = pcall(require, 'cmp')
  local luasnip_ok, luasnip = pcall(require, 'luasnip')
  if not (cmp_ok and luasnip_ok) then
    return
  end

  local mapping = cmp.mapping

  local kind_icons = {
    Text = '  ',
    Method = '  ',
    Function = '  ',
    Constructor = '  ',
    Field = '  ',
    Variable = '  ',
    Class = '  ',
    Interface = '  ',
    Module = '  ',
    Property = '  ',
    Unit = '  ',
    Value = '  ',
    Enum = '  ',
    Keyword = '  ',
    Snippet = '  ',
    Color = '  ',
    File = '  ',
    Reference = '  ',
    Folder = '  ',
    EnumMember = '  ',
    Constant = '  ',
    Struct = '  ',
    Event = '  ',
    Operator = '  ',
    TypeParameter = '  ',
  }

  cmp.setup({
    window = {
      documentation = {
        winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:Visual,Search:None',
        border = 'single',
      },
      completion = {
        winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:Visual,Search:None',
        border = 'single',
      },
    },

    formatting = {
      fields = { 'kind', 'abbr', 'menu' },
      format = function(entry, vim_item)
        -- Kind icons
        vim_item.kind = string.format('%s%s ', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind

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

    sources = {
      { name = 'nvim_lsp' },
      { name = 'nvim_lsp_signature_help' },
      { name = 'nvim_lua' },
      { name = 'luasnip' },
      { name = 'buffer' },
      { name = 'path' },
    },
  })
end

return M
