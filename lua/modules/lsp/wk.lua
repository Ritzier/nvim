require("which-key").register({
    l = {
        name = "LSP",
        v = {":DocsViewToggle<cr>", "Docs View"},
    },
    ls = { name = "Lsp Saga", },
    ll = {name="LSP"},
    llc = { name = "Code Action" },
    llD = { name = "Declaration" },
    llf = { name = "Formatting" },
    llh = {name="Hover"},
    lli = {name="Implementation"},
    lls = {name="Singature Help"},
    lln = {name="Rename"},
    llr = {name="References"},
    llt = {name="Type Definition"},
}, {prefix="<leader>"})
