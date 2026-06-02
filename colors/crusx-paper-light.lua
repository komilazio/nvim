vim.cmd("highlight clear")
vim.cmd("syntax reset")
vim.g.colors_name = "crusx-paper-light"


-- TODO(lazio): Put in real "dust" particle or whatever
-- NOTE(lazio): this is just a comment adjustment

local color = {
    -- fg = "#AD9E86",
    fg = "#EBD3AC",
    bg = "#200453",
    bg_float = "#340453",
    comment = "#9E98A0",
    -- cursor_line = "#202025",
    keyword = "#F3C505",
    number = "#C481FF",
    todo = "#C73C20",
    search = "#A8FF4A",
    code = "#101010",
    in_search = "#9558AC",
    visual = "#3A3E52",
    func = "#FC8D5C",
    builtin = "#45776D",
    seperator = "#340453",
    sign_column = "#340453",
    tab = "#458F2C",
    bool = "#B6434B",
    tab_off = "#193F0C",
    string = "#9DC3C9",
    color_column = "#313641"
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Editor
hi('Normal',       { fg = color.fg, bg = color.bg })
hi('NormalNC',     { fg = color.fg, bg = color.bg })
hi('NormalFloat',  { fg = color.fg, bg = color.bg_float })
hi('FloatTitle',   { fg = color.fg, bg = color.bg, bold = false })
hi('FloatBorder',  { fg = color.fg, bg = color.bg })
hi('lCursor',      { fg = color.fg, bg = color.bg })
hi('Title',        { fg = color.comment, bg = color.bg })
hi('CursorIM',     { fg = color.fg, bg = color.bg })
-- hi('ColorColumn',  { bg = color.color_column })
hi('TermCursor',   { fg = color.fg, bg = color.tab })
hi('TermCursorNC', { fg = color.fg, bg = color.bg })
hi('CursorLine',   { bg = color.cursor_line,  bold = false})
hi('StatusLine',   { bg = color.bg, bold = false })
hi('Search',       { fg = color.in_search, bold = false })
-- hi('Boolean',       { fg = color.bool, bold = false })
hi('IncSearch',    { fg = color.search, bold = false })
hi('FloatBorder',  { fg = color.bg_float, bg = color.bg_float })
hi('FloatShadow',  { bg = color.bg_float, blend = 100 })
hi('FloatShadowThrough', { bg = color.bg_float, blend = 100 })
hi('Pmenu',        { fg = color.fg, bg = color.bg_float })
hi('MatchParen',   { fg = color.search, bold = false, underline = true })
hi('Visual',       { bg = color.visual })
hi('WinSeparator', { fg = color.seperator, bg = color.bg })
hi('SignColumn',   { bg = color.seperator })
-- hi('TabLineFill',  { fg = color.fg, bg = color.bg })
hi('TabLine',      { fg = "#3D3D3D", bg = color.bg, italic = false })
-- hi('TabLineSel',   { bg = color.bg, fg = "#4B4A4A", bold = false })
hi('TabLineSel',   { bg = color.bg, fg = "#A6C3A6", bold = true, italic = false, underline = true })

-- Syntax: monotone with decoration
hi('Comment',      { fg = color.comment, italic = false,  bold = false })
hi('Constant',     { fg = color.fg,  bold = false })
hi('String',       { fg = color.string, italic = false })
hi('Operator',     { fg = color.fg,  bold = false })
hi('Keyword',      { fg = color.keyword,  bold = false })
hi('Exception',    { fg = color.fg,  bold = false })
hi('PreProc',      { fg = color.fg,  bold = false })
hi('Character',    { fg = color.fg,  bold = false })
hi('Number',       { fg = color.number,  bold = false })
hi('Boolean',      { fg = color.bool,  bold = false })
hi('Float',        { fg = color.fg,  bold = false })
hi('Identifier',   { fg = color.fg,  bold = false })
hi('Function',     { fg = color.func,  bold = false })
hi('Variable',     { fg = color.fg,  bold = false })
hi('Statement',    { fg = color.keyword,  bold = false })
hi('Conditional',  { fg = color.fg,  bold = false })
hi('Repeat',       { fg = color.fg,  bold = false })
hi('Label',        { fg = color.fg,  bold = false })
hi('Include',      { fg = color.builtin,  bold = false })
hi('Define',       { fg = color.fg,  bold = false })
hi('Macro',        { fg = color.fg,  bold = false })
hi('PreCondit',    { fg = color.fg,  bold = false })
hi('Type',         { fg = color.keyword, underline = false,  bold = false })
hi('Conditional',  { fg = color.keyword, underline = false,  bold = false })
hi('StorageClass', { fg = color.fg,  bold = false })
hi('Structure',    { fg = color.fg, underline = true,  bold = false })
hi('Typedef',      { fg = color.fg, underline = true,  bold = false })
hi('Special',      { fg = color.fg,  bold = false })
hi('SpecialChar',  { fg = color.fg,  bold = false })
hi('Tag',          { fg = color.fg, underline = true,  bold = false })
hi('Delimiter',    { fg = color.fg,  bold = false })
hi('Debug',        { fg = color.fg,  bold = false })
hi('Underlined',   { fg = color.fg, underline = true,  bold = false })
hi('SpecialComment', { fg = color.comment,  bold = false, italic = false })

-- Treesitter
hi('@variable',           { fg = color.fg,  bold = false })
hi('@variable.builtin',   { fg = color.builtin, italic = false,  bold = false })
hi('@variable.parameter', { fg = color.fg, italic = false,  bold = false })
hi('@variable.member',    { fg = color.fg,  bold = false })
hi('@constant',           { fg = color.fg,  bold = false })
hi('@constant.builtin',   { fg = color.builtin,  bold = false })
hi('@constant.macro',     { fg = color.builtin,  bold = false })
hi('@module',             { fg = color.builtin,  bold = false })
hi('@label',              { fg = color.builtin,  bold = false })
hi('@string',             { fg = color.string, italic = false,  bold = false })
hi('@string.escape',      { fg = color.fg,  bold = false })
hi('@string.special',     { fg = color.fg,  bold = false })
hi('@character',          { fg = color.fg,  bold = false })
hi('@number',             { fg = color.number,  bold = false })
hi('@boolean',            { fg = color.fg,  bold = false })
hi('@float',              { fg = color.number,  bold = false })
hi('@function',           { fg = color.func,  bold = false })
hi('@function.builtin',   { fg = color.builtin,  bold = false, italic = false })
hi('@function.identifier',   { fg = color.func,  bold = false, italic = false })
hi('@function.call',      { fg = color.func,  bold = false })
hi('@function.macro',     { fg = color.builtin,  bold = false, italic = false })
hi('@method',             { fg = color.func,  bold = false })
hi('@method.call',        { fg = color.func,  bold = false })
hi('@constructor',        { fg = color.fg,  bold = false })
hi('@keyword',            { fg = color.keyword,  bold = false })
hi('@keyword.function',   { fg = color.keyword,  bold = false })
hi('@keyword.operator',   { fg = color.fg,  bold = false })
hi('@keyword.return',     { fg = color.fg,  bold = false })
hi('@conditional',        { fg = color.keyword,  bold = false })
hi('@repeat',             { fg = color.fg,  bold = false })
hi('@exception',          { fg = color.fg,  bold = false })
hi('@include',            { fg = color.builtin })
hi('@type',               { fg = color.keyword, underline = false,  bold = false, italic = false })
hi('@statement',          { fg = color.keyword, underline = false,  bold = false, italic = false })
hi('@type.builtin',       { fg = color.builtin, underline = false,  bold = false })
hi('@type.definition',    { fg = color.fg, underline = false,  bold = false })
hi('@type.qualifier',     { fg = color.fg,  bold = false })
hi('@attribute',          { fg = color.fg,  bold = false })
hi('@field',              { fg = color.builtin,  bold = false })
hi('@property',           { fg = color.fg,  bold = false })
hi('@parameter',          { fg = color.fg, italic = false,  bold = false })
hi('@operator',           { fg = color.fg,  bold = false })
hi('@punctuation',        { fg = color.fg,  bold = false })
hi('@punctuation.bracket',    { fg = color.fg,  bold = false })
hi('@punctuation.delimiter',  { fg = color.fg,  bold = false })
hi('@punctuation.special',    { fg = color.fg,  bold = false })
hi('@comment',            { fg = color.comment, italic = false,  bold = false })
hi('@comment.documentation', { fg = color.comment, italic = false,  bold = false })
hi('@tag',                { fg = color.builtin, bold = false })
hi('@tag.attribute',      { fg = color.fg, italic = false,  bold = false })
hi('@tag.delimiter',      { fg = color.fg,  bold = false })
hi('@text',               { fg = color.fg,  bold = false })
hi('@text.strong',        { fg = color.fg,  bold = false })
hi('@text.emphasis',      { fg = color.fg, italic = false,  bold = false })
hi('@text.underline',     { fg = color.fg, underline = true,  bold = false })
hi('@text.strike',        { fg = color.fg, strikethrough = true,  bold = false })
hi('@text.title',         { fg = color.fg,  bold = false })

-- Semantic tokens (LSP)
hi('@lsp.type.class',         { fg = color.keyword, underline = true })
hi('@lsp.type.struct',        { fg = color.fg, underline = false })
hi('@lsp.type.interface',     { fg = color.keyword, underline = true })
hi('@lsp.type.parameter',     { fg = color.fg, italic = false })
hi('@lsp.type.variable',      { fg = color.fg })
hi('@lsp.type.property',      { fg = color.fg })
hi('@lsp.type.function',      { fg = color.func, bold = false })
hi('@lsp.type.method',        { fg = color.func, bold = false })
hi('@lsp.type.keyword',       { fg = color.keyword, bold = false })
hi('@lsp.type.namespace',     { fg = color.builtin })
hi('@lsp.type.type',          { fg = color.keyword, underline = true })
hi('@lsp.type.typeParameter', { fg = color.fg, italic = false })
hi('@lsp.mod.defaultLibrary', { italic = false })
hi('@lsp.typemod.struct.decoration.rust',{ fg = color.keyword, underline = true })
hi('@lsp.mod.decoration.rust',{ fg = color.keyword, underline = true })

-- Markdown headings (render-markdown.nvim)
hi('RenderMarkdownH1',    { fg = color.func })
hi('RenderMarkdownH2',    { fg = color.search })
hi('RenderMarkdownH3',    { fg = color.in_search })
hi('RenderMarkdownH4',    { fg = color.tab })
hi('RenderMarkdownH1Bg',  { bg = color.bg_float })
hi('RenderMarkdownH2Bg',  { bg = color.bg_float })
hi('RenderMarkdownH3Bg',  { bg = color.bg_float })
hi('RenderMarkdownH4Bg',  { bg = color.bg_float })
hi('RenderMarkdownCode',  { bg = color.bg })
hi('RenderMarkdownCodeInline', { bg = color.code })
hi('RenderMarkdownBullet', { fg = color.func })
hi('RenderMarkdownTableHead', { fg = color.builtin })
hi('RenderMarkdownTableRow',  { fg = color.func })
hi('RenderMarkdownSuccess', { fg = color.fg })
hi('RenderMarkdownInfo',    { fg = color.fg })
hi('@markup.heading.markdown', { fg = color.fg })
hi('@markup.heading.1.markdown', { fg = color.func, bold = true })
hi('@markup.heading.2.markdown', { fg = color.search, bold = true  })
hi('@markup.heading.3.markdown', { fg = color.in_search, bold = true  })
hi('@markup.heading.4.markdown', { fg = color.tab, bold = true  })
hi('@markup.raw.markdown_inline', { bg = color.code })
hi('@text.literal.markdown',       { fg = color.fg })
hi('@text.uri',           { fg = color.keyword, underline = true })
hi('@text.reference',     { fg = color.keyword, italic = false })
hi('@markup.raw.block.markdown',     { fg = color.keyword, bg = color.code, italic = false })
hi('@markup.quote.markdown',     { fg = color.keyword, bg = color.bg })
hi('@markup.punctuation.markdown',     { fg = color.builtin, bg = color.bg })
hi('@markup.link.markdown_inline',     { fg = color.builtin, bg = color.bg })
hi('@markup.link.url.markdown_inline',     { fg = color.builtin, bg = color.bg })
hi('@markup.link.label.markdown_inline',     { fg = color.builtin, bg = color.bg, italic = true })
hi('@label.markdown',     { fg = color.keyword, bg = color.code, italic = false })

hi('PERF',      { fg = '#3BD4DF', bold = false })
hi('NOTE',      { fg = '#CCEC2F', bold = false })
hi('FIXME',      { fg = '#FA411B', bold = false })
hi('TODO',      { fg = '#FA411B', bold = false })

-- vim.cmd([[
-- autocmd BufRead,BufNewFile * call matchadd('Perf', '\<PERF\>')
-- autocmd BufRead,BufNewFile * call matchadd('Note', '\<NOTE\>')
-- autocmd BufRead,BufNewFile * call matchadd('Fixme', '\<FIXME\>')
-- autocmd BufRead,BufNewFile * call matchadd('TODO', '\<TODO\>')
-- ]])


vim.api.nvim_create_augroup("CrusxTheme", { clear = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = "CrusxTheme",
  pattern = "*",
  callback = function()
    vim.fn.matchadd('Perf', '\\<PERF\\>')
    vim.fn.matchadd('Note', '\\<NOTE\\>')
    vim.fn.matchadd('Fixme', '\\<FIXME\\>')
    vim.fn.matchadd('TODO', '\\<TODO\\>')
  end,
})

-- FZFLua
vim.env.FZF_DEFAULT_OPTS = "--color=bg:#151516"
