vim.cmd('highlight clear')
vim.g.colors_name = 'nice-paper'

local c = {
  fg       = '#0B82C0',
  -- bg       = '#021612',
  bg       = '#09020F',

  visual   = '#F6E4C5',
  subtle   = '#867E71',
}

local error = "#DC2626"
local warning = "#FBBF24"
local info = "#2563EB"
local hint = "#536886"
local default = "#7C3AED"
local test = "#FF00FF"

local comment = '#3F503E'
local string  = '#247224'
local keyword = '#EB956C'
local number  = '#C7412A'
local parenMatch = '#BE051C'
local search_col = '#ff5400'
local diag_fg = '#F5FDF3'
local diag_error = '#c62828'
local cursor_line  = '#D3B884'

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Editor
hi('Normal',       { fg = c.fg, bg = c.bg })
hi('NormalNC',     { fg = c.fg, bg = c.bg })
hi('NormalFloat',  { fg = c.fg, bg = c.float_bg })
hi('FloatBorder',  { fg = c.dim, bg = c.float_bg })
hi('FloatTitle',   { fg = c.fg, bg = c.float_bg, bold = false })
hi('FloatShadow',  { bg = c.border, blend = 80 })
hi('FloatShadowThrough', { bg = c.border, blend = 100 })
-- hi('Cursor',       { fg = c.bg, bg = c.fg })
hi('lCursor',      { fg = c.bg, bg = c.fg })
hi('CursorIM',     { fg = c.bg, bg = c.fg })
hi('TermCursor',   { fg = c.bg, bg = c.fg })
hi('TermCursorNC', { fg = c.bg, bg = c.dim })
hi('CursorNormal',  { fg = c.bg, bg = '#1A4A2A' })
hi('CursorInsert',  { fg = c.bg, bg = '#002611' })
hi('CursorVisual',  { fg = c.bg, bg = '#3A6A3A' })
hi('CursorReplace', { fg = c.bg, bg = '#0A3018' })
hi('CursorCommand', { fg = c.bg, bg = '#1A4A2A' })
hi('CursorLine',   { bg = cursor_line, fg = 'NONE',  bold = false})
hi('CursorColumn', { bg = c.cursor })
hi('LineNr',       { fg = comment })
hi('CursorLineNr', { fg = c.fg, bold = false })
hi('SignColumn',   { bg = 'NONE' })
hi('VertSplit',    { fg = c.border, bg = c.bg })
hi('WinSeparator', { fg = c.border, bg = c.bg })
hi('StatusLine',   { fg = c.fg, bg = c.bg, bold = false })
hi('StatusLineNC', { fg = c.dim, bg = c.cursor })
hi('StatusLineNC', { fg = c.dim, bg = c.cursor })
hi('TabLine',      { fg = c.dim, bg = c.cursor })
hi('TabLineFill',  { bg = c.cursor })
hi('TabLineSel',   { fg = c.fg, bg = c.bg, bold = false })
hi('WinBar',       { fg = c.fg, bg = c.bg, bold = false })
hi('WinBarNC',     { fg = c.dim, bg = c.bg })
hi('Pmenu',        { fg = c.fg, bg = c.float_bg })
hi('PmenuSel',     { fg = c.bg, bg = c.fg, bold = false })
hi('PmenuSbar',    { bg = c.float_bg })
hi('PmenuThumb',   { bg = c.dim })
hi('PmenuMatch',   { fg = c.fg, bold = false })
hi('PmenuMatchSel', { fg = c.bg, bold = false })
hi('PmenuExtra',   { fg = c.dim })
hi('PmenuExtraSel', { fg = c.bg, bg = c.fg })
hi('Visual',       { bg = c.visual })
hi('VisualNOS',    { bg = c.visual })
hi('Search',       { fg = c.bg, bg = c.fg, bold = false })
hi('IncSearch',    { fg = search_col, bg = c.bright, bold = false })
hi('CurSearch',    { fg = c.bg, bg = search_col, bold = false })
hi('MatchParen',   { fg = parenMatch, bold = false, underline = true })
hi('Folded',       { fg = c.dim, bg = c.cursor, italic = false })
hi('FoldColumn',   { fg = c.dim, bg = 'NONE' })
hi('NonText',      { fg = c.subtle })
hi('SpecialKey',   { fg = c.subtle })
hi('Whitespace',   { fg = c.subtle })
hi('EndOfBuffer',  { fg = c.subtle })
hi('Directory',    { fg = keyword, bold = false })
hi('Title',        { fg = c.fg, bold = false })
hi('ErrorMsg',     { fg = error_col, bg = c.bg, bold = false, underline = true })
hi('WarningMsg',   { fg = c.fg, bold = false })
hi('MoreMsg',      { fg = c.fg, bold = false })
hi('ModeMsg',      { fg = c.fg, bold = false })
hi('Question',     { fg = c.fg, bold = false })
hi('WildMenu',     { fg = c.bg, bg = c.fg })
hi('QuickFixLine', { bg = c.cursor, bold = false })
hi('Conceal',      { fg = c.dim })
hi('SpellBad',     { undercurl = true, sp = c.fg })
hi('SpellCap',     { undercurl = true, sp = c.dim })
hi('SpellRare',    { undercurl = true, sp = c.dim })
hi('SpellLocal',   { undercurl = true, sp = c.dim })
hi('DiffAdd',      { bg = '#A5B5A0' })
hi('DiffChange',   { bg = '#B0BAB0' })
hi('DiffDelete',   { fg = c.dim, bg = '#C0B5B0' })
hi('DiffText',     { bg = '#95A590', bold = false })

