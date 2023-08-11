require("enrico.keymap")
require("enrico.set")
require("enrico.packer")
require("lualine").setup() 

--require('lspconfig')['pyright'].setup{
--    on_attach = on_attach,
--    flags = lsp_flags,
--} 
--
--require('lspconfig')['texlab'].setup{
--	on_attach = on_attach,
--	flags = lsp_flags,
--}

require'alpha'.setup(require'alpha.themes.startify'.config)
--vim.api.nvim_create_autocmd({"OptionSet"}, {
--    pattern = {"background"},
--    callback = function(ev)
--        if vim.o.background == 'dark' then
--            print('late dark')
--            vim.cmd("colorscheme modus-vivendi")
--            -- vim.cmd("colorscheme dracula")
--        else
--            print('late light')
--            vim.cmd("colorscheme modus-operandi")
--            -- vim.cmd("colorscheme gruvbox")
--        end
--        -- force a full redraw:
--        vim.cmd("mode")
--    end
--})
