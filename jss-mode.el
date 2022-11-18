;;; jss-mode.el --- Major mode for editing jsslang files -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2022 John Doe
;;
;; Author: Vitaliy Mayorov
;; Maintainer: Vitaliy Mayorov
;; Created: November 18, 2022
;; Modified: November 18, 2022
;; Version: 0.0.1
;; Keywords: languages jss jsslang
;; Homepage: https://github.com/vital/jss-mode
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:

(defconst jss-font-lock-keywords
  ;; Variables
  '(("$\{[a-z_-][a-z-_0-9]*\}" . font-lock-constant-face)))


(define-derived-mode jss-mode css-mode "jsslang"
  "Major mode for editing jsslang files
Special commands:
\\{jss-mode-map}"
  (font-lock-add-keywords nil jss-font-lock-keywords)
  ;; Add the single-line comment syntax ('//', ends with newline)
  ;; as comment style 'b' (see "Syntax Flags" in elisp manual)
  (modify-syntax-entry ?/ ". 124" css-mode-syntax-table)
  (modify-syntax-entry ?* ". 23b" css-mode-syntax-table)
  (modify-syntax-entry ?\n ">" css-mode-syntax-table))
  ;(add-to-list 'compilation-error-regexp-alist jss-compile-error-regex)
  ;(add-hook 'after-save-hook 'jss-compile-maybe nil t)


(provide 'jss-mode)
;;; jss-mode.el ends here
