(defconst liquid-tags-font-lock-keywords
  `((,(regexp-opt '("if" "elsif" "else" "case" "when" "unless" "for" "in") 'words) . font-lock-keyword-face))
  "Highlighting Liquid tags")

(define-derived-mode liquid-tags-mode fundamental-mode "Liquid"
  "Major mode for Liquid Tags"
  (set (make-local-variable 'font-lock-defaults) '(liquid-tags-font-lock-keywords nil t)))

(provide 'liquid-tags-mode)
