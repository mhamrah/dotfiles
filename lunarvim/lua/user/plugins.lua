lvim.plugins = {
	{
		"rose-pine/neovim",
		lazy = lvim.colorscheme ~= "lunar",
	},
	{
		"gbprod/nord.nvim",
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			})
		end,
	},
	{
		"simrat39/symbols-outline.nvim",
		config = function()
			require("symbols-outline").setup()
		end,
	},
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},
	"kylechui/nvim-surround",
	{ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" },
	{
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				log_level = "error",
				auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			})
		end,
	},
	"kevinhwang91/nvim-bqf",
	"simrat39/rust-tools.nvim",
	"windwp/nvim-spectre",
	"roobert/tailwindcss-colorizer-cmp.nvim",
	{ "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } },
	"jose-elias-alvarez/typescript.nvim",
	{
		"microsoft/vscode-js-debug",
		opt = true,
		run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
	},
	"olexsmir/gopher.nvim",
	"leoluz/nvim-dap-go",
	"neovim/tree-sitter-vimdoc",
}
