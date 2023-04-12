local tree = require("nvim-tree")
local which_key = require("which-key")

tree.setup {
	on_attach = function(bufnr)
		local api = require('nvim-tree.api')

		local function opts(desc)
			return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end

		local bufmap = function(lhs, rhs, opt)
			vim.keymap.set('n', lhs, rhs, opt)
		end

		bufmap('<C-]>', api.tree.change_root_to_node, opts('CD'))
		bufmap('<C-e>', api.node.open.replace_tree_buffer, opts('Open: In Place'))
		bufmap('<C-k>', api.node.show_info_popup, opts('Info'))
		bufmap('<C-r>', api.fs.rename_sub, opts('Rename: Omit Filename'))
		bufmap('t', api.node.open.tab, opts('Open: New Tab'))
		bufmap('v', api.node.open.vertical, opts('Open: Vertical Split'))
		bufmap('s', api.node.open.horizontal, opts('Open: Horizontal Split'))
		bufmap('<BS>', api.node.navigate.parent_close, opts('Close Directory'))
		bufmap('<CR>', api.node.open.edit, opts('Open'))
		bufmap('<Tab>', api.node.open.preview, opts('Open Preview'))
		bufmap('>', api.node.navigate.sibling.next, opts('Next Sibling'))
		bufmap('<', api.node.navigate.sibling.prev, opts('Previous Sibling'))
		bufmap('.', api.node.run.cmd, opts('Run Command'))
		bufmap('-', api.tree.change_root_to_parent, opts('Up'))
		bufmap('a', api.fs.create, opts('Create'))
		bufmap('bmv', api.marks.bulk.move, opts('Move Bookmarked'))
		bufmap('B', api.tree.toggle_no_buffer_filter, opts('Toggle No Buffer'))
		bufmap('c', api.fs.copy.node, opts('Copy'))
		bufmap('C', api.tree.toggle_git_clean_filter, opts('Toggle Git Clean'))
		bufmap('[c', api.node.navigate.git.prev, opts('Prev Git'))
		bufmap(']c', api.node.navigate.git.next, opts('Next Git'))
		bufmap('d', api.fs.remove, opts('Delete'))
		bufmap('D', api.fs.trash, opts('Trash'))
		bufmap('E', api.tree.expand_all, opts('Expand All'))
		bufmap('e', api.fs.rename_basename, opts('Rename: Basename'))
		bufmap(']e', api.node.navigate.diagnostics.next, opts('Next Diagnostic'))
		bufmap('[e', api.node.navigate.diagnostics.prev, opts('Prev Diagnostic'))
		bufmap('F', api.live_filter.clear, opts('Clean Filter'))
		bufmap('f', api.live_filter.start, opts('Filter'))
		bufmap('g?', api.tree.toggle_help, opts('Help'))
		bufmap('gy', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
		bufmap('h', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
		bufmap('I', api.tree.toggle_gitignore_filter, opts('Toggle Git Ignore'))
		bufmap('J', api.node.navigate.sibling.last, opts('Last Sibling'))
		bufmap('K', api.node.navigate.sibling.first, opts('First Sibling'))
		bufmap('m', api.marks.toggle, opts('Toggle Bookmark'))
		bufmap('o', api.node.open.edit, opts('Open'))
		bufmap('O', api.node.open.no_window_picker, opts('Open: No Window Picker'))
		bufmap('p', api.fs.paste, opts('Paste'))
		bufmap('P', api.node.navigate.parent, opts('Parent Directory'))
		bufmap('q', api.tree.close, opts('Close'))
		bufmap('r', api.fs.rename, opts('Rename'))
		bufmap('<C-r>', api.tree.reload, opts('Refresh'))
		bufmap('s', api.node.run.system, opts('Run System'))
		bufmap('S', api.tree.search_node, opts('Search'))
		bufmap('U', api.tree.toggle_custom_filter, opts('Toggle Hidden'))
		bufmap('W', api.tree.collapse_all, opts('Collapse'))
		bufmap('x', api.fs.cut, opts('Cut'))
		bufmap('y', api.fs.copy.filename, opts('Copy Name'))
		bufmap('Y', api.fs.copy.relative_path, opts('Copy Relative Path'))
	end
}

local keymap = vim.keymap.set

-- Toggle the file tree.
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })
keymap("n", "<C-f>", ":NvimTreeFocus<CR>", { silent = true })

which_key.register({
	g = {
		name = "Go",
		f = { "<cmd>:NvimTreeFindFile<CR>", "Current File" },
	},
}, { mode = "n", prefix = "<leader>", silent = true })
