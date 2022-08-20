require('lspkind').init({
    -- DEPRECATED (use mode instead): enables text annotations
    --
    -- default: true
    -- with_text = true,

    -- defines how annotations are shown
    -- default: symbol
    -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
    mode = 'symbol_text',
	-- mode = 'text_symbol',

    preset = 'codicons',

    symbol_map = require('modules.icons').nvim_lsp
})
