return {
	'nvim-treesitter/nvim-treesitter',
	'windwp/nvim-ts-autotag',
	'HiPhish/rainbow-delimiters.nvim',
	run = ':TSUpdate',
	config = function ()
		require("nvim-treesitter").setup({
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false
			},
			require ('rainbow-delimiters').setup({
				strategy = {
					[''] = require ('rainbow-delimiters').strategy['global'],
					vim = require ('rainbow-delimiters').strategy['local'],
				},
				query = {
					[''] = 'rainbow-delimiters',
					lua = 'rainbow-blocks',
				},
				priority = {
					[''] = 110,
					lua = 210,
				},
				highlight = {
					'RainbowDelimiterRed',
					'RainbowDelimiterYellow',
					'RainbowDelimiterBlue',
					'RainbowDelimiterOrange',
					'RainbowDelimiterGreen',
					'RainbowDelimiterViolet',
					'RainbowDelimiterCyan',
				},
			}),
			pairs = {
				enable = true,
				disable = {},
				highlight_pair_events = {},
				highlight_self = false,
				goto_right_end = false,
				fallback_cmd_normal = "call matchit#Match_wrapper('',1,'n')",
				keymaps = {
					goto_partner = "<leader>%",
					delete_balanced = "X",
				},
				delete_balanced = {
					only_on_first_char = false,
					fallback_cmd_normal = nil,
					longest_partner = false,

				}
			},
		})
		require('nvim-ts-autotag').setup({
			opts = {

				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false
			},

			per_filetype = {
				["html"] = {
					enable_close = false
				}
			}
		})
	end,
}
