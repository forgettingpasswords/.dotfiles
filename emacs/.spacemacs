;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     html
     (typescript :variables typescript-backend 'lsp)
     terraform
     elm
     (lsp :variables lsp-rust-server 'rust-analyzer)
     nginx
     php
     lua
     org
     confluence
     themes-megapack
     major-modes
     shell-scripts
     nixos
     python
     markdown
     elm
     (rust :variables rust-backend 'lsp)
     yaml
     spacemacs-editing
     syntax-checking
     auto-completion
     (haskell :variables
              ;; haskell-enable-ghci-ng-support t
              hindent-style  "gibiansky"
              haskell-stylish-on-save t
              )
     helm
     emacs-lisp
     git
     gtags
     multiple-cursors
     version-control
     javascript
     react
     lsp
     latex
     prettier
     csv
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     exec-path-from-shell
     ;; intero
     autothemer
     multi-term
     dante
     ;; darktooth-theme
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages
   '(
     vi-tilde-fringe
     )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(birds-of-paradise-plus)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 10.0
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'origami

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  (add-to-list 'exec-path "~/.local/bin")
  (add-to-list 'exec-path "/usr/bin")
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize))
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun browse-in-qutebrowser (url &rest ARGS)
  "Open url in a new tab in qutebrowser"
  (interactive (browse-url-interactive-arg "URL: "))
  (shell-command (concat "/run/current-system/sw/bin/qutebrowser " url)))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; Indentation stuff
  (setq-default
   standard-indent 2
   tab-width 2
   typescript-indent-level 2
   lsp-typescript-preferences-quote-style "single"
   indent-tabs-mode nil
   js-indent-level 2
   js2-basic-offset 2
   js2-strict-semi-warning nil
   js2-missing-semi-one-line-override nil
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-indent-style 2
   css-indent-offset 2
   )

  (setq-default browse-url-browser-function 'browse-in-qutebrowser)

  (defun qute-browse (url &rest ignore)
    shell-command (concat "qutebrowser --target window " url))

  ;;COLEMAK

  (define-key evil-normal-state-map "k" 'evil-ex-search-next)
  (define-key evil-motion-state-map "k" 'evil-ex-search-next)

  (define-key evil-normal-state-map "K" 'evil-ex-search-previous)
  (define-key evil-motion-state-map "K" 'evil-ex-search-previous)

  (define-key evil-normal-state-map "i" nil)

  (define-key evil-normal-state-map (kbd "SPC x {") 'sp-wrap-curly)
  (define-key evil-normal-state-map (kbd "SPC x }") 'sp-wrap-curly)

  (define-key evil-normal-state-map (kbd "SPC x (") 'sp-wrap-round)
  (define-key evil-normal-state-map (kbd "SPC x )") 'sp-wrap-round)

  (define-key evil-normal-state-map (kbd "SPC x [")  'sp-wrap-square)
  (define-key evil-normal-state-map (kbd "SPC x ]") 'sp-wrap-square)

  (define-key evil-visual-state-map "i" nil)
  (define-key evil-motion-state-map "l" 'evil-insert)
  (define-key evil-motion-state-map "i" 'evil-forward-char)
  (define-key evil-motion-state-map "e" 'evil-previous-visual-line)
  (define-key evil-motion-state-map "n" 'evil-next-visual-line)
  (define-key evil-motion-state-map "k" 'evil-search-next)
  (define-key evil-motion-state-map "K" 'evil-search-previous)
  (define-key evil-motion-state-map "k" 'evil-ex-search-next)
  (define-key evil-motion-state-map "K" 'evil-ex-search-previous)
  (define-key evil-normal-state-map "k" 'evil-ex-search-next)
  (define-key evil-normal-state-map "K" 'evil-ex-search-previous)
  (define-key evil-normal-state-map "L" 'evil-insert-line)
  (define-key evil-motion-state-map "I" 'evil-window-bottom)
  (define-key evil-normal-state-map ",," 'lsp-ui-sideline-apply-code-actions)

  ;; (define-key evil-motion-state-map "t", 'link-hint-open-link)
  ;; (define-key evil-normal-state-map "t", 'link-hint-open-link)

  (defun my/get-prettier-js-config-path ()
    (expand-file-name "prettier.config.js" (projectile-project-root)))

  (defun my/get-prettier-rc-config-path ()
    (expand-file-name ".prettierrc" (projectile-project-root)))

  (defun my/get-existing-prettier-config ()
    (if (file-exists-p (my/get-prettier-js-config-path))
        (my/get-prettier-js-config-path)
      (when (file-exists-p (my/get-prettier-rc-config-path)) (my/get-prettier-rc-config-path))))

  (defun my/use-local-prettier-config ()
    (setq-local prettier-js-args `("--config" ,(my/get-existing-prettier-config))))

  (defun my/prettier-js-mode (&rest args)
    (interactive)
    (when (not (= (length (my/get-existing-prettier-config)) 0))
      (message "whatevz (%s)" (my/get-existing-prettier-config))
      (prettier-js-mode args)))

  (add-hook 'prettier-js-mode-hook 'my/use-local-prettier-config)
  (setq company-idle-delay 0)
  (setq TeX-PDF-mode t)
  (setq TeX-view-program-selection '((output-pdf "Zathura")))

  (setq flycheck-javascript-eslint-executable "eslint_d")
  (setq flycheck-typescript-tslint-executable "eslint_d")
  (setq avy-keys '(?a ?r ?s ?t ?d ?h ?n ?e ?i ?o))
  (with-eval-after-load 'flycheck
    (flycheck-add-mode 'javascript-eslint 'typescript-tsx-mode))
  ;; (use-package company-lsp :commands company-lsp)

  (setq confluence-url "https://wiki.novamedia.com/confluence/rpc/xmlrpc")

  (setq javascript-fmt-tool 'prettier)
  (add-hook 'rjsx-mode-hook #'lsp)

  (add-hook 'rjsx-mode-hook 'my/prettier-js-mode)
  (add-hook 'typescript-tsx-mode-hook 'my/prettier-js-mode)
  (add-hook 'typescript-mode-hook 'my/prettier-js-mode)
  ;; (add-hook 'yaml-mode-hook 'my/prettier-js-mode)
  (add-hook 'markdown-mode-hook 'my/prettier-js-mode)
  (add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))

  (add-hook 'doc-view-mode-hook 'auto-revert-mode)
  (add-hook 'haskell-mode-hook (lambda ()
                                 (message "haskell-mode-hook")
                                 (dante-mode)
                                 (interactive-haskell-mode)
                                 (turn-on-haskell-indentation)
                                 (hindent-mode)
                                 (setq haskell-stylish-on-save t) ;; override haskell layer
                                 ))

  (define-key dante)

  (spacemacs/set-leader-keys-for-major-mode 'haskell-mode
    "ht" 'haskell-process-do-type
    "l"  'hayoo
    "t"  'intero-type-at
    "T"  'spacemacs/haskell-process-do-type-on-prev-line
    "r"  'haskell-process-load-file
    ;; "i"  'intero-info
    "I"  'haskell-do-info
    "g"  'intero-goto-definition
    )

  (defun my-correct-symbol-bounds (pretty-alist)
    "Prepend a TAB character to each symbol in this alist,
this way compose-region called by prettify-symbols-mode
will use the correct width of the symbols
instead of the width measured by char-width."
    (mapcar (lambda (el)
              (setcdr el (string ?\t (cdr el)))
              el)
            pretty-alist))

  (defun my-ligature-list (ligatures codepoint-start)
    "Create an alist of strings to replace with
codepoints starting from codepoint-start."
    (let ((codepoints (-iterate '1+ codepoint-start (length ligatures))))
      (-zip-pair ligatures codepoints)))

  ; list can be found at https://github.com/i-tu/Hasklig/blob/master/GlyphOrderAndAliasDB#L1588
  (setq my-hasklig-ligatures
    (let* ((ligs '("&&" "***" "*>" "\\\\" "||" "|>" "::"
                   "==" "===" "==>" "=>" "=<<" "!!" ">>"
                   ">>=" ">>>" ">>-" ">-" "->" "-<" "-<<"
                   "<*" "<*>" "<|" "<|>" "<$>" "<>" "<-"
                   "<<" "<<<" "<+>" ".." "..." "++" "+++"
                   "/=" ":::" ">=>" "->>" "<=>" "<=<" "<->")))
      (my-correct-symbol-bounds (my-ligature-list ligs #Xe100))))

  ;; nice glyphs for haskell with hasklig
  (defun my-set-hasklig-ligatures ()
    "Add hasklig ligatures for use with prettify-symbols-mode."
    (setq prettify-symbols-alist
          (append my-hasklig-ligatures prettify-symbols-alist))
    (prettify-symbols-mode))

  ;; (add-hook 'haskell-mode-hook 'my-set-hasklig-ligatures)
 )


(defun haskell-do-info (cPos cEnd)
  "Bring repl and do :info under the current cursor word"
  (interactive "r")
  (let (inputStr oldPos endSymbol)
    ;; grab the string
    (setq oldPos cPos)
    (setq endSymbol (cdr (bounds-of-thing-at-point 'symbol)))
    (skip-syntax-backward "^(, ")
    (setq inputStr (buffer-substring-no-properties (point) endSymbol))

    (goto-char oldPos)
    (haskell-interactive-switch)
    (haskell-interactive-mode-run-expr (format ":info %s" inputStr))
    (haskell-interactive-switch-back)
    )
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (add-node-modules-path zenburn-theme zen-and-art-theme yasnippet-snippets yapfify yaml-mode ws-butler writeroom-mode winum white-sand-theme which-key web-mode web-beautify volatile-highlights uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme treemacs-projectile treemacs-evil toxi-theme toc-org tide tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit symon symbol-overlay sunny-day-theme sublime-themes subatomic256-theme subatomic-theme string-inflection spaceline-all-the-icons spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode seti-theme scss-mode sass-mode rjsx-mode reverse-theme restart-emacs rebecca-theme rainbow-delimiters railscasts-theme pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme prettier-js popwin planet-theme pippel pipenv pip-requirements phpunit phpcbf php-extras php-auto-yasnippets phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el password-generator paradox overseer origami organic-green-theme org-plus-contrib org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme nodejs-repl noctilux-theme nix-mode naquadah-theme nameless mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-svn magit-gitflow madhat2r-theme macrostep lush-theme lsp-ui lsp-treemacs lsp-python-ms lsp-haskell lorem-ipsum livid-mode live-py-mode linum-relative link-hint light-soap-theme less-css-mode kaolin-themes json-navigator json-mode js2-refactor js-doc jbeans-theme jazz-theme ir-black-theme intero insert-shebang inkpot-theme indent-guide importmagic impatient-mode hybrid-mode hungry-delete hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme helm-xref helm-themes helm-swoop helm-pydoc helm-purpose helm-projectile helm-nixos-options helm-mode-manager helm-make helm-lsp helm-hoogle helm-gtags helm-gitignore helm-git-grep helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme haskell-snippets gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gitignore-templates gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md ggtags gandalf-theme fuzzy font-lock+ flycheck-pos-tip flycheck-package flycheck-haskell flycheck-bashate flx-ido flatui-theme flatland-theme fish-mode fill-column-indicator farmhouse-theme fancy-battery eziam-theme eyebrowse expand-region exotica-theme exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu espresso-theme emmet-mode elisp-slime-nav editorconfig dumb-jump drupal-mode dracula-theme dotenv-mode doom-themes doom-modeline django-theme diminish diff-hl devdocs define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dante dakrone-theme cython-mode cyberpunk-theme company-web company-tern company-statistics company-shell company-reftex company-php company-nixos-options company-lsp company-ghci company-ghc company-cabal company-auctex company-anaconda column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized cmm-mode clues-theme clean-aindent-mode chocolate-theme cherry-blossom-theme centered-cursor-mode busybee-theme bubbleberry-theme browse-at-remote blacken birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile attrap apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme ace-link ace-jump-helm-line ac-ispell)))
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
)
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(package-selected-packages
;;    '(zenburn-theme zen-and-art-theme yapfify yaml-mode ws-butler winum white-sand-theme which-key web-mode web-beautify volatile-highlights uuidgen use-package undo-tree underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme toc-org tide typescript-mode terraform-mode hcl-mode tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spaceline powerline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode seti-theme scss-mode sass-mode reverse-theme restart-emacs rebecca-theme rainbow-delimiters railscasts-theme pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme popwin planet-theme pip-requirements phpunit phpcbf php-extras php-auto-yasnippets phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el paradox spinner origami orgit organic-green-theme org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-plus-contrib org-mime org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme nix-mode neotree naquadah-theme mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc markdown-mode majapahit-theme magit-gitflow magit-popup madhat2r-theme macrostep lush-theme lorem-ipsum livid-mode skewer-mode simple-httpd live-py-mode linum-relative link-hint light-soap-theme json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc jbeans-theme jazz-theme ir-black-theme intero insert-shebang inkpot-theme indent-guide hydra lv hy-mode dash-functional hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers parent-mode highlight-indentation heroku-theme hemisu-theme helm-themes helm-swoop helm-pydoc helm-projectile projectile helm-nixos-options helm-mode-manager helm-make helm-hoogle helm-gtags helm-gitignore request helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme haskell-snippets haml-mode gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md ggtags gandalf-theme fuzzy flycheck-pos-tip pos-tip flycheck-haskell flycheck pkg-info epl flx-ido flx flatui-theme flatland-theme fish-mode fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exotica-theme exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit git-commit with-editor transient evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg eval-sexp-fu espresso-theme emmet-mode elisp-slime-nav dumb-jump drupal-mode php-mode dracula-theme django-theme diminish diff-hl define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme company-web web-completion-data company-statistics company-shell company-nixos-options nixos-options company-ghci company-ghc ghc haskell-mode company-cabal company-auctex company-anaconda company column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode cmm-mode clues-theme clean-aindent-mode cherry-blossom-theme busybee-theme bubbleberry-theme bind-map bind-key badwolf-theme autothemer auto-yasnippet yasnippet auto-highlight-symbol auto-compile packed auctex apropospriate-theme anti-zenburn-theme anaconda-mode pythonic f dash s ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup birds-of-paradise-plus-theme)))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:background nil)))))