-- Syntax: monotone with decoration
hi('Comment',      { fg = comment, italic = false,  bold = false })
hi('Constant',     { fg = c.fg,  bold = false })
hi('String',       { fg = string, italic = false,  bold = false })
hi('Character',    { fg = c.fg,  bold = false })
hi('Number',       { fg = number,  bold = false })
hi('Boolean',      { fg = c.fg,  bold = false })
hi('Float',        { fg = number,  bold = false })
hi('Identifier',   { fg = c.fg,  bold = false })
hi('Function',     { fg = c.fg,  bold = false })
hi('Statement',    { fg = c.bright,  bold = false })
hi('Conditional',  { fg = keyword,  bold = false })
hi('Repeat',       { fg = c.bright,  bold = false })
hi('Label',        { fg = c.fg,  bold = false })
hi('Operator',     { fg = c.fg,  bold = false })
hi('Keyword',      { fg = keyword,  bold = false })
hi('Exception',    { fg = c.bright,  bold = false })
hi('PreProc',      { fg = c.fg,  bold = false })
hi('Include',      { fg = c.fg,  bold = false })
hi('Define',       { fg = c.fg,  bold = false })
hi('Macro',        { fg = c.fg,  bold = false })
hi('PreCondit',    { fg = c.fg,  bold = false })
hi('Type',         { fg = default, underline = false,  bold = false })
hi('StorageClass', { fg = c.fg,  bold = false })
hi('Structure',    { fg = c.fg, underline = true,  bold = false })
hi('Typedef',      { fg = c.fg, underline = true,  bold = false })
hi('Special',      { fg = c.fg,  bold = false })
hi('SpecialChar',  { fg = c.fg,  bold = false })
hi('Tag',          { fg = c.fg, underline = true,  bold = false })
hi('Delimiter',    { fg = c.fg,  bold = false })
hi('SpecialComment', { fg = comment,  bold = false, italic = false })
hi('Debug',        { fg = c.fg,  bold = false })
hi('Underlined',   { fg = c.fg, underline = true,  bold = false })
hi('Ignore',       { fg = c.subtle,  bold = false })
hi('Error',        { fg = error_col,  bold = false, underline = true })
-- hi('Todo',         { fg = c.bg, bg = c.fg,  bold = false })

