(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'bind-key)

(use-package projectile
  :ensure t
  :defer t
  :init (setq projectile-completion-system 'helm)
  (setq projectile-indexing-method 'alien)
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))

(use-package helm-projectile
  :ensure t
  :defer t
  :after (projectile)
  :config (helm-projectile-on))

(use-package magit
  :ensure t
  :defer t
  :init
  (bind-key "C-c g" 'magit-status)
  (defun display-buffer-full-screen (buffer alist)
    (delete-other-windows)
    (set-window-dedicated-p nil nil)                                                                                                     
    (set-window-buffer nil buffer)                                                                                                       
    (get-buffer-window buffer))
  (setq magit-display-buffer-function                                                                                                    
      (lambda (buffer)                                                                                                                 
        (if magit-display-buffer-noselect                                                                                              
            (magit-display-buffer-traditional buffer)                                                                                  
          (display-buffer buffer '(display-buffer-full-screen))))))
