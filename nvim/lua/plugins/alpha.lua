return {
	'goolord/alpha-nvim',
	config = function ()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		-- dashboard.section.header.val = {
		-- 	"OUI"
		-- }
		dashboard.section.buttons.val = {
			dashboard.button("q", "X Quit Neovim", ":qa<CR>"),
			dashboard.button("f", "Find files", ":Telescope find_files<CR>"),
			dashboard.button("o", "Old files", ":Telescope oldfiles<CR>"),
		}
		alpha.setup(dashboard.opts)
	end
};
