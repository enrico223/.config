local lsp = require('lspconfig')

lsp.pyright.setup{
	single_file_support = false,
	on_attach =  function()
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer = 0})
	end
}

lsp.clangd.setup{
	on_attach =  function()
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer = 0})
	end
}

lsp.lua_ls.setup{
	on_attach =  function()
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer = 0})
	end
}

lsp.texlab.setup{
	on_attach =  function()
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer = 0})
	end
}

lsp.bashls.setup{
	on_attach =  function()
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer = 0})
	end
}
