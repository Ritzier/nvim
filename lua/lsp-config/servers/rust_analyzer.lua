local M = {}

local rt = require("rust-tools")

function M.setup(on_attach, capabilities)

  local function custom_attach(client, bufnr)
    on_attach(client, bufnr)
    vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
    vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })

  end

  local opts = {
    tools = { -- rust-tools options
      executor = require("rust-tools/executors").termopen,
      on_initialized = nil,
      reload_workspace_from_cargo_toml = true,
      inlay_hints = {
        auto = true,
        only_current_line = false,
        show_parameter_hints = true,
        parameter_hints_prefix = "<- ",
        other_hints_prefix = "=> ",
        max_len_align = false,
        max_len_align_padding = 1,
        right_align = false,
        right_align_padding = 7,
        highlight = "Comment",
      },

      hover_actions = {
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

        auto_focus = false,
      },

      crate_graph = {
        backend = "x11",
        output = nil,
        full = true,
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
          show_parameter_hints = true,
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
        capabilities = capabilities,
        on_attach = custom_attach,

        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy",
            },
            completion = {
              -- postfix = {
              --   enable = false,
              -- }
              callable = {
                snippets = "fill_arguments"
              }
            },
            imports = {
              granularity = {
                group = "module",
              },
              prefix = "self",
            },
            cargo = {
              buildScripts = {
                enable = true,
              },
            },
            procMacro = {
              enable = true,
            },
          },
        },
      },
    }, -- rust-analyer options
  }

  require('rust-tools').setup(opts)
end

require("lualine").setup({
  sections = {
    lualine_c = {
      { require("nvim-gps").get_location, cond = require("nvim-gps").is_available },
    },
  },
})

return M
