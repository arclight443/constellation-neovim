local tree = require("nvim-tree")
local which_key = require("which-key")

local function reload_tree()
	tree.api.reload()
end

tree.setup {
	disable_netrw = true,
	view = {
		mappings = {
			list = {
				{ key = "s",     action = "vsplit" },
				{ key = "t",     action = "tabnew" },
				{ key = "S",     action = "split" },
				{ key = "O",     action = "system_open" },
				{ key = "<C-r>", action_cb = reload_tree },
			}
		}
	}
}


local keymap = vim.keymap.set
local opts = { silent = true }

-- Toggle the file tree.
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<C-f>", ":NvimTreeFocus<CR>", opts)

which_key.register({
	g = {
		name = "Go",
		f = { "<cmd>:NvimTreeFindFile<CR>", "Current File" },
	},
}, { mode = "n", prefix = "<leader>", silent = true })
