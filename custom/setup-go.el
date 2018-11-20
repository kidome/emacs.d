;; put exports below into .bash_profile
;; export GOPATH=$HOME/Sandbox/gohome
;; export PATH=$PATH:$GOPATH/bin:/usr/local/opt/go/libexec/bin
;;
;; install gocode for company-go #go get -u github.com/mdempsky/gocode (-u flag for "update")
;; install godef fo go-mode's godef-jump  #go get -u github.com/rogpeppe/godef
;; put company-go.el into emacs's load-path

(add-to-list 'load-path "~/Sandbox/gohome/go-mode.el")
(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

(add-hook 'go-mode-hook 'global-company-mode)

(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-go)
  (company-flx-mode +1))

(provide 'setup-go)
