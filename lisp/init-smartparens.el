;;; init-smartparens.el --- smartparens settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package smartparens-config
  :ensure smartparens
  :hook (prog-mode . smartparens-strict-mode)
  :bind(("C-M-a" . 'sp-beginning-of-sexp)
        ("C-M-e" . 'sp-end-of-sexp)
        ("C-M-n" . 'sp-down-sexp)
        ("C-M-p" . 'sp-up-sexp)
        ("C-M-f" . 'sp-forward-sexp)
        ("C-M-b" . 'sp-back-sexp)
        ("C-]" . 'sp-unwrap-sexp)
        ("C-}" . 'sp-rewrap-sexp)
        ))

(provide 'init-smartparens)
;;; init-smartparens.el ends here
