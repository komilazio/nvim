return {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    opts = {
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
    },
    opts_extend = { "sources.default" },
}
