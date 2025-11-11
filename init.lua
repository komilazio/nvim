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
-- vim.opt.cursorline = true
-- vim.opt.number = true
-- vim.opt.relativenumber = true
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
vim.opt.signcolumn = "no"
vim.g.mapleader = " "
vim.opt.winborder = "rounded"
vim.g.termguicolors = 1
vim.cmd("set list")
vim.cmd("set listchars+=tab:..,lead:.")

---------KEYMAPS---------
-- vim.keymap.set("n", "j", "jzz")
-- vim.keymap.set("n", "k", "kzz")
vim.keymap.set("n", "<Esc>", "<cmd>nohl<CR>")
vim.keymap.set("n", ";", ":")
-- make the buffer to occupy the entire window
vim.keymap.set("n", "<leader>k", "<cmd>only<CR>", { noremap = true, silent = true })
-- kill that current buffer
vim.keymap.set("n", "<C-k>", "<cmd>bdelete!<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>h", ":cd %:h<CR>", { noremap = true})

-- Set Compiler
-- vim.keymap.set("n", "<C-c>", ":set mp=", { noremap = true})
-- Run Compiler
-- vim.keymap.set("n", "<leader>r", ":make<CR>", { noremap = true, silent=true})

-- Tabs
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { silent = true, noremap = true})
vim.keymap.set("n", "<leader>tk", "<cmd>tabclose<CR>", { silent = true, noremap = true})
vim.keymap.set("n", "<leader>tl", "<cmd>tabnext<CR>", { silent = true, noremap = true})
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
vim.keymap.set("n", "<C-f>", function()
    local dir = vim.fn.input("Dir> ", vim.fn.expand("~") .. "/", "dir")
    if dir ~= "" then
        require("fzf-lua").files({ cwd = dir })
    else
        require("fzf-lua").files()
    end
end, { noremap = true, silent = true })

-- Find files from root directory
vim.keymap.set("n", "<C-/>", function()
    local dir = vim.fn.input("Dir> ", vim.fn.expand("/") .. "", "dir")
    if dir ~= "" then
        require("fzf-lua").files({ cwd = dir })
    else
        require("fzf-lua").files()
    end
end, { noremap = true, silent = true })

-- Find Buffers
vim.keymap.set("n", "<C-b>", "<cmd>FzfLua buffers<CR>", { noremap = true, silent = true })

-- GREP WORD
vim.keymap.set("n", "<C-g>", "<cmd>FzfLua grep<CR>", { noremap = true, silent = true })
-- GREP WORD IN PROJECT
vim.keymap.set("n", "<C-l>", "<cmd>FzfLua grep_project<CR>", { noremap = true, silent = true })

-- Run programs
vim.keymap.set("n", "<leader>r", ":T ", { noremap = true })

-- save file write to a root owned file
vim.api.nvim_create_user_command("W", function()
    vim.cmd("SudaWrite")
end, {})

-- Experimental
vim.api.nvim_create_user_command("T", function(opts)
    local cmd = opts.args ~= "" and opts.args or os.getenv("SHELL") or "bash"
    vim.cmd("belowright split | resize 20 | terminal " .. cmd)
end, {
nargs = "*",
desc = "Open terminal below and run command",
})

-- vim.api.nvim_create_user_command("T", function(opts)
--   -- Determine what command to run
--   local cmd
--   if opts.args == "make" then
--     -- Get the current 'makeprg' setting
--     cmd = vim.api.nvim_get_option_value("makeprg", { scope = "local" })
--   else
--     cmd = opts.args
--   end
--
--   -- Default to shell if no args
--   if cmd == "" then
--     cmd = os.getenv("SHELL") or "bash"
--   end
--
--   -- Open terminal split below and run command
--   vim.cmd("belowright split | resize 20 | terminal " .. cmd)
-- end, {
--   nargs = "*",
--   desc = "Open terminal below and run command (use :T make for makeprg)",
-- })

-- Highlight text for yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- FILE MANAGER (NETRW)
-- ==============================================================
local last_buffer = nil
vim.keymap.set("n", "<leader>f", function()
    local filetype = vim.bo.filetype

    if filetype == "netrw" then
        -- Go back to the last buffer if it exists and is valid
        if last_buffer and vim.api.nvim_buf_is_valid(last_buffer) then
            vim.api.nvim_set_current_buf(last_buffer)
        else
            vim.cmd("enew") -- fallback if last buffer isn't valid
        end
    else
        -- Save the current buffer number before opening netrw
        last_buffer = vim.api.nvim_get_current_buf()
        vim.cmd("Ex")
    end
end, { noremap = true, silent = true })
-- ==============================================================

-- Enable the LSPs server
vim.lsp.enable({
    -- 'lua-language-server',
    'ols',
    'elixirls',
    'gleamls',
})

vim.diagnostic.config({ virtual_text = true })

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { buffer = args.buf })
        vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, { buffer = args.buf })
        vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, { buffer = args.buf })
        vim.keymap.set('n', '<C-i>', vim.lsp.buf.signature_help, { buffer = args.buf })
    end,
})

require("config.lazy")
