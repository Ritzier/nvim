local keymap = vim.keymap.set

local function on_attach(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  local opts = { noremap = true, silent = true }

  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")

  require("which-key").register({
    w = {
      name = "Workspace",
      a = { ":lua vim.lsp.buf.add_workspace_folder", "Add WorkSpace Folder" },
      r = { ":lua vim.lsp.buf.remove_workspace_folder", "Remove WorkSpace Folder" },
      l = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "List Workspace Folder" },
    },
    f = { ":lua vim.lsp.buf.format()<CR>", "Format" },
    n = { ":lua vim.lsp.buf.rename()<CR>", "Rename" },
    e = { ":lua vim.diagnostic.open_float()<CR>", "Diagnostic Open Float" }

  }, { prefix = "<space>", buffer = bufnr, silent = true, noremap = true })

  require("which-key").register({
    gD = { vim.lsp.buf.declaration, "Declaration" },
    gd = { vim.lsp.buf.definition, "Definition" },
    gi = { vim.lsp.buf.implementation, "Implementaion" },
    gt = { vim.lsp.buf.type_definition, "Type Definition" },
    -- K = { vim.lsp.buf.hover, "Hover Doc" },
    K = { "<cmd>Lspsaga hover_doc<CR>", "Hover" },
    ["[e"] = {
      "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>",
      "Prev Error"
    },
    ["]e"] = {
      -- "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>",
      "<cmd>Lspsaga ",
      "Next Error"
    },
    ["[d"] = {
      "<cmd>lua vim.diagnostic.goto_prev()<CR>",
      "Prev Diagnostic"
    },
    ["]d"] = {
      "<cmd>lua vim.diagnostic.goto_next()<CR>",
      "Next Diagnostic"
    },
  }, { leader = "", silent = true, noremap = true, buffer = bufnr })

  if client.server_capabilities.definitionProvider then
    vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
  end
end

return on_attach