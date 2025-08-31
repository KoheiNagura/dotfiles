local opt = vim.opt
local keymap = vim.keymap.set

-- basic settings
opt.title = true
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.ambiwidth = "single"
opt.helplang = { "ja", "en" }

-- appearance
opt.number = true
opt.cmdheight = 1
opt.termguicolors = true
opt.visualbell = true
opt.showcmd = true
opt.scrolloff = 5

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
opt.hlsearch = true
opt.incsearch = true

-- keymap
keymap('n', '<Esc><Esc>', ':nohlsearch<CR>', { silent = true })
keymap('i', 'jj', '<ESC>', { silent = true })
keymap('n', 'd', '"_d')
keymap('v', 'd', '"_d')

keymap('n', '<CR>', 'i<Return><Esc>^k')
keymap('n', '<C-j>', '}')
keymap('n', '<C-k>', '{')
keymap('n', '<Tab>', '5j')
keymap('n', '<S-Tab>', '5k')

