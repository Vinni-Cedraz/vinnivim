local cmd = vim.cmd

-- this one enables dap helptags
cmd([[autocmd BufEnter * silent! helptags ALL]])
cmd("command! Hello echo 'Hello, World!'")
cmd("nnoremap <silent> - :Hello<CR>")

-- the following autocommand executes :set suffixesadd=.c/.h everytime a .c/.h file is opened
vim.api.nvim_create_autocmd("BufRead", {
	pattern = "*.c,*.h",
	callback = function()
		vim.cmd("set suffixesadd=.c")
	end,
})

-- the following autocommand sets "., libs, and srcs/**" as path everytime a .c/.h file is opened
vim.api.nvim_create_autocmd("BufRead", {
	pattern = "*.c,*.h",
	callback = function()
		vim.cmd("set path+=.,libs,srcs/**")
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	callback = function()
		vim.cmd([[
      if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
	callback = function()
		vim.cmd("quit")
	end,
})
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 70 })
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.java" },
	callback = function()
		vim.lsp.codelens.refresh()
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd("echo 'Welcome, ' . $USER")
		vim.cmd("hi link illuminatedWord LspReferenceText")
	end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		local line_count = vim.api.nvim_buf_line_count(0)
		if line_count >= 5000 then
			vim.cmd("IlluminatePauseBuf")
		end
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.defer_fn(function()
		vim.cmd("echo 'Press <Ctrl + s> on normal mode to check whether copilot is enabled'")
		end, 3000)
		vim.defer_fn(function()
			vim.cmd("echo 'Press <Ctrl + right arrow> on insert mode to accept the grey text auto-suggestions from copilot'")
		end, 10000)
	end,
})
