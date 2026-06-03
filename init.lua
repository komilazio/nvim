-- Automatically start a server for nvr
-- if vim.fn.empty(vim.v.servername) > 0 then
--       vim.fn.serverstart(vim.fn.stdpath("cache") .. "/nvim-server")
-- end
-- vim.g.nvim_remote_open = "tab"

-- creates somne fancy tabs [n] bufname
-- function _G.MyTabLine()
--     local s = ""
--
--     for i = 1, vim.fn.tabpagenr("$") do
--         local winnr = vim.fn.tabpagewinnr(i)
--         local buflist = vim.fn.tabpagebuflist(i)
--         local bufnr = buflist[winnr]
--
--         local bufname = vim.fn.bufname(bufnr)
--
--         -- current working directory for this tab
--         local cwd = vim.fn.getcwd(-1, i)
--         cwd = vim.fn.fnamemodify(cwd, ":~")
--
--         if bufname == "" then
--             bufname = "[-]"
--         else
--             bufname = vim.fn.fnamemodify(bufname, ":t")
--         end
--
--         if i == vim.fn.tabpagenr() then
--             s = s .. "%#TabLineSel#"
--         else
--             s = s .. "%#TabLine#"
--         end
--
--         s = s .. " [" .. i .. "] "
--         -- s = s .. cwd .. "/" .. bufname .. " "
--         s = s .. cwd .. " "
--     end
--
--     s = s .. "%#TabLineFill#"
--
--     return s
-- end
-- vim.opt.tabline = "%!v:lua.MyTabLine()"
--
--
--
--
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.b.table_mode_active = true
        vim.cmd("silent! TableModeEnable")
    end,
})

vim.keymap.set('n', '<C-=>', ":let g:neovide_scale_factor = g:neovide_scale_factor + 0.1<CR>")
vim.keymap.set('n', '<C-->', ":let g:neovide_scale_factor = g:neovide_scale_factor - 0.1<CR>")
vim.keymap.set('n', '<C-0>', ":let g:neovide_scale_factor = 1<CR>")

vim.g.neovide_scroll_animation_length = 0.1
vim.g.neovide_cursor_animation_length = 0.005
vim.g.neovide_cursor_vfx_mode = "railgun"

vim.opt.timeout = true
vim.opt.timeoutlen = 50
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 1

