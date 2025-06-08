local opt = vim.opt

-- basic settings
opt.title = true
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.ambiwidth = "double"
opt.helplang = { "ja", "en" }

-- appearance
opt.number = true
-- opt.relativenumber = true
opt.cmdheight = 1
opt.termguicolors = true
opt.visualbell = true

-- code style
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
 
-- input
opt.mouse = "a"
opt.clipboard = { "unnamed", "unnamedplus" }
opt.backspace = { "start", "eol", "indent" }
opt.whichwrap = "b,s,h,l,<,>,[,]"

-- search
opt.ignorecase = true
opt.smartcase = true

