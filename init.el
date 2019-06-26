;; Load path

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path (concat user-emacs-directory "setup"))
(add-to-list 'load-path (concat user-emacs-directory "vendor"))

;; config changes made through the customise UI will be stored here
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file)

;; Splash
(setq inhibit-startup-message t)

;; Turn off mouse interface
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Setup path
(require 'setup-path)

;; required packages
(defvar required-packages '(better-defaults
                            ace-window
                            ack-and-a-half
                            auto-complete
                            cider
                            ;;clj-refactor
                            clojure-mode
                            ;;cljdoc
                            dash
                            diff-hl
                            diminish
                            discover-my-major
                            expand-region
                            flx-ido
                            hydra
                            ido-ubiquitous
                            ido-vertical-mode
                            magit
                            meghanada
                            multiple-cursors
                            perspective
                            projectile
                            rainbow-delimiters
                            slamhound
                            smartparens
                            smart-mode-line
                            smex
                            solarized-theme
                            sr-speedbar
                            undo-tree
                            use-package
                            volatile-highlights))

(require 'setup-required-packages)

;; Appearance
(require 'appearance)

;; core fns
(require 'core-fns)

;; diminish
(require 'diminish)

;;(defun my-java-mode-hook ()
;;    (eclim-mode t))

;;(add-hook 'java-mode-hook 'my-java-mode-hook)
;; OSX settings
(when (eq system-type 'darwin)
  (require 'osx))

;; Wind Move
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; winner
(winner-mode 1)

;; http://emacswiki.org/emacs/DeleteSelectionMode
(delete-selection-mode 1)

;;(require 'lsp-java)
;;(add-hook 'java-mode-hook #'lsp)
;; diff-hl
;(global-diff-hl-mode 1)

;; emacs backup
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)

;; Fix for the warnings

(defvar ido-cur-item nil)
(defvar ido-default-item nil)
(defvar ido-cur-list nil)
(defvar predicate nil)
(defvar inherit-input-method nil)

;; autosave
(setq auto-save-default nil)

;; smartparens
(require 'setup-smartparens)

;; ido
(require 'setup-ido)

;; uniquify
(require 'setup-uniquify)

;; whitespace
(require 'setup-whitespace)

;; projectile
(require 'setup-projectile)

;; cider
(require 'setup-cider)

;; volatile highlights
(require 'setup-volatile-highlights)

;; sr-speedbar
(require 'setup-sr-speedbar)

;; cljdoc
;;(require 'cljdoc)

;; auto-complete
(require 'setup-autocomplete)

;; smart-mode-line
(require 'setup-smart-mode-line)

;; smex
(require 'smex)
(smex-initialize)

;; hooks
(require 'setup-hooks)

;; global key bindings
(require 'setup-global-bindings)

;; meghanada java development
(require 'setup-meghanada)

;; google style guide
;; (require 'setup-google-c-style)

;; lsp-java
;;(require 'setup-lsp-java)

;; undo-tree
(global-undo-tree-mode)
(diminish 'undo-tree-mode)

;; program overrides
(setq find-program "gfind")
(setq insert-directory-program "gls")
(setq dired-use-ls-dired t)

;; allow y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; GC tuning
(setq gc-cons-threshold 20000000)

;; clj-refactor
;; (require 'clj-refactor)

;; ace-jump-mode
;(require 'setup-ace-jump-mode)
