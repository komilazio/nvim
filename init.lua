-- vim.opt.guicursor = ''
vim.opt.expandtab = true
vim.opt.showmode = false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.sidescrolloff = 3
vim.opt.scrolloff = 3
vim.opt.swapfile = false
vim.opt.breakindent = true
vim.opt.ignorecase = true
vim.opt.wrap = false
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
vim.opt.autochdir = true
vim.opt.showtabline = 1
vim.opt.signcolumn = "no"
vim.g.mapleader = " "
vim.opt.winborder = "rounded"
vim.g.termguicolors = 1
vim.cmd("set list")
-- vim.cmd("set listchars=space:.")

---------KEYMAPS---------
vim.keymap.set("n", "j", "jzz")
vim.keymap.set("n", "k", "kzz")
vim.keymap.set("n", "<Esc>", "<cmd>nohl<CR>")
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", "<C-k>", "<cmd>only<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })

-- Easy Resizing of windows
vim.keymap.set("n", "<C-Down>", "<C-w>-")
vim.keymap.set("n", "<C-Up>", "<C-w>+")
vim.keymap.set("n", "<C-Left>", "<C-w><")
vim.keymap.set("n", "<C-Right>", "<C-w>>")

vim.keymap.set("n", "<leader>wl", "<C-w>l")
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wj", "<C-w>j")

--- move stuff up or down and auto indent
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

-- Find files
vim.keymap.set("n", "<C-f>", function()
  local dir = vim.fn.input("Dir> ", vim.fn.expand("~") .. "/", "dir")
  if dir ~= "" then
    require("fzf-lua").files({ cwd = dir })
  else
    require("fzf-lua").files()
  end
end, { noremap = true, silent = true })
-----
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

-- Experimental
vim.keymap.set("n", "<C-t>", ":!", { noremap = true })

-- save file write to a root owned file
vim.api.nvim_create_user_command("W", function()
  vim.cmd("SudaWrite")
end, {})

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
vim.keymap.set("n", "<leader>e", function()
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
