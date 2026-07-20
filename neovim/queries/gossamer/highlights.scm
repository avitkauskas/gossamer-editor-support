; This file mirrors editors/tree-sitter-gossamer/queries/highlights.scm.
; It is placed here so neovim's runtimepath query loader can find it
; when the tree-sitter parser is registered as `gossamer`.

; Comments
(line_comment) @comment
(block_comment) @comment

; Literals
(integer_literal) @number
(float_literal) @number
(boolean_literal) @boolean
(string_literal) @string
(raw_string_literal) @string
(raw_byte_string_literal) @string
(byte_string_literal) @string
(byte_literal) @character
(char_literal) @character
(label) @label

((identifier) @constant.builtin
  (#match? @constant.builtin "^(Some|None|Ok|Err)$"))

(primitive_type) @type.builtin

((type_identifier) @type.builtin
  (#match? @type.builtin "^(Arc|Array|BTreeMap|BTreeSet|Box|Fn|FnMut|FnOnce|HashMap|HashSet|JoinHandle|Mutex|Option|Rc|Receiver|Result|RwLock|Sender|String|Vec|Weak)$"))

(type_identifier) @type

(function_item name: (identifier) @function)
(call_expression function: (identifier) @function.call)
(generic_function function: (identifier) @function.call)
(method_call_expression (identifier) @function.method)
(macro_invocation macro: (identifier) @function.macro)

(field_declaration name: (identifier) @field)
(parameter pattern: (identifier) @parameter)
(closure_parameter pattern: (identifier) @parameter)

(identifier) @variable

"|>" @operator

; Only tokens the grammar actually defines may appear here; an unknown
; token makes the whole query fail to load.
[
  "as" "async" "await" "comptime" "const" "crate" "dyn" "enum"
  "extern" "fn" "impl" "let" "mod" "mut" "package" "pub" "self"
  "Self" "static" "struct" "super" "trait" "type" "unsafe" "use"
  "where" "yield"
] @keyword

[
  "if" "else" "match" "loop" "while" "for" "in" "break"
  "continue" "return" "defer" "select" "go" "arena"
] @keyword

(reserved_keyword) @keyword
(continue_expression) @keyword

(attribute_item) @attribute
