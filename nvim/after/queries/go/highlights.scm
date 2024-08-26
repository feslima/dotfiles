;; extends
(import_declaration ["import"] @goImportDeclaration)
(import_spec (package_identifier) @goImportPackageIdentifier)
(
 (for_statement (range_clause ["range"] @goForRange))
 (#set! "priority" 125)
)
(expression_switch_statement (default_case ["default"] @keyword.conditional))
(default_case ["default"] @keyword.conditional)
(defer_statement ["defer"] @keyword.conditional)
(select_statement ["select"] @keyword.conditional)
(continue_statement ["continue"] @keyword.conditional)
(break_statement ["break"] @keyword.conditional)
