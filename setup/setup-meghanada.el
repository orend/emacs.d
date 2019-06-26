(require 'meghanada)
(add-hook 'java-mode-hook
          (lambda ()
            ;; meghanada-mode on
            (meghanada-mode t)
            ;; enable telemetry
;;            (meghanada-telemetry-enable t)
            (flycheck-mode +1)
            (setq c-basic-offset 4)
            ;; use code format
            ;; (add-hook 'before-save-hook 'meghanada-code-beautify-before-save)
            ))
(cond
   ((eq system-type 'windows-nt)
    (setq meghanada-java-path (expand-file-name "bin/java.exe" (getenv "JAVA_HOME")))
    (setq meghanada-maven-path "mvn.cmd"))
   (t
    (setq meghanada-java-path "java")
    (setq meghanada-maven-path "mvn")))

(provide 'setup-meghanada)
