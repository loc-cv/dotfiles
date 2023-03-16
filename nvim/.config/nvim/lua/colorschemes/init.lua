local vscode_dark = require('colorschemes.vscode-dark')
local github_light = require('colorschemes.github-light')

-- Default colorscheme
local M = vscode_dark

local colorscheme = vim.g.colorscheme

if colorscheme == 'vscode_dark' then
  M = vscode_dark
elseif colorscheme == 'github_light' then
  M = github_light
end

M.setup()

return M
