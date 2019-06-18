;;; init-javascript.el --- Support for Javascript and derivatives -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package js2-mode
  :config
  ;; (setq flycheck-disabled-checkers '(javascript-jshint))
  (setq js-indent-level 2)
  (setq js2-basic-offset 2)
  (setq js2-mode-show-strict-warnings nil)
  (setq js2-include-node-externs t)
  )

(use-package rjsx-mode
  :after js2-mode
  :mode (("\\.js\\'" . rjsx-mode)
         ("\\.tsx\\'". rjsx-mode)
         ("\\.es6\\'". rjsx-mode))
  :hook ((rjsx-mode . turn-off-smartparens-mode)
         (rjsx-mode . js-error-style))
  :config
  (defun use-eslint-from-node-modules ()
    (let* ((root (locate-dominating-file
                  (or (buffer-file-name) default-directory)
                  "node_modules"))
           (eslint (and root
                        (expand-file-name "node_modules/eslint/bin/eslint.js"
                                          root))))
      (when (and eslint (file-executable-p eslint))
        (setq-local flycheck-javascript-eslint-executable eslint))))
  (add-hook 'flycheck-mode-hook #'use-eslint-from-node-modules)
  (defun js-error-style ()
    (set-face-attribute 'js2-error nil
                        :background nil
                        :box nil
                        :underline "#e36209")
    (set-face-attribute 'flycheck-error nil
                        :background nil
                        :box nil
                        :underline "#e36209"))
  (add-to-list 'interpreter-mode-alist '("node" . rjsx-mode)))

(provide 'init-javascript)
;;; init-javascript.el ends here
