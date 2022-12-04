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

(require 'js2-mode)
(require 'css-mode)

(defconst jss-font-lock-keywords
  ;; Variables
  '(("$\{[a-z_-][a-z-_0-9]*\}" . font-lock-constant-face)))

;;;###autoload
(define-derived-mode jss-mode js2-mode "jsslang"
  "Major mode for editing jsslang files
Special commands:
\\{jss-mode-map}"
  ;; taken from css-mode
  (setq-local font-lock-defaults css-font-lock-defaults)
  (setq-local syntax-propertize-function
              css-syntax-propertize-function)
  (setq-local fill-paragraph-function #'css-fill-paragraph)
  (setq-local adaptive-fill-function #'css-adaptive-fill)
  (setq-local add-log-current-defun-function #'css-current-defun-name)
  (smie-setup css-smie-grammar #'css-smie-rules
              :forward-token #'css-smie--forward-token
              :backward-token #'css-smie--backward-token)
  (setq-local electric-indent-chars
              (append css-electric-keys electric-indent-chars))
  (setq-local font-lock-fontify-region-function #'css--fontify-region)
  (add-hook 'completion-at-point-functions
            #'css-completion-at-point nil 'local)
  ;; The default "." creates ambiguity with class selectors.
  (setq-local imenu-space-replacement " ")
  (setq-local imenu-prev-index-position-function
              #'css--prev-index-position)
  (setq-local imenu-extract-index-name-function
              #'css--extract-index-name)

  (font-lock-add-keywords nil jsfont-lock-keywords)
  ;; Add the single-line comment syntax ('//', ends with newline)
  ;; as comment style 'b' (see "Syntax Flags" in elisp manual)
  (modify-syntax-entry ?/ ". 124" css-mode-syntax-table)
  (modify-syntax-entry ?* ". 23b" css-mode-syntax-table)
  (modify-syntax-entry ?\n ">" css-mode-syntax-table))

  ;(add-to-list 'compilation-error-regexp-alist jss-compile-error-regex)
  ;(add-hook 'after-save-hook 'jss-compile-maybe nil t)

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.jss\\'" . jss-mode))


(provide 'jss-mode)
;;; jss-mode.el ends here
