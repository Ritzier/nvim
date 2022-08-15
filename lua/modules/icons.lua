local icons = {}

icons.navic_icons = {
	[1] = " ", -- File
	[2] = " ", -- Module
	[3] = " ", -- Namespace
	[4] = " ", -- Package
	[5] = "ﴯ ", -- Class
	[6] = " ", -- Method
	[7] = "ﰠ ", -- Property
	[8] = " ", -- Field
	[9] = " ", -- Constructor
	[10] = "", -- Enum
	[11] = "", -- Interface
	[12] = " ", -- Function
	[13] = " ", -- Variable
	[14] = " ", -- Constant
	[15] = "𝓐 ", -- String
	[16] = "# ", -- Number
	[17] = "◩ ", -- Boolean
	[18] = " ", -- Array
	[19] = "⦿ ", -- Object
	[20] = " ", -- Key
	[21] = "ﳠ ", -- Null
	[22] = " ", -- EnumMember
	[23] = " ", -- Struct
	[24] = " ", -- Event
	[25] = " ", -- Operator
	[26] = " ", -- TypeParameter
}

icons.nvim_lsp = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "塞",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

icons.global = {
	File = { icon = "", hl = "TSURI" },
	Module = { icon = "", hl = "TSNamespace" },
	Namespace = { icon = "", hl = "TSNamespace" },
	Package = { icon = "", hl = "TSNamespace" },
	Class = { icon = "ﴯ", hl = "TSType" },
	Method = { icon = "", hl = "TSMethod" },
	Property = { icon = "ﰠ", hl = "TSMethod" },
	Field = { icon = "", hl = "TSField" },
	Constructor = { icon = "", hl = "TSConstructor" },
	Enum = { icon = "", hl = "TSType" },
	Interface = { icon = "", hl = "TSType" },
	Function = { icon = "", hl = "TSFunction" },
	Variable = { icon = "", hl = "TSConstant" },
	Constant = { icon = "", hl = "TSConstant" },
	String = { icon = "𝓐", hl = "TSString" },
	Number = { icon = "#", hl = "TSNumber" },
	Boolean = { icon = "◩", hl = "TSBoolean" },
	Array = { icon = "", hl = "TSConstant" },
	Object = { icon = "⦿", hl = "TSType" },
	Key = { icon = "", hl = "TSType" },
	Null = { icon = "ﳠ", hl = "TSType" },
	EnumMember = { icon = "", hl = "TSField" },
	Struct = { icon = "", hl = "TSType" },
	Event = { icon = "", hl = "TSType" },
	Operator = { icon = "", hl = "TSOperator" },
	TypeParameter = { icon = "", hl = "TSParameter" },
}

icons.devicons = {
	default_icon = {
		icon = "",
		name = "Default",
	},
	c = {
		icon = "",
		name = "c",
	},
	css = {
		icon = "",
		name = "css",
	},
	deb = {
		icon = "",
		name = "deb",
	},
	Dockerfile = {
		icon = "",
		name = "Dockerfile",
	},
	html = {
		icon = "",
		name = "html",
	},
	jpeg = {
		icon = "",
		name = "jpeg",
	},
	jpg = {
		icon = "",
		name = "jpg",
	},
	js = {
		icon = "",
		name = "js",
	},
	kt = {
		icon = "󱈙",
		name = "kt",
	},
	lock = {
		icon = "",
		name = "lock",
	},
	lua = {
		icon = "",
		name = "lua",
	},
	mp3 = {
		icon = "",
		name = "mp3",
	},
	mp4 = {
		icon = "",
		name = "mp4",
	},
	out = {
		icon = "",
		name = "out",
	},
	png = {
		icon = "",
		name = "png",
	},
	py = {
		icon = "",
		name = "py",
	},
	["robots.txt"] = {
		icon = "ﮧ",
		name = "robots",
	},
	toml = {
		icon = "",
		name = "toml",
	},
	ts = {
		icon = "ﯤ",
		name = "ts",
	},
	ttf = {
		icon = "",
		name = "TrueTypeFont",
	},
	rb = {
		icon = "",
		name = "rb",
	},
	rpm = {
		icon = "",
		name = "rpm",
	},
	vue = {
		icon = "﵂",
		name = "vue",
	},
	woff = {
		icon = "",
		name = "WebOpenFontFormat",
	},
	woff2 = {
		icon = "",
		name = "WebOpenFontFormat2",
	},
	xz = {
		icon = "",
		name = "xz",
	},
	zip = {
		icon = "",
		name = "zip",
	},
}


return icons
