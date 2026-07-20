; Helix tree-sitter highlight queries: later patterns override earlier ones.
; Catch-alls go first; more specific overrides come last.

; Comments
(line_comment) @comment
(block_comment) @comment

; Literals
(integer_literal) @number
(float_literal) @number
(boolean_literal) @constant.builtin.boolean
(string_literal) @string
(raw_string_literal) @string
(raw_byte_string_literal) @string
(byte_string_literal) @string
(byte_literal) @string.special
(char_literal) @string
(label) @label

; Catch-all identifiers (specific cases override these below)
(identifier) @variable
(type_identifier) @type
(primitive_type) @type.builtin

; Built-in generic/container types
((type_identifier) @type.builtin
  (#match? @type.builtin "^(Arc|Array|BTreeMap|BTreeSet|Box|Fn|FnMut|FnOnce|HashMap|HashSet|JoinHandle|Mutex|Option|Rc|Receiver|Result|RwLock|Sender|String|Vec|Weak)$"))

; Built-in constructors (Some/None/Ok/Err live as paths/identifiers, match by name)
((identifier) @constant.builtin
  (#match? @constant.builtin "^(Some|None|Ok|Err)$"))

; Functions
(function_item name: (identifier) @function)
(call_expression function: (identifier) @function)
(generic_function function: (identifier) @function)
(method_call_expression (identifier) @function.method)

; Built-in macros (`println!`, `matches!`, `regex!`, ...)
(macro_invocation macro: (identifier) @function.macro)
(spread_argument) @operator

; Fields
(field_expression (identifier) @variable.field .)
(field_declaration name: (identifier) @variable.field)

; Parameters
(parameter pattern: (identifier) @variable.parameter)
(closure_parameter pattern: (identifier) @variable.parameter)

; Operators
[
  "+"
  "-"
  "*"
  "/"
  "%"
  "&"
  "|"
  "^"
  "!"
  "<"
  ">"
  "="
  "=="
  "!="
  "<="
  ">="
  "&&"
  "||"
  "<<"
  ">>"
  "->"
  "=>"
  "+="
  "-="
  "*="
  "/="
  "%="
  "&="
  "|="
  "^="
  "<<="
  ">>="
  ".."
  "..="
  "::"
  "::<"
  "@"
  "?"
] @operator

"|>" @operator.special

; Punctuation
[ "(" ")" "[" "]" "{" "}" ] @punctuation.bracket
[ "," ";" ":" "." ] @punctuation.delimiter

; Keywords
[
  "as"
  "async"
  "await"
  "comptime"
  "const"
  "crate"
  "dyn"
  "enum"
  "extern"
  "fn"
  "impl"
  "let"
  "mod"
  "mut"
  "package"
  "pub"
  "self"
  "Self"
  "static"
  "struct"
  "super"
  "trait"
  "type"
  "unsafe"
  "use"
  "where"
  "yield"
] @keyword

[
  "if"
  "else"
  "match"
  "loop"
  "while"
  "for"
  "in"
  "break"
  "return"
  "defer"
  "select"
  "go"
  "arena"
  "continue"
] @keyword.control

(reserved_keyword) @keyword
(continue_expression) @keyword.control

; Attributes
(attribute_item) @attribute