-- Treesitter
hi('@variable',           { fg = c.fg,  bold = false })
hi('@variable.builtin',   { fg = c.fg, italic = false,  bold = false })
hi('@variable.parameter', { fg = c.fg, italic = false,  bold = false })
hi('@variable.member',    { fg = c.fg,  bold = false })
hi('@constant',           { fg = c.fg,  bold = false })
hi('@constant.builtin',   { fg = c.fg,  bold = false })
hi('@constant.macro',     { fg = c.fg,  bold = false })
hi('@module',             { fg = c.fg,  bold = false })
hi('@label',              { fg = c.fg,  bold = false })
hi('@string',             { fg = string, italic = false,  bold = false })
hi('@string.escape',      { fg = c.fg,  bold = false })
hi('@string.special',     { fg = c.fg,  bold = false })
hi('@character',          { fg = c.fg,  bold = false })
hi('@number',             { fg = number,  bold = false })
hi('@boolean',            { fg = c.fg,  bold = false })
hi('@float',              { fg = c.fg,  bold = false })
hi('@function',           { fg = c.fg,  bold = false })
hi('@function.builtin',   { fg = c.fg,  bold = false, italic = false })
hi('@function.call',      { fg = c.fg,  bold = false })
hi('@function.macro',     { fg = c.fg,  bold = false, italic = false })
hi('@method',             { fg = c.fg,  bold = false })
hi('@method.call',        { fg = c.fg,  bold = false })
hi('@constructor',        { fg = c.fg,  bold = false })
hi('@keyword',            { fg = keyword,  bold = false })
hi('@keyword.function',   { fg = c.fg,  bold = false })
hi('@keyword.operator',   { fg = c.fg,  bold = false })
hi('@keyword.return',     { fg = c.bright,  bold = false })
hi('@conditional',        { fg = keyword,  bold = false })
hi('@repeat',             { fg = c.bright,  bold = false })
hi('@exception',          { fg = c.bright,  bold = false })
hi('@include',            { fg = c.fg,  bold = false })
hi('@type',               { fg = default, underline = false,  bold = false, italic = false })
hi('@type.builtin',       { fg = default, underline = false,  bold = false })
hi('@type.definition',    { fg = c.fg, underline = false,  bold = false })
hi('@type.qualifier',     { fg = c.fg,  bold = false })
hi('@attribute',          { fg = c.fg,  bold = false })
hi('@field',              { fg = c.fg,  bold = false })
hi('@property',           { fg = c.fg,  bold = false })
hi('@parameter',          { fg = c.fg, italic = false,  bold = false })
hi('@operator',           { fg = c.fg,  bold = false })
hi('@punctuation',        { fg = c.fg,  bold = false })
hi('@punctuation.bracket',    { fg = c.fg,  bold = false })
hi('@punctuation.delimiter',  { fg = c.fg,  bold = false })
hi('@punctuation.special',    { fg = c.fg,  bold = false })
hi('@comment',            { fg = comment, italic = false,  bold = false })
hi('@comment.documentation', { fg = comment, italic = false,  bold = false })
hi('@tag',                { fg = c.fg,  bold = false,  bold = false })
hi('@tag.attribute',      { fg = c.fg, italic = false,  bold = false })
hi('@tag.delimiter',      { fg = c.fg,  bold = false })
hi('@text',               { fg = c.fg,  bold = false })
hi('@text.strong',        { fg = c.fg,  bold = false })
hi('@text.emphasis',      { fg = c.fg, italic = false,  bold = false })
hi('@text.underline',     { fg = c.fg, underline = true,  bold = false })
hi('@text.strike',        { fg = c.fg, strikethrough = true,  bold = false })
hi('@text.title',         { fg = c.fg,  bold = false })
hi('@lsp.type.keyword',   { fg = default,  bold = false })

-- Markdown headings (render-markdown.nvim)
hi('RenderMarkdownH1',    { fg = c.bright, bold = false })
hi('RenderMarkdownH2',    { fg = c.bright, bold = false })
hi('RenderMarkdownH3',    { fg = c.fg, bold = false })
hi('RenderMarkdownH4',    { fg = c.fg, bold = false })
hi('RenderMarkdownH1Bg',  { fg = c.bright, bold = false })
hi('RenderMarkdownH2Bg',  { fg = c.bright, bold = false })
hi('RenderMarkdownH3Bg',  { fg = c.fg, bold = false })
hi('RenderMarkdownH4Bg',  { fg = c.fg, bold = false })
hi('RenderMarkdownCode',  { bg = c.visual })
hi('RenderMarkdownCodeInline', { bg = c.visual })
hi('RenderMarkdownBullet', { fg = c.dim })
hi('RenderMarkdownTableHead', { fg = c.fg, bold = false })
hi('RenderMarkdownTableRow',  { fg = c.fg })
hi('RenderMarkdownSuccess', { fg = c.fg })
hi('RenderMarkdownInfo',    { fg = c.dim })
hi('RenderMarkdownHint',    { fg = c.dim, italic = false })
hi('RenderMarkdownWarn',    { fg = c.fg })
hi('RenderMarkdownError',   { fg = c.fg, bold = false })
hi('@markup.heading.1.markdown', { fg = c.bright, bold = false })
hi('@markup.heading.2.markdown', { fg = c.bright, bold = false })
hi('@markup.heading.3.markdown', { fg = c.fg, bold = false })
hi('@markup.heading.4.markdown', { fg = c.fg, bold = false })
hi('@markup.raw.markdown_inline', { bg = c.visual })
hi('@text.literal',       { fg = c.fg })
hi('@text.uri',           { fg = c.fg, underline = true })
hi('@text.reference',     { fg = c.fg, italic = false })

