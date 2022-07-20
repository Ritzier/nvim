local navic_icons = {
    [1] = " ", -- File
    [2] = " ", -- Module
    [3] = " ", -- Namespace
    [4] = " ", -- Package
    [5] = "ﴯ ", -- Class
    [6] = " ", -- Method
    [7] = " ", -- Property
    [8] = "ﰠ ", -- Field
    [9] = " ", -- Constructor
    [10] = "", -- Enum
    [11] = "", -- Interface
    [12] = " ", -- Function
    [13] = " ", -- Variable
    [14] = " ", -- Constant
    [15] = " ", -- String
    [16] = "# ", -- Number
    [17] = "◩ ", -- Boolean
    [18] = " ", -- Array
    [19] = "⦿ ", -- Object
    [20] = " ", -- Key
    [21] = "ﳠ ", -- Null
    [22] = " ", -- EnumMember
    [23] = " ", -- Struct
    [24] = " ", -- Event
    [25] = " ", -- Operator
    [26] = " ", -- TypeParameter
}

local nvim_lsp = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "ﰠ",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "塞",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = ""
}

File = {icon = "", hl = "TSURI"}
Module = {icon = "", hl = "TSNamespace"}
Namespace = {icon = "", hl = "TSNamespace"}
Package = {icon = "", hl = "TSNamespace"}
Class = {icon = "ﴯ", hl = "TSType"}
Method = {icon = "", hl = "TSMethod"}
Property = {icon = "", hl = "TSMethod"}
Field = {icon = "ﰠ", hl = "TSField"}
Constructor = {icon = "", hl = "TSConstructor"}
Enum = {icon = "", hl = "TSType"}
Interface = {icon = "", hl = "TSType"}
Function = {icon = "", hl = "TSFunction"}
Variable = {icon = "", hl = "TSConstant"}
Constant = {icon = "", hl = "TSConstant"}
String = {icon = "𝓐", hl = "TSString"}
Number = {icon = "#", hl = "TSNumber"}
Boolean = {icon = "◩", hl = "TSBoolean"}
Array = {icon = "", hl = "TSConstant"}
Object = {icon = "⦿", hl = "TSType"}
Key = {icon = "", hl = "TSType"}
Null = {icon = "ﳠ", hl = "TSType"}
EnumMember = {icon = "", hl = "TSField"}
Struct = {icon = "", hl = "TSType"}
Event = {icon = "", hl = "TSType"}
Operator = {icon = "", hl = "TSOperator"}
TypeParameter = {icon = "", hl = "TSParameter"}
