local bufferline_status_ok, bufferline = pcall(require, "bufferline")
if not bufferline_status_ok then
	return
end

local bufdel_status_ok, bufdel = pcall(require, "bufdel")
if not bufdel_status_ok then
	return
end

local which_key_status_ok, which_key = pcall(require, "which-key")
if not which_key_status_ok then
	return
end

local signs = { error = " ", warning = " ", hint = " ", info = " " }

local severities = {
	"error",
	"warning"
}

bufferline.setup {
	options = {
		mode = "buffers",
		show_close_icon = false,
		show_buffer_close_icons = false,
		persist_buffer_sort = true,
		diagnostics = "nvim_lsp",
		alays_show_bufferline = true,
		separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
		diagnostics_indicator = function(_, _, diagnostic)
			local strs = {}
			for _, severity in ipairs(severities) do
				if diagnostic[severity] then
					table.insert(strs, signs[severity] .. diagnostic[severity])
				end
			end

			return table.concat(strs, " ")
		end,
		offsets = {
			{ filetype = "NvimTree", text = "NvimTree", highlight = "Directory", text_align = "left" }
		},
	},

	highlights = {
		fill = {
			fg = { attribute = "fg", highlight = "TabLine" },
			bg = { attribute = "bg", highlight = "TabLine" },
		},
		background = {
			fg = { attribute = "fg", highlight = "TabLine" },
			bg = { attribute = "bg", highlight = "TabLine" },
		},
		buffer_visible = {
			fg = { attribute = "fg", highlight = "TabLine" },
			bg = { attribute = "bg", highlight = "TabLine" },
		},
		close_button = {
			fg = { attribute = "fg", highlight = "TabLine" },
			bg = { attribute = "bg", highlight = "TabLine" },
		},
		close_button_visible = {
			fg = { attribute = "fg", highlight = "TabLine" },
			bg = { attribute = "bg", highlight = "TabLine" },
		},
		tab_selected = {
			fg = { attribute = "fg", highlight = "Normal" },
			bg = { attribute = "bg", highlight = "Normal" },
		},
		tab = {
			fg = { attribute = "fg", highlight = "TabLine" },
			bg = { attribute = "bg", highlight = "TabLine" },
		},
		tab_close = {
			fg = { attribute = "fg", highlight = "TabLineSel" },
			bg = { attribute = "bg", highlight = "Normal" },
		},
		duplicate_selected = {
			fg = { attribute = "fg", highlight = "TabLineSel" },
			bg = { attribute = "bg", highlight = "TabLineSel" },
			italic = true,
		},
		duplicate_visible = {
			fg = { attribute = "fg", highlight = "TabLine" },
			bg = { attribute = "bg", highlight = "TabLine" },
			italic = true,
		},
		duplicate = {
			fg = { attribute = "fg", highlight = "TabLine" },
			bg = { attribute = "bg", highlight = "TabLine" },
			italic = true,
		},
		modified = {
			fg = { attribute = "fg", highlight = "TabLine" },
			bg = { attribute = "bg", highlight = "TabLine" },
		},
		modified_selected = {
			fg = { attribute = "fg", highlight = "Normal" },
			bg = { attribute = "bg", highlight = "Normal" },
		},
		modified_visible = {
			fg = { attribute = "fg", highlight = "TabLine" },
			bg = { attribute = "bg", highlight = "TabLine" },
		},
		separator = {
			fg = { attribute = "bg", highlight = "TabLine" },
			bg = { attribute = "bg", highlight = "TabLine" },
		},
		separator_selected = {
			fg = { attribute = "bg", highlight = "Normal" },
			bg = { attribute = "bg", highlight = "Normal" },
		},
		indicator_selected = {
			fg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
			bg = { attribute = "bg", highlight = "Normal" },
		},
	},
}

bufdel.setup {
	net = 'tabs',
	quit = true,
}

which_key.register({
	g = {
		name = "Go",
		b = { "<cmd>:BufferLinePick<CR>", "Go to buffer" }
	}
}, { mode = "n", noremap = true, prefix = "<leader>", silent = true })