-- LSP Diagnostics
hi('DiagnosticError',     { fg = error })
hi('DiagnosticWarn',      { fg = warning,  })
hi('DiagnosticInfo',      { fg = info })
hi('DiagnosticHint',      { fg = hint })
hi('DiagnosticOk',        { fg = c.dim })
hi('DiagnosticUnderlineError', { undercurl = true, sp = c.fg })
hi('DiagnosticUnderlineWarn',  { undercurl = true, sp = c.dim })
hi('DiagnosticUnderlineInfo',  { undercurl = true, sp = c.subtle })
hi('DiagnosticUnderlineHint',  { undercurl = true, sp = c.subtle })
hi('DiagnosticUnderlineOk',    { undercurl = true, sp = c.subtle })
hi('DiagnosticVirtualTextError', { fg = error, italic = true,  bold = false })
hi('DiagnosticVirtualTextWarn',  { fg = warning, italic = true,  bold = false })
hi('DiagnosticVirtualTextInfo',  { fg = info, italic = true,  bold = false })
hi('DiagnosticVirtualTextHint',  { fg = hint, italic = true,  bold = false })
hi('DiagnosticVirtualTextOk',    { fg = diag_fg, bg = c.cursor })
hi('DiagnosticFloatingError', { fg = c.fg, bold = false })
hi('DiagnosticFloatingWarn',  { fg = c.fg })
hi('DiagnosticFloatingInfo',  { fg = c.dim })
hi('DiagnosticFloatingHint',  { fg = c.dim, italic = false })
hi('DiagnosticFloatingOk',    { fg = c.dim })
hi('DiagnosticSignError', { fg = c.fg, bold = false })
hi('DiagnosticSignWarn',  { fg = c.fg })
hi('DiagnosticSignInfo',  { fg = c.dim })
hi('DiagnosticSignHint',  { fg = c.dim })
hi('DiagnosticSignOk',    { fg = c.dim })

-- LSP References & Hints
hi('LspReferenceText',    { bg = c.cursor })
hi('LspReferenceRead',    { bg = c.cursor })
hi('LspReferenceWrite',   { bg = c.cursor, bold = false })
hi('LspSignatureActiveParameter', { bg = c.visual, bold = false })
hi('LspCodeLens',         { fg = c.dim, italic = false })
hi('LspCodeLensSeparator', { fg = c.dim })
hi('LspInlayHint',        { fg = c.dim, bg = c.cursor, italic = false })
hi('LspInfoBorder',       { fg = c.dim, bg = c.float_bg })

-- Semantic tokens (LSP)
hi('@lsp.type.class',         { fg = default, underline = true })
hi('@lsp.type.struct',        { fg = default, underline = false })
hi('@lsp.type.interface',     { fg = default, underline = true })
hi('@lsp.type.parameter',     { fg = c.fg, italic = false })
hi('@lsp.type.variable',      { fg = c.fg })
hi('@lsp.type.property',      { fg = c.fg })
hi('@lsp.type.function',      { fg = c.fg, bold = false })
hi('@lsp.type.method',        { fg = c.fg, bold = false })
hi('@lsp.type.keyword',       { fg = keyword, bold = false })
hi('@lsp.type.namespace',     { fg = default })
hi('@lsp.type.type',          { fg = default, underline = true })
hi('@lsp.type.typeParameter', { fg = c.fg, italic = false })
hi('@lsp.mod.defaultLibrary', { italic = false })

-- Git signs
hi('GitSignsAdd',    { fg = c.fg })
hi('GitSignsChange', { fg = c.dim })
hi('GitSignsDelete', { fg = c.bright })
hi('GitSignsCurrentLineBlame', { fg = c.dim, italic = false })
hi('GitSignsAddPreview',    { fg = c.fg, bg = c.cursor })
hi('GitSignsDeletePreview', { fg = c.bright, bg = c.cursor })
hi('GitSignsAddInline',     { bg = '#A5B5A0' })
hi('GitSignsDeleteInline',  { bg = '#C0B5B0' })
hi('GitSignsChangeInline',  { bg = c.cursor })

