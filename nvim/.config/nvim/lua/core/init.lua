-- Disable some builtin plugins
local g = vim.g
g.loaded_2html_plugin = false
g.loaded_getscript = false
g.loaded_getscriptPlugin = false
g.loaded_gzip = false
g.loaded_logipat = false
g.loaded_netrwFileHandlers = false
g.loaded_netrwPlugin = false
g.loaded_netrwSettngs = false
g.loaded_remote_plugins = false
g.loaded_tar = false
g.loaded_tarPlugin = false
g.loaded_zip = false
g.loaded_zipPlugin = false
g.loaded_vimball = false
g.loaded_vimballPlugin = false
g.zipPlugin = false

require "core.options"
require "core.autocmds"
require "core.mappings"
require "core.user_cmds"
require "core.highlights"
