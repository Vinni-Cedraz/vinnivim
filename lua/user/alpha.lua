local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	[[]],
	[[]],
	[[]],
	[[]],
	[[  _    _______   ___   _______    ________  ___ ]],
	[[ | |  / /  _/ | / / | / /  _/ |  / /  _/  |/  / ]],
	[[ | | / // //  |/ /  |/ // / | | / // // /|_/ /  ]],
	[[ | |/ // // /|  / /|  // /  | |/ // // /  / /   ]],
	[[ |___/___/_/ |_/_/ |_/___/  |___/___/_/  /_/    ]],
	[[]],
	[[]],
	[[               THIN, LIGHT, FAST!              ]],
	[[]],
}
dashboard.section.buttons.val = {
	dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", " " .. " Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", " " .. " Config", ":e ~/.config/nvim/lua/user/options.lua<CR>"),
	dashboard.button("q", " " .. " Quit", ":qa<CR>"),
}

dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
