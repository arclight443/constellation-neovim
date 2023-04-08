-- Disable the default keybinds so we can customize.
vim.g.tmux_navigator_no_mappings = 1

-- Disable the default behavior for accidentally navigating to
-- another pane when zoomed in.
vim.g.tmux_navigator_disable_when_zoomed = 1

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }

	if opts then
		options = vim.tbl_extend("force", options, opts)
	end

	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { silent = true })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { silent = true })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { silent = true })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { silent = true })
