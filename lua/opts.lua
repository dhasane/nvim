--[[ opts.lua ]]
local opt = vim.opt
local cmd = vim.api.nvim_command

local buffer = vim.bo
local window = vim.wo

-- [[ Theme ]]
opt.syntax = "ON"                -- str:  Allow syntax highlighting
opt.termguicolors = true         -- bool: If term supports ui color then enable
-- cmd('colorscheme dracula')       -- cmd:  Set the colorscheme

-- opt.undodir = ".cache/undo"
opt.undolevels=10000
opt.undofile = true

opt.ruler = true

opt.path:append(".**")
opt.spellsuggest = '10' -- muestra las primeras 10 palabras recomendadas

-- filetype plugin on

-- enables codefolding"
--  opt.foldmethod=indent
--  opt.foldnestmax=10
--  opt.foldcolumn=2
--  opt.nofoldenable
--  opt.foldlevel=1
--  highlight Pmenu guibg=#e77171 gui=bold

opt.encoding = 'utf-8'

opt.wildmenu = true
opt.wildmode = { 'longest', 'full' }
vim.opt.wildignore = {'*/cache/*', '*/tmp/*'}

vim.opt.listchars = {
    -- eol = '↲', 
    tab = '»·', -- tab:-\ 
    trail = '·' -- trail:¬∑
}

opt.splitbelow = true
opt.splitright = true

opt.linebreak = true
opt.breakindent = true
opt.showbreak = '\\'
opt.smarttab = true -- Improves tabbing
opt.expandtab = true -- Use spaces instead of tabs
opt.tabstop = 4 -- How much space Vim gives to a tab

opt.shiftwidth = 4  -- Assists code formatting

-- opt.backspace = 2  -- This makes the backspace key function like it does in other programs.

opt.smartindent = true  -- Automatically indents lines after opening a bracket in programming languages
opt.autoindent = true -- If you're indented, new lines will also be indented
opt.copyindent = true

opt.showmatch = true -- Highlights matching brackets in programming languages
opt.mouse='a'  -- Allows you to click around the text editor with your mouse to move the cursor
opt.go=a

opt.foldmethod = 'manual'  -- Lets you hide sections of code
-- opt.foldmethod=indent -- Lets you hide sections of code

opt.clipboard = 'unnamedplus'  -- en para el clipboard, en teoria
-- vim.o.clipboard = 'unnamedplus'

-- busqueda
opt.ignorecase = true -- make searches case insensitive
opt.hlsearch = true -- highlight matching search strings

opt.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience

opt.completeopt:append('preview')

vim.g['netrw_liststyle'] = 3
vim.g['netrw_banner'] = 0
vim.g['netrw_browse_split'] = 4
vim.g['netrw_winsize'] = 25

-- tamaño minimo de una vista
-- opt.winheight = 25
-- opt.winwidth = 90
-- TODO winlayout suena interesante
-- ['row', [['col', [['leaf', 1115], ['leaf', 1111]]], ['leaf', 1114]]]

-- Better display for messages
window.number = true
window.relativenumber = true

opt.scrolloff = 10 -- keep some lines visible when scrolling
opt.cursorline = true -- cambia el color de la linea en la que se encuentra el cursor

-- always show signcolumns
opt.signcolumn = 'yes'

-- opt.completeopt+=preview
-- opt.completeopt+=menu,longest,menuone,preview -- TODO -- TODO
-- opt.omnifunc=syntaxcomplete#Complete -- TODO


-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300
