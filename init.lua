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
-- vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_hide_mouse_when_typing = true

-- vim.o.background = "light"
vim.o.background = "dark"
vim.opt.timeout = true
vim.opt.timeoutlen = 50
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 1
vim.opt.completeopt:append("popup")

vim.g.mapleader = " "
vim.o.winborder = "rounded"
vim.opt.laststatus = 3
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.shiftwidth = 4     -- Number of spaces for each indentation level
vim.opt.tabstop = 4        -- Number of spaces a <Tab> in the file counts for
vim.opt.softtabstop = 4    -- Number of spaces a <Tab> counts for while editing
vim.opt.showmode = false
vim.opt.list = true
vim.opt.smoothscroll = true
-- vim.opt.listchars:append({space = '.'})
vim.opt.shortmess:append("FW")
vim.opt.showcmd = false
vim.opt.showtabline = 0
vim.opt.cursorline = true
vim.opt.scrollback = 1000000
vim.opt.scrolloff = 999999
vim.opt.termguicolors = true
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
end, { desc = "restart neovim in home dir", noremap = true, silent = true, })

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
    "https://github.com/sindrets/winshift.nvim",
    "https://github.com/saghen/blink.cmp",
    "https://github.com/ibhagwan/fzf-lua",
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/folke/which-key.nvim",
    "https://github.com/nvim-mini/mini.icons",
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/MeanderingProgrammer/render-markdown.nvim",
    "https://github.com/dhruvasagar/vim-table-mode",
    "https://github.com/ej-shafran/compile-mode.nvim",
    "https://github.com/altermo/ultimate-autopair.nvim",
    "https://github.com/mbbill/undotree",
    "https://codeberg.org/mfussenegger/nvim-dap",
    "https://github.com/rcarriga/nvim-dap-ui",
    "https://github.com/nvim-neotest/nvim-nio",
    "https://github.com/theHamsta/nvim-dap-virtual-text",
    "https://github.com/catppuccin/nvim",
    "https://github.com/nvim-mini/mini.indentscope",
    "https://github.com/mellow-theme/mellow.nvim",
    "https://github.com/dgrco/deepwater.nvim",
    "https://github.com/m00qek/baleia.nvim",
    "https://github.com/ellisonleao/gruvbox.nvim",
    "https://github.com/yorumicolors/yorumi.nvim",
    "https://github.com/slugbyte/lackluster.nvim",

})


-- setup must be called before loading
-- vim.cmd.colorscheme "crux"
-- vim.api.nvim_set_hl(0, "Normal", {})
-- require('boo-colorscheme').use({ theme = 'crimson_moonlight' })
-- Default options:
-- vim.cmd([[colorscheme deepwater]])
-- vim.cmd([[colorscheme yorumi]])
vim.cmd([[colorscheme lackluster-night]])

require("ultimate-autopair").setup()

local lackluster = require("lackluster")
lackluster.setup({
    -- tweak_highlight allows you to update or overwrite the value passed into
    -- vim.api.nvim_set_hl which allows you to have complete control over modifying all
    -- highlights on a granular level.
    tweak_highlight = {
      -- modify @keyword's highlights to be bold and italic
      ["@keyword"] = {
        overwrite = false, -- overwrite falsey will extend/update lackluster's defaults (nil also does this)
        bold = false,
        italic = false,
        -- see `:help nvim_set_hl` for all possible keys
      },
      -- overwrite @function to link to @keyword
      ["@function"] = {
        overwrite = true, -- overwrite == true will force overwrite lackluster's default highlights
        link = "@keyword",
      },
    },
})

-- then continue with lackluster.setup, lualine, etc...

require("lualine").setup({
    options = {
        theme = "lackluster",
        -- This removes the mode indicator block on the far left
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
    },
    sections = {
        lualine_a = {},
        lualine_b = {
            { "branch",      color = { bg = "#080808" } },
            { "diff",        color = { bg = "#080808" } },
            { "diagnostics", color = { bg = "#080808" } },
        },
        lualine_c = {
            { "filename", color = { bg = "#2d2d2d", fg = "#ffffff" } },
        },
        lualine_x = { { "encoding",   color = { bg = "#080808" } } },
        lualine_y = { { "progress",   color = { bg = "#080808" } } },
        lualine_z = { { "location",   color = { bg = "#080808" } } },
    },
})
-- vim.api.nvim_set_hl(0, "lualine_a_normal", { bg = "none", fg = "#ffffff" })

-- Mode indicator: colors cursorline per mode, always bold
local mode_colors = {
    n        = "#080808",
    i        = "#0B8F58",
    v        = "#9745be",
    V        = "#9745be",
    ["\22"]  = "#9745be",
    R        = "#245361",
    c        = "#f5c359",
}

local line_opacity = 0.10