-- Telescope
hi('TelescopeNormal',        { fg = c.fg, bg = c.visual })
hi('TelescopeBorder',        { fg = c.dim, bg = c.visual })
hi('TelescopePromptNormal',  { fg = c.fg, bg = c.visual })
hi('TelescopePromptBorder',  { fg = c.dim, bg = c.visual })
hi('TelescopePromptTitle',   { fg = c.bg, bg = c.fg, bold = false })
hi('TelescopePreviewTitle',  { fg = c.bg, bg = c.dim, bold = false })
hi('TelescopeResultsTitle',  { fg = c.bg, bg = c.dim, bold = false })
hi('TelescopeSelection',     { bg = c.visual, bold = false })
hi('TelescopeSelectionCaret', { fg = c.fg, bg = c.visual, bold = false })
hi('TelescopeMatching',      { fg = c.bright, bold = false, underline = true })
hi('TelescopePromptPrefix',  { fg = c.fg, bold = false })

-- nvim-cmp
hi('CmpItemAbbr',           { fg = c.fg })
hi('CmpItemAbbrMatch',      { fg = c.fg, bold = false })
hi('CmpItemAbbrMatchFuzzy', { fg = c.fg, bold = false })
hi('CmpItemAbbrDeprecated', { fg = c.dim, strikethrough = true })
hi('CmpItemKind',           { fg = c.dim })
hi('CmpItemMenu',           { fg = c.dim, italic = false })
-- CmpItemKind variants (all monotone with decoration hints)
hi('CmpItemKindText',          { fg = c.dim })
hi('CmpItemKindMethod',        { fg = c.dim, bold = false })
hi('CmpItemKindFunction',      { fg = c.dim, bold = false })
hi('CmpItemKindConstructor',   { fg = c.dim, bold = false })
hi('CmpItemKindField',         { fg = c.dim })
hi('CmpItemKindVariable',      { fg = c.dim })
hi('CmpItemKindClass',         { fg = c.dim, underline = true })
hi('CmpItemKindInterface',     { fg = c.dim, underline = true })
hi('CmpItemKindModule',        { fg = c.dim })
hi('CmpItemKindProperty',      { fg = c.dim })
hi('CmpItemKindUnit',          { fg = c.dim })
hi('CmpItemKindValue',         { fg = c.dim })
hi('CmpItemKindEnum',          { fg = c.dim, underline = true })
hi('CmpItemKindKeyword',       { fg = c.dim, bold = false })
hi('CmpItemKindSnippet',       { fg = c.dim, italic = false })
hi('CmpItemKindColor',         { fg = c.dim })
hi('CmpItemKindFile',          { fg = c.dim })
hi('CmpItemKindReference',     { fg = c.dim })
hi('CmpItemKindFolder',        { fg = c.dim, bold = false })
hi('CmpItemKindEnumMember',    { fg = c.dim })
hi('CmpItemKindConstant',      { fg = c.dim })
hi('CmpItemKindStruct',        { fg = c.dim, underline = true })
hi('CmpItemKindEvent',         { fg = c.dim })
hi('CmpItemKindOperator',      { fg = c.dim })
hi('CmpItemKindTypeParameter', { fg = c.dim, italic = false })

-- indent-blankline
hi('IblIndent', { fg = c.subtle })
hi('IblScope',  { fg = c.dim })

-- snacks.nvim
hi('SnacksNormal',           { fg = c.fg, bg = c.bg })
hi('SnacksNormalNC',         { fg = c.fg, bg = c.float_bg })
hi('SnacksWinBar',           { fg = c.fg, bold = false })
hi('SnacksWinBarNC',         { fg = c.dim })
hi('SnacksBackdrop',         { bg = c.border, blend = 80 })
hi('SnacksPicker',           { fg = c.fg, bg = c.float_bg })
hi('SnacksPickerPreview',    { fg = c.fg, bg = c.float_bg })
hi('SnacksPickerPreviewCursorLine', { bg = c.cursor })
hi('SnacksPickerPreviewBorder', { fg = c.dim, bg = c.float_bg })
hi('SnacksPickerPreviewFooter', { fg = c.dim, bg = c.float_bg })
hi('SnacksPickerList',       { fg = c.fg, bg = c.float_bg })
hi('SnacksPickerListCursorLine', { bg = c.cursor })
hi('SnacksPickerBorder',     { fg = c.dim, bg = c.float_bg })
hi('SnacksPickerInputBorder', { fg = c.dim, bg = c.visual })
hi('SnacksPickerInputTitle', { fg = c.bg, bg = c.fg, bold = false })
hi('SnacksPickerListTitle',  { fg = c.bg, bg = c.dim, bold = false })
hi('SnacksPickerPreviewTitle', { fg = c.bg, bg = c.dim, bold = false })
hi('SnacksPickerSelected',   { fg = c.fg, bold = false })
hi('SnacksPickerMatch',      { fg = c.bright, bold = false, underline = true })
hi('SnacksPickerPrompt',     { fg = c.fg, bold = false })
hi('SnacksPickerDir',        { fg = c.dim })
hi('SnacksPickerFile',       { fg = c.fg })
hi('SnacksPickerPathHidden', { fg = c.subtle })
hi('SnacksPickerPathIgnored', { fg = c.subtle })
hi('SnacksIndent',           { fg = c.subtle })
hi('SnacksIndentScope',      { fg = c.dim })

