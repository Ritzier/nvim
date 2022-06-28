local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

local M = {}

function M.default_mappings()
    keymap("i", "jk", "<ESC>", default_opts)
    keymap("t", "jk", "<C-\\><C-n>", default_opts)
    keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", default_opts)
    keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", default_opts)
    keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", default_opts)
    keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", default_opts)
    keymap("n", "<C-h>", "<C-w>h", default_opts)
    keymap("n", "<C-j>", "<C-w>j", default_opts)
    keymap("n", "<C-k>", "<C-w>k", default_opts)
    keymap("n", "<C-l>", "<C-w>l", default_opts)
    keymap("v", "<", "<gv", default_opts)
    keymap("v", ">", ">gv", default_opts)

    -- NvimTree
    keymap("n", "<C-n>", ":NvimTreeToggle<CR>", default_opts)

    -- Bufferline
    keymap("n", "<A-j>", ":BufferLineCycleNext<CR>", default_opts)
    keymap("n", "<A-k>", ":BufferLineCyclePrev<CR>", default_opts)
    keymap("n", "<A-S-j>", ":BufferLineMoveNext<CR>", default_opts)
    keymap("n", "<A-S-k>", ":BufferLineMovePrev<CR>", default_opts)
    -- EasyAlign
    keymap("n", "ga", ":'<,'>EasyAlign<CR>", default_opts)
    keymap("v", "ga", ":'<,'>EasyAlign<CR>", default_opts)

    -- Sniprun
    keymap("n", "<leader>sr", ":SnipRun<CR>", default_opts)
    keymap("v", "<leader>sr", ":'<,'>SnipRun<CR>", default_opts)
    keymap("n", "<leader>sc", ":SnipClose<CR>", default_opts)
    keymap("n", "<leader>si", ":SnipInfo<CR>", default_opts)

    -- Symbols Outline
    keymap("n", "<F3>", ":SymbolOutline<CR>", default_opts)
end



return M
