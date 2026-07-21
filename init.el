;; Use large font for YouTube video
(set-face-attribute 'default nil :height 140)

;; Disable annoying bell sound when pressing C-g, etc.
(setq ring-bell-function #'ignore)

;; Add MELPA (popular third-party package repo)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; Install and load `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(use-package tree-guide
  ;; First run `git clone http://github.com/benvvalk/tree-guide.el`,
  ;; then add the resulting directory to the load path:
  :load-path "~/git/tree-guide.el/"
  :hook emacs-lisp-mode)

(use-package aggressive-indent
  :ensure t
  :hook emacs-lisp-mode)

(use-package paren
  :hook (emacs-lisp-mode . show-paren-local-mode)
  :init
  ;; Highlight the whole expression, not just the matching paren
  (setq show-paren-style 'expression))

(use-package lispy
  :ensure t
  :hook emacs-lisp-mode)

(use-package hideshow-org
  :ensure t
  :hook (emacs-lisp-mode . hs-org/minor-mode)
  :config
  ;; Don't move the cursor when folding/unfolding!
  (advice-add #'hs-toggle-hiding
              :around
              (lambda (orig-function)
                (save-excursion
                  (funcall orig-function)))))
