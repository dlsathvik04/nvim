return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "> " },
			topdelete = { text = "" },
			changedelete = { text = "▎" },
			untracked = { text = "▎" },
		},
		signs_staged = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "> " },
			topdelete = { text = "" },
			changedelete = { text = "▎" },
		},
		signs_staged_enable = true,
		current_line_blame = false,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol",
			delay = 500,
		},
	},
	config = function(_, opts)
		local gs = require("gitsigns")
		gs.setup(opts)

		-- Navigation
		vim.keymap.set("n", "]g", function()
			gs.nav_hunk("next")
		end, { desc = "Next git hunk" })

		vim.keymap.set("n", "[g", function()
			gs.nav_hunk("prev")
		end, { desc = "Prev git hunk" })

		-- Staging
		vim.keymap.set({ "n", "v" }, "<leader>gs", gs.stage_hunk, { desc = "Stage hunk" })
		vim.keymap.set({ "n", "v" }, "<leader>gr", gs.reset_hunk, { desc = "Reset hunk" })
		vim.keymap.set("n", "<leader>gS", gs.stage_buffer, { desc = "Stage buffer" })
		vim.keymap.set("n", "<leader>gR", gs.reset_buffer, { desc = "Reset buffer" })

		-- Preview / info
		vim.keymap.set("n", "<leader>gp", gs.preview_hunk_inline, { desc = "Preview hunk" })
		vim.keymap.set("n", "<leader>gb", gs.blame_line, { desc = "Blame line" })
		vim.keymap.set("n", "<leader>gB", function()
			gs.blame_line({ full = true })
		end, { desc = "Blame line (full)" })
		vim.keymap.set("n", "<leader>gd", gs.diffthis, { desc = "Diff this" })
		vim.keymap.set("n", "<leader>gD", function()
			gs.diffthis("~")
		end, { desc = "Diff this (against last commit)" })

		-- Toggle
		vim.keymap.set("n", "<leader>gtb", gs.toggle_current_line_blame, { desc = "Toggle line blame" })

		-- Text object: select hunk with ih/ah
		vim.keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select hunk" })
	end,
}
