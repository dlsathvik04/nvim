return {
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name

			-- If a .clangd or compile_commands.json exists in project, respect it
			if
				vim.uv.fs_stat(path .. "/.clangd")
				or vim.uv.fs_stat(path .. "/compile_commands.json")
				or vim.uv.fs_stat(path .. "/compile_flags.txt")
			then
				return
			end
		end
	end,

	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--header-insertion=iwyu",
		"--completion-style=detailed",
		"--function-arg-placeholders",
		"--fallback-style=llvm",
	},

	init_options = {
		usePlaceholders = true,
		completeUnimported = true,
		clangdFileStatus = true,
	},

	settings = {},
}
