local M = {}

local configs = {
  -- Packer
  packer = function()
    -- Auto compile/clean/install plugins with packer-nvim
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = "*/lua/plugins/init.lua",
      callback = function()
        vim.cmd [[source <afile> | PackerClean]]
        vim.cmd [[source <afile> | PackerInstall]]
        vim.cmd [[source <afile> | PackerCompile]]
      end,
    })
  end,

  -- Floaterm
  floaterm = function()
    -- Make floaterm window transparent
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "floaterm",
      command = "setlocal winblend=15",
    })
  end,

  -- CoC
  coc = function()
    local cocGrp = vim.api.nvim_create_augroup("CoCGrp", { clear = true })

    -- Setup formatexpr specified filetype(s)
    vim.api.nvim_create_autocmd("FileType", {
      group = cocGrp,
      pattern = { "typescript", "json" },
      command = "setl formatexpr=CocAction('formatSelected')",
    })

    -- Update signature help on jump placeholder
    vim.api.nvim_create_autocmd("User", {
      group = cocGrp,
      pattern = "CocJumpPlaceholder",
      command = "call CocActionAsync('showSignatureHelp')",
    })

    -- Auto close coc-explorer when exit Neovim
    -- vim.api.nvim_create_autocmd("BufEnter", {
    --   pattern = "*",
    --   command = "if (winnr('$') == 1 && &filetype == 'coc-explorer') | q | endif",
    -- })

    -- Highlight the symbol and its references when holding the cursor
    vim.api.nvim_create_autocmd("CursorHold", {
      pattern = "*",
      callback = function()
        vim.fn.CocActionAsync "highlight"
      end,
    })
  end,
}

M.init = function()
  -- Just making sure everything works as expected
  vim.cmd [[filetype plugin indent on]]

  -- No line numbers in terminals
  vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    command = "setlocal nonumber norelativenumber",
  })

  -- Disable auto comment insertion
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    command = "setlocal formatoptions-=cro",
  })

  -- Better cursorline
  local cursorGrp = vim.api.nvim_create_augroup("cursorGrp", { clear = true })

  vim.api.nvim_create_autocmd({ "WinLeave", "InsertEnter" }, {
    group = cursorGrp,
    pattern = "*",
    callback = function()
      local excluded_filetypes = { "coc-explorer", "DiffviewFiles" }
      for _, ft in ipairs(excluded_filetypes) do
        if vim.bo.filetype == ft then
          return
        end
      end
      vim.cmd [[set nocursorline]]
    end,
  })

  vim.api.nvim_create_autocmd({ "WinEnter", "InsertLeave" }, {
    group = cursorGrp,
    pattern = "*",
    command = "set cursorline",
  })

  -- Load plugins autocmds
  for _, config in pairs(configs) do
    config()
  end
end

return M
