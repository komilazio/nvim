-- Automatically start a server for nvr
if vim.fn.empty(vim.v.servername) > 0 then
      vim.fn.serverstart(vim.fn.stdpath("cache") .. "/nvim-server")
end
vim.g.nvim_remote_open = "tab"


vim.api.nvim_create_autocmd("BufEnter", {
  -- group = group,
  pattern = "*.md",
  command = "TableModeEnable",
})

vim.api.nvim_create_autocmd("BufLeave", {
  -- group = group,
  pattern = "*.md",
  command = "TableModeDisable",
})

vim.opt.timeout = true
vim.opt.timeoutlen = 50
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 1

vim.cmd("colorscheme crusx-paper")
vim.g.mapleader = " "
vim.o.winborder = "rounded"
vim.opt.laststatus = 3
vim.opt.tabstop = 6
vim.opt.shiftwidth = 6
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.cursorline = true
vim.opt.scrolloff = 9
vim.opt.termguicolors = true
vim.opt.expandtab = true
vim.opt.guifont = "UbuntuMono Nerd Font:h11.5"
-- vim.opt.number = true
-- vim.opt.relativenumber = true
-- vim.opt.virtualedit = "all"
-- vim.opt.colorcolumn = "80"
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
vim.keymap.set("n", "<leader>k", "<cmd>bdelete!<CR>", { desc = "Delete Current Buffer", silent = true})
vim.keymap.set("v", "J", ":move '>+1<CR>gv=gv", { desc = "Move Block Down" })
vim.keymap.set("v", "K", ":move '<-2<CR>gv=gv", { desc = "Move Block Up" })

vim.keymap.set("n", "<M-t>", function()
      vim.cmd("tabnew")
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
      -- "https://github.com/sindrets/winshift.nvim",
      "https://github.com/stevearc/oil.nvim",
      "https://github.com/folke/which-key.nvim",
      "https://github.com/nvim-mini/mini.icons",
      "https://github.com/nvim-lualine/lualine.nvim",
      "https://github.com/MeanderingProgrammer/render-markdown.nvim",
      "https://github.com/dhruvasagar/vim-table-mode",
      "https://github.com/ej-shafran/compile-mode.nvim",
      "https://github.com/mbbill/undotree",
      -- Debug
      "https://codeberg.org/mfussenegger/nvim-dap",
      "https://github.com/rcarriga/nvim-dap-ui",
      "https://github.com/nvim-neotest/nvim-nio",
      "https://github.com/theHamsta/nvim-dap-virtual-text",
})

require("mini.icons").setup()
-- require('lualine').setup()
require("which-key").setup({ })
require("mason").setup({ })
-- require("winshift").setup()
---@module "compile-mode"
---@type CompileModeOpts
vim.g.compile_mode = {
      -- The string to show in the compile prompt as a default.
      -- For an empty prompt, you can use:
      -- To use different defaults based on filetype, you can use a table:
      default_command = {
            python = "python %",
            lua = "lua %",
            javascript = "bun %",
            typescript = "bun %",
            c = "cc -o %:r % && ./%:r",
            cpp = "cc -std=c++23 -o %:r % && ./%:r",
            java = "javac % && java %:r",
            go = "go run %",
            rust = "cargo run",
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
            "fd --type d --hidden --exclude .git . /",
            {
                  prompt = "📁 |> ",
                  winopts = {
                        fullscreen = true,
                        border = "none",
                  },
                  previewer = false,
                  actions = {
                        ["enter"] = function(sel)
                              local dir = sel[1]
                              vim.cmd("tabnew")
                              -- IMPORTANT: set tab-local cwd
                              vim.cmd("tcd " .. vim.fn.fnameescape(dir))
                              require("oil").open(dir)
                        end
                  }
            }
      )
end, { desc = "Open directory in Oil" })

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
-- { desc="Find files in the current working directory", noremap = true, silent = true})
-- vim.keymap.set("n", "<leader>f", "<cmd>lua FzfLua.files({ cwd = '~/' })<CR>",
vim.keymap.set("n", "<leader>f", "<cmd>lua FzfLua.files()<CR>",
{ desc="Find files from the current working directory", noremap = true, silent = true})
vim.keymap.set("n", "<leader>/", "<cmd>lua FzfLua.files({ cwd = '/' })<CR>",
{ desc="Find files the system directory", noremap = true, silent = true})
-- vim.keymap.set("n", "<leader>b", "<cmd>FzfLua buffers<CR>", { noremap = true, silent = true })

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
                  auto_show = true
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

vim.api.nvim_create_autocmd("InsertEnter", {
      callback = function()
            vim.cmd("highlight CursorLine guibg=#14310A")
      end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
      callback = function()
            vim.cmd("highlight Cursor guibg=#008080")
            vim.cmd("highlight CursorLine guibg=#300207")
      end,
})

-- Ensure terminals inherit current window cwd
vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
            vim.cmd(":terminal")
      end,
})

