local M = {}
local opt = vim.opt

local options = {
  -- General options
  clipboard = 'unnamed,unnamedplus', -- copy-paste between vim and everything else
  showmode = false, -- don't show things like -- INSERT -- anymore
  pumheight = 10, -- set popup menu height
  splitright = true, -- vertical splits will automatically be to the right
  splitbelow = true, -- horizontal splits will automatically be below
  updatetime = 100, -- faster completion
  termguicolors = true, -- enable true color
  scrolloff = 1, -- minimal number of lines above and below cursor
  conceallevel = 0, -- so that I can see `` in Markdown files
  number = true, -- enable number lines
  relativenumber = true, -- enable relative number lines
  signcolumn = 'yes', -- always show the signcolumn
  linebreak = true, -- prevent words from being split across two lines when line wraps
  cursorline = true, -- enable cursorline
  mouse = 'a', -- enable your mouse
  shortmess = opt.shortmess + { c = true }, -- don't give ins-completion-menu message
  fillchars = { eob = ' ' }, -- disable `~` on nonexistent lines
  ttimeout = false, -- fix delay <es>
  timeout = false, -- no waiting for key combination

  -- Disable swapfiles & backup files
  backup = false, -- prevent making a backup before overwriting a file
  writebackup = false, -- prevent keeping the backup file while the file is being written
  swapfile = false, -- disable swapfiles

  -- Searching options
  incsearch = true, -- find the next match as we type the search
  hlsearch = true, -- highlight searches by default
  ignorecase = true, -- ignore case when searching...
  smartcase = true, -- ...unless we type a capital

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
  local g = vim.g
  g.loaded_2html_plugin = false
  g.loaded_getscript = false
  g.loaded_getscriptPlugin = false
  g.loaded_gzip = false
  g.loaded_logipat = false
  g.loaded_netrwFileHandlers = false
  g.loaded_netrw = false
  g.loaded_netrwPlugin = false
  g.loaded_netrwSettings = false
  g.loaded_remote_plugins = false
  g.loaded_tar = false
  g.loaded_tarPlugin = false
  g.loaded_zip = false
  g.loaded_gzip = false
  g.loaded_zipPlugin = false
  g.loaded_vimball = false
  g.loaded_vimballPlugin = false
  g.zipPlugin = false
  g.loaded_matchit = false
  g.loaded_matchparen = false
  g.loaded_rrhelper = false

  -- Set options
  for k, v in pairs(options) do
    opt[k] = v
  end
end

return M
