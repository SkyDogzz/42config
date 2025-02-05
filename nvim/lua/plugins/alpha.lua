return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = {
      "Personnalized Neovim by Skydogzz",
    }
    dashboard.section.buttons.val = {
      dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
    }
    alpha.setup(dashboard.opts)
  end,
}
