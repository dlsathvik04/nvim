return {
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if vim.uv.fs_stat(path .. "/rust-analyzer.json") then
				return
			end
		end

		-- Fix: Set checkOnSave to a boolean here to satisfy the type check
		client.config.settings["rust-analyzer"] =
			vim.tbl_deep_extend("force", client.config.settings["rust-analyzer"] or {}, {
				checkOnSave = true,
			})
	end,

	settings = {
		["rust-analyzer"] = {
			-- If the 'map' error persists, move the command
			-- into the 'check' table which is the modern standard
			check = {
				command = "clippy",
				extraArgs = { "--", "-D", "clippy::all" },
			},
			-- This toggle is now a boolean
			checkOnSave = true,

			diagnostics = {
				enable = true,
			},
			cargo = {
				allFeatures = true,
			},
			procMacro = {
				enable = true,
			},
			inlayHints = {
				bindingModeHints = {
					enable = false,
				},
				chainingHints = {
					enable = true,
				},
				closingBraceHints = {
					enable = true,
					minLines = 25,
				},
				closureReturnTypeHints = {
					enable = "never",
				},
				lifetimeElisionHints = {
					enable = "never",
					useParameterNames = false,
				},
				maxLength = 25,
				parameterHints = {
					enable = true,
				},
				reborrowHints = {
					enable = "never",
				},
				renderColons = true,
				typeHints = {
					enable = true,
					hideNamedConstructor = false,
					hideClosureInitialization = false,
				},
			},
		},
	},
}
