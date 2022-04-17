-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/colcv/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/colcv/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/colcv/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/colcv/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/colcv/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\2ß\3\0\1\a\0\18\00006\1\0\0'\2\1\0B\1\2\2+\2\0\0009\3\2\0009\4\2\0019\4\3\4\5\3\4\0X\3\aÄ6\3\0\0'\4\4\0B\3\2\0029\3\5\3B\3\1\2\18\2\3\0X\3\16Ä9\3\6\0009\4\6\0019\4\a\4\4\3\4\0X\3\5Ä9\3\6\0009\4\6\0019\4\b\4\5\3\4\0X\3\6Ä6\3\0\0'\4\4\0B\3\2\0029\3\t\3B\3\1\2\18\2\3\0006\3\0\0'\4\n\0B\3\2\0029\3\v\0035\4\14\0009\5\2\0009\6\2\0019\6\f\6\5\5\6\0X\5\2Ä'\5\r\0X\6\1Ä'\5\15\0=\5\16\4=\2\17\4D\3\2\0\rlocation\bkey\16__multiline\1\0\0\14__default\tline\28calculate_commentstring&ts_context_commentstring.internal\30get_visual_start_location\6V\6v\fcmotion\24get_cursor_location#ts_context_commentstring.utils\nblock\nctype\18Comment.utils\frequireh\1\0\5\0\a\0\0146\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0\6Ä9\2\3\0015\3\5\0003\4\4\0=\4\6\3B\2\2\1K\0\1\0K\0\1\0\rpre_hook\1\0\0\0\nsetup\fComment\frequire\npcall\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["close-buffers.nvim"] = {
    config = { "\27LJ\2\2‘\1\0\0\5\0\n\0\0196\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\3\4\0004\4\0\0=\4\5\0034\4\0\0=\4\6\0034\4\0\0=\4\a\0035\4\b\0=\4\t\3B\2\2\1K\0\1\0\27preserve_window_layout\1\3\0\0\tthis\rnameless\22file_regex_ignore\21file_glob_ignore\20filetype_ignore\1\0\0\nsetup\18close_buffers\frequire\npcall\0" },
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/close-buffers.nvim",
    url = "https://github.com/kazhala/close-buffers.nvim"
  },
  ["coc-fzf"] = {
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/coc-fzf",
    url = "https://github.com/antoinemadec/coc-fzf"
  },
  ["coc.nvim"] = {
    config = { "\27LJ\2\2´\2\0\0\3\0\n\0\0156\0\0\0009\0\1\0005\1\4\0005\2\3\0=\2\5\1=\1\2\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0005\1\t\0=\1\b\0K\0\1\0\1\v\0\0\rcoc-html\fcoc-css\14coc-emmet\17coc-tsserver\rcoc-json\17coc-prettier\15coc-eslint\17coc-snippets\17coc-explorer\20coc-sumneko-lua\26coc_global_extensions\14right:50%\20coc_fzf_preview\vwindow\1\0\0\1\0\2\nwidth\4Õô≥Ê\fÃô≥ˇ\3\vheight\4ö≥ÊÃ\tô≥¶ˇ\3\15fzf_layout\6g\bvim\0" },
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["filetype.nvim"] = {
    config = { "\27LJ\2\0024\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\23did_load_filetypes\6g\bvim\0" },
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  fzf = {
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\2x\0\0\a\0\t\1\0206\0\0\0009\0\1\0009\0\2\0'\1\3\0B\0\2\0026\1\0\0009\1\1\0019\1\2\1'\2\4\0B\1\2\0026\2\5\0009\2\6\2#\3\1\0\24\3\0\3B\2\2\3'\4\a\0\18\5\2\0'\6\b\0&\4\6\4L\4\2\0\a% \6 \tmodf\tmath\6$\6.\tline\afn\bvim»\1Ñ\1\0\1\5\0\b\0\0226\1\0\0009\1\1\0019\1\2\1\a\1\3\0X\1\2Ä'\1\4\0L\1\2\0\f\1\0\0X\1\1Ä'\1\5\0006\2\0\0009\2\1\0029\2\6\2\v\2\2\0X\2\5Ä'\2\a\0\18\3\1\0'\4\a\0&\2\4\2L\2\2\0'\2\4\0L\2\2\0\6 \rreadonly\bÓÇ¢\5\thelp\rfiletype\abo\bvimÃ\4\0\1\n\1\23\3n+\1\0\0006\2\0\0009\2\1\0029\2\2\2)\3\0\0B\2\2\2\25\2\0\2)\3<\0\1\3\2\0X\3\fÄ6\3\0\0009\3\1\0039\3\3\0036\4\0\0009\4\1\0049\4\4\4'\5\5\0B\4\2\2'\5\6\0B\3\3\2\18\1\3\0X\3\25Ä)\3(\0\1\3\2\0X\3\16Ä6\3\0\0009\3\1\0039\3\a\0036\4\0\0009\4\1\0049\4\3\0046\5\0\0009\5\1\0059\5\4\5'\6\5\0B\5\2\2'\6\6\0B\4\3\0A\3\0\2\18\1\3\0X\3\6Ä6\3\0\0009\3\1\0039\3\4\3'\4\b\0B\3\2\2\18\1\3\0006\3\0\0009\3\1\0039\3\t\0036\4\0\0009\4\1\0049\4\4\4'\5\b\0B\4\2\0A\3\0\2\t\3\1\0X\3\1Ä'\1\n\0006\3\v\0009\3\f\3-\4\0\0\18\5\0\0B\4\2\0A\3\0\2\b\3\2\0X\3\6Ä\18\3\1\0-\4\0\0\18\5\0\0B\4\2\2&\3\4\3L\3\2\0006\3\0\0009\3\r\0039\3\14\3\15\0\3\0X\4\28Ä6\3\0\0009\3\r\0039\3\15\3\15\0\3\0X\4\23Ä6\3\0\0009\3\1\0039\3\16\3'\4\17\0'\5\18\0B\3\3\2\b\3\2\0X\4\tÄ\18\4\1\0'\5\19\0'\6\20\0'\a\19\0'\b\21\0'\t\22\0&\4\t\4L\4\2\0X\4\6Ä\18\4\1\0'\5\19\0'\6\20\0'\a\22\0&\4\a\4L\4\2\0\18\3\1\0'\4\22\0&\3\4\3L\3\2\0\r¿\a  \tÔÄ∂ \tÔÅÄ \6 \anw\b\\s$\vsearch\rmodified\15modifiable\abo\blen\vstring\rUntitled\nempty\b%:t\16pathshorten\t:~:.\6%\vexpand\16fnamemodify\rwinwidth\afn\bvim\4\2\0\\\0\0\3\0\5\1\0156\0\0\0009\0\1\0009\0\2\0006\1\0\0009\1\1\0019\1\3\1'\2\4\0B\1\2\0A\0\0\2\b\0\0\0X\0\2Ä+\0\2\0L\0\2\0+\0\1\0L\0\2\0\b%:t\vexpand\nempty\afn\bvim\2>\0\2\b\0\1\0\f6\2\0\0\18\3\0\0B\2\2\4X\5\4Ä\5\6\1\0X\a\2Ä+\a\2\0L\a\2\0E\5\3\3R\5˙+\2\1\0L\2\2\0\vipairsH\0\1\4\2\4\0\v-\1\0\0-\2\1\0006\3\0\0009\3\1\0039\3\2\3B\1\3\2\15\0\1\0X\2\2Ä'\1\3\0L\1\2\0L\0\2\0\17¿\16¿\5\rfiletype\abo\bvimâ\1\0\1\4\2\6\1\24-\1\0\0-\2\1\0006\3\0\0009\3\1\0039\3\2\3B\1\3\2\15\0\1\0X\2\2Ä'\1\3\0L\1\2\0006\1\0\0009\1\4\0019\1\5\1)\2\0\0B\1\2\2\25\1\0\1)\0022\0\1\2\1\0X\2\2ÄL\0\2\0X\2\2Ä'\2\3\0L\2\2\0K\0\1\0\17¿\16¿\rwinwidth\afn\5\rfiletype\abo\bvim\4\17\0\0\1\0\1\0\2'\0\0\0L\0\2\0\6 f\0\0\3\3\5\0\r-\0\0\0-\1\1\0006\2\0\0009\2\1\0029\2\2\2B\0\3\2\15\0\0\0X\1\3Ä-\0\2\0009\0\3\0D\0\1\0'\0\4\0L\0\2\0\17¿\16¿\5¿\5\24get_buffer_filetype\rfiletype\abo\bvim\26\0\0\2\1\1\0\3-\0\0\0'\1\0\0D\0\2\0\18¿\tÔû° .\0\0\2\2\1\0\5-\0\0\0-\1\1\0009\1\0\1B\1\1\0C\0\0\0\18¿\3¿\19get_git_branch-\0\0\2\2\1\0\5-\0\0\0-\1\1\0009\1\0\1B\1\1\0C\0\0\0\18¿\4¿\18get_file_icon\27\0\0\2\2\0\0\4-\0\0\0-\1\1\0B\1\1\0C\0\0\0\18¿\14¿4\0\0\2\2\1\0\5-\0\0\0-\1\1\0009\1\0\1B\1\1\0C\0\0\0\18¿\2¿\25get_diagnostic_error3\0\0\2\2\1\0\5-\0\0\0-\1\1\0009\1\0\1B\1\1\0C\0\0\0\18¿\2¿\24get_diagnostic_warn3\0\0\2\2\1\0\5-\0\0\0-\1\1\0009\1\0\1B\1\1\0C\0\0\0\18¿\2¿\24get_diagnostic_hint3\0\0\2\2\1\0\5-\0\0\0-\1\1\0009\1\0\1B\1\1\0C\0\0\0\18¿\2¿\24get_diagnostic_info3\0\0\2\2\1\0\5-\0\0\0-\1\1\0009\1\0\1B\1\1\0C\0\0\0\19¿\5¿\24get_buffer_filetype\25\0\0\2\1\1\0\3-\0\0\0'\1\0\0D\0\2\0\19¿\b   /\0\0\2\2\1\0\5-\0\0\0-\1\1\0009\1\0\1B\1\1\0C\0\0\0\19¿\4¿\20get_file_encode\25\0\0\2\1\1\0\3-\0\0\0'\1\0\0D\0\2\0\19¿\b   \27\0\0\2\2\0\0\4-\0\0\0-\1\1\0B\1\1\0C\0\0\0\18¿\f¿\17\0\0\1\0\1\0\2'\0\0\0L\0\2\0\6 )\0\0\1\1\1\0\3-\0\0\0009\0\0\0D\0\1\0\5¿\24get_buffer_filetypeN\0\0\3\3\4\0\f-\0\0\0-\1\1\0006\2\0\0009\2\1\0029\2\2\2B\0\3\2\15\0\0\0X\1\2Ä'\0\3\0L\0\2\0-\0\2\0D\0\1\0\17¿\16¿\14¿\5\rfiletype\abo\bvim¸\16\1\0\24\0z\0˙\0016\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0ÚÄ6\2\1\0'\3\3\0B\2\2\0026\3\1\0'\4\4\0B\3\2\0026\4\1\0'\5\5\0B\4\2\0026\5\1\0'\6\6\0B\5\2\0026\6\1\0'\a\a\0B\6\2\0029\a\b\0016\b\1\0'\t\t\0B\b\2\0029\t\n\b9\n\v\b9\v\f\b5\f\14\0=\f\r\0013\f\15\0003\r\16\0003\14\17\0003\15\18\0005\16\19\0003\17\20\0003\18\21\0003\19\22\0009\20\23\a5\21\29\0005\22\25\0003\23\24\0=\23\26\0225\23\27\0>\t\2\23=\23\28\22=\22\30\21>\21\1\0209\20\23\a5\21\"\0005\22 \0003\23\31\0=\23\26\0225\23!\0>\n\1\23>\t\2\23=\23\28\22=\22#\21>\21\2\0209\20\23\a5\21)\0005\22%\0003\23$\0=\23\26\0229\23&\6=\23'\0225\23(\0>\n\1\23>\t\2\23=\23\28\22=\22*\21>\21\3\0209\20\23\a5\0210\0005\22,\0003\23+\0=\23\26\0225\23-\0>\t\2\23=\23.\0229\23&\6=\23'\0225\23/\0>\n\1\23>\t\2\23=\23\28\22=\0221\21>\21\4\0209\20\23\a5\0214\0005\0223\0003\0232\0=\23\26\22=\15'\0224\23\3\0>\n\1\23>\t\2\23=\23\28\22=\0225\21>\21\5\0209\20\23\a5\0219\0005\0227\0003\0236\0=\23\26\0225\0238\0>\n\1\23>\t\2\23=\23\28\22=\22:\21>\21\6\0209\20\23\a5\21>\0005\22<\0003\23;\0=\23\26\0225\23=\0>\n\1\23>\t\2\23=\23\28\22=\22?\21>\21\a\0209\20\23\a5\21C\0005\22A\0003\23@\0=\23\26\0225\23B\0>\n\1\23>\t\2\23=\23\28\22=\22D\21>\21\b\0209\20\23\a5\21H\0005\22F\0003\23E\0=\23\26\0225\23G\0>\n\1\23>\t\2\23=\23\28\22=\22I\21>\21\t\0209\20\23\a5\21M\0005\22K\0003\23J\0=\23\26\0225\23L\0>\n\1\23>\t\2\23=\23\28\22=\22N\21>\21\n\0209\20O\a5\21S\0005\22Q\0003\23P\0=\23\26\22=\15'\0225\23R\0>\n\1\23>\t\2\23=\23\28\22=\22T\21>\21\5\0209\20O\a5\21X\0005\22V\0003\23U\0=\23\26\22=\15'\0225\23W\0>\t\2\23=\23\28\22=\22Y\21>\21\6\0209\20O\a5\21]\0005\22[\0003\23Z\0=\23\26\0225\23\\\0>\n\1\23>\t\2\23=\23\28\22=\22^\21>\21\a\0209\20O\a5\21b\0005\22`\0003\23_\0=\23\26\0225\23a\0>\t\2\23=\23\28\22=\22c\21>\21\b\0209\20O\a5\21g\0005\22e\0003\23d\0=\23\26\0225\23f\0>\n\1\23>\t\2\23=\23\28\22=\22h\21>\21\t\0209\20i\a5\21m\0005\22k\0003\23j\0=\23\26\0225\23l\0>\t\2\23=\23\28\22=\22n\21>\21\1\0209\20i\a5\21s\0005\22p\0003\23o\0=\23\26\22=\15'\0225\23q\0>\t\2\23=\23.\0225\23r\0>\v\1\23>\t\2\23=\23\28\22=\22t\21>\21\2\0209\20i\a5\21x\0005\22v\0003\23u\0=\23\26\0225\23w\0>\v\1\23>\t\2\23=\23\28\22=\22y\21>\21\3\0202\0\0ÄK\0\1\0K\0\1\0\21InactiveFileName\1\0\0\1\4\0\0\0\0\tbold\1\0\1\nevent\15VimResized\0\23InactiveBufferType\1\0\0\1\4\0\0\0\0\tbold\1\2\0\0\tNONE\1\0\1\14separator\6 \0\17InactiveLine\1\0\0\1\2\0\0\tNONE\1\0\0\0\20short_line_left\fPerCent\1\0\0\1\4\0\0\0\0\tbold\1\0\0\0\21FileEncodeSpaces\1\0\0\1\2\0\0\tNONE\1\0\1\nevent\15VimResized\0\15FileEncode\1\0\0\1\4\0\0\0\0\tbold\1\0\1\nevent\15VimResized\0\23FileTypeNameSpaces\1\0\0\1\2\0\0\tNONE\1\0\1\nevent\15VimResized\0\17FileTypeName\1\0\0\1\4\0\0\0\0\tbold\1\0\1\nevent\15VimResized\0\nright\19DiagnosticInfo\1\0\0\1\4\0\0\0\0\tbold\1\0\1\ticon\n ÔÅö \0\19DiagnosticHint\1\0\0\1\4\0\0\0\0\tbold\1\0\1\ticon\n ÔÅ™ \0\19DiagnosticWarn\1\0\0\1\4\0\0\0\0\tbold\1\0\1\ticon\n ÔÅ± \0\20DiagnosticError\1\0\0\1\4\0\0\0\0\tbold\1\0\1\ticon\n ÔÅó \0\rFileName\1\0\0\1\4\0\0\0\0\tbold\1\0\1\nevent\15VimResized\0\rFileIcon\1\0\0\1\0\0\0\14GitBranch\1\0\0\1\4\0\0\0\0\tbold\24separator_highlight\1\2\0\0\tNONE\1\0\1\14separator\a  \0\fGitIcon\1\0\0\1\4\0\0\0\0\tbold\14condition\24check_git_workspace\1\0\0\0\26SpecialFileTypeBuffer\1\0\0\1\4\0\0\0\0\tbold\1\0\0\0\15ActiveLine\1\0\0\14highlight\1\2\0\0\tNONE\rprovider\1\0\0\0\tleft\0\0\0\1\a\0\0\rfugitive\vpacker\rvim-plug\rNvimTree\rCHADTree\17coc-explorer\0\0\0\0\1\2\0\0\6 \20short_line_list\25GalaxylineInactiveFG\23GalaxylineActiveFG\17GalaxylineBG\20core.highlights\fsection\25galaxyline.condition galaxyline.providers.buffer\"galaxyline.providers.fileinfo\29galaxyline.providers.vcs$galaxyline.providers.diagnostic\15galaxyline\frequire\npcall\0" },
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/galaxyline.nvim",
    url = "https://github.com/NTBBloodbath/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\2ô\4\0\0\6\0\17\0\0236\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\3\15\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\0045\5\t\0=\5\n\0045\5\v\0=\5\f\0045\5\r\0=\5\14\4=\4\16\3B\2\2\1K\0\1\0\nsigns\1\0\0\17changedelete\1\0\4\ttext\6~\ahl\15DiffChange\vlinehl\21GitSignsChangeLn\nnumhl\21GitSignsChangeNr\14topdelete\1\0\4\ttext\tü≠∂\ahl\15DiffDelete\vlinehl\21GitSignsDeleteLn\nnumhl\21GitSignsDeleteNr\vdelete\1\0\4\ttext\tü≠ª\ahl\15DiffDelete\vlinehl\21GitSignsDeleteLn\nnumhl\21GitSignsDeleteNr\vchange\1\0\4\ttext\b‚îÉ\ahl\15DiffChange\vlinehl\21GitSignsChangeLn\nnumhl\21GitSignsChangeNr\badd\1\0\0\1\0\4\ttext\b‚îÉ\ahl\fDiffAdd\vlinehl\18GitSignsAddLn\nnumhl\18GitSignsAddNr\nsetup\rgitsigns\frequire\npcall\0" },
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["glow.nvim"] = {
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/glow.nvim",
    url = "https://github.com/ellisonleao/glow.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\2ú\3\0\0\5\0\t\0\0156\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\3\4\0005\4\5\0=\4\6\0035\4\a\0=\4\b\3B\2\2\1K\0\1\0\20buftype_exclude\1\2\0\0\rterminal\21filetype_exclude\1\r\0\0\thelp\rterminal\14dashboard\20TelescopePrompt\21TelescopeResults\rfugitive\rvim-plug\17coc-explorer\vpacker\flspinfo\rNvimTree\rCHADTree\1\0\5\31show_current_context_start\2\25show_current_context\2.show_current_context_start_oncurrent_line\2\tchar\b‚ñè#show_trailing_blankline_indent\1\nsetup\21indent_blankline\frequire\npcall\0" },
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["is.vim"] = {
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/is.vim",
    url = "https://github.com/haya14busa/is.vim"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\2\2M\0\0\3\0\4\0\n6\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\1B\2\1\1K\0\1\0\nsetup\14neoscroll\frequire\npcall\0" },
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\2s\0\0\4\0\5\0\v6\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\3\4\0B\2\2\1K\0\1\0\1\0\3\fmap_c_h\2\fmap_c_w\2\vmap_cr\1\nsetup\19nvim-autopairs\frequire\npcall\0" },
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\2©\1\0\0\5\0\6\0\f6\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\3\4\0005\4\5\0B\2\3\1K\0\1\0\1\0\t\vrgb_fn\2\vcss_fn\2\nnames\2\bcss\2\vRRGGBB\2\tmode\15background\rRRGGBBAA\2\vhsl_fn\2\bRGB\2\1\2\0\0\6*\nsetup\14colorizer\frequire\npcall\0" },
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-ts-context-commentstring", "nvim-ts-autotag" },
    loaded = true,
    only_config = true
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\2}\0\0\5\0\a\0\r6\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\3\5\0005\4\4\0=\4\6\3B\2\2\1K\0\1\0\fautotag\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\npcall\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    after = { "Comment.nvim" },
    config = { "\27LJ\2\2õ\1\0\0\5\0\a\0\r6\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\3\5\0005\4\4\0=\4\6\3B\2\2\1K\0\1\0\26context_commentstring\1\0\0\1\0\2\venable\2\19enable_autocmd\1\nsetup\28nvim-treesitter.configs\frequire\npcall\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["nvim-window.git"] = {
    config = { "\27LJ\2\2 \1\0\0\5\0\a\0\r6\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\3\5\0005\4\4\0=\4\6\3B\2\2\1K\0\1\0\nchars\1\0\3\fhint_hl\tBold\14normal_hl\15NvimWindow\vborder\tnone\1\27\0\0\6a\6b\6c\6d\6e\6f\6g\6h\6i\6j\6k\6l\6m\6n\6o\6p\6q\6r\6s\6t\6u\6v\6w\6x\6y\6z\nsetup\16nvim-window\frequire\npcall\0" },
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/nvim-window.git",
    url = "https://gitlab.com/yorickpeterse/nvim-window"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["pounce.nvim"] = {
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/pounce.nvim",
    url = "https://github.com/rlane/pounce.nvim"
  },
  ["smart-splits.nvim"] = {
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/smart-splits.nvim",
    url = "https://github.com/mrjones2014/smart-splits.nvim"
  },
  ["telescope-emoji.nvim"] = {
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/telescope-emoji.nvim",
    url = "https://github.com/xiyaowong/telescope-emoji.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim",
    url = "https://github.com/nvim-telescope/telescope-media-files.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\2è\6\0\0\v\0'\00066\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0006\2\1\0'\3\3\0B\2\2\0029\3\4\0015\4\24\0005\5\6\0005\6\5\0=\6\a\0055\6\b\0=\6\t\0055\6\19\0005\a\v\0009\b\n\2=\b\f\a9\b\r\2=\b\14\a9\b\15\2=\b\16\a9\b\17\2=\b\18\a=\a\20\6=\6\21\0055\6\22\0=\6\23\5=\5\25\0045\5\27\0005\6\26\0=\6\28\5=\5\29\0045\5!\0005\6\31\0005\a\30\0=\a \6=\6\"\5=\5#\4B\3\2\0015\3$\0006\4%\0\18\5\3\0B\4\2\4X\a\3Ä9\t&\1\18\n\b\0B\t\2\1E\a\3\3R\a˚K\0\1\0\19load_extension\vipairs\1\4\0\0\bfzf\16media_files\nemoji\15extensions\16media_files\1\0\0\14filetypes\1\0\0\1\b\0\0\bpng\twebp\bjpg\tjpeg\twebm\bpdf\bmp4\fpickers\15find_files\1\0\0\1\0\1\vhidden\2\rdefaults\1\0\0\16borderchars\1\t\0\0\b‚îÄ\b‚îÇ\b‚îÄ\b‚îÇ\b‚îå\b‚îê\b‚îò\b‚îî\rmappings\6i\1\0\0\n<M-w>\18delete_buffer\n<M-c>\nclose\n<C-k>\28move_selection_previous\n<C-j>\1\0\0\24move_selection_next\25file_ignore_patterns\1\5\0\0\17node_modules\14*%.min%.*\vdotbot\v^.git/\22vimgrep_arguments\1\0\0\1\n\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\r--hidden\18--glob=!.git/\nsetup\22telescope.actions\14telescope\frequire\npcall\0" },
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-better-whitespace"] = {
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/vim-better-whitespace",
    url = "https://github.com/ntpeters/vim-better-whitespace"
  },
  ["vim-floaterm"] = {
    config = { "\27LJ\2\2à\2\0\0\3\0\f\1\0256\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0*\1\0\0=\1\b\0006\0\0\0009\0\1\0006\1\0\0009\1\n\0019\1\v\1)\2\0\0B\1\2\2=\1\t\0K\0\1\0\24nvim_win_get_height\bapi\20floaterm_height\19floaterm_width\22 TERMINAL: $1/$2 \19floaterm_title\16bottomright\22floaterm_position\nfloat\21floaterm_wintype\6g\bvimµÊÃô\19ô≥Ê˛\3\0" },
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-highlightedyank"] = {
    config = { "\27LJ\2\2D\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1,\1=\1\2\0K\0\1\0'highlightedyank_highlight_duration\6g\bvim\0" },
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/vim-highlightedyank",
    url = "https://github.com/machakann/vim-highlightedyank"
  },
  ["vim-move"] = {
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/vim-move",
    url = "https://github.com/matze/vim-move"
  },
  ["vim-obsession"] = {
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/vim-obsession",
    url = "https://github.com/tpope/vim-obsession"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/vim-polyglot",
    url = "https://github.com/sheerun/vim-polyglot"
  },
  ["vim-sandwich"] = {
    config = { "\27LJ\2\2O\0\0\2\0\3\0\0056\0\0\0009\0\1\0'\1\2\0B\0\2\1K\0\1\0000runtime macros/sandwich/keymap/surround.vim\bcmd\bvim\0" },
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/vim-sandwich",
    url = "https://github.com/machakann/vim-sandwich"
  },
  ["vim-searchlight"] = {
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/vim-searchlight",
    url = "https://github.com/PeterRincker/vim-searchlight"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/vim-sleuth",
    url = "https://github.com/tpope/vim-sleuth"
  },
  ["vim-textobj-entire"] = {
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/vim-textobj-entire",
    url = "https://github.com/kana/vim-textobj-entire"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/vim-textobj-user",
    url = "https://github.com/kana/vim-textobj-user"
  },
  ["vscode.nvim"] = {
    loaded = true,
    path = "/home/colcv/.local/share/nvim/site/pack/packer/start/vscode.nvim",
    url = "https://github.com/Mofiqul/vscode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\2Ë\2\0\0\6\0\r\0\0196\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\3\5\0005\4\4\0=\4\6\0035\4\a\0005\5\b\0=\5\t\4=\4\n\0035\4\v\0=\4\f\3B\2\2\1K\0\1\0\vindent\1\0\1\venable\1\14highlight\fdisable\1\4\0\0\bvim\thtml\bcss\1\0\2&additional_vim_regex_highlighting\1\venable\2\21ensure_installed\1\0\0\1\21\0\0\blua\thtml\bcss\tscss\15javascript\15typescript\btsx\tjson\njsonc\6c\bcpp\ago\ngomod\bphp\vpython\nregex\tbash\njsdoc\bdot\fgraphql\nsetup\28nvim-treesitter.configs\frequire\npcall\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: vim-floaterm
time([[Config for vim-floaterm]], true)
try_loadstring("\27LJ\2\2à\2\0\0\3\0\f\1\0256\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0*\1\0\0=\1\b\0006\0\0\0009\0\1\0006\1\0\0009\1\n\0019\1\v\1)\2\0\0B\1\2\2=\1\t\0K\0\1\0\24nvim_win_get_height\bapi\20floaterm_height\19floaterm_width\22 TERMINAL: $1/$2 \19floaterm_title\16bottomright\22floaterm_position\nfloat\21floaterm_wintype\6g\bvimµÊÃô\19ô≥Ê˛\3\0", "config", "vim-floaterm")
time([[Config for vim-floaterm]], false)
-- Config for: vim-highlightedyank
time([[Config for vim-highlightedyank]], true)
try_loadstring("\27LJ\2\2D\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1,\1=\1\2\0K\0\1\0'highlightedyank_highlight_duration\6g\bvim\0", "config", "vim-highlightedyank")
time([[Config for vim-highlightedyank]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\2\2M\0\0\3\0\4\0\n6\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\1B\2\1\1K\0\1\0\nsetup\14neoscroll\frequire\npcall\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\2ú\3\0\0\5\0\t\0\0156\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\3\4\0005\4\5\0=\4\6\0035\4\a\0=\4\b\3B\2\2\1K\0\1\0\20buftype_exclude\1\2\0\0\rterminal\21filetype_exclude\1\r\0\0\thelp\rterminal\14dashboard\20TelescopePrompt\21TelescopeResults\rfugitive\rvim-plug\17coc-explorer\vpacker\flspinfo\rNvimTree\rCHADTree\1\0\5\31show_current_context_start\2\25show_current_context\2.show_current_context_start_oncurrent_line\2\tchar\b‚ñè#show_trailing_blankline_indent\1\nsetup\21indent_blankline\frequire\npcall\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\2©\1\0\0\5\0\6\0\f6\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\3\4\0005\4\5\0B\2\3\1K\0\1\0\1\0\t\vrgb_fn\2\vcss_fn\2\nnames\2\bcss\2\vRRGGBB\2\tmode\15background\rRRGGBBAA\2\vhsl_fn\2\bRGB\2\1\2\0\0\6*\nsetup\14colorizer\frequire\npcall\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: coc.nvim
time([[Config for coc.nvim]], true)
try_loadstring("\27LJ\2\2´\2\0\0\3\0\n\0\0156\0\0\0009\0\1\0005\1\4\0005\2\3\0=\2\5\1=\1\2\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0005\1\t\0=\1\b\0K\0\1\0\1\v\0\0\rcoc-html\fcoc-css\14coc-emmet\17coc-tsserver\rcoc-json\17coc-prettier\15coc-eslint\17coc-snippets\17coc-explorer\20coc-sumneko-lua\26coc_global_extensions\14right:50%\20coc_fzf_preview\vwindow\1\0\0\1\0\2\nwidth\4Õô≥Ê\fÃô≥ˇ\3\vheight\4ö≥ÊÃ\tô≥¶ˇ\3\15fzf_layout\6g\bvim\0", "config", "coc.nvim")
time([[Config for coc.nvim]], false)
-- Config for: nvim-window.git
time([[Config for nvim-window.git]], true)
try_loadstring("\27LJ\2\2 \1\0\0\5\0\a\0\r6\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\3\5\0005\4\4\0=\4\6\3B\2\2\1K\0\1\0\nchars\1\0\3\fhint_hl\tBold\14normal_hl\15NvimWindow\vborder\tnone\1\27\0\0\6a\6b\6c\6d\6e\6f\6g\6h\6i\6j\6k\6l\6m\6n\6o\6p\6q\6r\6s\6t\6u\6v\6w\6x\6y\6z\nsetup\16nvim-window\frequire\npcall\0", "config", "nvim-window.git")
time([[Config for nvim-window.git]], false)
-- Config for: vim-sandwich
time([[Config for vim-sandwich]], true)
try_loadstring("\27LJ\2\2O\0\0\2\0\3\0\0056\0\0\0009\0\1\0'\1\2\0B\0\2\1K\0\1\0000runtime macros/sandwich/keymap/surround.vim\bcmd\bvim\0", "config", "vim-sandwich")
time([[Config for vim-sandwich]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\2ô\4\0\0\6\0\17\0\0236\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\3\15\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\0045\5\t\0=\5\n\0045\5\v\0=\5\f\0045\5\r\0=\5\14\4=\4\16\3B\2\2\1K\0\1\0\nsigns\1\0\0\17changedelete\1\0\4\ttext\6~\ahl\15DiffChange\vlinehl\21GitSignsChangeLn\nnumhl\21GitSignsChangeNr\14topdelete\1\0\4\ttext\tü≠∂\ahl\15DiffDelete\vlinehl\21GitSignsDeleteLn\nnumhl\21GitSignsDeleteNr\vdelete\1\0\4\ttext\tü≠ª\ahl\15DiffDelete\vlinehl\21GitSignsDeleteLn\nnumhl\21GitSignsDeleteNr\vchange\1\0\4\ttext\b‚îÉ\ahl\15DiffChange\vlinehl\21GitSignsChangeLn\nnumhl\21GitSignsChangeNr\badd\1\0\0\1\0\4\ttext\b‚îÉ\ahl\fDiffAdd\vlinehl\18GitSignsAddLn\nnumhl\18GitSignsAddNr\nsetup\rgitsigns\frequire\npcall\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: filetype.nvim
time([[Config for filetype.nvim]], true)
try_loadstring("\27LJ\2\0024\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\23did_load_filetypes\6g\bvim\0", "config", "filetype.nvim")
time([[Config for filetype.nvim]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\2\2x\0\0\a\0\t\1\0206\0\0\0009\0\1\0009\0\2\0'\1\3\0B\0\2\0026\1\0\0009\1\1\0019\1\2\1'\2\4\0B\1\2\0026\2\5\0009\2\6\2#\3\1\0\24\3\0\3B\2\2\3'\4\a\0\18\5\2\0'\6\b\0&\4\6\4L\4\2\0\a% \6 \tmodf\tmath\6$\6.\tline\afn\bvim»\1Ñ\1\0\1\5\0\b\0\0226\1\0\0009\1\1\0019\1\2\1\a\1\3\0X\1\2Ä'\1\4\0L\1\2\0\f\1\0\0X\1\1Ä'\1\5\0006\2\0\0009\2\1\0029\2\6\2\v\2\2\0X\2\5Ä'\2\a\0\18\3\1\0'\4\a\0&\2\4\2L\2\2\0'\2\4\0L\2\2\0\6 \rreadonly\bÓÇ¢\5\thelp\rfiletype\abo\bvimÃ\4\0\1\n\1\23\3n+\1\0\0006\2\0\0009\2\1\0029\2\2\2)\3\0\0B\2\2\2\25\2\0\2)\3<\0\1\3\2\0X\3\fÄ6\3\0\0009\3\1\0039\3\3\0036\4\0\0009\4\1\0049\4\4\4'\5\5\0B\4\2\2'\5\6\0B\3\3\2\18\1\3\0X\3\25Ä)\3(\0\1\3\2\0X\3\16Ä6\3\0\0009\3\1\0039\3\a\0036\4\0\0009\4\1\0049\4\3\0046\5\0\0009\5\1\0059\5\4\5'\6\5\0B\5\2\2'\6\6\0B\4\3\0A\3\0\2\18\1\3\0X\3\6Ä6\3\0\0009\3\1\0039\3\4\3'\4\b\0B\3\2\2\18\1\3\0006\3\0\0009\3\1\0039\3\t\0036\4\0\0009\4\1\0049\4\4\4'\5\b\0B\4\2\0A\3\0\2\t\3\1\0X\3\1Ä'\1\n\0006\3\v\0009\3\f\3-\4\0\0\18\5\0\0B\4\2\0A\3\0\2\b\3\2\0X\3\6Ä\18\3\1\0-\4\0\0\18\5\0\0B\4\2\2&\3\4\3L\3\2\0006\3\0\0009\3\r\0039\3\14\3\15\0\3\0X\4\28Ä6\3\0\0009\3\r\0039\3\15\3\15\0\3\0X\4\23Ä6\3\0\0009\3\1\0039\3\16\3'\4\17\0'\5\18\0B\3\3\2\b\3\2\0X\4\tÄ\18\4\1\0'\5\19\0'\6\20\0'\a\19\0'\b\21\0'\t\22\0&\4\t\4L\4\2\0X\4\6Ä\18\4\1\0'\5\19\0'\6\20\0'\a\22\0&\4\a\4L\4\2\0\18\3\1\0'\4\22\0&\3\4\3L\3\2\0\r¿\a  \tÔÄ∂ \tÔÅÄ \6 \anw\b\\s$\vsearch\rmodified\15modifiable\abo\blen\vstring\rUntitled\nempty\b%:t\16pathshorten\t:~:.\6%\vexpand\16fnamemodify\rwinwidth\afn\bvim\4\2\0\\\0\0\3\0\5\1\0156\0\0\0009\0\1\0009\0\2\0006\1\0\0009\1\1\0019\1\3\1'\2\4\0B\1\2\0A\0\0\2\b\0\0\0X\0\2Ä+\0\2\0L\0\2\0+\0\1\0L\0\2\0\b%:t\vexpand\nempty\afn\bvim\2>\0\2\b\0\1\0\f6\2\0\0\18\3\0\0B\2\2\4X\5\4Ä\5\6\1\0X\a\2Ä+\a\2\0L\a\2\0E\5\3\3R\5˙+\2\1\0L\2\2\0\vipairsH\0\1\4\2\4\0\v-\1\0\0-\2\1\0006\3\0\0009\3\1\0039\3\2\3B\1\3\2\15\0\1\0X\2\2Ä'\1\3\0L\1\2\0L\0\2\0\17¿\16¿\5\rfiletype\abo\bvimâ\1\0\1\4\2\6\1\24-\1\0\0-\2\1\0006\3\0\0009\3\1\0039\3\2\3B\1\3\2\15\0\1\0X\2\2Ä'\1\3\0L\1\2\0006\1\0\0009\1\4\0019\1\5\1)\2\0\0B\1\2\2\25\1\0\1)\0022\0\1\2\1\0X\2\2ÄL\0\2\0X\2\2Ä'\2\3\0L\2\2\0K\0\1\0\17¿\16¿\rwinwidth\afn\5\rfiletype\abo\bvim\4\17\0\0\1\0\1\0\2'\0\0\0L\0\2\0\6 f\0\0\3\3\5\0\r-\0\0\0-\1\1\0006\2\0\0009\2\1\0029\2\2\2B\0\3\2\15\0\0\0X\1\3Ä-\0\2\0009\0\3\0D\0\1\0'\0\4\0L\0\2\0\17¿\16¿\5¿\5\24get_buffer_filetype\rfiletype\abo\bvim\26\0\0\2\1\1\0\3-\0\0\0'\1\0\0D\0\2\0\18¿\tÔû° .\0\0\2\2\1\0\5-\0\0\0-\1\1\0009\1\0\1B\1\1\0C\0\0\0\18¿\3¿\19get_git_branch-\0\0\2\2\1\0\5-\0\0\0-\1\1\0009\1\0\1B\1\1\0C\0\0\0\18¿\4¿\18get_file_icon\27\0\0\2\2\0\0\4-\0\0\0-\1\1\0B\1\1\0C\0\0\0\18¿\14¿4\0\0\2\2\1\0\5-\0\0\0-\1\1\0009\1\0\1B\1\1\0C\0\0\0\18¿\2¿\25get_diagnostic_error3\0\0\2\2\1\0\5-\0\0\0-\1\1\0009\1\0\1B\1\1\0C\0\0\0\18¿\2¿\24get_diagnostic_warn3\0\0\2\2\1\0\5-\0\0\0-\1\1\0009\1\0\1B\1\1\0C\0\0\0\18¿\2¿\24get_diagnostic_hint3\0\0\2\2\1\0\5-\0\0\0-\1\1\0009\1\0\1B\1\1\0C\0\0\0\18¿\2¿\24get_diagnostic_info3\0\0\2\2\1\0\5-\0\0\0-\1\1\0009\1\0\1B\1\1\0C\0\0\0\19¿\5¿\24get_buffer_filetype\25\0\0\2\1\1\0\3-\0\0\0'\1\0\0D\0\2\0\19¿\b   /\0\0\2\2\1\0\5-\0\0\0-\1\1\0009\1\0\1B\1\1\0C\0\0\0\19¿\4¿\20get_file_encode\25\0\0\2\1\1\0\3-\0\0\0'\1\0\0D\0\2\0\19¿\b   \27\0\0\2\2\0\0\4-\0\0\0-\1\1\0B\1\1\0C\0\0\0\18¿\f¿\17\0\0\1\0\1\0\2'\0\0\0L\0\2\0\6 )\0\0\1\1\1\0\3-\0\0\0009\0\0\0D\0\1\0\5¿\24get_buffer_filetypeN\0\0\3\3\4\0\f-\0\0\0-\1\1\0006\2\0\0009\2\1\0029\2\2\2B\0\3\2\15\0\0\0X\1\2Ä'\0\3\0L\0\2\0-\0\2\0D\0\1\0\17¿\16¿\14¿\5\rfiletype\abo\bvim¸\16\1\0\24\0z\0˙\0016\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0ÚÄ6\2\1\0'\3\3\0B\2\2\0026\3\1\0'\4\4\0B\3\2\0026\4\1\0'\5\5\0B\4\2\0026\5\1\0'\6\6\0B\5\2\0026\6\1\0'\a\a\0B\6\2\0029\a\b\0016\b\1\0'\t\t\0B\b\2\0029\t\n\b9\n\v\b9\v\f\b5\f\14\0=\f\r\0013\f\15\0003\r\16\0003\14\17\0003\15\18\0005\16\19\0003\17\20\0003\18\21\0003\19\22\0009\20\23\a5\21\29\0005\22\25\0003\23\24\0=\23\26\0225\23\27\0>\t\2\23=\23\28\22=\22\30\21>\21\1\0209\20\23\a5\21\"\0005\22 \0003\23\31\0=\23\26\0225\23!\0>\n\1\23>\t\2\23=\23\28\22=\22#\21>\21\2\0209\20\23\a5\21)\0005\22%\0003\23$\0=\23\26\0229\23&\6=\23'\0225\23(\0>\n\1\23>\t\2\23=\23\28\22=\22*\21>\21\3\0209\20\23\a5\0210\0005\22,\0003\23+\0=\23\26\0225\23-\0>\t\2\23=\23.\0229\23&\6=\23'\0225\23/\0>\n\1\23>\t\2\23=\23\28\22=\0221\21>\21\4\0209\20\23\a5\0214\0005\0223\0003\0232\0=\23\26\22=\15'\0224\23\3\0>\n\1\23>\t\2\23=\23\28\22=\0225\21>\21\5\0209\20\23\a5\0219\0005\0227\0003\0236\0=\23\26\0225\0238\0>\n\1\23>\t\2\23=\23\28\22=\22:\21>\21\6\0209\20\23\a5\21>\0005\22<\0003\23;\0=\23\26\0225\23=\0>\n\1\23>\t\2\23=\23\28\22=\22?\21>\21\a\0209\20\23\a5\21C\0005\22A\0003\23@\0=\23\26\0225\23B\0>\n\1\23>\t\2\23=\23\28\22=\22D\21>\21\b\0209\20\23\a5\21H\0005\22F\0003\23E\0=\23\26\0225\23G\0>\n\1\23>\t\2\23=\23\28\22=\22I\21>\21\t\0209\20\23\a5\21M\0005\22K\0003\23J\0=\23\26\0225\23L\0>\n\1\23>\t\2\23=\23\28\22=\22N\21>\21\n\0209\20O\a5\21S\0005\22Q\0003\23P\0=\23\26\22=\15'\0225\23R\0>\n\1\23>\t\2\23=\23\28\22=\22T\21>\21\5\0209\20O\a5\21X\0005\22V\0003\23U\0=\23\26\22=\15'\0225\23W\0>\t\2\23=\23\28\22=\22Y\21>\21\6\0209\20O\a5\21]\0005\22[\0003\23Z\0=\23\26\0225\23\\\0>\n\1\23>\t\2\23=\23\28\22=\22^\21>\21\a\0209\20O\a5\21b\0005\22`\0003\23_\0=\23\26\0225\23a\0>\t\2\23=\23\28\22=\22c\21>\21\b\0209\20O\a5\21g\0005\22e\0003\23d\0=\23\26\0225\23f\0>\n\1\23>\t\2\23=\23\28\22=\22h\21>\21\t\0209\20i\a5\21m\0005\22k\0003\23j\0=\23\26\0225\23l\0>\t\2\23=\23\28\22=\22n\21>\21\1\0209\20i\a5\21s\0005\22p\0003\23o\0=\23\26\22=\15'\0225\23q\0>\t\2\23=\23.\0225\23r\0>\v\1\23>\t\2\23=\23\28\22=\22t\21>\21\2\0209\20i\a5\21x\0005\22v\0003\23u\0=\23\26\0225\23w\0>\v\1\23>\t\2\23=\23\28\22=\22y\21>\21\3\0202\0\0ÄK\0\1\0K\0\1\0\21InactiveFileName\1\0\0\1\4\0\0\0\0\tbold\1\0\1\nevent\15VimResized\0\23InactiveBufferType\1\0\0\1\4\0\0\0\0\tbold\1\2\0\0\tNONE\1\0\1\14separator\6 \0\17InactiveLine\1\0\0\1\2\0\0\tNONE\1\0\0\0\20short_line_left\fPerCent\1\0\0\1\4\0\0\0\0\tbold\1\0\0\0\21FileEncodeSpaces\1\0\0\1\2\0\0\tNONE\1\0\1\nevent\15VimResized\0\15FileEncode\1\0\0\1\4\0\0\0\0\tbold\1\0\1\nevent\15VimResized\0\23FileTypeNameSpaces\1\0\0\1\2\0\0\tNONE\1\0\1\nevent\15VimResized\0\17FileTypeName\1\0\0\1\4\0\0\0\0\tbold\1\0\1\nevent\15VimResized\0\nright\19DiagnosticInfo\1\0\0\1\4\0\0\0\0\tbold\1\0\1\ticon\n ÔÅö \0\19DiagnosticHint\1\0\0\1\4\0\0\0\0\tbold\1\0\1\ticon\n ÔÅ™ \0\19DiagnosticWarn\1\0\0\1\4\0\0\0\0\tbold\1\0\1\ticon\n ÔÅ± \0\20DiagnosticError\1\0\0\1\4\0\0\0\0\tbold\1\0\1\ticon\n ÔÅó \0\rFileName\1\0\0\1\4\0\0\0\0\tbold\1\0\1\nevent\15VimResized\0\rFileIcon\1\0\0\1\0\0\0\14GitBranch\1\0\0\1\4\0\0\0\0\tbold\24separator_highlight\1\2\0\0\tNONE\1\0\1\14separator\a  \0\fGitIcon\1\0\0\1\4\0\0\0\0\tbold\14condition\24check_git_workspace\1\0\0\0\26SpecialFileTypeBuffer\1\0\0\1\4\0\0\0\0\tbold\1\0\0\0\15ActiveLine\1\0\0\14highlight\1\2\0\0\tNONE\rprovider\1\0\0\0\tleft\0\0\0\1\a\0\0\rfugitive\vpacker\rvim-plug\rNvimTree\rCHADTree\17coc-explorer\0\0\0\0\1\2\0\0\6 \20short_line_list\25GalaxylineInactiveFG\23GalaxylineActiveFG\17GalaxylineBG\20core.highlights\fsection\25galaxyline.condition galaxyline.providers.buffer\"galaxyline.providers.fileinfo\29galaxyline.providers.vcs$galaxyline.providers.diagnostic\15galaxyline\frequire\npcall\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\2è\6\0\0\v\0'\00066\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0006\2\1\0'\3\3\0B\2\2\0029\3\4\0015\4\24\0005\5\6\0005\6\5\0=\6\a\0055\6\b\0=\6\t\0055\6\19\0005\a\v\0009\b\n\2=\b\f\a9\b\r\2=\b\14\a9\b\15\2=\b\16\a9\b\17\2=\b\18\a=\a\20\6=\6\21\0055\6\22\0=\6\23\5=\5\25\0045\5\27\0005\6\26\0=\6\28\5=\5\29\0045\5!\0005\6\31\0005\a\30\0=\a \6=\6\"\5=\5#\4B\3\2\0015\3$\0006\4%\0\18\5\3\0B\4\2\4X\a\3Ä9\t&\1\18\n\b\0B\t\2\1E\a\3\3R\a˚K\0\1\0\19load_extension\vipairs\1\4\0\0\bfzf\16media_files\nemoji\15extensions\16media_files\1\0\0\14filetypes\1\0\0\1\b\0\0\bpng\twebp\bjpg\tjpeg\twebm\bpdf\bmp4\fpickers\15find_files\1\0\0\1\0\1\vhidden\2\rdefaults\1\0\0\16borderchars\1\t\0\0\b‚îÄ\b‚îÇ\b‚îÄ\b‚îÇ\b‚îå\b‚îê\b‚îò\b‚îî\rmappings\6i\1\0\0\n<M-w>\18delete_buffer\n<M-c>\nclose\n<C-k>\28move_selection_previous\n<C-j>\1\0\0\24move_selection_next\25file_ignore_patterns\1\5\0\0\17node_modules\14*%.min%.*\vdotbot\v^.git/\22vimgrep_arguments\1\0\0\1\n\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\r--hidden\18--glob=!.git/\nsetup\22telescope.actions\14telescope\frequire\npcall\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\2s\0\0\4\0\5\0\v6\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\3\4\0B\2\2\1K\0\1\0\1\0\3\fmap_c_h\2\fmap_c_w\2\vmap_cr\1\nsetup\19nvim-autopairs\frequire\npcall\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: close-buffers.nvim
time([[Config for close-buffers.nvim]], true)
try_loadstring("\27LJ\2\2‘\1\0\0\5\0\n\0\0196\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\3\4\0004\4\0\0=\4\5\0034\4\0\0=\4\6\0034\4\0\0=\4\a\0035\4\b\0=\4\t\3B\2\2\1K\0\1\0\27preserve_window_layout\1\3\0\0\tthis\rnameless\22file_regex_ignore\21file_glob_ignore\20filetype_ignore\1\0\0\nsetup\18close_buffers\frequire\npcall\0", "config", "close-buffers.nvim")
time([[Config for close-buffers.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-ts-context-commentstring ]]

-- Config for: nvim-ts-context-commentstring
try_loadstring("\27LJ\2\2õ\1\0\0\5\0\a\0\r6\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\3\5\0005\4\4\0=\4\6\3B\2\2\1K\0\1\0\26context_commentstring\1\0\0\1\0\2\venable\2\19enable_autocmd\1\nsetup\28nvim-treesitter.configs\frequire\npcall\0", "config", "nvim-ts-context-commentstring")

vim.cmd [[ packadd Comment.nvim ]]

-- Config for: Comment.nvim
try_loadstring("\27LJ\2\2ß\3\0\1\a\0\18\00006\1\0\0'\2\1\0B\1\2\2+\2\0\0009\3\2\0009\4\2\0019\4\3\4\5\3\4\0X\3\aÄ6\3\0\0'\4\4\0B\3\2\0029\3\5\3B\3\1\2\18\2\3\0X\3\16Ä9\3\6\0009\4\6\0019\4\a\4\4\3\4\0X\3\5Ä9\3\6\0009\4\6\0019\4\b\4\5\3\4\0X\3\6Ä6\3\0\0'\4\4\0B\3\2\0029\3\t\3B\3\1\2\18\2\3\0006\3\0\0'\4\n\0B\3\2\0029\3\v\0035\4\14\0009\5\2\0009\6\2\0019\6\f\6\5\5\6\0X\5\2Ä'\5\r\0X\6\1Ä'\5\15\0=\5\16\4=\2\17\4D\3\2\0\rlocation\bkey\16__multiline\1\0\0\14__default\tline\28calculate_commentstring&ts_context_commentstring.internal\30get_visual_start_location\6V\6v\fcmotion\24get_cursor_location#ts_context_commentstring.utils\nblock\nctype\18Comment.utils\frequireh\1\0\5\0\a\0\0146\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0\6Ä9\2\3\0015\3\5\0003\4\4\0=\4\6\3B\2\2\1K\0\1\0K\0\1\0\rpre_hook\1\0\0\0\nsetup\fComment\frequire\npcall\0", "config", "Comment.nvim")

vim.cmd [[ packadd nvim-ts-autotag ]]

-- Config for: nvim-ts-autotag
try_loadstring("\27LJ\2\2}\0\0\5\0\a\0\r6\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\3\5\0005\4\4\0=\4\6\3B\2\2\1K\0\1\0\fautotag\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\npcall\0", "config", "nvim-ts-autotag")

time([[Sequenced loading]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
