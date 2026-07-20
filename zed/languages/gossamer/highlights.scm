; Mirrors editors/tree-sitter-gossamer/queries/highlights.scm but tuned
; for Zed's highlight name conventions.

(line_comment) @comment
(block_comment) @comment

(integer_literal) @number
(float_literal) @number
(boolean_literal) @boolean
(string_literal) @string
(raw_string_literal) @string
(raw_byte_string_literal) @string
(byte_string_literal) @string
(byte_literal) @string.special
(char_literal) @string.special
(label) @label

((identifier) @constant
  (#match? @constant "^(Some|None|Ok|Err)$"))

(primitive_type) @type
(type_identifier) @type

(function_item name: (identifier) @function)
(call_expression function: (identifier) @function)
(generic_function function: (identifier) @function)
(method_call_expression (identifier) @function.method)
(macro_invocation macro: (identifier) @function.special)

(field_declaration name: (identifier) @property)
(parameter pattern: (identifier) @variable.parameter)
(closure_parameter pattern: (identifier) @variable.parameter)

(identifier) @variable

"|>" @operator

; Only tokens the grammar actually defines may appear here; an unknown
; token makes the whole query fail to load.
[
  "as" "async" "await" "comptime" "const" "crate" "dyn" "enum"
  "extern" "fn" "impl" "let" "mod" "mut" "package" "pub" "self"
  "Self" "static" "struct" "super" "trait" "type" "unsafe" "use"
  "where" "yield"
  "if" "else" "match" "loop" "while" "for" "in" "break"
  "continue" "return" "defer" "select" "go" "arena"
] @keyword

(reserved_keyword) @keyword
(continue_expression) @keyword

(attribute_item) @attribute
