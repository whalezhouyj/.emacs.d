;;; init-flycheck.el --- Configure Flycheck global behaviour -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package flycheck
  :config
  (add-hook 'after-init-hook 'global-flycheck-mode)
  (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list))

(use-package flycheck-color-mode-line
  :config
  (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))


(provide 'init-flycheck)
;;; init-flycheck.el ends here
