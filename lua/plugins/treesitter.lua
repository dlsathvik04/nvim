return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	config = function()
		local ts = require("nvim-treesitter")

		ts.install({
			"wgsl",
			"lua",
			"python",
			"rust",
			"zig",
			"go",
			"javascript",
			"sql",
			"vim",
			"vimdoc",
			"query",
			"markdown",
			"markdown_inline",
			"bash",
			"json",
			"toml",
			"yaml",
			"html",
			"css",
			"c",
			"cpp",
		})

		-- Highlighting is native now! You enable it per-filetype or universally via an autocmd
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "lua", "wgsl" }, -- add whatever languages you want highlighted
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
