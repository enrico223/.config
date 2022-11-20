require("enrico.keymap")
require("enrico.set")
require("enrico.packer")
require("lualine").setup() 

require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
} 

require('lspconfig')['texlab'].setup{
	on_attach = on_attach,
	flags = lsp_flags,
}
