(setq create-lockfiles nil)
(setq backup-directory-alist '(("" . "~/.emacs.d/backup")))
(setq auto-save-default nil)
(setq gc-cons-treshold 50000000)
(setq line-number-display-limit-width 10000)
(setq gnutils-min-prime-bits 4096)
(setq tags-revert-without-query t)
(setq-default show-trailing-whitespace t)
(setq show-trailing-whitespace nil)
(setq inhibit-startup-screen t)
(setq kill-buffer-query-functions nil)
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(load-library "iso-transl")
(setq default-buffer-file-coding-system 'utf-8)
(tool-bar-mode 0)

;; (toggle-scroll-bar 0)

(menu-bar-mode -1)
(setq default-fill-column 81)
(setq fci-rule-column 81)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(global-hl-line-mode 0)
(require 'package)
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")
                         ))
(package-initialize)
(setq package-list
      '(
        company
        consult

        dash-functional
        diminish

        embark
        embark-consult

        evil
        evil-collection
        evil-escape
        evil-surround
        evil-string-inflection
        evil-matchit

        flycheck

        fzf
        general
        git

        key-chord
        magit

        marginalia

        markdown-mode
        modus-themes
        nix-mode
        nixpkgs-fmt

        orderless

        popwin
        powerline
        prettier-js
        projectile
        smartparens
        spacemacs-theme
        string-inflection
        swiper

        tide

        treesit-auto
        typescript-mode
        undo-fu
        use-package
        web-mode
        which-key

        wgrep

        vertico

        xref
        ))

