-- =============================================================================
-- Genarated by lightline to lualine theme converter
--   https://gist.github.com/shadmansaleh/000871c9a608a012721c6acc6d7a19b9
-- License: MIT License
-- =============================================================================

local colors = {
  color3   = "#bcbcbc",
  color7   = "#af5f5f",
  color10  = "#5f875f",
  color2   = "#87875f",
  color4   = "#ffffaf",
  color1   = "#585858",
  color0   = "#262626",
}

local apprentice = {
  normal = {
    b = { fg = colors.color0, bg = colors.color1 },
    a = { fg = colors.color0, bg = colors.color2 , gui = "bold", },
    c = { fg = colors.color3, bg = colors.color0 },
  },
  visual = {
    b = { fg = colors.color0, bg = colors.color1 },
    a = { fg = colors.color0, bg = colors.color4 , gui = "bold", },
  },
  inactive = {
    b = { fg = colors.color0, bg = colors.color1 },
    a = { fg = colors.color0, bg = colors.color1 , gui = "bold", },
    c = { fg = colors.color1, bg = colors.color0 },
  },
  replace = {
    b = { fg = colors.color0, bg = colors.color1 },
    a = { fg = colors.color0, bg = colors.color7 , gui = "bold", },
  },
  insert = {
    b = { fg = colors.color0, bg = colors.color1 },
    a = { fg = colors.color0, bg = colors.color10 , gui = "bold", },
  },
}

return apprentice