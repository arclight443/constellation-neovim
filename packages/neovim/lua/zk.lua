local zk_status_ok, zk = pcall(require, "zk")
if not zk_status_ok then
	return
end

local which_key_status_ok, which_key = pcall(require, "which-key")
if not which_key_status_ok then
	return
end

local keymap = vim.keymap.set
local opts = { silent = true }

zk.setup({
	picker = "select",
	lsp = {
		config = {
			cmd = { "zk", "lsp" },
			name = "zk",
		},

		auto_attach = {
			enabled = true,
			filetypes = { "markdown" },
		}
	},
})

which_key.register({
	z = {
		name = "Zk",
		r = { "<cmd>:ZkCd<CR>", "Go to notebook root" },
		n = { "<cmd>:ZkNew<CR>", "New note" },
		p = { "<cmd>:ZkNotes<CR>", "View all notes" },
		l = { "<cmd>:ZkLinks<CR>", "View linked notes" },
		b = { "<cmd>:ZkBacklinks<CR>", "View backlinked notes" },
		m = { "<cmd>:ZkMatch<CR>", "View notes with matched text" },
		t = { "<cmd>:ZkTags<CR>", "Search notes with selected tags" },
		i = { "<cmd>:ZkInsertLink<CR>", "Insert link" },
	},
}, { mode = "n", prefix = "<leader>", silent = false })
