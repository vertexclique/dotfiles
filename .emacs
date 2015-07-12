;; ========== CODE AID ==========
;; Company mode
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "C-s-SPC") 'company-complete)

;; Auto complete mode
;; (global-auto-complete-mode t)

;; Semantics and Navigation
(semantic-mode 1)
(global-set-key (kbd "<f7>") 'semantic-ia-fast-jump) ;; jump to definition.
(global-set-key (kbd "s-<f7>")                         ;; jump back
                (lambda ()
                  (interactive)
                  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
                     (error "Semantic Bookmark ring is currently empty"))
                  (let* ((ring (oref semantic-mru-bookmark-ring ring))
                         (alist (semantic-mrub-ring-to-assoc-list ring))
                         (first (cdr (car alist))))
                    (if (semantic-equivalent-tag-p (oref first tag)
                                                   (semantic-current-tag))
                        (setq first (cdr (car (cdr alist)))))
                    (semantic-mrub-switch-tags first))))

(global-set-key (kbd "M-p") 'imenu)


;; ========== PROJECT MANAGEMENT ==========
(projectile-global-mode)
(setq projectile-enable-caching t)

(global-set-key (kbd "<f8>") 'sr-speedbar-toggle)
(setq speedbar-show-unknown-files t)
(setq speedbar-directory-unshown-regexp "^$")

(require 'projectile-speedbar)
(global-set-key (kbd "<f2>") 'projectile-speedbar-open-current-buffer-in-tree)