-- MiniCursorwordCurrent
vim.api.nvim_set_hl(0, 'MiniCursorword', {bg = "#E2B25F"})
vim.api.nvim_set_hl(0, 'MiniCursorwordCurrent', {bg = "none"})

-- fzf
vim.env.FZF_DEFAULT_OPTS = "--color=fg:#A8FF4A,bg:#09020F,hl:#7C3AED,fg+:#ff5400,bg+:#E2B25F"
-- hi('FzfCursor',      { fg = c.fg})
-- hi('FzfLuaBufName',      { fg = c.fg})
-- hi('FzfLuaSearch',      { fg = c.fg})
-- hi('FzfLuaCursorLine',      { bg = "#E2B25F" })
-- hi('FzfLuaCursorLineNr',      { bg = "#E2B25F" })

-- Fidget (LSP progress)
hi('FidgetTitle',  { fg = c.fg, bold = false })
hi('FidgetTask',   { fg = c.dim, italic = false })

-- this is not working, it changed the color of the mode
-- i don't know why
vim.cmd([[
hi Cursor gui=reverse guifg=#BE051C guibg=NONE
]])


hi('TODO',     { fg = '#A8FF4A', bold = true })
hi('BUG',      { fg = '#FF1431', bold = true })
hi('PERF',      { fg = '#F8E71C', bold = true })
hi('NOTE',      { fg = '#2BFCC8', bold = true })
hi('FIXME',      { fg = '#FF4D14', bold = true })

vim.cmd([[
autocmd BufRead,BufNewFile * call matchadd('Todo', '\<TODO\>')
autocmd BufRead,BufNewFile * call matchadd('Bug', '\<BUG\>')
autocmd BufRead,BufNewFile * call matchadd('Perf', '\<PERF\>')
autocmd BufRead,BufNewFile * call matchadd('Note', '\<NOTE\>')
autocmd BufRead,BufNewFile * call matchadd('Fixme', '\<FIXME\>')
]])

if vim.g.neovide then
    vim.g.terminal_color_0  = c.fg
    vim.g.terminal_color_1  = '#7788AA'
    vim.g.terminal_color_2  = c.fg
    vim.g.terminal_color_3  = c.fg
    vim.g.terminal_color_4  = keyword
    vim.g.terminal_color_5  = c.fg
    vim.g.terminal_color_6  = c.fg
    vim.g.terminal_color_7  = c.subtle
    vim.g.terminal_color_8  = c.dim
    vim.g.terminal_color_9  = c.fg
    vim.g.terminal_color_10 = c.fg
    vim.g.terminal_color_11 = c.fg
    vim.g.terminal_color_12 = c.fg
    vim.g.terminal_color_13 = c.fg
    vim.g.terminal_color_14 = c.fg
    vim.g.terminal_color_15 = c.bg
else
    vim.g.terminal_color_0  = c.fg
    vim.g.terminal_color_1  = '#7788AA'
    vim.g.terminal_color_2  = c.fg
    vim.g.terminal_color_3  = c.fg
    vim.g.terminal_color_4  = keyword
    vim.g.terminal_color_5  = c.fg
    vim.g.terminal_color_6  = c.fg
    vim.g.terminal_color_7  = c.subtle
    vim.g.terminal_color_8  = c.dim
    vim.g.terminal_color_9  = c.fg
    vim.g.terminal_color_10 = c.fg
    vim.g.terminal_color_11 = c.fg
    vim.g.terminal_color_12 = c.fg
    vim.g.terminal_color_13 = c.fg
    vim.g.terminal_color_14 = c.fg
    vim.g.terminal_color_15 = c.bg

end