vim.g.mapleader = " "
vim.o.winborder = "rounded"
vim.opt.laststatus = 3
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.showmode = false
vim.opt.list = true
vim.opt.smoothscroll = true
vim.opt.listchars:append({space = '.'})
vim.opt.shortmess:append("FW")
vim.opt.showcmd = false
vim.opt.showtabline = 0
vim.opt.cursorline = false
vim.opt.scrollback = 1000000
vim.opt.scrolloff = 999999
vim.opt.termguicolors = true
vim.opt.expandtab = true
vim.opt.guifont = "UbuntuMono Nerd Font:h11.5"
vim.opt.statuscolumn = "%s%l "
vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.virtualedit = "all"
-- vim.opt.colorcolumn = "80"
vim.opt.wrap = false
vim.opt.smartindent = true
vim.g.rust_recommended_style = false
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.keymap.set("n", ";", ":", { desc = "Quick command mode" })
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], { noremap = true, silent = true})
vim.keymap.set("n", "<leader>wl", "<C-w>l")
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<ESC>", ":nohl<CR>", {silent = true})
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("n", "<leader>c;", "<cmd>normal gcc<cr>", { desc = "Add Comment To Current Line" })
vim.keymap.set("v", "<leader>c;", "<cmd>normal gcc<cr>", { desc = "Add Comment To Current Line" })
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "-", "$")
vim.keymap.set("v", "-", "$")
-- vim.keymap.set("n", "<leader>d", "\"_d")
-- vim.keymap.set("v", "<leader>d", "\"_d")
-- vim.keymap.set("x", "<leader>p", "\"_dp")
vim.keymap.set("n", "<C-S-v>", '"+p')
vim.keymap.set("i", "<C-S-v>", '<C-r>+')
vim.keymap.set("c", "<C-S-v>", '<C-r>+')
vim.keymap.set("t", "<C-S-v>", [[<C-\><C-N>"+pi]], { noremap = true })
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>o", "<cmd>only<CR>", { desc = "Delete Current Buffer", silent = true})
vim.keymap.set("n", "<leader>kk", "<cmd>bdelete<CR>", { desc = "Kill/Delete Current Buffer", silent = true})
vim.keymap.set("n", "<leader>kc", "<cmd>close<CR>", { desc = "Close the current window", silent = true})
vim.keymap.set("v", "J", ":move '>+1<CR>gv=gv", { desc = "Move Block Down" })
vim.keymap.set("v", "K", ":move '<-2<CR>gv=gv", { desc = "Move Block Up" })


vim.keymap.set("n", "<leader>0", function()
    vim.cmd("cd " .. vim.fn.expand("~"))
    vim.cmd("restart")
end, {
desc = "restart neovim in home dir",
noremap = true,
silent = true,
})

-- vim.cmd([[cabbrev q <nop>]])
vim.keymap.set("ca", "q", "detach", {silent = true})
vim.keymap.set("n", "<leader>q", ":detach<cr>", {silent = true})


vim.keymap.set("n", "<M-t>", function()
    vim.cmd("tabnew")
    vim.cmd("terminal")
end, { noremap = true, silent = true})


vim.keymap.set("n", "<C-t>", function()
    vim.cmd("vs")
    vim.cmd("terminal")
end,
{ noremap = true, silent = true})

vim.keymap.set("n", "<M-h>", ":tabprevious<CR>", {silent = true})
vim.keymap.set("n", "<M-l>", ":tabnext<CR>", {silent = true})
vim.keymap.set("t", "<M-h>", "<C-\\><C-n>:tabprevious<CR>", {silent = true})
vim.keymap.set("t", "<M-l>", "<C-\\><C-n>:tabnext<CR>", {silent = true})
vim.keymap.set("i", "<M-h>", "<nop>")
vim.keymap.set("i", "<M-l>", "<nop>")
vim.keymap.set("i", "<M-j>", "<nop>")
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", {noremap = true, silent = true})
vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/folke/flash.nvim",
    "https://github.com/lambdalisue/vim-suda",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/saghen/blink.cmp",
    "https://github.com/ibhagwan/fzf-lua",
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/folke/which-key.nvim",
    "https://github.com/nvim-mini/mini.icons",
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/MeanderingProgrammer/render-markdown.nvim",
    "https://github.com/dhruvasagar/vim-table-mode",
    "https://github.com/ej-shafran/compile-mode.nvim",
    "https://github.com/mbbill/undotree",
    "https://codeberg.org/mfussenegger/nvim-dap",
    "https://github.com/rcarriga/nvim-dap-ui",
    "https://github.com/nvim-neotest/nvim-nio",
    "https://github.com/theHamsta/nvim-dap-virtual-text",
    "https://github.com/catppuccin/nvim",
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/nvim-mini/mini.indentscope",
    "https://github.com/mellow-theme/mellow.nvim",
    "https://github.com/dgrco/deepwater.nvim",

})

-- setup must be called before loading
-- vim.cmd.colorscheme "crux"
-- vim.api.nvim_set_hl(0, "Normal", {})
-- require('boo-colorscheme').use({ theme = 'crimson_moonlight' })
vim.cmd([[colorscheme deepwater]])

require("mini.icons").setup()
require("lualine").setup()

require('mini.indentscope').setup({
    draw = { delay = 50 },
    -- symbol = "│"
    symbol = "|"
})
vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#495513", bg = 'NONE'})
vim.api.nvim_set_hl(0, 'Whitespace', { fg = '#313329', bg = 'NONE'})
vim.api.nvim_set_hl(0, 'SpecialKey', { fg = '#313329', bg = 'NONE' })


require("which-key").setup({ })
require("mason").setup({ })
---@module "compile-mode"
---@type CompileModeOpts
vim.g.compile_mode = {
    -- The string to show in the compile prompt as a default.
    -- For an empty prompt, you can use:
    -- To use different defaults based on filetype, you can use a table:
    default_command = {
        -- python = "python %",
        -- lua = "lua %",
        -- javascript = "bun %",
        -- typescript = "bun %",
        -- c = "cc -o %:r % && ./%:r",
        -- cpp = "cc -std=c++23 -o %:r % && ./%:r",
        -- java = "javac % && java %:r",
        -- go = "go run %",
        -- rust = "cargo run",
    },
    focus_compilation_buffer = true,
}
vim.keymap.set("n", "<leader>r", ":below Compile<CR>")
vim.keymap.set("n", "<leader>cc", ":below Recompile<CR>")

require('render-markdown').setup({
    completions = { blink = { enabled = true } },
    heading = {
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

vim.keymap.set("n", "<leader>sp", function()
    require("fzf-lua").fzf_exec(
        "fd --type f --hidden --exclude .git . /",
        {
            -- prompt = "📁 |> ",
            prompt = "󱞶 ",
            winopts = {
                fullscreen = true,
                border = "none",
            },

            previewer = false,

            actions = {
                ["default"] = function(selected)
                    local file = selected[1]

                    if not file then
                        return
                    end

                    local dir = vim.fn.fnamemodify(file, ":h")

                    vim.cmd("tabnew")
                    vim.cmd("tcd " .. vim.fn.fnameescape(dir))

                    require("oil").open(dir)
                end,
            },
        }
    )
end, { desc = "Open file directory in Oil" })

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
        winopts = file_win_opts,
        fd_opts = [[  --type f --hidden --no-ignore --follow --exclude .git]],
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
-- { desc="Find files in the current working directory", noremap = true, silent = true})
-- vim.keymap.set("n", "<leader>f", "<cmd>lua FzfLua.files({ cwd = '~/' })<CR>",
vim.keymap.set("n", "<leader>f", "<cmd>lua FzfLua.files()<CR>",
{ desc="Find files from the current working directory", noremap = true, silent = true})
vim.keymap.set("n", "<leader>/", "<cmd>lua FzfLua.files({ cwd = '/' })<CR>",
{ desc="Find files the system directory", noremap = true, silent = true})
vim.keymap.set("n", "<leader>bb", "<cmd>FzfLua buffers<CR>", { noremap = true, silent = true })
-- Because my projects opens in tabs
vim.keymap.set("n", "<leader>p", "<cmd>FzfLua tabs<CR>", { desc = "Open projects" })


vim.api.nvim_create_user_command('BufOnly', function()
    local cur_buf = vim.api.nvim_get_current_buf()
    for _, b in ipairs(vim.api.nvim_list_bufs()) do
        if b ~= cur_buf and vim.api.nvim_buf_get_option(b, 'buftype') ~= 'terminal' then
            vim.api.nvim_buf_delete(b, { force = true })
        end
    end
end, {})
vim.keymap.set('n', '<leader>bo', ':BufOnly<CR>', { silent = true })


vim.keymap.set("n", "<C-g>", "<cmd>FzfLua grep<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>l", "<cmd>FzfLua grep_project<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "x", "o"}, "s", function() require("flash").jump() end, { desc = "Flash"})

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
            enabled = true,
        },
        menu = {
            auto_show = false
        }
    },
    signature = {
        enabled = true,
        window = { border = nil }
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', },
    },
    fuzzy = { implementation = "lua" },
})
vim.api.nvim_create_user_command("W", function()
    vim.cmd("SudaWrite")
end, {})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

local dap = require("dap")
local dapui = require("dapui")

require("dapui").setup()

require("oil").setup({
    default_file_explorer = true,
    columns = {
        "icon",
        -- "permissions",
        -- "size",
        -- "mtime",
    },
    buf_options = {
        buflisted = false,
        bufhidden = "hide",
    },
    win_options = {
        wrap = false,
        signcolumn = "yes",
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
        autosave_changes = true,
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
        ["<M-q>"] = { "actions.close", mode = "n" },
        ["<M-k>"] = "actions.refresh",
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
vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>")

-- Ensure terminals inherit current window cwd
vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
        local cwd = vim.fn.getcwd(0)
        vim.cmd("tcd " .. vim.fn.fnameescape(cwd))
    end,
})

vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
        local cwd = vim.fn.getcwd(0)
        vim.cmd("tcd " .. vim.fn.fnameescape(cwd))
    end,
})

