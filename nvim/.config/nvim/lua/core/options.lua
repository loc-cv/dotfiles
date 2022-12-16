local M = {}
local opt = vim.opt

local options = {
  -- General options
  clipboard = 'unnamed,unnamedplus', -- copy-paste between vim and everything else
  showmode = false, -- don't show things like -- INSERT -- anymore
  pumheight = 10, -- set popup menu height
  splitright = true, -- vertical splits will automatically be to the right
  splitbelow = true, -- horizontal splits will automatically be below
  updatetime = 50, -- long updatetime leads to poor user experience
  termguicolors = true, -- enable true color
  -- scrolloff = 1, -- minimal number of lines above and below cursor
  number = true, -- enable number lines
  relativenumber = true, -- enable relative number lines
  signcolumn = 'yes', -- always show the signcolumn
  wrap = true, -- enable lines wrapping
  linebreak = true, -- prevent words from being split across two lines when line wraps
  showbreak = '↳ ', -- string to put at the start of lines that have been wrapped
  breakindent = true, -- wrapped line will continue visually indented (same amount of space as the beginning of that line)
  cursorline = true, -- enable cursorline
  mouse = 'a', -- enable your mouse
  shortmess = opt.shortmess + { c = true }, -- don't give ins-completion-menu message
  fillchars = { eob = ' ', stl = ' ' }, -- disable `~` on nonexistent lines
  ttimeout = false, -- fix delay <ESC>
  timeout = false, -- no waiting for key combination
  sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal', -- some session options that I don't understand :)
  cpoptions = opt.cpoptions - { '_' }, -- make sense of 'cw'
  splitkeep = 'screen', -- keep the text on the same screen line when opening, closing or resizing horizontal splits

  -- Disable swapfiles & backup files
  backup = false, -- prevent making a backup before overwriting a file
  writebackup = false, -- prevent keeping the backup file while the file is being written
  swapfile = false, -- disable swapfiles

  -- Searching options
  hlsearch = false, -- disable highlight searches
  incsearch = true, -- show the next match as we type the search
  ignorecase = true, -- ignore case when searching ...
  smartcase = true, -- ... unless we type a capital

  -- Indent options
  expandtab = true, -- expand tabs to spaces
  autoindent = true, -- copy the indentation from the previous, when starting a new line
  smartindent = true, -- do smart autoindenting when starting a new line
  smarttab = true, -- <Tab> in front of a line inserts blanks according to 'shiftwidth'
  shiftround = true, -- round indent to multiple of 'shiftwidth'
  shiftwidth = 2, -- number of spaces to use for each step of (auto)indent
  tabstop = 2, -- number of spaces that a <Tab> counts for
  softtabstop = 2, -- number of spaces that a <Tab> counts for while performing editting eperations
}

M.init = function()
  -- Disable some builtin plugins
  vim.g.loaded_gzip = 1
  vim.g.loaded_zip = 1
  vim.g.loaded_zipPlugin = 1
  vim.g.loaded_tar = 1
  vim.g.loaded_tarPlugin = 1
  vim.g.loaded_getscript = 1
  vim.g.loaded_getscriptPlugin = 1
  vim.g.loaded_vimball = 1
  vim.g.loaded_vimballPlugin = 1
  vim.g.loaded_2html_plugin = 1
  vim.g.loaded_logiPat = 1
  vim.g.loaded_rrhelper = 1
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
  vim.g.loaded_netrwSettings = 1
  vim.g.loaded_netrwFileHandlers = 1

  -- colorscheme
  vim.g.colorscheme = 'vscode_dark'
  -- vim.g.colorscheme = 'vscode_light'
  -- vim.g.colorscheme = 'github_light'
  -- vim.g.colorscheme = 'kanagawa'

  -- Just making sure everything works as expected
  vim.cmd([[filetype plugin indent on]])

  -- Set options
  for k, v in pairs(options) do
    opt[k] = v
  end
end

return M
