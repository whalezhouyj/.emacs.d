;;; init-themes.el --- Defaults for themes -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package leuven-theme
  :config
  (load-theme 'leuven t))

(use-package ns-auto-titlebar
  :config
  (ns-auto-titlebar-mode))

(provide 'init-themes)
;;; init-themes.el ends here
