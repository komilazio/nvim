--=========================================================
-- OPTIONS 
--=========================================================
local o = vim.o
o.background = "dark"
local opt = vim.opt
vim.cmd([[set guicursor="disable"]])

vim.g.mapleader = " "
-- opt.filetype = "on"
opt.wrap = false
opt.scrolloff = 10
opt.sidescrolloff = 8
opt.laststatus = 3
vim.g.netrw_keepdir=0
opt.number = false
opt.relativenumber = false
opt.signcolumn = "no"
opt.termguicolors = true
opt.cursorline = true
opt.equalalways = true

-- Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Visual settings
opt.showmatch = true
opt.cmdheight = 1
opt.showmode = false
opt.pumheight = 10
opt.pumblend = 10
opt.winblend = 0
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 2
opt.confirm = true
opt.ruler = true
opt.virtualedit = "block"
opt.winminwidth = 5
vim.opt.winborder = "rounded"

-- File handling
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
opt.undolevels = 10000
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.updatetime = 100
opt.timeoutlen = vim.g.vscode and 1000 or 100
opt.ttimeoutlen = 0
opt.autoread = true
opt.autowrite = true

-- Behavior settings
opt.hidden = true
opt.errorbells = false
opt.backspace = "indent,eol,start"
opt.autochdir = false
opt.iskeyword:append("-")
opt.path:append("**")
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.modifiable = true
opt.encoding = "UTF-8"

-- Split behavior
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"

-- Command-line completion
opt.wildmenu = true
opt.wildmode = "longest:full,full"
opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

-- Better diff options
opt.diffopt:append("linematch:60")

-- Performance improvements
opt.redrawtime = 10000
opt.maxmempattern = 20000

-- Folding settings
opt.smoothscroll = true
vim.wo.foldmethod = "expr"
opt.foldlevel = 99
opt.formatoptions = "jcroqlnt"
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"

-- Create undo directory if it doesn't exist
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p")
end

vim.g.autoformat = true
vim.g.trouble_lualine = true

-- ===================================================
-- NEOVIDE SETTINGS
-- ===================================================
vim.o.guifont = "UbuntuMono Nerd Font:h10"
if vim.g.neovide == true then
    vim.api.nvim_set_keymap("n", "<C-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>", { silent = true })
    vim.api.nvim_set_keymap("n", "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>", { silent = true })
    vim.api.nvim_set_keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
end
vim.g.neovide_hide_mouse_when_typing = true
-- vim.g.neovide_progress_bar_enabled = true
-- vim.g.neovide_progress_bar_height = 5.0
-- vim.g.neovide_progress_bar_animation_speed = 200.0
vim.g.neovide_progress_bar_hide_delay = 0.1
-- vim.g.neovide_cursor_vfx_mode = "sonicboom"
vim.g.neovide_cursor_trail_size = 0.1
vim.g.neovide_cursor_animation_length = 0.1
vim.g.neovide_scroll_animation_length = 0.1
vim.g.neovide_position_animation_length = 0.1
vim.g.neovide_scroll_animation_far_lines = 1
-- vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_cursor_hack = true

--=========================================================
-- KEYMAPS 
--=========================================================
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- escape terminal mode
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], { noremap = true, silent = true})

-- Clear search patterns
map("n", "<ESC>", ":nohl<CR>", {silent = true})

-- mapping character deleting
map("n", "<Alt>b", "<Del>")
-- mapping vertical split
map("n", "<leader>v", ":vs<CR>", {silent = true})

-- Better indenting (stay in visual mode)
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Formating tables in markdown
--This is the best command i have ever used in neovim: !column -t -s '|' -o '|'
map("v", "<leader>\\", ":'<,'>!column -t -s '|' -o '|'<CR>", { silent = true })

-- Change directory to the current directory
map("n", "<leader>h", ":cd %:h<CR>", { noremap = true})

-- Smart search navigation (n always goes forward, N always backward)
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Keeps the cursor in the middle (This is so nice.....) When moving up and down
map("n", "j", "jzz",   { noremap = true, silent = true })
map("n", "k", "kzz",   { noremap = true, silent = true })

