local conda_prefix = vim.env.CONDA_PREFIX

return {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
	settings = {
		basedpyright = {
			python = conda_prefix and (conda_prefix .. "/bin/python") or vim.fn.exepath("python"),
		},
		analysis = {
			autoSearchPath = true,
			useLibraryCodeForTypes = true,
			typeCheckingMode = "off",
			diagnosticMode = "workspace",
			diagnosticSeverityOverrides = {
				reportMissingImports = "warning",
				reportMissingModuleSource = "warning",
			},
		},
	},
}
