local opt = vim.opt

local options = {
  -- General options
  clipboard = 'unnamed,unnamedplus', -- Copy-paste between vim and everything else
  showmode = false, -- Don't show things like -- INSERT -- anymore
  pumheight = 10, -- Set popup menu height
  splitright = true, -- Vertical splits will automatically be to the right
  splitbelow = true, -- Horizontal splits will automatically be below
  updatetime = 200, -- Faster completion
  termguicolors = true, -- Enable true color
  scrolloff = 1, -- Minimal number of lines above and below cursor
  fillchars = { eob = ' ' }, -- Hide the tilde sign (~) on end of buffers
  conceallevel = 0, -- So that I can see `` in Markdown files
  number = true, -- Enable number lines
  relativenumber = true, -- Enable relative number lines
  signcolumn = 'yes', -- Always show the signcolumn
  linebreak = true, -- Prevent words from being split across two lines when line wraps
  cursorline = true, -- Enable cursorline
  mouse = 'a', -- Enable your mouse

  -- Disable swapfiles & backup files
  backup = false, -- Prevent making a backup before overwriting a file
  writebackup = false, -- Prevent keeping the backup file while the file is being written
  swapfile = false, -- Disable swapfiles

  -- Searching options
  incsearch = true, -- Find the next match as we type the search
  hlsearch = true, -- Highlight searches by default
  ignorecase = true, -- Ignore case when searching...
  smartcase = true, -- ...unless we type a capital

  -- Indent options
  expandtab = true, -- Expand tabs to spaces
  autoindent = true, -- Copy the indentation from the previous, when starting a new line
  smartindent = true, -- Do smart autoindenting when starting a new line
  smarttab = true, -- <Tab> in front of a line inserts blanks according to 'shiftwidth'
  shiftround = true, --Round indent to multiple of 'shiftwidth'
  shiftwidth = 2, -- Number of spaces to use for each step of (auto)indent
  tabstop = 2, -- Number of spaces that a <Tab> counts for
  softtabstop = 2, -- Number of spaces that a <Tab> counts for while performing editting eperations

  -- Timout options
  timeoutlen = 300, -- Time in milliseconds to wait for a mapped sequence to complete
  ttimeoutlen = 0, -- Fix delay <esc>
  timeout = false, -- No waiting for key combination
}

-- Don't give ins-completion-menu messages
opt.shortmess:append 'c'

for k, v in pairs(options) do
  opt[k] = v
end
