local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end
-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}
-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here2     
  --  use {
  --      'romgrk/barbar.nvim',
  --      requires = {'kyazdani42/nvim-web-devicons'}
  --  }
    use {
	    "SmiteshP/nvim-gps",
        requires = "nvim-treesitter/nvim-treesitter"
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons'
        },
        config = function() require'nvim-tree'.setup {view = { side = 'left', width = 30 }} end
    }
    use {
	    'nvim-telescope/telescope.nvim',
	    requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
  	    'romgrk/barbar.nvim',
  	    requires = {'kyazdani42/nvim-web-devicons'}
	}
    use {
	    "FotiadisM/tabset.nvim",
	    config = function()
	    require("tabset").setup()
        end
    }
    use {
        'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer',
    }
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'windwp/nvim-autopairs'
 --   use {'neoclide/coc.nvim', branch = 'release'}
 --   use 'neovim/nvim-lspconfig'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'mhinz/vim-startify'
    use 'nvim-lualine/lualine.nvim'
    use 'sainnhe/everforest'
    use 'joshdick/onedark.vim'
    use 'sonph/onehalf'
    use 'folke/lsp-colors.nvim'
    use "gosukiwi/vim-atom-dark"
    use "tribela/vim-transparent"
    use "xiyaowong/nvim-transparent"
    use "kyazdani42/nvim-web-devicons"
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
    use "mfussenegger/nvim-dap"   
    -- Automatically set up your configuration after cloning packer.nvim
    use 'folke/tokyonight.nvim'
   -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
