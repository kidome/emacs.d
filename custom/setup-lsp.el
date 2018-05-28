
(with-eval-after-load 'company
  (company-flx-mode +1)
  (setq company-flx-limit 50) )

(with-eval-after-load 'helm
  (helm-flx-mode +1))


(use-package cquery
  :commands lsp-cquery-enable
  :init
  (progn
    (defun cquery//enable ()
      (condition-case nil
          (lsp-cquery-enable)
        (user-error nil)))
    (add-hook 'c-mode-common-hook #'cquery//enable)
    (setq cquery-executable "/usr/local/bin/cquery")))

(use-package lsp-ui
  :init
  (progn
    (add-hook 'lsp-mode-hook 'lsp-ui-mode)
    ))

(use-package company-lsp
  :init
  (progn
    (push 'company-lsp company-backends)
    (setq company-transformers nil company-lsp-async t company-lsp-cache-candidates nil)))

;; do lsp-cquery-enable on finding .cquery files in project root directory
;;(defun my//enable-cquery-if-compile-commands-json ()
;;  (when
;;      (and (not (and (boundp 'lsp-mode) lsp-mode))
;;           (or
;;            (cl-some (lambda (x) (string-match-p x buffer-file-name)) my-cquery-whitelist)
;;            (cl-notany (lambda (x) (string-match-p x buffer-file-name)) my-cquery-blacklist))
;;           (or (locate-dominating-file default-directory "compile_commands.json")
;;               (locate-dominating-file default-directory ".cquery")))
;;    (setq eldoc-idle-delay 0.2)
;;    (lsp-cquery-enable)
;;    (lsp-enable-imenu)
;;    (when (>= emacs-major-version 26)
;;      (lsp-ui-doc-mode 1))))


(provide 'setup-lsp)
