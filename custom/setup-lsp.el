
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
    (with-eval-after-load 'cquery
      ;;(setq cquery-sem-highlight-method 'font-lock)
      ;;(cquery-use-default-rainbow-sem-highlight)
      (setq cquery-executable "/usr/local/bin/cquery"))
    (add-hook 'c-mode-common-hook #'cquery//enable)
    ))

(use-package lsp-ui
  :init
  (progn
    (add-hook 'lsp-mode-hook 'lsp-ui-mode)
    (with-eval-after-load 'lsp-ui
      ;;(define-key lsp-ui-mode-map (kbd "C-p") 'lsp-ui-peek-jump-forward)
      ;;(define-key lsp-ui-mode-map (kbd "C-t") 'lsp-ui-peek-jump-backward)
      (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
      (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
      (define-key lsp-ui-mode-map [remap xref-find-apropos]  #'lsp-ui-peek-find-workspace-symbol)
      (define-key lsp-ui-mode-map (kbd "C-j") 'lsp-ui-peek-find-workspace-symbol)
      ;(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-parse-file)
      ;(define-key helm-gtags-mode-map (kbd "C-g") 'helm-gtags-select)
      )))

(use-package company-lsp
  :init
  (progn
    (with-eval-after-load 'company
      (add-to-list 'company-backends 'company-lsp)
      (setq company-transformers nil company-lsp-async t company-lsp-cache-candidates nil)
      )))

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
