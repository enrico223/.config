vim.cmd [[packadd packer.nvim]]
--Packer package manager
return require('packer').startup(function(use)
   use 'wbthomason/packer.nvim'
   use {'nvim-lualine/lualine.nvim',
   requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}
--Plug for latex documents
	use 'lervag/vimtex'
	use 'SirVer/ultisnips'
	use 'matze/vim-tex-fold'
	use 'xuhdev/vim-latex-live-preview'

--Plug for obsidian 
	use 'epwalsh/obsidian.nvim'

--Plug for live pandoc 
	use 'frabjous/knap'
--sntax
	use 'ap/vim-css-color' --displays a preview of colors with CSS
	use 'nvim-tree/nvim-web-devicons'
	use 'nvim-treesitter/nvim-treesitter'
--Plug for filesystem explorer
	use 'preservim/nerdtree'
	use {'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  requires = { {'nvim-lua/plenary.nvim'} }
}
    use {"nvim-telescope/telescope-frecency.nvim",
	config = function()
			require"telescope".load_extension("frecency") 
	end,
	requires = {"kkharji/sqlite.lua"}
	}
	use 'nvim-lua/plenary.nvim'
    use { 'nvim-telescope/telescope-file-browser.nvim',
		config = function()
			require"telescope".load_extension("file_browser")
		end,
	} 
--Plug for greet screen
use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
}

--Plug for center text
	use {'shortcuts/no-neck-pain.nvim', tag = '*'}
	
--LSP
	use 'neovim/nvim-lspconfig'
--Plug for smooth scrolling 
	use 'karb94/neoscroll.nvim'

--Plug for error warning in programming
	use 'dense-analysis/ale'

-- Plug for cheat.sh
	use 'RishabhRD/popfix'	
	use 'RishabhRD/nvim-cheat.sh'
	
-- Colorschemes 
	use 'ellisonleao/gruvbox.nvim'
    use 'ishan9299/modus-theme-vim'
	use "rebelot/kanagawa.nvim"
	use 'sainnhe/sonokai'
	use { 'bluz71/vim-moonfly-colors', as = 'moonfly' }
	use { 'dasupradyumna/midnight.nvim' }
	use { "catppuccin/nvim", as = "catppuccin" }
	use({ 'rose-pine/neovim', as = 'rose-pine' })

end)

