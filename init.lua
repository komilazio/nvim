vim.cmd("colorscheme crusx-paper")
vim.g.mapleader = " "
vim.o.winborder = "rounded"
vim.opt.laststatus = 3
vim.opt.tabstop = 6
vim.opt.shiftwidth = 6
vim.opt.scrolloff = 9
vim.opt.termguicolors = true
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.virtualedit = "all"
vim.opt.colorcolumn = "80"
vim.opt.smartindent = true
vim.g.rust_recommended_style = false
vim.opt.signcolumn = "no"
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
-- vim.keymap.set("x", "<leader>p", "\"_dp")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>o", "<cmd>only<CR>", { desc = "Delete Current Buffer", silent = true})
vim.keymap.set("n", "<leader>k", "<cmd>bdelete!<CR>", { desc = "Delete Current Buffer", silent = true})
-- vim.keymap.set("n", "<leader>d", "\"_d")
-- vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "<M-t>", ":terminal<CR>", { noremap = true, silent = true})
-- vim.keymap.set("n", "<M-h>", "<C-\\><C-N>:tabprevious<CR>", { noremap = true, silent = true})
-- vim.keymap.set("n", "<M-l>", "<C-\\><C-N>:tabnext<CR>", {silent = true})
-- vim.keymap.set("i", "<M-k>", "<nop>")
vim.keymap.set("i", "<M-h>", "<nop>")
vim.keymap.set("i", "<M-l>", "<nop>")
vim.keymap.set("i", "<M-j>", "<nop>")
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", {noremap = true, silent = true})
vim.pack.add({
      "https://github.com/nvim-lua/plenary.nvim",
      "https://github.com/folke/flash.nvim",
      "https://github.com/folke/flash.nvim",
      "https://github.com/lambdalisue/vim-suda",
      "https://github.com/mason-org/mason.nvim",
      "https://github.com/saghen/blink.cmp",
      "https://github.com/ibhagwan/fzf-lua",
      "https://github.com/sindrets/winshift.nvim",
      "https://github.com/stevearc/oil.nvim",
      "https://github.com/folke/which-key.nvim",
      "https://github.com/nvim-mini/mini.icons",
      "https://github.com/nvim-lualine/lualine.nvim",
      "https://github.com/MeanderingProgrammer/render-markdown.nvim",
      "https://github.com/dhruvasagar/vim-table-mode",
      "https://github.com/ej-shafran/compile-mode.nvim",
      "https://github.com/mbbill/undotree",
})
require("mini.icons").setup()
require('lualine').setup()
require("which-key").setup({ })
require("mason").setup({ })
require("winshift").setup()
---@module "compile-mode"
---@type CompileModeOpts
vim.g.compile_mode = {
      -- The string to show in the compile prompt as a default.
      -- For an empty prompt, you can use:
      default_command = "",
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

-- Open Directory in Oil using fzf-lua
vim.keymap.set("n", "<leader>sp", function()
      require("fzf-lua").fzf_exec(
            "fd --type d --hidden --exclude .git . /",
            {
                  prompt = "📁 Dirs> ",
                  winopts = {
                        fullscreen = true,
                        border = "none",
                  },
                  previewer = false,
                  actions = {
                        ["enter"] = function(sel)
                              local dir = sel[1]
                              require("oil").open(dir)
                        end
                  } }
            )
      end, { desc = "Open directory in Oil" }
)

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
{ desc="Find files from the home directory", noremap = true, silent = true})
vim.keymap.set("n", "<leader>/", "<cmd>lua FzfLua.files({ cwd = '/' })<CR>",
{ desc="Find files the system directory", noremap = true, silent = true})
vim.keymap.set("n", "<leader>b", "<cmd>FzfLua buffers<CR>", { noremap = true, silent = true })
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
-- vim.api.nvim_create_autocmd("User", {
--       pattern = { "OilEnter", "OilDirChanged" },
--       callback = function(event)
--             vim.defer_fn(function()
--                   local oil = require("oil")
--                   local dir = oil.get_current_dir()
--                   if dir then
--                         vim.cmd("lcd " .. dir)
--                   end
--             end, 20) -- delay a few ms so Oil finishes updating
--       end,
-- })
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
            -- ["<q>"] = { "actions.close", mode = "n" },
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
-- Save cwd per buffer
vim.keymap.set("n", "<leader>h", function()
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
end, { desc = "Set buffer cwd from Oil" })
-- Restore cwd when entering buffers
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function(args)
    local cwd = vim.b[args.buf].local_cwd

    if cwd then
      vim.cmd("lcd " .. vim.fn.fnameescape(cwd))
    end
  end,
})
-- Ensure terminals inherit current window cwd
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    local cwd = vim.fn.getcwd(0)
    vim.cmd("lcd " .. vim.fn.fnameescape(cwd))
  end,
})

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
        -- vim.keymap.set('i', '<M-l>',       vim.lsp.buf.signature_help, { buffer = args.buf })
    end,
})
