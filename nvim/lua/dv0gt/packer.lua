local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- themes
  use 'doums/darcula'
  use 'folke/tokyonight.nvim'
  use "EdenEast/nightfox.nvim"
  use "lunarvim/darkplus.nvim"
  use 'ryanoasis/vim-devicons'
  use 'NLKNguyen/papercolor-theme'
  use 'lourenci/github-colors'
  -- git
  use 'lewis6991/gitsigns.nvim'
  use 'f-person/git-blame.nvim'
  use 'tpope/vim-fugitive'

  use 'kyazdani42/nvim-tree.lua'

  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-context'

  use 'fatih/vim-go'
  use 'vim-test/vim-test'

  use 'nvim-telescope/telescope.nvim'
  use "ahmedkhalf/project.nvim"
  use 'nvim-lua/plenary.nvim'

  use 'lukas-reineke/indent-blankline.nvim'

  use 'kyazdani42/nvim-web-devicons'

  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

  use { 'L3MON4D3/LuaSnip', requires = "kyazdani42/nvim-web-devicons" }

  -- code completion & autocpmpletion
  use { "hrsh7th/nvim-cmp", commit = "2427d06b6508489547cd30b6e86b1c75df363411" } -- The completion plugin
  use { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" } -- buffer completions
  use { "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" } -- path completions
  use { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp-signature-help" }
  use 'rafamadriz/friendly-snippets'
  use { 'f3fora/cmp-spell' }
  use { "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" }
  use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }

  use { "neovim/nvim-lspconfig", commit = "e5ba5d2b96843903108b00f07fea782268cdd6af" } -- enable LSP
  -- use { "williamboman/nvim-lsp-installer", commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6" } -- simple to use language server installer
  use { "williamboman/mason.nvim", commit = '45606b0e9b01a1565bfc8b57a52ec04f58f5f295' }

  use { "williamboman/mason-lspconfig.nvim" }

  use { "jose-elias-alvarez/null-ls.nvim", commit = "c0c19f32b614b3921e17886c541c13a72748d450" } -- for formatters and linters
  use { "RRethy/vim-illuminate", commit = "c82e6d04f27a41d7fdcad9be0bce5bb59fcb78e5" }

  use { "akinsho/toggleterm.nvim", tag = 'v2.*', config = function() require("toggleterm").setup() end }

  use { "windwp/nvim-autopairs", commit = "4fc96c8f3df89b6d23e5092d31c866c53a346347" } -- Autopairs, integrates with both cmp and treesitter
  use 'windwp/nvim-ts-autotag'
  use 'lukas-reineke/lsp-format.nvim'
  use { "iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end }
  use 'numToStr/Comment.nvim'
  use 'goolord/alpha-nvim'
  use 'norcalli/nvim-colorizer.lua'
  use 'akinsho/bufferline.nvim'
  use 'glepnir/lspsaga.nvim'
  use 'ray-x/lsp_signature.nvim'


  use 'laytan/cloak.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use { 'mfussenegger/nvim-jdtls', commit = "faf7ec2df507e16082afc4ef6b18813863f68dd8" }

  use { "folke/which-key.nvim", commit = "6885b669523ff4238de99a7c653d47b081b5506d" }
  use { 'ThePrimeagen/harpoon', commit = "4dfe94e633945c14ad0f03044f601b8e6a99c708" }
  use { 'krivahtoo/silicon.nvim', run = './install.sh' }
  use {
    "NTBBloodbath/rest.nvim",
    commit = "6b5487f68e55bd626f2f2bab6c92e2c19febe814",
    requires = { "nvim-lua/plenary.nvim" }
  }

  use "folke/todo-comments.nvim"
  use "xiyaowong/nvim-transparent"

  --dap
  use { "mfussenegger/nvim-dap", version = "0.3.0" }
  use 'leoluz/nvim-dap-go'
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
  use { "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } }
  use {
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npm run compile"
  }
  use 'David-Kunz/jester'

  use 'ChristianChiarulli/nvim-ts-rainbow'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

end)
