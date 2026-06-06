return {
	"NMAC427/guess-indent.nvim",
	opts = {
		auto_cmd = true, -- ensures it runs on buffer read
		override_editorconfig = false,
	},
	config = function(_, opts)
		require("guess-indent").setup(opts)

		-- Force a default layout style if guess-indent finds an empty or un-analyzable WGSL file
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "wgsl",
			callback = function()
				-- Default fallback parameters for your shaders (e.g., 4 spaces)
				vim.bo.expandtab = true
				vim.bo.shiftwidth = 4
				vim.bo.tabstop = 4
				-- Pull in standard C-style brace indentation patterns for hitting enter
				vim.cmd("runtime! indent/c.vim")
			end,
		})
	end,
}

