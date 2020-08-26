;;; init-local.el --- My own settings  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(set-face-attribute 'default nil :font "Dank Mono-14")
;; This is your old M-x.
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-F") 'counsel-rg)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-x s") 'sanityinc/swiper-at-point)

;; avy configs
(global-set-key (kbd "C-q") 'avy-goto-char-timer)
(global-set-key (kbd "C-M-g") 'avy-goto-line)
(global-set-key (kbd "C-x c l") 'avy-copy-line)
(global-set-key (kbd "C-x c r") 'avy-copy-region)
(global-set-key (kbd "C-x c k") 'avy-kill-region)
(global-unset-key (kbd "C-x m"))
(global-set-key (kbd "C-x m l") 'avy-move-line)
(global-set-key (kbd "C-x m r") 'avy-move-region)
(global-set-key (kbd "M-q") 'save-buffers-kill-terminal)
(setq avy-timeout-seconds 0.3)
(setq avy-style 'pre)

;; ivy
(global-set-key (kbd "C-c i r") 'ivy-resume)

;; enable global undo tree mode
(global-undo-tree-mode)

;; set tab width to 2
(setq tab-width 2)

;;see https://oremacs.com/2016/01/06/ivy-flx/
(setq ivy-re-builders-alist
      '((counsel-M-x . ivy--regex-fuzzy)
        (t . ivy--regex-plus)))
;; Put backup files neatly away
(let ((backup-dir "~/.emacs.d/backups")
      (auto-saves-dir "~/.emacs.d/auto-saves/"))
  (dolist (dir (list backup-dir auto-saves-dir))
    (when (not (file-directory-p dir))
      (make-directory dir t)))
  (setq backup-directory-alist `(("." . ,backup-dir))
        auto-save-file-name-transforms `((".*" ,auto-saves-dir t))
        auto-save-list-file-prefix (concat auto-saves-dir ".saves-")
        tramp-backup-directory-alist `((".*" . ,backup-dir))
        tramp-auto-save-directory auto-saves-dir))

(setq backup-by-copying t    ; Don't delink hardlinks
      delete-old-versions t  ; Clean up the backups
      version-control t      ; Use version numbers on backups,
      kept-new-versions 5    ; keep some new versions
      kept-old-versions 2)   ; and some old ones, too

;; custom conusel configs
(defun counsel-rg-dir ()
  (interactive)
  (let ((dir (read-directory-name "search in: ")))
    (counsel-rg "" dir)))
(global-set-key (kbd "C-x r d") 'counsel-rg-dir)
(global-set-key (kbd "C-x C-b") 'switch-to-buffer)

;; custom projectile configs
(setq projectile-project-root-files #'( ".projectile" )
      projectile-project-root-files-functions #'(projectile-root-top-down
                                                 projectile-root-top-down-recurring
                                                 projectile-root-bottom-up
                                                 projectile-root-local))
(setq projectile-enable-caching nil)
;; other key bindings
;; join line to next line
(global-set-key (kbd "C-j")
                (lambda ()
                  (interactive)
                  (join-line -1)))
(global-set-key (kbd "C-X C-l") nil)
(global-set-key (kbd "M-c") nil)

(defun copy-file-relative-name ()
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (with-temp-buffer
        (insert filename)
        (clipboard-kill-region (point-min) (point-max)))
      (message filename)))
  )

(setq mac-option-modifier 'super)
(global-set-key (kbd "s-p") 'md-move-lines-up)
(global-set-key (kbd "s-n") 'md-move-lines-down)

;; iedit mode key binding
(use-package iedit
  :config
  (global-set-key (kbd "C-;") 'iedit-mode))

(global-set-key (kbd "C-x o") 'other-frame)

(defun backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))
(global-set-key (kbd "C-c k") 'backward-kill-line)

(setq auto-save-interval 30000)
(setq auto-save-timeout 1200)

;; workaround for C-c p f error: file-missing "Setting current directory" "No such file or directory"
(setq projectile-git-submodule-command nil)

;; fix flycheck lessc error
(setq flycheck-less-executable "/usr/local/bin/lessc")

;; web-mode hook
(defun customize-web-mode ()
  "My web mode hooks."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  )
(add-to-list 'auto-mode-alist '("\\.wxml\\'" . web-mode))
(add-hook 'web-mode-hook 'customize-web-mode)

(provide 'init-local)
;;; init-local.el ends here
