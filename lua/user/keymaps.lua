local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }
-- KEYMAPPINGS [VIEW ALL THE DEFAULTS BY PRESSING <LEADER>LK]
keymap('n', '<leader>1', ':colorscheme system76<CR>', opts)
keymap('n', '<leader>2', ':colorscheme gruvbox<CR>', opts)
keymap('n', '<leader>3', ':colorscheme terafox<CR>', opts)
keymap('n', '<leader>t', ':UndotreeToggle<CR>', opts)
vim.cmd [[autocmd BufEnter * silent! helptags ALL]]  -- this one enables dap helptags
keymap('n', '<F7>', ':lua require"dap".step_over()<CR>', opts)
keymap('n', '<F8>', ':lua require"dap".step_into()<CR>', opts)
keymap('n', 'ff', ':Telescope find_files cwd=~/ <CR>', opts)
keymap('i', 'jj', '<Esc>', opts)
keymap("n", "<S-l>", ":bnext<CR>", opts)   -- Navigate buffers
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap('n', '<S-w>', ':w<CR>', opts)
keymap('n', '<S-x>', ':x<CR>', opts)
keymap('n', '<S-r>', ':redo<CR>', opts)
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)  -- Close current buffer
keymap('n', '<C-q>', ':qa!<cr>', opts)

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)


-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)        --- indent a bunch of stuf together!!
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- DAP
keymap("n", "<F5>", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<F6>", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