local function hex_to_rgb(hex)
    hex = hex:gsub("#", "")
    return tonumber(hex:sub(1,2), 16),
           tonumber(hex:sub(3,4), 16),
           tonumber(hex:sub(5,6), 16)
end

local function blend(fg_hex, bg_hex, alpha)
    local fr, fg, fb = hex_to_rgb(fg_hex)
    local br, bg, bb = hex_to_rgb(bg_hex)
    local r = math.floor(fr * alpha + br * (1 - alpha))
    local g = math.floor(fg * alpha + bg * (1 - alpha))
    local b = math.floor(fb * alpha + bb * (1 - alpha))
    return string.format("#%02x%02x%02x", r, g, b)
end

local function get_bg()
    local hl = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
    if hl.bg then
        return string.format("#%06x", hl.bg)
    end
    return "#000000"
end

vim.o.guicursor = "n-c:block-Cursor,i-ci-ve:block-CursorInsert,v-V:block-CursorVisual,r-cr:hor20-Cursor"
local function update_cursorline()
    vim.schedule(function()
        local mode = vim.fn.mode()
        local color = mode_colors[mode] or mode_colors["n"]
        local opacity = (mode == "n") and 0 or line_opacity
        local blended = blend(color, get_bg(), opacity)

        -- Set global fallback (for normal mode / inactive windows)
        vim.api.nvim_set_hl(0, "CursorLine",   { bg = "#000000" })
        vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "#080808", fg = "#7788AA" })

        -- Set a per-window highlight only for the current window
        vim.api.nvim_set_hl(0, "CursorLineActive",   { bg = blended, bold = true })
        vim.api.nvim_set_hl(0, "CursorLineNrActive", { bg = blended, bold = true })

        vim.wo.winhighlight = "CursorLine:CursorLineActive,CursorLineNr:CursorLineNrActive"

        -- vim.api.nvim_set_hl(0, "Cursor",       { bg = "#BE5D5D", fg = "#f9f5d7" })
        -- vim.api.nvim_set_hl(0, "CursorInsert", { bg = "#0B8F58", fg = "#f9f5d7" })
        -- vim.api.nvim_set_hl(0, "CursorVisual", { bg = "#9745be", fg = "#f9f5d7", bold = true })
        vim.api.nvim_set_hl(0, "Cursor",       { bg = "#FFFFFF", fg = "#080808" })
        vim.api.nvim_set_hl(0, "CursorInsert", { bg = "#0B8F58", fg = "#f9f5d7" })
        vim.api.nvim_set_hl(0, "CursorVisual", { bg = "#9745be", fg = "#f9f5d7", bold = true })

        if mode == "v" or mode == "V" or mode == "\22" then
            vim.api.nvim_set_hl(0, "Visual", { bg = blended, bold = true })
        else
            vim.api.nvim_set_hl(0, "Visual", { bg = "#504945", bold = true })
        end
    end)
end

-- Reset inactive windows when leaving them
vim.api.nvim_create_autocmd("WinLeave", {
    callback = function()
        vim.wo.winhighlight = "CursorLine:CursorLine,CursorLineNr:CursorLineNr"
    end,
})

update_cursorline()

vim.api.nvim_create_autocmd({ "ModeChanged", "ColorScheme", "BufEnter", "WinEnter" }, {
    callback = update_cursorline,
})

vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
    callback = function()
        local mode = vim.fn.mode()
        if mode == "v" or mode == "V" or mode == "\22" then
            update_cursorline()
        end
    end,
})

require("mini.icons").setup()

require('mini.indentscope').setup({
    draw = { delay = 50 },
    -- symbol = "│"
    symbol = "╎"
})
vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#2a2a2a", bg = 'NONE'})

require("which-key").setup({ })
require("mason").setup({ })

---@module "compile-mode"
---@type CompileModeOpts
vim.g.compile_mode = {
    input_word_completion = true,
    baleia_setup = true,
    bang_expansion = true,
    default_command = "make -k",
    focus_compilation_buffer = true,
}

-- Save the source window ID before we jump into the compilation buffer
local source_win_id = nil

vim.api.nvim_create_autocmd("FileType", {
    pattern = "compilation",
    callback = function()
        source_win_id = vim.fn.win_getid(vim.fn.winnr("#"))

        vim.keymap.set("n", "<CR>", function()
            -- Switch back to source window first, then jump to error
            if source_win_id and vim.api.nvim_win_is_valid(source_win_id) then
                vim.api.nvim_set_current_win(source_win_id)
            end
            require("compile-mode").goto_error()
        end, { buffer = true, desc = "Jump to error" })

        vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = true, desc = "Close compilation buffer" })
    end,
})

vim.keymap.set("n", "<leader>cr", ":below Compile<CR>")
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

