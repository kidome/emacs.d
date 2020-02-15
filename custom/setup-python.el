
(add-hook 'python-mode-hook 'elpy-enable)
(add-hook 'python-mode-hook 'global-company-mode)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

(with-eval-after-load 'elpy
  (setenv "WORKON_HOME" "/Users/nj0/.emacs.d/")
  (pyvenv-workon "pyve_emacs")
  )

(with-eval-after-load 'anaconda
  (define-key anaconda-mode-map [remap xref-find-definitions] #'anaconda-goto-definition)
  )

(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-anaconda)
  (company-flx-mode +1))

(use-package elpy
  :init
  (progn
    (setq-default ighlight-indentation-mode -1)
    ))

(use-package anaconda-mode
  :init
  (progn
    ()
    ))

(use-package company-anaconda
  :init
  (progn
    ()
    ))

(provide 'setup-python)
