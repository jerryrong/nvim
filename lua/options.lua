local g = vim.g
local opt = vim.opt

-- Rebind <Leader> key
g.mapleader = ","

opt.showmode = false

opt.laststatus = 3

opt.clipboard = "unnamedplus"

opt.history = 100

opt.timeoutlen = 500

opt.autowrite = true

-- Turn backup off
opt.writebackup = false
opt.swapfile = false

-- About searching
opt.ignorecase = true
opt.smartcase = true

opt.wildmode = { "longest", "full" }
opt.wildignore = { "*.o", "*~", "*.pyc" }

opt.fileencodings = { "ucs-bom", "utf-8", "chinese", "cp936", "latin1" }

opt.number = true
opt.numberwidth = 2

opt.showmatch = true
opt.matchtime = 2

opt.textwidth = 80

-- Show tabs and spaces and so on
opt.list = true
opt.listchars = { tab = "▸▸", eol = "¬", extends = "»", precedes = "«" }

-- Indent and tab
opt.expandtab = true
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

opt.shortmess:append("sI")

opt.termguicolors = true

opt.mouse = "a"

opt.splitbelow = true
opt.splitright = true