-- Auto-close pairs (simple, no plugin needed)
map("i", "`", "``<left>")
map("i", '"', '""<left>')
map("i", "(", "()<left>")
map("i", "[", "[]<left>")
map("i", "{", "{}<left>")
-- map("i", "<", "<><left>")

-- Better paste (doesn't replace clipboard with deleted text)
map("v", "p", '"_dP', opts)
map("n", "P", '"+p')
map("v", "P", '"+p')
map("n", "Y", '"+Y')
map("v", "Y", '"+y')

-- Easy way to get in to command mode.
map("n", ";", ":", { desc = "Quick command mode" })

-- ═══════════════════════════════════════════════════════════
-- WINDOW MANAGEMENT (splitting and navigation)
-- ═══════════════════════════════════════════════════════════
map("n", "<leader>wl", "<C-w>l")
map("n", "<leader>wh", "<C-w>h")
map("n", "<leader>wk", "<C-w>k")
map("n", "<leader>wj", "<C-w>j")

-- ═══════════════════════════════════════════════════════════
-- TAB MANAGEMENT
-- ═══════════════════════════════════════════════════════════
map("n", "<C-t>", ":tabnew<CR>", {silent = true})
map("n", "<C-h>", ":tabprevious<CR>", {silent = true})
map("n", "<C-l>", ":tabnext<CR>", {silent = true})

map("t", "<C-h>", "<C-\\><C-N>:tabprevious<CR>", {silent = true})
map("t", "<C-l>", "<C-\\><C-N>:tabnext<CR>", {silent = true})

map("n", "<leader>k", "<cmd>bdelete!<CR>", { desc = "Delete Current Buffer", silent = true})
map("n", "<leader>o", "<cmd>only<CR>", { desc = "Delete Current Buffer", silent = true})

-- move stuff up or down and auto indent
map("v", "J", ":move '>+1<CR>gv=gv", { desc = "Move Block Down" })
map("v", "K", ":move '<-2<CR>gv=gv", { desc = "Move Block Up" })

-- Quick commenting
map("n", "<leader>c;", "<cmd>normal gcc<cr>", { desc = "Add Comment To Current Line" })
map("v", "<leader>c;", "<cmd>normal gcc<cr>", { desc = "Add Comment To Current Line" })

-- Flash (Quick jumps)
map({ "n", "x", "o"}, "s", function() require("flash").jump() end, { desc = "Flash"})

--====================================================================
--RUN PROGRAMS AND COMMANDS 
--====================================================================

-- Run programs and commands
vim.keymap.set("n", "<leader>r", ":Command<Space>", { noremap = true })

-- Command completion helper
local function command_complete(arglead, cmdline, cursorpos)
    local args = vim.split(cmdline, "%s+")

    -- first word →  shell command
    if #args <= 2 then
        return vim.fn.getcompletion(arglead, "shellcmd")
    end

    -- everything after →  files
    return vim.fn.getcompletion(arglead, "file")
end

--====================================================================
-- MANAGE PLUGINS
--====================================================================

vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/norcalli/nvim-colorizer.lua",
    "https://github.com/folke/flash.nvim",
    "https://github.com/lambdalisue/vim-suda",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/saghen/blink.cmp",
    "https://github.com/ibhagwan/fzf-lua",
    "https://github.com/sindrets/winshift.nvim",
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/folke/which-key.nvim",
    "https://github.com/nvim-mini/mini.icons",
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/mvllow/modes.nvim",
    "https://github.com/MeanderingProgrammer/render-markdown.nvim",
    -- "https://github.com/nvim-mini/mini.statusline",
    -- "https://github.com/nvim-tree/nvim-web-devicons",
    -- "https://github.com/rmagatti/auto-session",
})

--Mini Icons
require("mini.icons").setup()

-- Lualine 
require('lualine').setup()

-- NOTE(lazio): this is temporary, while i was trying out the colorsscheme
-- vim.opt.rtp:append(vim.fn.stdpath("config") .. "/vsassist.new")

-- Color Theme
vim.cmd("colorscheme crusx-paper")

