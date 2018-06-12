;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;; Parameters mostly set following "TheBB"'s init.el file: (https://github.com/TheBB/spacemacs-layers/blob/master/init.el)
;; To see the deleted comments, compare with the original dotfile using: `SPC f e D'

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation nil
   dotspacemacs-ask-for-lazy-installation nil
   dotspacemacs-configuration-layer-path nil
   dotspacemacs-install-packages 'used-only

   dotspacemacs-configuration-layers
   '(;; Languages
     bibtex
     (c-c++ :variables
            c-c++-enable-clang-support t)
     csv
     emacs-lisp
     latex
     markdown
     (python :variables
             python-test-runner 'pytest)

     ;; Applications
     (ibuffer :variables ibuffer-group-buffers-by nil)
     ranger ; `SPC a r'. file manager using vim shortcuts.

     ;; Other
     ;; Note: Can quickly type "fd" to exit auto-complete.
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence "jk"
                      auto-completion-complete-with-key-sequence-delay 0.2
                      )
     git
     github
     osx
     (shell :variables
            shell-default-shell 'eshell
            shell-default-height 20
            shell-default-position 'left)
     (spell-checking :variables spell-checking-enable-by-default nil)
     (syntax-checking :variables syntax-checking-enable-by-default nil)
     )

   dotspacemacs-additional-packages
   '(visual-line-mode
     helm-flycheck
     smart-tabs-mode
     )

   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '(smartparens)))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 10
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'hybrid
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner nil
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(monokai
                         spacemacs-dark
                         spacemacs-light)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Source Code Pro"
                               :size 16
                               :weight demibold
                               :width normal
                               :powerline-scale 1.15)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab t
   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text t
   dotspacemacs-ex-substitute-global t
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-large-file-size 1 ; Size (in MB) for file size where major/minor modes are not active.
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 10
   dotspacemacs-helm-resize t
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always
   dotspacemacs-enable-paste-transient-state t
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup t
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols nil
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers t
   dotspacemacs-folding-method 'origami
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/user-init ()
  "This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  (setq-default
   ;; Miscellaneous
   vs-follow-symlinks t
   ring-bell-function 'ignore
   indent-tabs-mode nil

   ;; Theming
   monokai-highlight-line "#3A3A3A"

   ;; Evil
   evil-shift-round nil

   ;; Flycheck
   flycheck-check-syntax-automatically '(save mode-enabled)

   ;; Avy
   avy-all-windows 'all-frames

   ;; Compilation
   ;; For parallel compile: SPC u NUM_THREADS SPC c c
   compilation-auto-jump-to-first-error t
   compilation-skip-threshold 0 ; Do not skip any messages
   )
  )

(defun dotspacemacs/user-config ()
  ;; Settings
  (add-hook 'text-mode-hook 'auto-fill-mode) ; Line wrap automatically in text-mode.
  (add-hook 'makefile-mode-hook 'whitespace-mode)
  (custom-set-faces '(evil-search-highlight-persist-highlight-face ((t (:background "selectedMenuItemColor"))))) ; Better contrast for search highlight
  (add-hook 'c-mode-hook 'spacemacs/toggle-auto-fill-mode) ;; \todo figure out how to place these in .dir-locals.el
  (add-hook 'c-mode-hook 'spacemacs/toggle-fill-column-indicator)

  ;; Additional Leader Keys
  ;; Evil
  ;; Move vertically though visual lines, not actual lines.
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
  (define-key evil-normal-state-map (kbd "C-A") "ggVG") ; Select All (visual mode)
  (define-key evil-normal-state-map (kbd "<f5>") "yawp")
  (define-key evil-normal-state-map (kbd "<f6>") "yawep")
  (evil-leader/set-key
    "os" 'just-one-space) ; Convert space to one space using `SPC os'.
  ;; Spacemacs
  (spacemacs/set-leader-keys
    "feh" 'helm-spacemacs-help
    "er" "erTn" ; // vim shortcut: 'e'nd 'r'eplace with 'T', 'n'ext; /todo Delete when finished with the templating
    )

  ;; Workarounds
  (setq-default
   python-shell--interpreter nil
   python-shell--interpreter-args nil)

  ;; Style
  (smart-tabs-insinuate 'c 'c++ 'python)
  (c-add-style "pz" ; mostly copied from the "stroustrup", "linux" and "bb" styles.
               '((indent-tabs-mode . nil) ; t: expandtab; nil: opposite.
                 (c-basic-offset . 4)
                 (tab-width . 4)
                 (fill-column . 100)
                 (c-comment-only-line-offset . 0)
                 (c-hanging-braces-alist
                  (brace-list-open)
                  (brace-entry-open)
                  (substatement-open after)
                  (block-close . c-snug-do-while)
                  (arglist-cont-nonempty))
                 (c-cleanup-list brace-else-brace)
                 (c-offsets-alist
                  (statement-block-intro . +)
                  (substatement-open . 0)
                  (substatement-label . 0)
                  (label . 0)
                  (statement-cont . c-lineup-assignments)
                  (knr-argdecl-intro . 0)
                  (inline-open . 0)
                  (inextern-lang . 0)
                  (innamespace . 0) ; 0: no indentation in namespaces; +: opposite.
                  (topmost-intro-cont . 0) ; 0: remove indentation after function name; +: opposite.
                  )))

  (push '(other . "pz") c-default-style)
  (push '(python-mode . "python") c-default-style)

  ;; Provide a new MAJORMODE-local-vars-hook
  ;; reference: https://emacs.stackexchange.com/a/29662
  (add-hook 'hack-local-variables-hook 'run-local-vars-mode-hook)
  (defun run-local-vars-mode-hook ()
    "Run a hook for the major-mode after the local variables have been processed."
    (run-hooks (intern (concat (symbol-name major-mode) "-local-vars-hook"))))

  ;; Debugging
  ;; (setq debug-on-error 't) ; Show lisp errors in debugger (Has some incompatibility with compilation-auto-jump).

  ;; Safe local variables
  (put 'helm-make-build-dir 'safe-local-variable 'stringp)
  )
