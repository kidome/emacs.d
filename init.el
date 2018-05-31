;; !!!NOTE:
;; as all in .emacs.d be pushed into github/public, don't put personal's in .emacs.d
;; otherwise, put personal's in this file ~/.emacs, don't put ~/.emacs into public
;; BACKUP ~/.emacs into ~/.emacs.d/dot.emacs.gpg

(require 'package)
(add-to-list 'package-archives
         '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/custom")

(require 'setup-general)
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
  (require 'setup-helm)
 ;;choose one tags system
 ;;(require 'setup-helm-gtags)
 ;;(require 'setup-ggtags)
 )
(require 'setup-cedet)
(require 'setup-editing)


(require 'setup-lsp)
(require 'setup-python)

;; function-args
;; (require 'function-args)
;; (fa-config-default)
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)