-- Colorizer
require("colorizer").setup()

-- Which key
require("which-key").setup({ })
-- Winshift
require("winshift").setup()
-- A simple helper to run command
vim.api.nvim_create_user_command("Command", function(opts)
    local cmd = opts.args ~= "" and opts.args or os.getenv("SHELL") or "bash"
    vim.cmd("belowright new")         -- Create a new horizontal split
    vim.cmd("resize 20")              -- Set height
    vim.cmd("WinShift down")         -- WinShift plugin to have span the window full width even if there are already split windows.
    vim.cmd("terminal " .. cmd)
end, {
nargs = "*",
complete = command_complete,
desc = "Open terminal below and run command",
})

require("modes").setup({
    colors = {
        bg = "", -- Optional bg param, defaults to Normal hl group
        copy = "#f5c359",
        delete = "#c75c6a",
        change = "#c75c6a", -- Optional param, defaults to delete
        format = "#c79585",
        insert = "#54A004",
        replace = "#245361",
        select = "#A945D8", -- Optional param, defaults to visual
        visual = "#A945D8", 
    },

    line_opacity = 0.1,
})

require('nvim-treesitter').setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}


require('render-markdown').setup({
    completions = { blink = { enabled = true } },
    -- Useful context to have when evaluating values.
    -- | level    | the number of '#' in the heading marker         |
    -- | sections | for each level how deeply nested the heading is |
    heading = {
        -- Turn on / off heading icon & background rendering.
        enabled = true,
        backgrounds = {
            'none',
            'none',
            'none',
            'none',
            'none',
            'none',
        },
        custom = {},
    },
    code = {
        enabled = false,
    },
})

-- FZF-LUA
local file_win_opts = {
    fullscreen = true,
    border = "none",
    preview = {
        layout = "vertical",
        vertical = "up:70%",
        border = "none"
    },
}
require("fzf-lua").setup({
    defaults = {
        formatter = "path.filename_first",
    },
    files = { 
        winopts = file_win_opts 
    },
    buffers = { winopts = file_win_opts },
    grep = { winopts = file_win_opts },
    oldfiles = { winopts = file_win_opts },
    git = {
        files = {
            winopts = file_win_opts,
        },
    }
})
map("n", "<leader>p", "<cmd>FzfLua files<CR>", { desc="Find files in the current working directory", noremap = true, silent = true})
map("n", "<leader>f", "<cmd>lua FzfLua.files({ cwd = '~/' })<CR>", { desc="Find files from the home directory", noremap = true, silent = true})
map("n", "<leader>/", "<cmd>lua FzfLua.files({ cwd = '/' })<CR>",  { desc="Find files the system directory", noremap = true, silent = true})
-- Find Buffers
map("n", "<leader>b", "<cmd>FzfLua buffers<CR>", { noremap = true, silent = true })
-- GREP WORD
map("n", "<C-g>", "<cmd>FzfLua grep<CR>", { noremap = true, silent = true })
-- GREP WORD IN PROJECT
map("n", "<leader>l", "<cmd>FzfLua grep_project<CR>", { noremap = true, silent = true })

-- Blink (for autocomplete and suggestions)
require("blink.cmp").setup({
    keymap = {
        preset = 'default',
        -- preset = 'enter',
        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<C-j>'] = { 'select_next', 'fallback' },
        ['<Tab>'] = { 'accept', 'fallback' },
    },
    appearance = {
        nerd_font_variant = 'normal'
    },
    completion = {
        ghost_text = {
            enabled = true
        },
        menu = {
            auto_show = false
        }
    },
    signature = {
        enabled = true,
        window = { border = 'none' }
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', },
    },
    fuzzy = { implementation = "lua" },
})

-- Mason
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})


-- Suda
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

-- Oil file manager
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

