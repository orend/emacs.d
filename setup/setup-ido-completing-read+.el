(require 'ido)
(require 'ido-completing-read+)
(require 'flx-ido)
(require 'ido-vertical-mode)

(ido-mode +1)
(ido-ubiquitous-mode 1)
(ido-vertical-mode 1)
(ido-everywhere 1)
(flx-ido-mode +1)

(setq ido-enable-prefix nil)
(setq ido-enable-flex-matching t)
(setq ido-max-prospects 10)
(setq ido-auto-merge-work-directories-length -1)
(setq ido-use-faces nil)
(setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)

;; ido files to ignore
(add-to-list 'ido-ignore-files "\\.DS_Store")

(provide 'setup-ido-completing-read+)
;; setup-ido ends here
