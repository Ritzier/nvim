; extends

; Match script arrays in TOML with bash highlighting
(pair
  (bare_key) @key (#eq? @key "script")
  (array
    (string) @injection.content
    (#set! injection.language "bash")
    (#offset! @injection.content 0 3 0 -3))) ; Remove triple quotes

; Match single script strings
(pair
  (bare_key) @key (#eq? @key "script")
  (string) @injection.content
  (#set! injection.language "bash")
  (#offset! @injection.content 0 1 0 -1)) ; Remove single quotes
