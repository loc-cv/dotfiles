local vscode_dark = require('colorschemes.vscode-dark')
local github_light = require('colorschemes.github-light')
local kanagawa = require('colorschemes.kanagawa')

-- Default colorscheme
local M = vscode_dark

local colorscheme = vim.g.colorscheme

if colorscheme == 'vscode_dark' then
  M = vscode_dark
elseif colorscheme == 'github_light' then
  M = github_light
elseif colorscheme == 'kanagawa' then
  M = kanagawa
end

M.setup()

return M
