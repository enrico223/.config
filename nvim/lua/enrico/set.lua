local g = vim.g
local opt = vim.opt

g.mapleader = " "

opt.termguicolors = true 
opt.relativenumber = false
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
opt.textwidth = 75
g.livepreview_use_biber = true
g.vimtex_view_general_viewer = 'sioyek'
g.knap_settings = {
	mdoutputext = "pdf",
	mdtopdf = "pandoc %docroot% -o %outputfile%",
    mdtopdfviewerlaunch = "sioyek %outputfile%",
    mdtopdfviewerrefresh = "none"
}
