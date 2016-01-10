(load-file (let ((coding-system-for-read 'utf-8))
                            (shell-command-to-string "agda-mode locate")))

(setq agda2-include-dirs
            (list "." (expand-file-name "~/AgdaLibrary/")))

(require 'agda2)

(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

(setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))
