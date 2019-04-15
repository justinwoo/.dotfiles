(setq create-lockfiles nil)
(setq backup-directory-alist '(("" . "~/.emacs.d/backup")))
(setq auto-save-default nil)
(setq gc-cons-treshold 50000000)
(setq line-number-display-limit-width 10000)
(setq gnutils-min-prime-bits 4096)
(setq tags-revert-without-query t)
(setq-default show-trailing-whitespace t)
(setq show-trailing-whitespace t)
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(load-library "iso-transl")
(setq default-buffer-file-coding-system 'utf-8)
(tool-bar-mode 0)
(toggle-scroll-bar 0)
(blink-cursor-mode 0)
(setq default-fill-column 81)
(setq fci-rule-column 81)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(global-hl-line-mode 1)
(require 'package)
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")))
(package-initialize)
(setq package-list
      '(
        company
        counsel
        counsel-projectile
        diminish
        doom-themes
        evil
        evil-escape
        evil-magit
        evil-surround
        flycheck
        flycheck-rust
        general
        git
        helm
        helm-ag
        helm-company
        helm-projectile
        helm-rg
        helm-themes
        ivy
        js2-mode
        key-chord
        magit
        markdown-mode
        org
        popwin
        powerline
        prettier-js
        projectile
        racer
        rainbow-delimiters
        rust-mode
        smartparens
        spacemacs-theme
        swiper
        use-package
        web-mode
        which-key
        xref
        ))

(when (not package-archive-contents) (package-refresh-contents))
(dolist (package package-list) (when (not (package-installed-p package)) (package-install package)))

(require 'use-package)

(use-package key-chord :ensure t
  :init
  (key-chord-mode 1))

(use-package general :ensure t
  :config
  (general-evil-setup)
  (setq general-default-keymaps 'evil-normal-state-map)
  (general-define-key :keymaps 'dired-mode-map "SPC" nil)
  (general-define-key :keymaps 'compilation-mode-map "SPC" nil)
  (general-define-key
   ";" 'evil-ex)
  (general-define-key
   :keymaps 'insert
   "C-/" 'helm-company
   "M-/" 'helm-dabbrev
   "C-p" 'company-dabbrev)
  (general-define-key
   :keymaps 'visual
   "SPC a r" 'align-regexp
   "SPC c l" 'comment-or-uncomment-region)
  (general-define-key :keymaps 'evil-insert-state-map
                      (general-chord "kj") 'evil-normal-state)
  (general-define-key
   :keymaps 'normal
   "C--"     'text-scale-decrease
   "C-0"     '(lambda() (interactive) (text-scale-set 1))
   "C-="     'text-scale-increase
   "C-u"     'evil-scroll-up
   "M-x"     'helm-M-x
   "Q"       'evil-execute-macro
   "SPC /"   'helm-do-ag-project-root
   "SPC ?"   'helm-projectile-rg
   "SPC b b" 'helm-buffers-list
   "SPC b d" 'kill-this-buffer
   "SPC b m" '(lambda() (interactive) (switch-to-buffer "*Messages*"))
   "SPC b s" '(lambda() (interactive) (switch-to-buffer "*scratch*"))
   "SPC c l" 'comment-line
   "SPC e b" 'eval-buffer
   "SPC e c" 'flycheck-clear
   "SPC e l" 'flycheck-list-errors
   "SPC e n" 'flycheck-next-error
   "SPC e p" 'flycheck-previous-error
   "SPC f D" 'delete-other-frames
   "SPC f b" 'display-buffer-other-frame
   "SPC f f" 'make-flycheck-frame
   "SPC f d" 'delete-frame
   "SPC f j" 'dired-other-frame
   "SPC f n" 'make-frame-command
   "SPC h f" 'helm-find-files
   "SPC m p e" 'set-flycheck-on-change
   "SPC m p w" 'set-flycheck-save-only
   "SPC o"   'other-window
   "SPC t s" 'flycheck-mode
   "SPC w s" 'split-window-below
   "SPC w v" 'split-window-right
   "SPC x" 'delete-trailing-whitespace
   ))

(defun make-flycheck-frame ()
  "make a flycheck errors frame"
  (interactive)
  (flycheck-list-errors)
  (delete-window (get-buffer-window  "*Flycheck errors*"))
  (display-buffer-other-frame "*Flycheck errors*"))

(use-package evil
  :ensure t
  :init
  (progn
    (evil-mode 1)
    (evil-select-search-module 'evil-search-module 'evil-search)
    (evil-declare-change-repeat 'company-complete)))

(use-package evil-surround
  :ensure t
  :init
  (progn
    (global-evil-surround-mode 1)))

(use-package evil-escape :ensure t
  :diminish evil-escape-mode
  :config
  (evil-escape-mode))

(defun magit-traditional-status ()
  "open magit-status with the traditional half-frame view"
  (interactive)
  (customize-set-variable 'magit-display-buffer-function 'magit-display-buffer-traditional)
  (magit-status))

(defun magit-fullframe-status ()
  "open magit-status with a fullframe view"
  (interactive)
  (customize-set-variable 'magit-display-buffer-function 'magit-display-buffer-fullframe-status-v1)
  (magit-status))

(use-package magit
  :ensure t
  :general
  (general-define-key
   :keymaps 'normal
   "SPC g s" 'magit-fullframe-status
   "SPC g a" 'magit-traditional-status
   "SPC g S" 'magit-traditional-status
   "SPC g b" 'magit-blame)
  (general-define-key
   :keymaps 'magit-blame-read-only-mode-map
   "SPC"     nil
   "SPC g b" 'magit-blame-mode)
  :config
  (general-define-key :keymaps 'magit-status-mode-map "SPC" nil)
  (use-package evil-magit :ensure t))

(use-package projectile :ensure t
  :general
  (general-define-key
   :keymaps 'normal
   "SPC p f" 'helm-projectile
   "SPC p p" 'helm-projectile-switch-project)
  :config
  (setq projectile-completion-system 'ivy)
  (projectile-mode 1))

(use-package powerline
  :ensure t
  :config
  (powerline-center-evil-theme))

(use-package company
  :ensure t
  :diminish company-mode
  :config
  (global-company-mode)
  (setq company-dabbrev-downcase nil)
  (setq company-idle-delay 'nil)
  :general
  (general-define-key
   :keymaps 'insert
   "C-SPC" 'company-complete)
  (general-define-key
   :keymaps 'company-active-map
   "<tab>" 'company-complete-selection
   "C-n" 'company-select-next
   "C-j" 'company-select-next
   "C-p" 'company-select-previous
   "C-k" 'company-select-previous))

(use-package swiper :ensure t
  :general
  (general-define-key
   :keymaps 'normal
   "SPC s" 'swiper))

(use-package diminish :ensure t)

(use-package which-key :ensure t
  :diminish which-key-mode
  :config
  (which-key-mode 1)
  )

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(use-package markdown-mode :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package doom-themes :ensure t
  :preface (defvar region-fg nil)
  :config
  (load-theme 'spacemacs-light t)
  (set-face-attribute 'default nil
                      :family "Noto Sans Mono CJK JP"
                      :height 130
                      :weight 'normal
                      :width 'normal))

(add-hook 'sh-mode-hook 'flycheck-mode)

;; fucking flycheck
(use-package flycheck :ensure t
  :init
  (progn
    (setq flycheck-check-syntax-automatically
          '(mode-enabled
            idle-change
            new-line
            save
            ))
    (setq flycheck-idle-change-delay 0.5))
  (use-package popwin :ensure t))

(defun set-flycheck-save-only ()
  "set flycheck to check on save only"
  (interactive)
  (customize-set-variable
   'flycheck-check-syntax-automatically
   '(mode-enabled
     save
     ))
  (message "Set flycheck to check on save only"))

(defun set-flycheck-on-change ()
  "set flycheck to check on change"
  (interactive)
  (customize-set-variable
   'flycheck-check-syntax-automatically
   '(mode-enabled
     idle-change
     new-line
     save
     ))
  (message "Set flycheck to check on change"))

(defun my/org-mode-hook ()
  "Stop the org-level headers from increasing in height relative to the other text."
  (dolist (face '(org-level-1
                  org-level-2
                  org-level-3
                  org-level-4
                  org-level-5))
    (set-face-attribute face nil :weight 'semi-bold :height 1.0)))
(add-hook 'org-mode-hook 'my/org-mode-hook)
(setq org-bullets-bullet-list '("大" "中" "小" "・"))

(defun my-build-psc-package-project ()
  "build my project man"
  (interactive)
  (save-buffer)
  (let ((default-directory (projectile-project-root))
        (success-buffer-name "*PSC-PACKAGE BUILD SUCCESS*")
        (error-buffer-name "*PSC-PACKAGE BUILD ERRORS*"))
    (when (buffer-live-p (get-buffer success-buffer-name)) (kill-buffer success-buffer-name))
    (when (buffer-live-p (get-buffer error-buffer-name)) (kill-buffer error-buffer-name))
    (if (file-exists-p "psc-package.json")
        (shell-command "psc-package build -- 'test/**/*.purs'" success-buffer-name error-buffer-name)
      (error "wtf no psc-package.json"))
    (if (get-buffer error-buffer-name)
        (switch-to-buffer-other-window error-buffer-name)
      (switch-to-buffer-other-window success-buffer-name)
      (message "Project build succeeded."))))

(defun my-psc-ide-server-kill-buffer ()
  "die"
  (interactive)
  (kill-buffer (get-buffer "*psc-ide-server*"))
  (message "killed buffer psc-ide-server"))

(defun my-psc-ide-server-restart ()
  "die"
  (interactive)
  (kill-buffer (get-buffer "*psc-ide-server*"))
  (psc-ide-server-start (psc-ide-suggest-project-dir)))

(use-package purescript-mode :ensure t
  :load-path "~/Code/new-purescript-mode/")
;; :load-path "~/.nix-profile/elisp/purescript-mode-local/"
;; :diminish 'purescript-indentation-mode)

(use-package psc-ide :ensure t
  ;; :load-path "~/.nix-profile/elisp/psc-ide-local/"
  :load-path "~/Code/psc-ide-emacs/"
  :init
  (progn
    (helm-mode 1)
    (add-hook 'purescript-mode-hook 'psc-ide-mode)
    (add-hook 'purescript-mode-hook 'company-mode)
    (add-hook 'purescript-mode-hook 'flycheck-mode)

    (evil-define-key 'normal purescript-mode-map
      ",mt"  'psc-ide-add-clause
      ",mcs" 'psc-ide-case-split
      ",ms"  'psc-ide-server-start
      ",mr"  'my-psc-ide-server-restart
      ",mb"  'psc-ide-rebuild
      ",mB"  'my-build-psc-package-project
      ",mq"  'my-psc-ide-server-kill-buffer
      ",ml"  'psc-ide-load-all
      ",mL"  'psc-ide-load-module
      ",mia" 'psc-ide-add-import
      ",mis" 'psc-ide-flycheck-insert-suggestion
      ",gg"  'psc-ide-goto-definition
      ",ht"  'psc-ide-show-type)
    (evil-define-key 'visual purescript-mode-map
      ",mii" 'my-purescript-region-imports-suggestions)
    ))

(defun my-purescript-region-imports-suggestions ()
  "Apply imports suggestions on region"
  (interactive)
  (if (region-active-p)
      (progn
        (let* ((line-start (line-number-at-pos (region-beginning)))
               (line-end (line-number-at-pos (region-end))))
          (dolist (line (number-sequence line-start
                                         (- line-end 1)))
            (goto-line line)
            (psc-ide-flycheck-insert-suggestion))
          (goto-line line-start)
          (evil-visual-line)
          (evil-next-line (- line-end 1 line-start))
          (flush-lines "^[[:space:]]*$" (region-beginning) (point))))
    (message "You need an active region to use this.")))

;; for references: M-?
(add-to-list 'xref-backend-functions 'psc-ide-xref-backend)

(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-psc-ide-backend))

(global-company-mode)

(global-set-key (kbd "C-SPC") 'company-complete)
(global-set-key (kbd "C-S-SPC") 'company-dabbrev)
(global-set-key (kbd "M-SPC") 'company-dabbrev)

(define-key evil-insert-state-map (kbd "<tab>") 'company-complete-common)
(define-key evil-insert-state-map (kbd "C-p") 'company-dabbrev)

(setq company-idle-delay 'nil)

(use-package rjsx-mode :mode "\\.js\\'")
(add-hook 'rjsx-mode-hook 'flycheck-mode)

(use-package web-mode
  :ensure t
  :mode ("\\.html\\'"
         "\\.css\\'"
         "\\.scss\\'"))

(use-package js2-mode
  :mode "\\.js\\'"
  :init
  (progn
    (setq js2-strict-missing-semi-warning nil)
    (setq js2-missing-semi-one-line-override nil)
    ;; wtf who doesn't use 2-space JS indent
    (setq-default
     ;; js2-mode
     js2-basic-offset 2
     ;; web-mode
     css-indent-offset 2
     web-mode-markup-indent-offset 2
     web-mode-css-indent-offset 2
     web-mode-code-indent-offset 2
     web-mode-attr-indent-offset 2)
    (setq-default js-indent-level 2)))

(setq c-default-style "java")
(setq-default c-basic-offset 2)

(defun run-prettier-standard ()
  "run prettier-standard"
  (interactive)
  (let* ((command (format "cd %s && prettier-standard %s" (projectile-project-root) buffer-file-name))
         (results "*PRETTIER-STANDARD SOURCES*")
         (errors "*PRETTIER-STANDARD ERRORS*"))
    (shell-command command results errors)
    (if (get-buffer errors)
        (progn
          (with-current-buffer errors
            (message (string-trim (buffer-string))))
          (kill-buffer errors))
      (progn
        (with-current-buffer results
          (message (string-trim (buffer-string))))
        (kill-buffer results)))))

(defun run-prettier ()
  "run normal prettier"
  (interactive)
  (require 'prettier-js)
  (customize-set-variable 'prettier-js-command "prettier")
  (prettier-js)
  )

(require 's)
(require 'projectile)

(defun run-format-nix ()
  "run format-nix"
  (interactive)
  (let* ((command (format "cd %s && format-nix %s" (projectile-project-root) buffer-file-name))
         (results "*FORMAT-NIX STDOUT*")
         (errors "*FORMAT-NIX ERRORS*"))
    (shell-command command results errors)
    (if (get-buffer errors)
        (progn
          (with-current-buffer errors
            (message (string-trim (buffer-string))))
          (kill-buffer errors))
      (progn
        (with-current-buffer results
          (message (string-trim (buffer-string))))
        (kill-buffer results)
        (revert-buffer t t t)))))

(general-define-key
 :keymaps 'normal
 "SPC m p n" 'run-format-nix)

(general-define-key
 :keymaps 'normal
 "SPC m p s" 'run-prettier-standard
 "SPC m p d" 'run-prettier)

(when (file-exists-p "~/.user-config.el")
  (load-file "~/.user-config.el"))

;; holy hell
(setq undo-tree-enable-undo-in-region nil)

(use-package helm :ensure t
  :init
  (progn
    (require 'helm)
    ;; rebind spc / and *
    (setq helm-ag-base-command "rg --vimgrep --no-heading --smart-case")
    (setq helm-mode-handle-completion-in-region t)
    (setq helm-completion-in-region-fuzzy-match t)
    (setq helm-recentf-fuzzy-match t)
    (setq helm-buffers-fuzzy-matching t)
    (setq helm-recentf-fuzzy-match t)
    (setq helm-buffers-fuzzy-matching t)
    (setq helm-locate-fuzzy-match t)
    (setq helm-M-x-fuzzy-match t)
    (setq helm-semantic-fuzzy-match t)
    (setq helm-imenu-fuzzy-match t)
    (setq helm-apropos-fuzzy-match t)
    (setq helm-lisp-fuzzy-completion t)
    (setq helm-session-fuzzy-match t)
    (setq helm-etags-fuzzy-match t)
    (evil-select-search-module 'evil-search-module 'evil-search)
    (evil-declare-change-repeat 'company-complete)))

;; let's see
(setq x-wait-for-event-timeout nil)

;; guess im using this or something dunno
(setq org-agenda-files '("~/org/notes.org"))

;; dhall
(use-package dhall-mode
  :ensure t
  :mode "\\.dhall\\'")

;; haskell
(use-package haskell-mode
  :ensure t
  :mode "\\.hs\\'")

;; rust
(use-package rust-mode
  :ensure t
  :mode "\\.rs\\'"
  :init
  (evil-define-key 'normal rust-mode-map
    ",gg"  'racer-find-definition
    ",gG"  'racer-find-definition-other-window
    ",gf"  'racer-find-definition-other-frame))

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

;; nix
(use-package nix-mode
  :load-path "~/.nix-profile/elisp/nix-mode/"
  :mode "\\.nix\\'"
  :custom
  (nix-indent-function #'nix-indent-line))

;; holy fucking shit
(setq-default search-invisible t)

;; jumalauta who thought this is helpful
(fset 'evil-visual-update-x-selection 'ignore)

;; escape key sequence
(setq-default evil-escape-key-sequence "kj")

;; no powerline freaking separator
;; what the fuck did this break forward search before
(setq powerline-default-separator 'bar)

;; good job evil indent
(defun turn-off-evil-auto-indent ()
  (setq-local evil-auto-indent nil))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq tab-width 2)
(setq-default evil-shift-width 2)
(setq evil-shift-width 2)

(superword-mode t)

(add-hook 'haskell-mode-hook #'turn-off-evil-auto-indent)
(add-hook 'purescript-mode-hook #'turn-off-evil-auto-indent)

(helm-mode 1)

;; after this is trash
(setq custom-file "/dev/null")
(load custom-file)
