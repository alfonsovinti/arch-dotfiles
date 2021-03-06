local utils = require("utils")

local g = vim.g -- a table to access global variables
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd("pwd")
local indent = 4

cmd("syntax enable")
cmd("filetype plugin indent on")

-- global options
utils.opt("o", "modelines", 1)
utils.opt("o", "hidden", true)          -- hide buffers, not close them
utils.opt("o", "backup", false)         -- disable backup before overwriting a file
utils.opt("o", "exrc", true)            -- search on current directory .nvimrc or .exrc files
utils.opt("o", "hlsearch", true)        -- searching
utils.opt("o", "incsearch", true)       -- searching
utils.opt("o", "ignorecase", true)      -- case insensitive
utils.opt("o", "smartcase", true)
utils.opt("o", "scrolloff", 6)          -- minimal number of screen lines to keep above and below the cursor
utils.opt("o", "shiftround", true)      -- >> indents to next multiple of "shiftwidth".
utils.opt("o", "icm", "split")          -- also shows partial off-screen results in a preview window
utils.opt("o", "splitbelow", true)
utils.opt("o", "splitright", true)
utils.opt("o", "clipboard", "unnamed,unnamedplus")
utils.opt("o", "cmdheight", 2)          -- give more space for displaying messages
--utils.opt("o", "wildmode", "list:longest")
-- TODO utils.opt("o", "completeopt", "menuone,noinsert,noselect")
-- TODO utils.opt("o", "updatetime", 50) -- short delay

-- window local options
utils.opt("w", "number", true)
utils.opt("w", "cursorline", true)
utils.opt("w", "relativenumber", true)
utils.opt("w", "colorcolumn", "80")
utils.opt("w", "signcolumn", "yes")
-- folding
utils.opt("w", "foldmethod", "indent")
utils.opt("w", "foldnestmax", 10)
utils.opt("w", "foldenable", false)
utils.opt("w", "foldlevel", 10)

-- buffer local options
utils.opt("b", "modeline", false)
utils.opt("b", "undofile", true)        -- maintain undo history between sessions
utils.opt("b", "swapfile", false)
utils.opt("b", "expandtab", true)       -- add spaces not tab
utils.opt("b", "tabstop", indent)
utils.opt("b", "softtabstop", indent)
utils.opt("b", "shiftwidth", indent)    -- >> indents by 2 spaces.
utils.opt("b", "smartindent", true)     -- do indenting when starting a new line
utils.opt("b", "autoindent", true)      -- copy indent from current line
utils.opt("b", "infercase", true)

-- netrw
--g.netrw_liststyle = 3
--g.netrw_banner = 0
--g.netrw_winsize = 25
--g.netrw_browse_split = 2

cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = false}")

utils.augroup({
    { "BufWritePre", "*", "%s/\\s\\+$//e" },
}, "TRIM_WHITESPACE")

cmd('au BufNewFile,BufRead * if &ft == "" | set ft=text | endif')

-- GUI
utils.opt("o", "guifont", "FiraCode Nerd Font:h11")
