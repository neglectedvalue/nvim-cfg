-- Basic remaps
require("nvg.remap")

-- Lazy nvim init

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Plugin section

require("lazy").setup({
	"folke/which-key.nvim",
	-- Theme and colorscheme
	{
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight]])
		end,
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
	-- Telescope
	{
		"nvim-telescope/telescope.nvim", tag = '0.1.6',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('nvg.plugins.telescope').init() 
		end
	},
	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require('nvg.plugins.treesitter').init()
		end
	},
	-- Undotree
	{
		"mbbill/undotree",
		config = function()
			require('nvg.plugins.undotree').init()
		end
	},
	-- Lsp zero and its deps
	{"williamboman/mason.nvim"},
	{"williamboman/mason-lspconfig.nvim"},
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		config = function()
			require('nvg.plugins.lsp').init()
		end
	},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},
})
