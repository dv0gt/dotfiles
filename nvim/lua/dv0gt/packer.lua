local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  -- themes
  use("doums/darcula")
  use("folke/tokyonight.nvim")
  use("EdenEast/nightfox.nvim")
  use("lunarvim/darkplus.nvim")
  use("ryanoasis/vim-devicons")
  use("NLKNguyen/papercolor-theme")
  use("lourenci/github-colors")
  -- git
  use("lewis6991/gitsigns.nvim")
  use("f-person/git-blame.nvim")
  use("tpope/vim-fugitive")

  use("kyazdani42/nvim-tree.lua")

  use("nvim-treesitter/nvim-treesitter")
  use("nvim-treesitter/nvim-treesitter-context")

  use("fatih/vim-go")
  use("vim-test/vim-test")

  use("nvim-telescope/telescope.nvim")
  use("ahmedkhalf/project.nvim")
  use("nvim-lua/plenary.nvim")

  use({"lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {
        char = '┊',
        show_trailing_blankline_indent = false,
      }
    })

  use("kyazdani42/nvim-web-devicons")

  use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })

  use({ "L3MON4D3/LuaSnip", requires = "kyazdani42/nvim-web-devicons" })

  -- code completion & autocpmpletion
  use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
  use({ "hrsh7th/cmp-buffer" }) -- buffer completions
  use({ "hrsh7th/cmp-path" }) -- path completions
  use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
  use({ "hrsh7th/cmp-nvim-lsp-signature-help" })
  use("rafamadriz/friendly-snippets")
  use({ "f3fora/cmp-spell" })
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "hrsh7th/cmp-nvim-lua" })

  use({ "neovim/nvim-lspconfig" }) -- enable LSP
  -- use { "williamboman/nvim-lsp-installer", commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6" } -- simple to use language server installer
  use({ "williamboman/mason.nvim" })

  use({ "williamboman/mason-lspconfig.nvim" })

  use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
  use({ "RRethy/vim-illuminate" })

  ---@diagnostic disable-next-line: different-requires
  use({
    "akinsho/toggleterm.nvim",
    tag = "v2.*",
    config = function()
      require("toggleterm").setup()
    end,
  })

  use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
  use("windwp/nvim-ts-autotag")
  use("lukas-reineke/lsp-format.nvim")
  use({
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  })
  use("numToStr/Comment.nvim")
  use("goolord/alpha-nvim")
  use("norcalli/nvim-colorizer.lua")
  use("akinsho/bufferline.nvim")
  use("glepnir/lspsaga.nvim")
  use("ray-x/lsp_signature.nvim")

  use("laytan/cloak.nvim")
  use({ "catppuccin/nvim", as = "catppuccin" })
  use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
  use({ "mfussenegger/nvim-jdtls" })

  use({ "folke/which-key.nvim" })
  use({ "ThePrimeagen/harpoon" })
  use({ "krivahtoo/silicon.nvim", run = "./install.sh" })
  use({ "rest-nvim/rest.nvim", requires = { "nvim-lua/plenary.nvim" } })

  use("folke/todo-comments.nvim")
  use("xiyaowong/nvim-transparent")

  --dap
  use({ "mfussenegger/nvim-dap", version = "0.3.0" })
  use("leoluz/nvim-dap-go")
  use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
  -- use { "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } }
  -- use {
  --   "microsoft/vscode-js-debug",
  --   opt = true,
  --   run = "npm install --legacy-peer-deps && npm run compile"
  -- }
  use("David-Kunz/jester")

  use("ChristianChiarulli/nvim-ts-rainbow")

  use("chrisgrieser/nvim-early-retirement")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
