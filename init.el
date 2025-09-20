;; Load path

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

;(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path (concat user-emacs-directory "setup"))
(add-to-list 'load-path (concat user-emacs-directory "vendor"))

;; config changes made through the customise UI will be stored here
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file)

;; Splash
(setq inhibit-startup-message t)

;; Start Emacs server for emacsclient
(require 'server)
(unless (server-running-p)
  (server-start))

;; Turn off mouse interface
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Setup path
(require 'setup-path)

;; required packages
(defvar required-packages '(better-defaults
                            ace-window
                            ;; ack-and-a-half
                            amx
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
                            go-mode
                            highlight-symbol
                            hydra
                            ido-vertical-mode
                            ido-completing-read+
                            lsp-mode
                            magit
                            meghanada
                            multiple-cursors
                            org-download
                            org-superstar
                            perspective
                            projectile
                            rainbow-delimiters
                            ;; slamhound
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

;; Auto-save configuration
(setq auto-save-default t)  ; Enable auto-save
(setq auto-save-interval 300)  ; Auto-save after 300 keystrokes
(setq auto-save-timeout 30)  ; Auto-save after 30 seconds of idle time

;; Put auto-save files in a specific directory
(setq auto-save-file-name-transforms
      `((".*" ,(concat user-emacs-directory "auto-save/") t)))

;; Create auto-save directory if it doesn't exist
(unless (file-exists-p (concat user-emacs-directory "auto-save/"))
  (make-directory (concat user-emacs-directory "auto-save/") t))

;; Auto-save on loss of focus
(add-hook 'focus-out-hook (lambda () (save-some-buffers t)))

;; Backup files configuration
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups/"))))
(setq backup-by-copying t)  ; Don't clobber symlinks
(setq delete-old-versions t)
(setq kept-new-versions 6)
(setq kept-old-versions 2)
(setq version-control t)  ; Use versioned backups

;; Create backups directory if it doesn't exist
(unless (file-exists-p (concat user-emacs-directory "backups/"))
  (make-directory (concat user-emacs-directory "backups/") t))

;; Function to recover from auto-save files
(defun recover-this-file ()
  "Recover the current buffer from its auto-save file."
  (interactive)
  (let ((auto-save-file (make-auto-save-file-name)))
    (if (file-exists-p auto-save-file)
        (progn
          (find-file auto-save-file)
          (message "Recovered from auto-save file: %s" auto-save-file))
      (message "No auto-save file found for this buffer"))))

;; Save all buffers when Emacs loses focus or is killed
(add-hook 'kill-emacs-hook (lambda () (save-some-buffers t)))
(add-hook 'suspend-hook (lambda () (save-some-buffers t)))

;; smartparens
(require 'setup-smartparens)

;; ido
(require 'setup-ido-completing-read+)

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

;; google style guide
(require 'google-c-style)

;; meghanada java development
(require 'setup-meghanada)

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

(require 'amx)
(amx-mode 1)

(setq-default indent-tabs-mode nil)

(require 'org-superstar)
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))

;; (set-face-attribute 'default nil :font "Courier New")

(require 'org-download)

;; Drag-and-drop to `dired`
(add-hook 'dired-mode-hook 'org-download-enable)
(setq org-image-actual-width nil)

;; Enable visual-line mode globally
(global-visual-line-mode 1)
(diminish 'visual-line-mode)

;; Desktop/Sessions - Save and restore Emacs sessions
(desktop-save-mode 1)
(setq desktop-path (list user-emacs-directory))
(setq desktop-dirname user-emacs-directory)
(setq desktop-base-file-name "emacs-desktop")
(setq desktop-load-locked-desktop t)  ; Load desktop even if it's locked
(setq desktop-auto-save-timeout 30)   ; Auto-save desktop every 30 seconds
