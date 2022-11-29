local M = {}

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    bufnr = bufnr,
    filter = function(client)
      return client.name == 'null-ls'
    end,
  })
end

local lspFormattingAuGroup = vim.api.nvim_create_augroup('LspFormatting', {})

M.setup = function()
  local ok, null_ls = pcall(require, 'null-ls')
  if not ok then
    return
  end

  null_ls.setup({
    on_attach = function(client, bufnr)
      if client.supports_method('textDocument/formatting') then
        vim.api.nvim_clear_autocmds({ group = lspFormattingAuGroup, buffer = bufnr })
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = lspFormattingAuGroup,
          buffer = bufnr,
          callback = function()
            lsp_formatting(bufnr)
          end,
        })
      end
    end,

    sources = {
      null_ls.builtins.formatting.stylua.with({
        extra_args = { '--config-path', vim.fn.expand('~/.config/nvim/stylua.toml') },
      }),

      null_ls.builtins.formatting.prettierd,
      null_ls.builtins.diagnostics.eslint_d,
      null_ls.builtins.code_actions.eslint_d,

      require('typescript.extensions.null-ls.code-actions'),
    },
  })
end

return M
