(require 'package)

; (add-to-list 'package-archives
;             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(cond
 ((>= 24 emacs-major-version)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives
           '("melpa-stable" . "http://stable.melpa.org/packages/") t)
  (package-refresh-contents)
 )
)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(dolist (p required-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'setup-required-packages)
;; setup-required-packages ends here
