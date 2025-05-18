return {
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate"
	},
	{
		"nvim-treesitter/playground",
	},
	{
		"mbbill/undotree"
	},
	{
		"neovim/nvim-lspconfig"
	},
	{
		"williamboman/mason.nvim"
	},
	{
		"williamboman/mason-lspconfig.nvim"
	},
	{
		"hrsh7th/nvim-cmp"
	},
	{
		"hrsh7th/cmp-buffer"
	},
	{
		"hrsh7th/cmp-path"
	},
	{
		"saadparwaiz1/cmp_luasnip"
	},
	{
		"hrsh7th/cmp-nvim-lsp"
	},
	{
		"hrsh7th/cmp-nvim-lua"
	},
	{
		"L3MON4D3/LuaSnip"
	},
	{
		"rafamadriz/friendly-snippets"
	},
	{
		"numToStr/Comment.nvim"
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "gelguy/wilder.nvim" },
	-- {
		-- "cordx56/rustowl",
		-- dependencies = { "neovim/nvim-lspconfig" },
		-- config = function()
			-- local lspconfig = require("lspconfig")
			-- lspconfig.rustowl.setup({})
		-- end,
	-- },
	{
		"ThePrimeagen/vim-be-good"
	},
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			local telescope = require("telescope")
			telescope.setup({})
			local builtin = require("telescope.builtin")
			vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
			vim.keymap.set('n', '<C-p>', builtin.git_files, {})
			vim.keymap.set('n', '<leader>pws', function()
				local word = vim.fn.expand("<cword>")
				builtin.grep_string({ search = word })
			end)
			vim.keymap.set('n', '<leader>pWs', function()
				local word = vim.fn.expand("<cWORD>")
				builtin.grep_string({ search = word })
			end)
			vim.keymap.set('n', '<leader>ps', function()
				builtin.grep_string({ search = vim.fn.input("") })
			end)
		end,
	},
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("lspsaga").setup({})
			vim.keymap.set("n", "<S-F6>", "<cmd>Lspsaga rename<CR>", { silent = true })
		end,
	},
}
