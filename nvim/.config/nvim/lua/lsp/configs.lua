local M = {}

M.setup = function()
  require('nvim-lsp-installer').setup({
    ensure_installed = {},
    automatic_installation = false,

    ui = {
      check_outdated_servers_on_open = true,
      border = 'single',

      icons = {
        server_installed = '✓',
        server_pending = '➜',
        server_uninstalled = '✗',
      },

      keymaps = {
        -- expand a server in the UI
        toggle_server_expand = '<CR>',

        -- install the server under the current cursor position
        install_server = 'i',

        -- reinstall/update the server under the current cursor position
        update_server = 'u',

        -- check for new version for the server under the current cursor position
        check_server_version = 'c',

        -- update all installed servers
        update_all_servers = 'U',

        -- check which installed servers are outdated
        check_outdated_servers = 'C',

        -- uninstall a server
        uninstall_server = 'X',
      },
    },
  })

  local lspconfig = require('lspconfig')

  lspconfig.sumneko_lua.setup({
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { 'vim' },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file('', true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  })

  lspconfig.tsserver.setup({})
  lspconfig.eslint.setup({})

  -- Add additional capabilities supported by nvim-cmp
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

  local luasnip = require('luasnip')
  local ok, cmp = pcall(require, 'cmp')
  if not ok then
    return
  end

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping(function(fallback)
        -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
        if cmp.visible() then
          local entry = cmp.get_selected_entry()
          if not entry then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          else
            cmp.confirm()
          end
        else
          fallback()
        end
      end, { 'i', 's', 'c' }),
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
    }),
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    },
  })
end

return M
