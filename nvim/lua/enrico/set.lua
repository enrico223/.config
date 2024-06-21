local g = vim.g
local opt = vim.opt

g.mapleader = " "

opt.termguicolors = true 
opt.relativenumber = true
opt.number = false
opt.mouse = "a" 
opt.spell = true
opt.wildmenu = true
opt.spelllang = "en_us,it"
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.incsearch = true 
--opt.nohlsearch = true
--opt.complete+=k 
opt.foldmethod = 'expr'
opt.wrap = true  
opt.linebreak = true
opt.textwidth = 0
g.livepreview_use_biber = true
g.vimtex_view_general_viewer = 'zathura'
g.vimtex_compiler_silent = 1
g.vimtex_view_method = 'zathura'
g.vimtex_view_skim_reading_bar = 1
g.knap_settings = {
	mdoutputext = "pdf",
	mdtopdf = "pandoc %docroot% -o %outputfile%",
    mdtopdfviewerlaunch = "zathura %outputfile%",
    mdtopdfviewerrefresh = "none"
}
g.hardtime_maxcount = 3
g.python3_host_prog = "/usr/bin/python3"
vim.cmd([[highlight link EndOfBuffer Normal]])
vim.cmd([[hi LineNr guibg=bgt]])
