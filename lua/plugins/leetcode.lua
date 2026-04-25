return {
	"kawre/leetcode.nvim",
	build = ":TSUpdate html", -- treesitter for problem parsing
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-telescope/telescope.nvim", -- optional but recommended
		"hrsh7th/nvim-cmp", -- optional (autocompletion)
	},
	opts = {
		lang = "python3", -- change if needed
		storage = {
			home = vim.fn.expand("~/LEARN/leetcode"),
		},
	},
}