--========================================================
vim.g.baleia = require("baleia").setup({ })
-- Command to colorize the current buffer
vim.api.nvim_create_user_command("BaleiaColorize", function()
    vim.g.baleia.once(vim.api.nvim_get_current_buf())
end, { bang = true })
-- Command to show logs
vim.api.nvim_create_user_command("BaleiaLogs", vim.cmd.messages, { bang = true })
--========================================================

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

vim.keymap.set("n", "<leader>m", function()
    vim.diagnostic.open_float(nil, { focus = false })
end, {desc = "View Diagnostics Error",
noremap = true})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        vim.keymap.set('n', '<leader>gd',  vim.lsp.buf.definition,     { buffer = args.buf })
        vim.keymap.set('n', '<leader>gD',  vim.lsp.buf.declaration,    { buffer = args.buf })
        vim.keymap.set('n', '<leader>gi',  vim.lsp.buf.implementation, { buffer = args.buf })

        -- Enable inlay hints for this buffer
        vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })

        -- Optional: toggle with a keymap
        vim.keymap.set('n', '<leader>th', function()
            vim.lsp.inlay_hint.enable(
                not vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf }),
                { bufnr = args.buf }
            )
        end, { buffer = args.buf, desc = "Toggle inlay hints" })
    end,
})
vim.api.nvim_set_hl(0, "LspInlayHint", { bg = "#080808", fg = "#444444", italic = true })

local function open_scratch()
    vim.bo.buftype = "nofile"
    vim.bo.bufhidden = "wipe"
    vim.bo.swapfile = false
    vim.api.nvim_buf_set_name(0, "**scratch**")

    local ns = vim.api.nvim_create_namespace("scratch_hl")
    vim.api.nvim_set_hl(ns, "Normal", { fg = "#708090" })
    vim.api.nvim_set_hl(ns, "CursorLine",       { bg = "none" })
    vim.api.nvim_win_set_hl_ns(0, ns)
end

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.fn.argc() == 0 then
            open_scratch()
        end
    end,
})

vim.keymap.set("n", "<leader>88", function()
    vim.cmd("enew")
    open_scratch()
end, { desc = "Open scratch buffer" })

vim.api.nvim_set_hl(0, 'PERF',  { fg = '#595BBB', bold = false })
vim.api.nvim_set_hl(0, 'NOTE',  { fg = '#7ED321', bold = false })
vim.api.nvim_set_hl(0, 'FIXME', { fg = '#B4463A', bold = false })
vim.api.nvim_set_hl(0, 'TODO',  { fg = '#F8E71C', bold = false })
vim.api.nvim_set_hl(0, 'HACK',  { fg = '#BB59A8', bold = false })
vim.api.nvim_set_hl(0, 'BUG',   { fg = '#EE0A02', bold = false })

--TODO: this is a todo thing.
--FIXME: just a temp soloution for now.
--NOTE: this is a todo thing.
--BUG: just a temp soloution for now.
--PERF: this is a todo thing.
--HACK: just a temp soloution for now.

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  -- group = "CrusxTheme",
  pattern = "*",
  callback = function()
    vim.fn.matchadd('Perf', '\\<PERF\\>')
    vim.fn.matchadd('Hack', '\\<HACK\\>')
    vim.fn.matchadd('Note', '\\<NOTE\\>')
    vim.fn.matchadd('Fixme', '\\<FIXME\\>')
    vim.fn.matchadd('TODO', '\\<TODO\\>')
    vim.fn.matchadd('Bug', '\\<BUG\\>')
  end,
})

vim.g.terminal_color_0  = "#080808"  -- black       (gray1)
vim.g.terminal_color_1  = "#D70000"  -- red
vim.g.terminal_color_2  = "#789978"  -- green
vim.g.terminal_color_3  = "#abab77"  -- yellow
vim.g.terminal_color_4  = "#7788AA"  -- blue
vim.g.terminal_color_5  = "#708090"  -- magenta     (lack)
vim.g.terminal_color_6  = "#deeeed"  -- cyan        (luster)
vim.g.terminal_color_7  = "#aaaaaa"  -- white       (gray7)
vim.g.terminal_color_8  = "#2a2a2a"  -- bright black (gray3)
vim.g.terminal_color_9  = "#ffaa88"  -- bright red  (orange)
vim.g.terminal_color_10 = "#789978"  -- bright green
vim.g.terminal_color_11 = "#abab77"  -- bright yellow
vim.g.terminal_color_12 = "#7788AA"  -- bright blue
vim.g.terminal_color_13 = "#708090"  -- bright magenta (lack)
vim.g.terminal_color_14 = "#deeeed"  -- bright cyan (luster)
vim.g.terminal_color_15 = "#DDDDDD"  -- bright white (gray9)
