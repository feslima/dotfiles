;; extends

; Update priority of "assert" keyword
(
 (assert_statement ["assert"] @javaAssertStatement)
 (#set! "priority" 125)
)

; make "default" of switch belong to conditional
(switch_label ["default"] @conditional.java)
