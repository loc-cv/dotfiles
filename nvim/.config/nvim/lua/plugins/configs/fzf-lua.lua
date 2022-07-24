local M = {}

M.setup = function()
  local ok, fzf_lua = pcall(require, 'fzf-lua')
  if not ok then
    return
  end

  fzf_lua.setup({
    winopts = {
      -- Only valid when using a float window
      -- (i.e. when 'split' is not defined, default)
      height = 0.90, -- window height
      width = 0.90, -- window width
      row = 0.20, -- window row position (0=top, 1=bottom)
      col = 0.50, -- window col position (0=left, 1=right)

      -- border argument passthrough to nvim_open_win(), also used
      -- to manually draw the border characters around the preview
      -- window, can be set to 'false' to remove all borders or to
      -- 'none', 'single', 'double', 'thicc' or 'rounded' (default)
      border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' },

      preview = {
        wrap = 'nowrap', -- wrap|nowrap
        vertical = 'up:55%', -- up|down:size
        horizontal = 'right:55%', -- right|left:size
        layout = 'vertical', -- horizontal|vertical|flex
        delay = 0, -- delay(ms) displaying the preview, prevents lag on fast scrolling
        scrollbar = 'float', -- float: in-window floating border

        -- builtin previewer window options
        winopts = {
          cursorline = false,
          signcolumn = 'yes',
        },
      },
    },

    keymap = {
      -- These override the default tables completely
      -- no need to set to `false` to disable a bind
      -- delete or modify is sufficient
      builtin = {
        -- neovim `:tmap` mappings for the fzf win
        ['<C-h>'] = 'toggle-help',
        ['<C-f>'] = 'toggle-fullscreen',

        -- Only valid with the 'builtin' previewer
        ['?'] = 'toggle-preview',
        ['/'] = 'toggle-preview-wrap',

        -- Rotate preview clockwise/counter-clockwise
        ['<C-n>'] = 'toggle-preview-cw',
        ['<C-p>'] = 'toggle-preview-ccw',

        ['<C-e>'] = 'preview-page-down',
        ['<C-y>'] = 'preview-page-up',
        ['<C-r>'] = 'preview-page-reset',
      },
    },

    previewers = {
      builtin = {
        -- preview extensions using a custom shell command:
        -- for example, use `viu` for image previews
        -- will do nothing if `viu` isn't executable
        extensions = {
          -- neovim terminal only supports `viu` block output
          ['jpg'] = { 'ueberzug' },
          ['jpeg'] = { 'ueberzug' },
          ['png'] = { 'ueberzug' },
          ['webp'] = { 'ueberzug' },
          ['webm'] = { 'ueberzug' },
          ['pdf'] = { 'ueberzug' },
          ['mp4'] = { 'ueberzug' },
        },

        -- if using `ueberzug` in the above extensions map
        -- set the default image scaler, possible scalers:
        --   false (none), "crop", "distort", "fit_contain", "contain", "forced_cover", "cover"
        -- https://github.com/seebye/ueberzug
        ueberzug_scaler = 'cover',
      },
    },

    -- Provider setups
    files = {
      prompt = 'Files❯ ',
      fd_opts = '--color=never --type f --hidden --follow --exclude .git --exclude node_modules',
    },

    helptags = {
      prompt = 'Help❯ ',
    },

    git = {
      files = {
        prompt = 'GitFiles❯ ',
      },

      status = {
        prompt = 'GitStatus❯ ',
      },

      commits = {
        prompt = 'Commits❯ ',
      },

      bcommits = {
        prompt = 'BCommits❯ ',
      },

      branches = {
        prompt = 'Branches❯ ',
      },

      stash = {
        prompt = 'Stash❯ ',
      },
    },

    grep = {
      prompt = 'Rg❯ ',
      input_prompt = 'Grep For❯ ',
      cmd = 'rg --column --line-number --no-heading --color=always --smart-case --hidden --with-filename --glob=!.git/ --trim',
    },

    args = {
      prompt = 'Args❯ ',
    },

    oldfiles = {
      prompt = 'History❯ ',
    },

    buffers = {
      prompt = 'Buffers❯ ',
    },

    tabs = {
      prompt = 'Tabs❯ ',
    },

    lines = {
      prompt = 'Lines❯ ',
    },

    blines = {
      prompt = 'BLines❯ ',
    },

    tags = {
      prompt = 'Tags❯ ',
    },

    btags = {
      prompt = 'BTags❯ ',
    },

    colorschemes = {
      prompt = 'Colorschemes❯ ',
    },

    lsp = {
      prompt_postfix = '❯ ', -- will be appended to the LSP label, to override use 'prompt' instead

      -- make lsp requests synchronous so they work with null-ls
      async_or_timeout = 3000,
    },

    diagnostics = {
      prompt = 'Diagnostics❯ ',
    },
  })
end

return M
