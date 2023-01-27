-------------------------------------------------------------------------------
-- options
-------------------------------------------------------------------------------
-- backup, swap and undo
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.autoread = true

-- indent
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.wrapscan = true
vim.opt.smartcase = true

-- sign column
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"

-- display hidden character
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("lead:⋅")
vim.opt.listchars:append("trail:⋅")
vim.opt.listchars:append("eol:")
vim.opt.listchars:append("tab: ")
vim.opt.fillchars:append("diff: ")
vim.opt.fillchars:append("eob: ")

-- status and tab bar
vim.opt.cmdheight = 0
vim.opt.laststatus = 3
vim.opt.showtabline = 0

-- completion menu
vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }
vim.opt.pumheight = 10

-- misc
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.cursorline = true
vim.opt.foldenable = false
vim.opt.wrap = false
vim.opt.updatetime = 100
vim.opt.shell = "/bin/bash"
vim.opt.clipboard = "unnamedplus"
