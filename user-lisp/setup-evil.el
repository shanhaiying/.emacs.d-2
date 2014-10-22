(require 'evil)
(require 'evil-leader)
(require 'evil-surround)

(global-evil-surround-mode 1)

(require 'evil-visualstar)

(global-evil-leader-mode)
(evil-mode 1)


;; Evil Numbers are evil
(define-key evil-normal-state-map (kbd "C-+") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C--") 'evil-numbers/dec-at-pt)

;; Add Evil mode
(global-set-key (kbd "C-M-;") 'ace-jump-word-mode)
;; (define-key evil-motion-state-map (kbd "SPC") #'evil-ace-jump-word-mode)
;; (define-key evil-operator-state-map (kbd "SPC") #'evil-ace-jump-word-mode)

;; All EVIL needs a LEADER
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "v" 'visual-line-mode
  "s" 'sudo-edit
  "0" 'delete-window
  "j"  '(lambda nil (interactive) (split-window-vertically) (other-window 1))
  "l"  '(lambda nil (interactive) (split-window-horizontally) (other-window 1))
  "o" 'other-window
  "<SPC>" 'dired-jump)

(evil-leader/set-key
  "f" 'helm-projectile
  "r" 'helm-recentf
  "b" 'helm-buffers-list
  "k" 'kill-buffer)

(when (and (featurep 'evil) (featurep 'evil-leader))
    (evil-leader/set-key
      "c" 'ace-jump-char-mode
      "w" 'ace-jump-word-mode
      "n" 'ace-jump-line-mode))

(if (featurep 'expand-region)
    (progn
      (setq expand-region-contract-key "z")
      (evil-leader/set-key "x" 'er/expand-region)))

;; these modes are clear from evil
(add-hook 'term-mode-hook 'evil-emacs-state)
(add-hook 'prodigy-mode-hook 'evil-emacs-state)
(add-hook 'cider-repl-mode-hook 'evil-emacs-state)

(add-hook 'rcirc-mode-hook 'evil-insert-state)
(add-hook 'commit-mode-ho)

(provide 'setup-evil)
