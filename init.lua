-- vim.opt.guicursor = ''
vim.opt.expandtab = true
vim.opt.showmode = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.sidescrolloff = 3
vim.opt.scrolloff = 9
vim.opt.swapfile = false
vim.opt.breakindent = true
vim.opt.ignorecase = true
vim.opt.wrap = true
vim.opt.incsearch = true
vim.opt.cursorline = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.laststatus = 3
vim.opt.splitbelow = true
vim.opt.undofile = true
vim.opt.virtualedit = "all"
vim.opt.smartindent = true
vim.opt.updatetime = 80
vim.opt.timeoutlen = 80
vim.opt.autochdir = false
vim.opt.showtabline = 1
vim.opt.signcolumn = "yes"
vim.g.mapleader = " "
vim.opt.winborder = "rounded"
vim.g.termguicolors = 1
vim.cmd("set list")
vim.cmd("set listchars+=tab:..,lead:.")

---------Neovide Stuffs--------------
-- vim.o.guifont = "MartianMono Nerd Font Propo:h12"
vim.o.guifont = "Hurmit Nerd Font:h11"
if vim.g.neovide == true then
    vim.api.nvim_set_keymap("n", "<C-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>", { silent = true })
    vim.api.nvim_set_keymap("n", "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>", { silent = true })
    vim.api.nvim_set_keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
end
vim.g.neovide_cursor_animation_length = 0.0
vim.g.neovide_scroll_animation_length = 0.0
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_cursor_hack = true
vim.g.neovide_hide_mouse_when_typing = true

-- Use Ctrl+V to paste from system clipboard in insert and normal mode
vim.keymap.set('i', '<C-p>', '<C-r>+', { noremap = true, silent = true })
vim.keymap.set('v', '<C-p>', '<C-r>+', { noremap = true, silent = true })
vim.keymap.set('n', '<C-p>', '"+p',    { noremap = true, silent = true })
vim.keymap.set('c', '<C-p>', '<C-r>+', { noremap = true }) -- in command mode
--------------------------------------------------------------------------

---------KEYMAPS---------
-- vim.keymap.set("n", "j", "jzz") this is so good
-- vim.keymap.set("n", "k", "kzz")
vim.keymap.set("n", "<Esc>", "<cmd>nohl<CR>")
vim.keymap.set("n", ";", ":")
-- make the buffer to occupy the entire window
vim.keymap.set("n", "<leader>k", "<cmd>only<CR>", { noremap = true, silent = true })
-- kill that current buffer
vim.keymap.set("n", "<C-k>", "<cmd>bdelete!<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "jk", "<Esc>",                { noremap = true, silent = true })
vim.keymap.set("n", "<leader>h", ":cd %:h<CR>",   { noremap = true})

-- Tabs
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>",      { silent = true, noremap = true})
vim.keymap.set("n", "<leader>tk", "<cmd>tabclose<CR>",    { silent = true, noremap = true})
vim.keymap.set("n", "<leader>tl", "<cmd>tabnext<CR>",     { silent = true, noremap = true})
vim.keymap.set("n", "<leader>th", "<cmd>tabprevious<CR>", { silent = true, noremap = true})

-- Easy Resizing of windows
vim.keymap.set("n", "<C-Down>", "<C-w>-")
vim.keymap.set("n", "<C-Up>", "<C-w>+")
vim.keymap.set("n", "<C-Left>", "<C-w><")
vim.keymap.set("n", "<C-Right>", "<C-w>>")
vim.keymap.set("n", "<leader>wl", "<C-w>l")
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wj", "<C-w>j")

-- move stuff up or down and auto indent
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in the middle.
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- yank to another register
vim.keymap.set("n", "P", '"+p')
vim.keymap.set("v", "P", '"+p')
vim.keymap.set("n", "Y", '"+Y')
vim.keymap.set("v", "Y", '"+y')

-- Find files from home directory
vim.keymap.set("n", "<leader>f", function()
    local dir = vim.fn.input("dir_name> ")
    if dir ~= "" then
        require("fzf-lua").files({ cwd = dir })
    else
        require("fzf-lua").files()
    end
end, { desc="Find files from home directory", noremap = true, silent = true})

-- Goto a Directory
vim.keymap.set("n", "<C-f>", ":find ", {desc = "Goto a particular directory", noremap = true})

-- terminal
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], { noremap = true, silent = true})
-- vim.keymap.set('n', "<C-SPACE>", "<cmd>terminal<CR>", { noremap = true, silent = true})

