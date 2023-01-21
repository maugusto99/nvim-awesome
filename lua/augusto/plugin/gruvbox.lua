local status_ok, gruvbox= pcall(require,"gruvbox")
if not status_ok then
  return
end

local colors = require("gruvbox.palette")

gruvbox.setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = true,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true,
  contrast = "hard",
  dim_inactive = false,
  transparent_mode = false,
  overrides = {
    SignColumn = {bg = colors.dark0_hard},
    GruvboxRedSign = { fg = colors.red, bg = colors.dark0_hard, reverse = false },
    GruvboxGreenSign = { fg = colors.green, bg = colors.dark0_hard, reverse = false },
    GruvboxYellowSign = { fg = colors.yellow, bg = colors.dark0_hard, reverse = false },
    GruvboxBlueSign = { fg = colors.blue, bg = colors.dark0_hard, reverse = false },
    GruvboxPurpleSign = { fg = colors.purple, bg = colors.dark0_hard, reverse = false },
    GruvboxAquaSign = { fg = colors.aqua, bg = colors.dark0_hard, reverse = false },
    GruvboxOrangeSign = { fg = colors.orange, bg = colors.dark0_hard, reverse = false },

  }
})

vim.cmd("colorscheme gruvbox")