vim.keymap.set("n", "<leader>h", function()
    local oil = require("oil")
    local dir = oil.get_current_dir()
    local oil = require("oil")
    local dir = oil.get_current_dir()

    if not dir then
        print("Not inside Oil")
        return
    end
    -- Save directory to current buffer
    vim.b.local_cwd = dir
    -- Apply window-local cwd
    vim.cmd("lcd " .. vim.fn.fnameescape(dir))
    print("Buffer cwd -> " .. dir)
    if not dir then
        print("Not inside Oil")
        return
    end
    -- Save directory to current buffer
    vim.b.local_cwd = dir
    -- Apply window-local cwd
    vim.cmd("lcd " .. vim.fn.fnameescape(dir))
    print("Buffer cwd -> " .. dir)
end, { desc = "Set buffer cwd from Oil" })

vim.lsp.enable({
    "rust_analyzer",
    "ols",
    "luals",
    "clangd",
})

vim.diagnostic.config({
    signs = {
        text = {
            ERROR = " ",
            WARN  = " ",
            HINT  = " ",
            INFO  = " ",
        },
    },
    virtual_text = true,
})

-- vim.o.signcolumn = "auto"
vim.keymap.set("n", "<leader>m", function()
    vim.diagnostic.open_float(nil, { focus = false })
end, {desc = "View Diagnostics Error",
noremap = true})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        vim.keymap.set('n', '<leader>gd',  vim.lsp.buf.definition,     { buffer = args.buf })
        vim.keymap.set('n', '<leader>gD',  vim.lsp.buf.declaration,    { buffer = args.buf })
        vim.keymap.set('n', '<leader>gi',  vim.lsp.buf.implementation, { buffer = args.buf })
        -- vim.keymap.set('i', '<M-l>',       vim.lsp.buf.signature_help, { buffer = args.buf })
    end,
})
