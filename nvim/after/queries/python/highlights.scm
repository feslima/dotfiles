;; extends
(with_statement ["with"] @keyword.with)
(as_pattern ["as"] @keyword.as)
(import_statement name: (dotted_name (identifier) @module.import))
(import_from_statement module_name: (dotted_name (identifier) @module.import))
(class_definition
  body: (block (function_definition
          name:(identifier) @constructor.init-definition
          (#eq? @constructor.init-definition "__init__")))
)
(for_statement ["in"] @keyword.in)
(type_parameter (type (string (string_content) @type)))
