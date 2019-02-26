{ pkgs ? import ../nix/pinned.nix {} }:

{
  inherit (pkgs.emacsMelpa)

  # these are all broken because of missing packages

  # evil-escape
  # evil-unimpaired

  ac-ispell
  ace-jump-helm-line
  ace-link
  ace-window
  aggressive-indent
  alert
  all-the-icons
  anzu
  async
  auto-compile
  auto-complete
  auto-highlight-symbol
  auto-yasnippet
  avy
  bind-key
  bind-map
  browse-at-remote
  cargo
  centered-cursor-mode
  clean-aindent-mode
  column-enforce-mode
  company
  company-statistics
  counsel
  counsel-projectile
  dash
  dash-functional
  define-word
  dhall-mode
  diff-hl
  diminish
  doom-modeline
  dotenv-mode
  dumb-jump
  eldoc-eval
  elisp-slime-nav
  epl
  eval-sexp-fu
  evil
  evil-anzu
  evil-args
  evil-cleverparens
  evil-ediff
  evil-exchange
  evil-goggles
  evil-iedit-state
  evil-indent-plus
  evil-lion
  evil-lisp-state
  evil-magit
  evil-matchit
  evil-nerd-commenter
  evil-numbers
  evil-org
  evil-surround
  evil-tutor
  evil-visual-mark-mode
  evil-visualstar
  expand-region
  eyebrowse
  f
  fancy-battery
  fill-column-indicator
  flx
  flx-ido
  flycheck
  flycheck-pos-tip
  flycheck-rust
  font-lock-plus
  fringe-helper
  fuzzy
  gh-md
  ghub
  git-commit
  git-gutter
  git-gutter-fringe
  git-gutter-plus
  git-link
  git-messenger
  git-timemachine
  gitattributes-mode
  gitconfig-mode
  gitignore-mode
  gitignore-templates
  gntp
  gnuplot
  golden-ratio
  google-translate
  goto-chg
  graphql
  gxref
  haskell-mode
  helm
  helm-ag
  helm-c-yasnippet
  helm-company
  helm-core
  helm-descbinds
  helm-flx
  helm-git-grep
  helm-gitignore
  helm-make
  helm-mode-manager
  helm-org-rifle
  helm-projectile
  helm-purpose
  helm-swoop
  helm-themes
  helm-xref
  highlight
  highlight-indentation
  highlight-numbers
  highlight-parentheses
  hl-todo
  ht
  htmlize
  hungry-delete
  hydra
  iedit
  imenu-list
  indent-guide
  ivy
  js2-mode
  link-hint
  log4e
  lorem-ipsum
  macrostep
  magit
  magit-gitflow
  magit-popup
  magit-svn
  markdown-mode
  markdown-toc
  memoize
  mmm-mode
  monokai-theme
  move-text
  nameless
  neotree
  open-junk-file
  org-brain
  org-bullets
  org-category-capture
  org-download
  org-mime
  org-plus-contrib
  org-pomodoro
  org-present
  org-projectile
  orgit
  overseer
  packed
  paradox
  paredit
  parent-mode
  password-generator
  pcre2el
  persp-mode
  pkg-info
  popup
  popwin
  pos-tip
  powerline
  prettier-js
  projectile
  racer
  rainbow-delimiters
  request
  restart-emacs
  rjsx-mode
  rust-mode
  s
  shrink-path
  smartparens
  smeargle
  solarized-theme
  spaceline
  spaceline-all-the-icons
  spinner
  string-inflection
  swiper
  symon
  toc-org
  toml-mode
  treemacs
  treemacs-evil
  treemacs-projectile
  treepy
  undo-tree
  use-package
  uuidgen
  vi-tilde-fringe
  visual-fill-column
  volatile-highlights
  web-mode
  which-key
  window-purpose
  winum
  with-editor
  writeroom-mode
  ws-butler
  yasnippet
  yasnippet-snippets
  zenburn-theme

  ;
}
