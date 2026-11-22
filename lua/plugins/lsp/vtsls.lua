return {
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name

			-- Respect project-level TypeScript/JavaScript or Biome/Prettier configs
			if
				vim.uv.fs_stat(path .. "/tsconfig.json")
				or vim.uv.fs_stat(path .. "/jsconfig.json")
				or vim.uv.fs_stat(path .. "/biome.json")
				or vim.uv.fs_stat(path .. "/.eslintrc.json")
			then
				return
			end
		end
	end,

	cmd = {
		"vtsls",
		"--stdio",
	},

	init_options = {
		-- Options to customize memory limits or host features
		hostInfo = "neovim",
		maxTsServerMemory = 8192,
	},

	settings = {
		javascript = {
			-- Completion & Inlay Hints behavior
			suggest = {
				completeFunctionCalls = true,
			},
			inlayHints = {
				parameterNames = { enabled = "literals" },
				parameterTypes = { enabled = true },
				variableTypes = { enabled = false },
				propertyDeclarationTypes = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
				enumMemberValues = { enabled = true },
			},
			updateImportsOnFileMove = { enabled = "always" },
			preferences = {
				importModuleSpecifier = "non-relative",
				quoteStyle = "auto",
			},
		},
		typescript = {
			suggest = {
				completeFunctionCalls = true,
			},
			inlayHints = {
				parameterNames = { enabled = "literals" },
				parameterTypes = { enabled = true },
				variableTypes = { enabled = false },
				propertyDeclarationTypes = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
				enumMemberValues = { enabled = true },
			},
			updateImportsOnFileMove = { enabled = "always" },
			preferences = {
				importModuleSpecifier = "non-relative",
				quoteStyle = "auto",
			},
		},
		vtsls = {
			autoUseWorkspaceTsdk = true,
			experimental = {
				completion = {
					enableServerSideFuzzyMatch = true,
				},
			},
		},
	},
}