-- Find Buffers
vim.keymap.set("n", "<leader>b", "<cmd>FzfLua buffers<CR>", { noremap = true, silent = true })

-- GREP WORD
vim.keymap.set("n", "<C-g>", "<cmd>FzfLua grep<CR>", { noremap = true, silent = true })

-- GREP WORD IN PROJECT
vim.keymap.set("n", "<leader>l", "<cmd>FzfLua grep_project<CR>", { noremap = true, silent = true })

-- Run programs
-- vim.keymap.set("n", "<leader>r", ":Command ", { noremap = true })
vim.keymap.set("n", "<leader>r", "<cmd>terminal<CR>", { noremap = true })

-- save file write to a root owned file
vim.api.nvim_create_user_command("W", function()
    vim.cmd("SudaWrite")
end, {})

-- Experimental
vim.api.nvim_create_user_command("Command", function(opts)
    local cmd = opts.args ~= "" and opts.args or os.getenv("SHELL") or "bash"
    vim.cmd("wincmd J")               -- Go to bottom
    vim.cmd("belowright new")         -- Create a new horizontal split
    vim.cmd("resize 20")              -- Set height
    vim.cmd("terminal " .. cmd)
end, {
nargs = "*",
desc = "Open terminal below and run command",
})

-- Oil
vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>", { noremap = true, silent = true })

vim.api.nvim_create_autocmd("User", {
    pattern = { "OilEnter", "OilDirChanged" },
    callback = function(event)
        vim.defer_fn(function()
            local oil = require("oil")
            local dir = oil.get_current_dir()
            if dir then
                vim.cmd("lcd " .. dir)
            end
        end, 20) -- delay a few ms so Oil finishes updating
    end,
})

-- Highlight text for yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Enable the LSPs server
vim.lsp.enable({
    -- 'lua-language-server',
    'ols',
    'zls',
    'luals',
    -- 'elixirls',
    -- 'gleamls',
})

vim.diagnostic.config({ virtual_text = true })
vim.keymap.set("n", "<leader>m", function()
    vim.diagnostic.open_float(nil, { focus = false })
    end, {desc = "View Diagnostics Error",
noremap = true})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition,     { buffer = args.buf })
        vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration,    { buffer = args.buf })
        vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, { buffer = args.buf })
        vim.keymap.set('i', '<Cl>',       vim.lsp.buf.signature_help, { buffer = args.buf })
    end,
})

-- Start plugins here.....
require("config.lazy")

-- Personal theme settings
vim.api.nvim_set_hl(0, "FloatBorder",        { bg = "#03271B"})
vim.api.nvim_set_hl(0, "FloatTitle",         { bg = "#03271B"})
vim.api.nvim_set_hl(0, "FloatFooter",        { bg = "#03271B"})
vim.api.nvim_set_hl(0, "Whitespace",         { fg = "#1F1E1E" })
vim.api.nvim_set_hl(0, "Normal",             { bg = "#03271B" })
vim.api.nvim_set_hl(0, "NormalFloat",        { bg = "#03271B" })
vim.api.nvim_set_hl(0, "signColumn",         { bg = "#03271B" })
vim.api.nvim_set_hl(0, "WinSeparator",       { fg = "#73909E" })
vim.api.nvim_set_hl(0, "Comment",            { fg = "#73909E" })
vim.api.nvim_set_hl(0, "Pmenu",              { fg = "#73909E" })
vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = "#03271B" })

-- Mini_Statusline
vim.api.nvim_set_hl(0, "StatusLine",                { bg = "none" })
vim.api.nvim_set_hl(0, "MiniStatuslineModeCommand", { bg = "#223A70"})
vim.api.nvim_set_hl(0, "MiniStatuslineModeVisual",  { bg = "#C4693D"})
-- vim.api.nvim_set_hl(0, "StatusLineNC",              { bg = "#000000" })
-- vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal",  { bg = "#6F2929" })
-- vim.api.nvim_set_hl(0, "MiniStatuslineModeInsert",  { bg = "#1E6F54"})
-- vim.api.nvim_set_hl(0, "MiniStatuslineFilename",    { bg = "#7788AA"})
-- vim.api.nvim_set_hl(0, "MiniStatuslineFileinfo",    { bg = "#abab77"})