local lualine = require('lualine')
-- Color table for highlights
-- stylua: ignore
local colors = {
      bg       = '#141414',
      fg       = '#bbc2cf',
      yellow   = '#ECBE7B',
      cyan     = '#008080',
      darkblue = '#081633',
      green    = '#98be65',
      orange   = '#FF8800',
      violet   = '#a9a1e1',
      magenta  = '#c678dd',
      blue     = '#51afef',
      red      = '#ec5f67',
}
local conditions = {
      buffer_not_empty = function()
            return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
      end,
      hide_in_width = function()
            return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
            local filepath = vim.fn.expand('%:p:h')
            local gitdir = vim.fn.finddir('.git', filepath .. ';')
            return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
}
-- Config
local config = {
      options = {
            -- Disable sections and component separators
            component_separators = '',
            section_separators = '',
            theme = {
                  -- We are going to use lualine_c an lualine_x as left and
                  -- right section. Both are highlighted by c theme .  So we
                  -- are just setting default looks o statusline
                  normal = { c = { fg = colors.fg, bg = "#141414"  } }, --colors.bg
                  inactive = { c = { fg = colors.fg, bg = colors.bg } },
            },
      },
      sections = {
            -- these are to remove the defaults
            lualine_a = {},
            lualine_b = {},
            lualine_y = {},
            lualine_z = {},
            -- These will be filled later
            lualine_c = {},
            lualine_x = {},
      },
      inactive_sections = {
            -- these are to remove the defaults
            lualine_a = {},
            lualine_b = {},
            lualine_y = {},
            lualine_z = {},
            lualine_c = {},
            lualine_x = {},
      },
}
-- Inserts a component in lualine_c at left section
local function ins_left(component)
      table.insert(config.sections.lualine_c, component)
end
-- Inserts a component in lualine_x at right section
local function ins_right(component)
      table.insert(config.sections.lualine_x, component)
end

local the_bar = function ()

ins_left {
      function()
            -- Mode indicator
            return "▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰"
      end,
      -- color = { fg = "#008080" },
      color = function()
            -- auto change color according to neovims mode
            local mode_color = {
                  n = colors.orange,
                  i = "#09E717",
                  v = "#510974",
                  [''] = colors.blue,
                  V = "#510974",
                  c = "#FF0000",
                  no = colors.red,
                  s = colors.orange,
                  S = colors.orange,
                  [''] = colors.orange,
                  ic = colors.yellow,
                  R = colors.violet,
                  Rv = colors.violet,
                  cv = colors.red,
                  ce = colors.red,
                  r = colors.cyan,
                  rm = colors.cyan,
                  ['r?'] = colors.cyan,
                  ['!'] = colors.red,
                  t = colors.red,
            }
            return { fg = mode_color[vim.fn.mode()] }
      end,
      padding = { left = 2, right = 0 }, -- We don't need space before this
}
end

ins_left {
      function()
           return "⟦⟪⟫⟧"
      end,
      color = { fg = "#9D62D3" },
      padding = { left = 0, right = 1 }, -- We don't need space before this
}
ins_left {
      -- filesize component
      'filesize',
      cond = conditions.buffer_not_empty,
}
-- ins_left {
--       'filename',
--       cond = conditions.buffer_not_empty,
--       color = { fg = colors.yellow },
-- }

ins_left { 'location' }

ins_left { 'progress', color = { fg = colors.fg } }

ins_left {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      symbols = { error = ' ', warn = ' ', info = ' ' },
      diagnostics_color = {
            error = { fg = colors.red },
            warn = { fg = colors.yellow },
            info = { fg = colors.cyan },
      },
}

the_bar()

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
      function()
            return '%='
      end,
}


ins_left {
      -- Lsp server name .
      function()
            local msg = 'No Active Lsp'
            local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
            local clients = vim.lsp.get_clients()
            if next(clients) == nil then
                  return msg
            end
            for _, client in ipairs(clients) do
                  local filetypes = client.config.filetypes
                  if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                        return client.name
                  end
            end
            return msg
      end,
      icon = '',
      color = { fg = '#CDE3C8' },
}

ins_right {
      function()
            return '%='
      end,
}


-- Add components to right sections
ins_right {
      'o:encoding', -- option component same as &encoding in viml
      fmt = string.upper, -- I'm not sure why it's upper case either ;)
      cond = conditions.hide_in_width,
      color = { fg = colors.green },
}



ins_right {
      'fileformat',
      fmt = string.upper,
      icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
      color = { fg = colors.green },
}

ins_right {
      'branch',
      icon = '',
      color = { fg = colors.violet },
}

ins_right {
      'diff',
      -- Is it me or the symbol for modified us really weird
      symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
      diff_color = {
            added = { fg = colors.green },
            modified = { fg = colors.orange },
            removed = { fg = colors.red },
      },
      cond = conditions.hide_in_width,
}

ins_right {
      function()
           return "⟦⟪⟫⟧"
            -- return "▞▚"
      end,
      color = { fg = "#9D62D3" },
      padding = { left = 0, right = 0 },
}
-- Now don't forget to initialize lualine
lualine.setup(config)

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
vim.o.signcolumn = "yes"
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
