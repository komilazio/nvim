return {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    opts = {
        keymap = {
            preset = 'enter',
            ['<S-Tab>'] = { 'select_prev', 'fallback' },
            ['<Tab>'] = { 'select_next', 'fallback' },
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
