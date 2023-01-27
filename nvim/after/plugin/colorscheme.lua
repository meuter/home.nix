-------------------------------------------------------------------------------
-- colors
-------------------------------------------------------------------------------

local float_bg = "#272727"
local diff_green = "#044025"
local diff_red = "#400404"
local diff_yellow = "#403d04"
local visual_selected = "#253747"

-- enable true colors
vim.opt.termguicolors = true

-- start with a builtin color scheme
vim.cmd("colorscheme habamax")

-- fixup some general highlight
vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE" })
vim.api.nvim_set_hl(0, "Visual", { fg = "NONE", bg = visual_selected })
vim.api.nvim_set_hl(0, "DiffAdd", { fg = "NONE", bg = diff_green })
vim.api.nvim_set_hl(0, "DiffChange", { fg = "NONE", bg = diff_green })
vim.api.nvim_set_hl(0, "DiffDelete", { fg = "NONE", bg = diff_red })
vim.api.nvim_set_hl(0, "DiffText", { fg = "NONE", bg = diff_yellow })
vim.api.nvim_set_hl(0, "Pmenu", { fg = "NONE", bg = float_bg })
vim.api.nvim_set_hl(0, "PmenuSel", { fg = "NONE", bg = visual_selected })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "NONE", bg = float_bg })
vim.api.nvim_set_hl(0, "LspInfoBorder", { fg = "NONE", bg = float_bg })

-- support for gitsign
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#c2c253", bg = "NONE" })

-- support for Neotree
vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "SkyBlue3" })
vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "white" })
vim.api.nvim_set_hl(0, "NeoTreeRootName", { bold = true, fg = "white" })
vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { fg = "green" })
vim.api.nvim_set_hl(0, "NeoTreeGitConflict", { fg = "red" })
vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = "AliceBlue" })
vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = "LightYellow" })
vim.api.nvim_set_hl(0, "NeoTreeSymbolicLinkTarget", { fg = "cyan" })

-- support for Telescope
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "NONE", bg = float_bg })
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = float_bg })