;; mac os
(setq mac-command-modifier 'super)
(setq mac-option-modifier 'meta)
(global-set-key (kbd "s-p") #'(lambda () (interactive) (message "Stop trying to print!!!")))
(global-set-key (kbd "s-q") #'(lambda () (interactive) (message "Stop closing!!!")))
(global-set-key (kbd "s-t") #'(lambda () (interactive) (message "Fucking font menu")))
(when (string= system-type "darwin")
  (setq dired-use-ls-dired nil))

(when (eq system-type 'darwin)
  (setq dired-use-ls-dired nil))

;; fuck you emacs
(defalias 'yes-or-no-p 'y-or-n-p)

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

  (general-define-key
   ";" 'evil-ex)

  (general-define-key
   :keymaps 'insert
   "C-p" 'company-dabbrev)

  (general-define-key
   :keymaps 'visual
   "SPC a r" 'align-regexp
   "SPC c l" 'comment-or-uncomment-region)

  (general-define-key :keymaps 'evil-insert-state-map
                      (general-chord "kj") 'evil-normal-state)

  (general-define-key
   :keymaps 'normal
   "Q"       'evil-execute-macro
   "D"       'evil-delete-whole-line
   "M-h"     'evil-window-left
   "M-l"     'evil-window-right
   "M-j"     'evil-window-down
   "M-k"     'evil-window-up
   ;; "s-p"     'projectile-find-file
   ;; "M-p"     'projectile-find-file
   )

  (general-define-key
   :states 'normal
   :keymaps 'override
   "C--"     'text-scale-decrease
   "C-0"     '(lambda() (interactive) (text-scale-set 1))
   "C-="     'text-scale-increase
   "C-u"     'evil-scroll-up
   "SPC /"   'consult-ripgrep
   "SPC p f" 'consult-fd
   "SPC b b" 'consult-buffer
   "SPC b f" 'consult-buffer-other-frame

   "SPC b d" 'my-kill-this-buffer
   "SPC b n" 'next-buffer
   "SPC b p" 'previous-buffer
   "SPC b D" 'spacemacs/kill-matching-buffers-rudely
   "SPC b C-d" 'spacemacs/kill-matching-buffers-rudely

   "SPC b m" '(lambda() (interactive) (switch-to-buffer "*Messages*"))
   "SPC b s" '(lambda() (interactive) (switch-to-buffer "*scratch*"))
   "SPC c l" 'comment-line
   "SPC c c" 'open-config
   "SPC c v" 'reload-config
   "SPC d d" 'dired
   "SPC d f" 'find-file
   "SPC d j" 'dired
   "SPC e b" 'eval-buffer
   "SPC e c" 'flycheck-clear
   "SPC e l" 'spacemacs/toggle-flycheck-error-list
   "SPC e n" 'flycheck-next-error
   "SPC e p" 'flycheck-previous-error
   "M-n" 'flycheck-next-error
   "M-p" 'flycheck-previous-error
   "SPC f D" 'delete-other-frames
   "SPC f b" 'display-buffer-other-frame
   "SPC f d" 'delete-frame
   "SPC f f" 'find-file-other-frame
   "SPC f j" 'dired-other-frame
   "SPC f n" 'my-make-frame-command
   "SPC f c" 'clone-indirect-buffer-other-window
   "SPC f q" 'evil-quit
   "SPC r l" 'bookmark-bmenu-list
   "SPC r m" 'bookmark-set
   "SPC r b" 'bookmark-jump
   "SPC r B" 'bookmark-jump-other-window
   "SPC m p e" 'set-flycheck-on-change
   "SPC m p w" 'set-flycheck-save-only
   "SPC o"   'other-window
   "SPC t s" 'flycheck-mode
   "SPC w s" 'split-window-below
   "SPC w v" 'split-window-right
   "SPC x" 'delete-trailing-whitespace
   ))

(defun open-config () (interactive) (find-file "~/.emacs.d/init.el"))
(defun reload-config () (interactive) (load-file "~/.emacs.d/init.el"))

(defun my-make-frame-command ()
  "from the original make-frame-command"
  (interactive)
  (if (display-graphic-p)
      (make-frame)
    (select-frame (make-frame)))
  ;; lol make-frame alist args dont work
  (set-frame-size (selected-frame) 100 100)
  )

(defun my-kill-this-buffer ()
  "Why the fuck does kill-this-buffer require menu"
  (interactive)
  (kill-buffer (current-buffer)))

;; from https://github.com/gempesaw/dotemacs/blob/emacs/dg-defun.el
(defun spacemacs/kill-matching-buffers-rudely (regexp &optional internal-too)
  "Kill buffers whose name matches the specified REGEXP. This
function, unlike the built-in `kill-matching-buffers` does so
WITHOUT ASKING. The optional second argument indicates whether to
kill internal buffers too."
  (interactive "sKill buffers matching this regular expression: \nP")
  (dolist (buffer (buffer-list))
    (let ((name (buffer-name buffer)))
      (when (and name (not (string-equal name ""))
                 (or internal-too (/= (aref name 0) ?\s))
                 (string-match regexp name))
        (kill-buffer buffer)))))

(add-to-list
 'display-buffer-alist
 `(,(rx bos "*Flycheck errors*" eos)
   (display-buffer-reuse-window
    display-buffer-in-side-window)
   (side            . bottom)
   (reusable-frames . visible)
   (window-height   . 0.33)))

(setq evil-want-keybinding nil)

(defun my-evil-indent-buffer ()
  "Indent the entire buffer using evil-indent."
  (interactive)
  (save-excursion
    (evil-indent (point-min) (point-max))))

(use-package evil
  :ensure t
  :init
  (setq evil-undo-system 'undo-fu)
  :config
  (evil-mode 1)
  (evil-select-search-module 'evil-search-module 'evil-search)
  (evil-declare-change-repeat 'company-complete)
  )

(use-package evil-collection
  :after evil
  :ensure t
  :init
  (evil-collection-init)
  )

(use-package evil-surround
  :ensure t
  :init
  (progn
    (global-evil-surround-mode 1)))

(use-package evil-matchit
  :ensure t
  :init
  (progn
    (global-evil-matchit-mode 1)))

(use-package evil-string-inflection
  :ensure t)

(use-package evil-escape :ensure t
  :diminish evil-escape-mode
  :config
  (evil-escape-mode))

(use-package fzf
  :general
  (general-define-key
   :keymaps 'normal
   "SPC g e" 'magit-fast-commit-modified
   "SPC g s" 'magit-fullframe-status
   "SPC g a" 'magit-traditional-status
   "SPC g S" 'magit-traditional-status
   "SPC g b" 'magit-blame)
  :config
  (setq fzf/args "-x --color bw --print-query --margin=1,0 --no-hscroll"
        fzf/executable "fzf"
        fzf/git-grep-args "-i --line-number %s"
        ;; command used for `fzf-grep-*` functions
        ;; example usage for ripgrep:
        ;; fzf/grep-command "rg --no-heading -nH"
        fzf/grep-command "grep -nrH"
        ;; If nil, the fzf buffer will appear at the top of the window
        fzf/position-bottom t
        fzf/window-height 15))

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

(defun magit-fast-commit-modified ()
  "magit please amend commit modified quickly"
  (interactive)
  (magit-stage-modified)
  (magit-commit-extend))

;; fucking treesitter
(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(use-package magit
  :ensure t
  :general
  (general-define-key
   :keymaps 'normal
   "SPC g e" 'magit-fast-commit-modified
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
  (evil-collection-init 'magit)
  )

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package vertico
  :ensure t
  :config
  (setq vertico-cycle t)
  (setq vertico-resize nil)
  (vertico-mode 1)
  )

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode 1)
  )

(use-package consult
  :ensure t
  :config
  )

(use-package embark
  :ensure t

  :general
  (general-define-key
   :keymaps 'normal
   "SPC ." 'embark-act
   "SPC ;" 'embark-dwim)

  :bind
  (("C-." . embark-act)
   ("C-;" . embark-dwim)
   ("C-e" . embark-export)
   ("C-h B" . embark-bindings))

  :init
  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  :config
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

;; Consult users will also want the embark-consult package.
(use-package embark-consult
  :ensure t ; only need to install it, embark loads it after consult if found
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package wgrep
  :ensure t
  :config
  (require 'wgrep)
  )

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

(use-package markdown-mode :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package modus-themes :ensure t
  :preface (defvar region-fg nil)
  :init
  (load-theme 'modus-operandi :no-confirm)
  :config
  (set-face-attribute 'default nil
                      :family (cond ((eq system-type 'darwin) "Monaco")
                                    (t "Noto Sans Mono CJK JP"))
                      :height (cond ((eq system-type 'darwin) 120)
                                    (t 100))
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

(defun flycheck-errors-in-new-frame ()
  (interactive)
  (display-buffer-pop-up-frame (get-buffer "*Flycheck errors*") '()))

(add-to-list 'flycheck-checkers 'python-mypy t)
(flycheck-add-next-checker 'python-pylint 'python-mypy t)

;; from spacemacs
;; toggle flycheck window
(defun spacemacs/toggle-flycheck-error-list ()
  "Toggle flycheck's error list window.
If the error list is visible, hide it.  Otherwise, show it."
  (interactive)
  (-if-let (window (flycheck-get-error-list-window))
      (quit-window nil window)
    (flycheck-list-errors)))


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

(use-package lua-mode
  :mode ("\\.lua\\'"))

(use-package typescript-ts-mode
  :mode ("\\.jsx\\'"
         "\\.tsx\\'")
  :init
  (progn
    (add-hook 'typescript-ts-mode-hook 'tide-mode)
    (add-hook 'typescript-ts-mode-hook 'company-mode)
    (add-hook 'typescript-ts-mode-hook 'flycheck-mode)
    (add-hook 'typescript-ts-mode-hook #'setup-tide-mode)

    (evil-define-key 'normal typescript-ts-mode-map
      ",f"  'tide-fix
      ",gd" 'tide-jump-to-definition
      ",gi" 'tide-jump-to-implementation
      ",ge" 'tide-goto-error
      ",gl" 'tide-goto-line-reference
      ",gR" 'tide-restart-server
      ",gr" 'tide-goto-reference)
    ))

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(global-company-mode)

(global-set-key (kbd "C-SPC") 'company-complete)
(global-set-key (kbd "C-S-SPC") 'company-dabbrev)
(global-set-key (kbd "M-SPC") 'company-dabbrev)

(define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop)
(define-key evil-insert-state-map (kbd "C-p") 'company-dabbrev)

(setq company-idle-delay 'nil)

(use-package web-mode
  :ensure t
  :mode ("\\.html\\'"
         "\\.css\\'"
         "\\.scss\\'"))

(setq c-default-style "java")
(setq-default c-basic-offset 2)

(defun run-prettier ()
  "run normal prettier"
  (interactive)
  (require 'prettier-js)
  (customize-set-variable 'prettier-js-command "prettier")
  (prettier-js)
  )

(use-package s)
(use-package projectile)

(general-define-key
 :keymaps 'normal
 "SPC m p n" 'nixpkgs-fmt-buffer
 "SPC m p d" 'run-prettier
 "SPC i" 'my-evil-indent-buffer)

(when (file-exists-p "~/.user-config.el")
  (load-file "~/.user-config.el"))

;; let's see
(setq x-wait-for-event-timeout nil)

;; guess im using this or something dunno
(setq org-agenda-files '("~/org/notes.org"))

;; haskell
(use-package haskell-mode
  :ensure t
  :mode "\\.hs\\'")

;; stop the fucking warnings
(setq lsp-enable-file-watchers nil)

;; rust
(setq lsp-rust-server 'rust-analyzer)
(use-package rust-mode
  :ensure t
  :hook (rust-mode . lsp)
  :mode "\\.rs\\'"
  :init
  (progn
    ;; (add-hook 'racer-mode-hook #'company-mode)

    (evil-define-key 'normal rust-mode-map
      ",gg"  'lsp-find-definition
      ",gr"  'lsp-find-references
      ",gG"  'lsp-find-type-definition
      ",gf"  'lsp-find-implementation)))

;; nix
(use-package nix-mode
  ;; :load-path "~/.nix-profile/elisp/nix-mode/"
  :mode "\\.nix\\'"
  :custom
  (nix-indent-function #'nix-indent-line))

;; tf
(use-package terraform-mode
  ;; if using straight
  ;; :straight t

  ;; if using package.el
  ;; :ensure t
  :custom (terraform-indent-level 4)
  :config
  (defun my-terraform-mode-init ()
    ;; if you want to use outline-minor-mode
    ;; (outline-minor-mode 1)
    )

  (add-hook 'terraform-mode-hook 'my-terraform-mode-init))

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

;; underscores are part of words in most fucking languages
(add-hook 'rust-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'javascript-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))

;; specific to machine
(setq local-config-file "~/.emacs.local.el")
(unless (file-exists-p local-config-file)
  (make-empty-file local-config-file))
(load local-config-file)

;; after this is trash
(setq custom-file "~/.emacs_custom_shit_fest.el")
(unless (file-exists-p custom-file)
  (make-empty-file custom-file))
(load custom-file)
