local M = {}

local rt = require("rust-tools")

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").update_capabilities(M.capabilities)
M.capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

function M.attach(client, bufnr)
	local opts = { noremap = true, silent = true }
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
  local navic = require("nvim-navic")
  local gps = require("nvim-gps")

  vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	--[[ vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts) ]]
	vim.keymap.set("n", "gd", "<cmd>Lspsaga preview_definition<CR>", bufopts)
	vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)

	vim.keymap.set("n", "<leader>llc", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "<leader>llD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "<leader>lld", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "<leader>llf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", bufopts)
	vim.keymap.set("n", "<leader>llh", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "<leader>lli", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<leader>lls", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<leader>lln", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>llr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<leader>llt", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<leader>llwa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>llwr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>llwl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<leader>ltt", "<cmd>TroubleToggle<cr>", bufopts)
	vim.keymap.set("n", "<leader>ltq", "<cmd>TroubleToggle<cr> quickfix<cr>", bufopts)
	vim.keymap.set("n", "<leader>ltr", "<cmd>TroubleToggle<cr> lsp_references<cr>", bufopts)
	vim.keymap.set("n", "<leader>ltl", "<cmd>TroubleToggle<cr> loclist<cr>", bufopts)

	vim.keymap.set("n", "<leader>lgd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", bufopts)
	vim.keymap.set("n", "<leader>lgt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", bufopts)
	vim.keymap.set("n", "<leader>lgi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", bufopts)
	vim.keymap.set("n", "<leader>lgc", "<cmd>lua require('goto-preview').close_all_win()<CR>", bufopts)
	vim.keymap.set("n", "<leader>lgr", "<cmd>lua require('goto-preview').goto_preview_reference", bufopts)

	vim.keymap.set("n", "<leader>lsr", "<cmd>Lspsaga rename<cr>", bufopts)
	vim.keymap.set("n", "<leader>lsc", "<cmd>Lspsaga code_action<cr>", bufopts)
	vim.keymap.set("x", "<leader>lsc", ":<c-u>Lspsaga range_code_action<cr>", bufopts)
	vim.keymap.set("n", "<leader>lsk", "<cmd>Lspsaga hover_doc<cr>", bufopts)
	vim.keymap.set("n", "<leader>lss", "<cmd>Lspsaga show_line_diagnostics<cr>", bufopts)
	vim.keymap.set("n", "<leader>lsn", "<cmd>Lspsaga diagnostic_jump_next<cr>", bufopts)
	vim.keymap.set("n", "<leader>lsp", "<cmd>Lspsaga diagnostic_jump_prev<cr>", bufopts)

  vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
  -- Code action groups
  vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })

  if client.name ~= "tailwindcss"
      and client.name ~= "bashls"
      and client.name ~= "html"
      and client.name ~= "angularls"
      and client.name ~= "efm"
      and client.name ~= "cssls"
  then
    navic.attach(client, bufnr)
    require("lualine").setup({
      sections = {
        lualine_c = {
          { navic.get_location, cond = navic.is_available },
        },
      },
    })
  else
    require("lualine").setup({
      sections = {
        lualine_c = {
          { gps.get_location, cond = gps.is_available },
        },
      },
    })
  end
  vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
  -- Code action groups
  vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
end

local opts = {
  tools = { -- rust-tools options

    -- how to execute terminal commands
    -- options right now: termopen / quickfix
    executor = require("rust-tools/executors").termopen,

    -- callback to execute once rust-analyzer is done initializing the workspace
    -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
    on_initialized = nil,

    -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
    reload_workspace_from_cargo_toml = true,

    -- These apply to the default RustSetInlayHints command
    inlay_hints = {
      -- automatically set inlay hints (type hints)
      -- default: true
      auto = true,

      -- Only show inlay hints for the current line
      only_current_line = false,

      -- whether to show parameter hints with the inlay hints or not
      -- default: true
      show_parameter_hints = true,

      -- prefix for parameter hints
      -- default: "<-"
      parameter_hints_prefix = "<- ",

      -- prefix for all the other hints (type, chaining)
      -- default: "=>"
      other_hints_prefix = "=> ",

      -- whether to align to the lenght of the longest line in the file
      max_len_align = false,

      -- padding from the left if max_len_align is true
      max_len_align_padding = 1,

      -- whether to align to the extreme right or not
      right_align = false,

      -- padding from the right if right_align is true
      right_align_padding = 7,

      -- The color of the hints
      highlight = "Comment",
    },

    -- options same as lsp hover / vim.lsp.util.open_floating_preview()
    hover_actions = {

      -- the border that is used for the hover window
      -- see vim.api.nvim_open_win()
      border = {
        { "╭", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╮", "FloatBorder" },
        { "│", "FloatBorder" },
        { "╯", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╰", "FloatBorder" },
        { "│", "FloatBorder" },
      },

      -- whether the hover action window gets automatically focused
      -- default: false
      auto_focus = false,
    },

    -- settings for showing the crate graph based on graphviz and the dot
    -- command
    crate_graph = {
      -- Backend used for displaying the graph
      -- see: https://graphviz.org/docs/outputs/
      -- default: x11
      backend = "x11",
      -- where to store the output, nil for no output stored (relative
      -- path from pwd)
      -- default: nil
      output = nil,
      -- true for all crates.io and external crates, false only the local
      -- crates
      -- default: true
      full = true,
      autoSetHints = true,
      hover_with_actions = true,
      inlay_hints = {
        show_parameter_hints = false,
        parameter_hints_prefix = "",
        other_hints_prefix = "",
      },

      enabled_graphviz_backends = {
        "bmp",
        "cgimage",
        "canon",
        "dot",
        "gv",
        "xdot",
        "xdot1.2",
        "xdot1.4",
        "eps",
        "exr",
        "fig",
        "gd",
        "gd2",
        "gif",
        "gtk",
        "ico",
        "cmap",
        "ismap",
        "imap",
        "cmapx",
        "imap_np",
        "cmapx_np",
        "jpg",
        "jpeg",
        "jpe",
        "jp2",
        "json",
        "json0",
        "dot_json",
        "xdot_json",
        "pdf",
        "pic",
        "pct",
        "pict",
        "plain",
        "plain-ext",
        "png",
        "pov",
        "ps",
        "ps2",
        "psd",
        "sgi",
        "svg",
        "svgz",
        "tga",
        "tiff",
        "tif",
        "tk",
        "vml",
        "vmlz",
        "wbmp",
        "webp",
        "xlib",
        "x11",
      },
    },
  },

  server = {
    standalone = true,
    server = {
      capabilities = M.capabilities,
      on_attach = M.attach,

      settings = {
        ["rust-analyzer"] = {
          -- enable clippy on save
          checkOnSave = {
            command = "clippy",
          },
        },
      },
    },
  }, -- rust-analyer options
}

require('rust-tools').setup(opts)
