local wk = require("which-key")

return function(hop, directions)
    wk.register({
        h = {
            name = "hop",
            f = {
                function()
                    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
                end,
                "Jump After Cursor"
            },
            F = {
                function()
                    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
                end
            },
            t = {
                function()
                    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
                end
            },
            T = {
                function()
                    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
                end
            }
        }
    }, { mode = 'n', 'x', 'v', prefix = '<leader>', silent = true })
end
