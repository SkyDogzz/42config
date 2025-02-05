return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("bufferline").setup({
			options = {
				numbers = "none",
				close_command = "bdelete! %d",
				right_mouse_command = "bdelete! %d",
				left_mouse_command = "buffer %d",
				middle_mouse_command = nil,
				indicator = {
					icon = '▎',
					style = 'icon',
				},
				buffer_close_icon = '',
				modified_icon = '●',
				close_icon = '',
				left_trunc_marker = '',
				right_trunc_marker = '',
				max_name_length = 18,
				max_prefix_length = 15,
				tab_size = 18,
				diagnostics = false,
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				enforce_regular_tabs = false,
				always_show_bufferline = true,
			},
		})
	end,
}
