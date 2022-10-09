require("nvim-treesitter.configs").setup({
	ensure_installed = {
    "bash",
    "c",
    "c_sharp",
    "cmake",
    "comment",
    "cpp",
    "css",
    "cuda",
    "dart",
    "dockerfile",
    "dot",
    "elm",
    "fish",
    "gdscript",
    "go",
    "godot_resource",
    "gomod",
    "gowork",
    "graphql",
    "hack",
    "haskell",
    "html",
    "http",
    "java",
    "javascript",
    "jsdoc",
    "json",
    "json5",
    "jsonc",
    "jsonnet",
    "julia",
    "kotlin",
    "llvm",
    "lua",
    "make",
    "markdown",
    "markdown_inline",
    "meson",
    "ninja",
    "nix",
    "ocaml",
    "ocaml_interface",
    "ocamllex",
    "pascal",
    "perl",
    "php",
    "phpdoc",
    "python",
    "query",
    "r",
    "ruby",
    "rust",
    "sql",
    "surface",
    "swift",
    "toml",
    "tsx",
    "v",
    "vim",
    "vue",
    "wgsl",
    "yang",
    "zig",
  },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	autotag = {
		enable = true,
	},
	endwise = {
		enable = true,
	},
	rainbow = {
		enable = true,
	},
	matchup = {
		enable = true,
	},
})

require("indent_blankline").setup({
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
})

require("nvim-autopairs").setup({
	fast_wrap = {
		map = "<M-e>",
		chars = { "{", "[", "(", '"', "'" },
		pattern = [=[[%'%"%)%>%]%)%}%,]]=],
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "Search",
		highlight_grey = "Comment",
	},
})

local Rule = require'nvim-autopairs.rule'

require("nvim-autopairs").add_rules({
	require("nvim-autopairs.ts-rule").endwise("then$", "end", "lua", "if_statement"),
	Rule(' ', ' ')
    :with_pair(function (opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({ '()', '[]', '{}' }, pair)
    end),
  Rule('( ', ' )')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%)') ~= nil
      end)
      :use_key(')'),
  Rule('{ ', ' }')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%}') ~= nil
      end)
      :use_key('}'),
  Rule('[ ', ' ]')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%]') ~= nil
      end)
      :use_key(']')
})
