(use-package projectile
  :ensure t
  :init (setq projectile-completion-system 'helm)
  (setq projectile-indexing-method 'alien)
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1)
  (helm-projectile-on))
