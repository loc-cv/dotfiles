local opt = vim.opt

local options = {
  -- General options
  clipboard = 'unnamed,unnamedplus', -- copy-paste between vim and everything else
  showmode = false, -- don't show things like -- INSERT -- anymore
  pumheight = 10, -- set popup menu height
  splitright = true, -- vertical splits will automatically be to the right
  splitbelow = true, -- horizontal splits will automatically be below
  updatetime = 200, -- faster completion
  termguicolors = true, -- enable true color
  scrolloff = 1, -- minimal number of lines above and below cursor
  fillchars = { eob = ' ' }, -- hide the tilde sign (~) on end of buffers
  conceallevel = 0, -- so that I can see `` in Markdown files
  number = true, -- enable number lines
  relativenumber = true, -- enable relative number lines
  signcolumn = 'yes', -- always show the signcolumn
  linebreak = true, -- prevent words from being split across two lines when line wraps
  cursorline = true, -- enable cursorline
  mouse = 'a', -- enable your mouse

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

  -- Timout options
  timeoutlen = 300, -- time in milliseconds to wait for a mapped sequence to complete
  ttimeoutlen = 0, -- fix delay <esc>
  timeout = false, -- no waiting for key combination
}

-- Don't give ins-completion-menu messages
opt.shortmess:append 'c'

for k, v in pairs(options) do
  opt[k] = v
end
