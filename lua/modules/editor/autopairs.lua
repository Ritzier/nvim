return function()
	vim.cmd([[
    let g:AutoPairs = { '<':'>','(':')', '[':']', '{':'}',"'":"'",'"':'"', '```':'```', '"""':'"""', "'''":"'''", "`":"`"}
    let g:AutoPairsShortcutFastWrap = '<M-e>'
    let g:AutoPairsFlyMode = 1
    ]])
end
