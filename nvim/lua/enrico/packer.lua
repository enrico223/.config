--Packer package manager
return require('packer').startup(function()
   use 'wbthomason/packer.nvim'
   use {  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}
--Plug for latex documents
	use 'lervag/vimtex'
	use 'SirVer/ultisnips'
	use 'matze/vim-tex-fold'
	use 'xuhdev/vim-latex-live-preview'

--Plug for live pandoc 
	use 'frabjous/knap'
--sntax
	use 'ap/vim-css-color' --displays a preview of colors with CSS
--lsp config 
	use 'neovim/nvim-lspconfig'
	use 'HallerPatrick/py_lsp.nvim' 
--Plug for filesystem explorer
	use 'preservim/nerdtree'
	use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}
    use {
	"nvim-telescope/telescope-frecency.nvim",
	config = function()
			require"telescope".load_extension("frecency")
	end,
	requires = {"kkharji/sqlite.lua"}
	}
	use 'nvim-lua/plenary.nvim'
    use {
		'nvim-telescope/telescope-file-browser.nvim',
		config = function()
			require"telescope".load_extension("file_browser")
		end,
	}
--Plug for center text
	use 'junegunn/goyo.vim'

--Plug for smooth scrolling 
	use 'karb94/neoscroll.nvim'

--Plug for error warning in programming
	use 'dense-analysis/ale'

--Plug for greet screen
	use 'goolord/alpha-nvim'
--Colorschemes 
	use 'ellisonleao/gruvbox.nvim'
	use 'dracula/vim'
	use 'sam4llis/nvim-tundra'
	use 'agude/vim-eldar'
	use 'nanotech/jellybeans.vim'
	use 'sainnhe/sonokai'
	use 'fabi1cazenave/kalahari.vim'
	use 'folke/tokyonight.nvim'
	use 'shaunsingh/solarized.nvim'
	use { "catppuccin/nvim", as = "catppuccin" }
end)

