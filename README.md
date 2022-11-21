# jsslang-mode
Simple Emacs mode for jsslang

# Installation

Add something like this to your emacs load file:

``` emacs-lisp
(add-to-list 'load-path (expand-file-name "~/.emacs.d/folder-where-you-put-jss-mode-el"))
(autoload 'jss-mode "jss-mode")
(add-to-list 'auto-mode-alist '("\\.jss\\'" . jss-mode))
```
