-- treesitter
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		auto_install = true,
		ensure_installed = {
			"c",
			"cpp",
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