require("oil").setup({
    default_file_explorer = true,
    columns = {
        "icon",
        "permissions",
        "size",
        -- "mtime",
    },
    buf_options = {
        buflisted = false,
        bufhidden = "hide",
    },
    win_options = {
        wrap = false,
        signcolumn = "no",
        cursorcolumn = false,
        foldcolumn = "0",
        spell = false,
        list = false,
        conceallevel = 3,
        concealcursor = "nvic",
    },
    delete_to_trash = true,
    skip_confirm_for_simple_edits = false,
    prompt_save_on_select_new_entry = true,
    cleanup_delay_ms = 2000,
    lsp_file_methods = {
        enabled = true,
        timeout_ms = 1000,
        autosave_changes = false,
    },
    constrain_cursor = "editable",
    watch_for_changes = false,
    keymaps = {
        ["g?"] = { "actions.show_help", mode = "n" },
        ["<CR>"] = "actions.select",
        ["<C-s>"] = { "actions.select", opts = { vertical = true } },
        ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
        ["<C-t>"] = { "actions.select", opts = { tab = true } },
        ["<C-p>"] = "actions.preview",
        -- ["<q>"] = { "actions.close", mode = "n" },
        ["<C-S-l>"] = "actions.refresh",
        ["-"] = { "actions.parent", mode = "n" },
        ["_"] = { "actions.open_cwd", mode = "n" },
        ["`"] = { "actions.cd", mode = "n" },
        ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
        ["gs"] = { "actions.change_sort", mode = "n" },
        ["gx"] = "actions.open_external",
        ["g."] = { "actions.toggle_hidden", mode = "n" },
        ["g\\"] = { "actions.toggle_trash", mode = "n" },
    },
    use_default_keymaps = true,
    view_options = {
        show_hidden = true,
        is_hidden_file = function(name, bufnr)
            local m = name:match("^%.")
            return m ~= nil
        end,
        is_always_hidden = function(name, bufnr)
            return false
        end,
        natural_order = "fast",
        case_insensitive = false,
        sort = {
            { "type", "asc" },
            { "name", "asc" },
        },
        highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
            return nil
        end,
    },
    extra_scp_args = {},
    git = {
        -- Return true to automatically git add/mv/rm files
        add = function(path)
            return false
        end,
        mv = function(src_path, dest_path)
            return false
        end,
        rm = function(path)
            return false
        end,
    },
    float = {
        padding = 2,
        max_width = 0,
        max_height = 0,
        border = nil,
        win_options = {
            winblend = 0,
        },
        get_win_title = nil,
        preview_split = "auto",
        override = function(conf)
            return conf
        end,
    },
    preview_win = {
        update_on_cursor_moved = true,
        preview_method = "fast_scratch",
        disable_preview = function(filename)
            return false
        end,
        win_options = {},
    },
    confirmation = {
        max_width = 0.9,
        min_width = { 40, 0.4 },
        width = nil,
        max_height = 0.9,
        min_height = { 5, 0.1 },
        height = nil,
        border = nil,
        win_options = {
            winblend = 0,
        },
    },
    progress = {
        max_width = 0.9,
        min_width = { 40, 0.4 },
        width = nil,
        max_height = { 10, 0.9 },
        min_height = { 5, 0.1 },
        height = nil,
        border = nil,
        minimized_border = "none",
        win_options = {
            winblend = 0,
        },
    },
    ssh = {
        border = nil,
    },
    keymaps_help = {
        border = nil,
    },
})
map("n", "<leader>e", "<cmd>Oil<CR>")

-- Enable the LSPs server
vim.lsp.enable({
    "rust_analyzer",
    "ols",
    "luals",
    "clangd",
})

vim.diagnostic.config({ virtual_text = true })
vim.keymap.set("n", "<leader>m", function()
    vim.diagnostic.open_float(nil, { focus = false })
end, {desc = "View Diagnostics Error",
noremap = true})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        vim.keymap.set('n', '<leader>gd',  vim.lsp.buf.definition,     { buffer = args.buf })
        vim.keymap.set('n', '<leader>gD',  vim.lsp.buf.declaration,    { buffer = args.buf })
        vim.keymap.set('n', '<leader>gi',  vim.lsp.buf.implementation, { buffer = args.buf })
        vim.keymap.set('i', '<C-l>',       vim.lsp.buf.signature_help, { buffer = args.buf })
    end,
})
