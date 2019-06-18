;;; init-undo-tree.el --- undo-tree settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package undo-tree
  :init
  (undo-tree-mode)

  :bind(("C-/". 'undo-tree-undo)
        ("C-?". 'undo-tree-redo)
        ))

(provide 'init-undo-tree)
;;; init-undo-tree.el ends here
