(require 'clj-refactor)

(defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import
    (cljr-add-keybindings-with-prefix "C-c C-j")
    (setq cljr-warn-on-eval nil))

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)
