(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" "4fda8201465755b403a33e385cf0f75eeec31ca8893199266a6aeccb4adedfa4" default))
 '(magit-todos-insert-after '(bottom) nil nil "Changed by setter of obsolete option `magit-todos-insert-at'")
 '(safe-local-variable-values
   '((flycheck-javascript-eslint-executable . "~/Projects/MDXical/node_modules/.bin/eslint")
     (ssh-deploy-root-local . "~/dockers/containers/")
     (ssh-deploy-async-with-threads . 1)
     (ssh-deploy-async . 1)
     (ssh-deploy-on-explicit-save . 1)
     (ssh-deploy-automatically-detect-remote-changes . 1)
     (ssh-deploy-root-remote . "/ssh:josh@media.mcgee.network:/opt/containers")
     (ssh-deploy-root-local . "~/dockers/server/")))
 '(warning-suppress-types '((lsp-mode) (lsp-mode) (lsp-mode) (defvaralias))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:foreground "white" :background "red" :weight bold :height 2.5 :box (:line-width 10 :color "red")))))
 '(ts-fold-replacement-face ((t (:foreground unspecified :box nil :inherit font-lock-comment-face :weight light)))))
