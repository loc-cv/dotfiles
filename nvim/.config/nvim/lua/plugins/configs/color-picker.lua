local M = {}

M.setup = function()
  local ok, color_picker = pcall(require, 'color-picker')
  if not ok then
    return
  end

  color_picker.setup({
    icons = { '■', '┄' },
    border = 'single', -- none | single | double | rounded | solid | shadow
    keymap = {
      H = '<Plug>ColorPickerSlider0Percent',
      M = '<Plug>ColorPickerSlider50Percent',
      L = '<Plug>ColorPickerSlider100Percent',
      h = '<Plug>ColorPickerSlider1Decrease',
      l = '<Plug>ColorPickerSlider1Increase',
      o = '<Plug>ColorPickerChangeOutputType',
      r = '<Plug>ColorPickerChangeColorMode',
      t = '<Plug>ColorPickerToggleTransparency',
      n = '<Plug>ColorPickerNumericInput',
      a = '<Plug>ColorPickerApplyColor',
    },
  })
end

return M
