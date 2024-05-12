;; extends
(rpc (rpc_name) @rpcFunctionName)
(rpc (message_or_enum_type) @rpcMessageOrEnumType)
(message (message_body (field (type) @messageBodyFieldType)))
(message (message_body (field (type (message_or_enum_type) @messageBodyFieldType))))
(message (message_body (field (identifier) @messageBodyFieldIdentifier)))
(package (full_ident (identifier) @packageIdentifier))
