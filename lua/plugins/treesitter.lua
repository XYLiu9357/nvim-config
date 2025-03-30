-- treesitter
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		auto_install = true,
		ensure_installed = {
			"c",
			"c++",
			"cmake",
			"dockerfile",
			"python",
			"latex",
			"matlab",
		},
		highlight = { enable = true },
		indent = { enable = true },
	},
}
