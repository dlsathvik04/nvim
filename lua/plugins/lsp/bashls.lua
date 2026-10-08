return {
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name

			-- Respect project-level ShellCheck configs if present
			if vim.uv.fs_stat(path .. "/.shellcheckrc") or vim.uv.fs_stat(path .. "/shellcheckrc") then
				return
			end
		end
	end,

	cmd = {
		"bash-language-server",
		"start",
	},

	init_options = {},

	settings = {
		bashIde = {
			-- Linting via ShellCheck integration
			shellcheckPath = "shellcheck",
			enableSourceErrorDiagnostics = true,

			-- Glob pattern to locate sourced files for completion/definitions
			includeAllWorkspaceSymbols = true,
			globPattern = "*@(.sh|.inc|.bash|.command)",

			-- Shfmt integration (if using bash-language-server formatting)
			shfmt = {
				path = "shfmt",
				ignoreEditorconfig = false,
			},
		},
	},
}
