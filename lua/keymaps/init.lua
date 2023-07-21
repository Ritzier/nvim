local M = {}

local wk = require("which-key")

wk.register({
    -- ["<ESC>"] = {},
    ["<C-h>"] = { "<C-w>h", "Focus left" },
    ["<C-j>"] = { "<C-w>l", "Focus down" },
    ["<C-k>"] = { "<C-w>k", "Focus up" },
    ["<C-l>"] = { "<C-w>l", "Focus right" },
    ["<C-n>"] = { ":NvimTreeToggle<CR>", "NvimTreeToggle" },
    ["<A-j>"] = { ":BufferLineCycleNext<CR>", "Focus Next Buffer" },
    ["<A-k>"] = { ":BufferLineCyclePrev<CR>", "Focus Prev Buffer" },
    ["<A-S-j>"] = { ":BufferLineMoveNext<CR>", "Move Next Buffer" },
    ["<A-S-k>"] = { ":BufferLineMovePrev<CR>", "Move Prev Buffer" },
    ["<C-x>"] = { ":BufDel<CR>", "Close buffer" },
    ["<C-S-x>"] = { ":BufDelAll<CR>", "Close all buffer" },
    ["<C-s>"] = { ":w<CR>", "Write buffer" },

    -- Plugin: ToggleTerm
    ["<C-\\>"] = { ":ToggleTerm<CR>", "ToggleTerm" },
}, { mode = "n", prefix = "", silent = true })

wk.register({
    ["<"] = { "<gv", "Decrease Indent" },
    [">"] = { ">gv", "Increase Indent" },
    ["<A-j>"] = { ":m '>+1<CR>gv=gv'", "Move line down" },
    ["<A-k>"] = { ":m '>-2<CR>gv=gv'", "Move line up" },
    ["ga"] = { ":'<, '>EasyAlign<CR>", "EasyAlign" },
    ["e"] = { "<cmd>lua require('dapui').eval()<CR>", "Evaluate" },
    ["<space>v"] = { "<cmd>GuardFmt<CR>", "Formatter" },
}, { mode = "v", prefix = "", silent = true })

wk.register({
    ["<C-h>"] = { "<C-\\><C-n><C-w>h", "Focus left" },
    ["<C-j>"] = { "<C-\\><C-n><C-w>j", "Focus down" },
    ["<C-k>"] = { "<C-\\><C-n><C-w>k", "Focus up" },
    ["<C-l>"] = { "<C-\\><C-n><C-w>l", "Focus right" },
    ["<Esc>"] = { "<C-\\><C-n>", "" },
}, { mode = "t", prefix = "", silent = true })

wk.register({
    ["h"] = {
        name = "Hop",
    },

    ["o"] = {
        name = "OverSeer",
        o = { "<cmd>OverseerToggle<CR>", "Overseer Toggle" },
        b = { ":OverseerBuild<CR>", "Overseer Build" },
        c = { ":OverseerClearCache<CR>", "Overseer Clear Cache" },
        i = { ":OverseerInfo<CR>", "Overseer Info" },
        r = { ":OverseerRun<CR>", "Overseer Run" },
        R = { ":OverseerRunCmd<CR>", "Overseer Run CMD" },
        q = { ":OverseerQuickAction<CR>", "Overseer Quick Action" },
    },
    ["t"] = {
        name = "Telescope",
        t = { "<cmd>Telescope<CR>", "Telescope" },
        l = { "<cmd>Telescope live_grep<CR>", "Live Grep" },
        f = { "<cmd>Telescope find_files<CR>", "Find Files" },
    },

    ["v"] = { ":lua Toggle_venn()<CR>", "Toggle Venn" },

    ["c"] = {
        name = "Color",
        c = { ":CccHighlighterToggle<CR>", "Highlighter Toggle" },
        v = { ":CccCovert<CR>", "Convert" },
        p = { ":CccPick<CR>", "Pick" },
    },
    ["f"] = { "<cmd>GuardFmt<CR>", "Formatter" },
}, { mode = "n", prefix = "<leader>", silent = true })

wk.register({

}, { mode = "n", prefix = "<space>", silent = true })

return M
