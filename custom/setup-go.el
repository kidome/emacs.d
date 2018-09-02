(add-to-list 'load-path "~/Sandbox/gohome/go-mode.el")
(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

(add-hook 'go-mode-hook 'global-company-mode)

(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-go)
  (company-flx-mode +1))

(provide 'setup-go)
