;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; https://tecosaur.github.io/emacs-config/config.html

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Giorgos Paraskevopoulos"
      user-mail-address "georgepar.91@gmail.com")


;; Font configuration
(setq doom-font (font-spec :family "Source Code Pro" :size 17)
      doom-variable-pitch-font (font-spec :family "Source Code Pro" :size 15)
      doom-unicode-font (font-spec :family "JuliaMono")
      doom-big-font (font-spec :family "Source Code Pro" :size 24)
      doom-serif-font (font-spec :family "IBM Plex Mono" :weight 'light))


;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; Orange line letters instead of red
(custom-set-faces!
  '(doom-modeline-buffer-modified :foreground "orange"))

;; Do not show encoding in the modeline
(defun doom-modeline-conditional-buffer-encoding ()
  "We expect the encoding to be LF UTF-8, so only show the modeline when this is not the case"
  (setq-local doom-modeline-buffer-encoding
              (unless (and (memq (plist-get (coding-system-plist buffer-file-coding-system) :category)
                                 '(coding-category-undecided coding-category-utf-8))
                           (not (memq (coding-system-eol-type buffer-file-coding-system) '(1 2))))
                t)))
(add-hook 'after-change-major-mode-hook #'doom-modeline-conditional-buffer-encoding)

;; buffer names
(setq doom-fallback-buffer-name "► Doom"
      +doom-dashboard-name "► Doom")


;; relative numbers
(setq display-line-numbers-type 'relative)


;; better defaults
(setq-default
      window-combination-resize t
      x-stretch-cursor t)

(setq undo-limit 80000000                         ; Raise undo-limit to 80Mb
      evil-want-fine-undo t                       ; By default while in insert all changes are one big blob. Be more granular
      auto-save-default t                         ; Nobody likes to loose work, I certainly don't
      truncate-string-ellipsis "…"                ; Unicode ellispis are nicer than "...", and also save /precious/ space
      password-cache-expiry nil                   ; I can trust my computers ... can't I?
      ;; scroll-preserve-screen-position 'always     ; Don't have `point' jump around
      scroll-margin 2)                            ; It's nice to maintain a little margin

;; for camel case strings. Treat subwords as separate
(global-subword-mode 1)


;; configure python repl
(setq +python-ipython-repl-args '("-i" "--simple-prompt" "--no-color-info"))
(setq +python-jupyter-repl-args '("--simple-prompt"))

;; ; (setq writeroom-fullscreen-effect t)
(setq projectile-project-search-path '("~/projects"))

(map! :map +doom-dashboard-mode-map
      :ne "s" #'doom/quickload-session
      :ne "a" #'org-agenda
      :ne "f" #'find-file
      :ne "r" #'consult-recent-file
      :ne "p" #'doom/open-private-config
      :ne "c" (cmd! (find-file (expand-file-name "config.el" doom-private-dir)))
      :ne "." (cmd! (doom-project-find-file "~/.config/")) ; . for dotfiles
      ;; :ne "b" #'+vertico/switch-workspace-buffer
      :ne "B" #'consult-buffer
      :ne "q" #'save-buffers-kill-terminal)


(setq which-key-idle-delay 0.5) ;; I need the help, I really do

(after! magit
  (magit-delta-mode +1))

(setq-default history-length 1000)
(setq-default prescient-history-length 1000)


(set-company-backend!
  '(text-mode
    markdown-mode
    gfm-mode
    company-files)
  '(:seperate
    company-ispell
    company-files))


(setq ispell-dictionary "en-custom")
(setq +zen-text-scale 0.6)

(lsp-register-client
    (make-lsp-client :new-connection (lsp-tramp-connection "pyright-langserver")
                     :major-modes '(python-mode)
                     :remote? t
                     :server-id 'pyright-remote))


(lsp-register-client
    (make-lsp-client :new-connection (lsp-tramp-connection "bash-language-server")
                     :major-modes '(shell-script-mode)
                     :remote? t
                     :server-id 'bash-remote))


;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq-default major-mode 'org-mode)

(setq org-directory "~/notes/"
      org-use-property-inheritance t
      org-export-in-background t
      org-catch-invisible-edits 'smart
      org-export-with-sub-superscripts '{}
      org-list-demote-modify-bullet '(("+" . "-") ("-" . "+") ("*" . "+") ("1." . "a.")))

(setq org-startup-with-inline-images t)


(set-file-template! "\\.tex$" :trigger "__" :mode 'latex-mode)
(set-file-template! "\\.org$" :trigger "__" :mode 'org-mode)
(set-file-template! "/LICEN[CS]E$" :trigger '+file-templates/insert-license)


(use-package! org-appear
 :hook (org-mode . org-appear-mode)
 :config
 (setq org-appear-autoemphasis t
       org-appear-autosubmarkers t
       org-appear-autolinks nil)
 ;; for proper first-time setup, `org-appear--set-elements'
 ;; needs to be run after other hooks have acted.
 (run-at-time nil nil #'org-appear--set-elements))

(use-package! ob-http
 :commands org-babel-execute:http)


(use-package! org-transclusion
 :commands org-transclusion-mode
 :init
 (map! :after org :map org-mode-map
       "<f12>" #'org-transclusion-mode))

(use-package! graphviz-dot-mode
 :commands graphviz-dot-mode
 :mode ("\\.dot\\'" "\\.gz\\'")
 :init
 (after! org
   (setcdr (assoc "dot" org-src-lang-modes)
           'graphviz-dot)))

(use-package! company-graphviz-dot
 :after graphviz-dot-mode)

(org-babel-do-load-languages)
'org-babel-load-languages
'((dot . t)) ; this line activates dot


(use-package! citar
  ;; :when (featurep! :completion ivy--default)

   :custom
   (citar-bibliography '("~/bib/references/refs.bib"))
   (org-cite-insert-processor 'citar)
   (org-cite-follow-processor 'citar)
   (org-cite-activate-processor 'citar))

(use-package! citeproc
  :defer t)

(map! :after org
      :map org-mode-map
      :localleader
      :desc "Insert citation" "@" #'org-cite-insert)

(use-package! oc
  :after org citar
  :config
  (require 'ox)
  (setq org-cite-global-bibliography
        (let ((paths (or citar-bibliography
                         (bound-and-true-p bibtex-completion-bibliography))))
          ;; Always return bibliography paths as list for org-cite.
          (if (stringp paths) (list paths) paths)))
  ;; setup export processor; default csl/citeproc-el, with biblatex for latex
  (setq org-cite-export-processors
        '((t csl "association-for-computational-linguistics.csl"))))
           

(use-package! oc-csl
  :after oc
  :config
  (setq org-cite-csl-styles-dir "~/bib/styles"))


  ;;; Org-cite processors
(use-package! oc-biblatex
  :after oc)
(use-package! oc-natbib
  :after oc)


(use-package! citar-org
  :no-require
  :custom
  (org-cite-insert-processor 'citar)
  (org-cite-follow-processor 'citar)
  (org-cite-activate-processor 'citar)
  (org-support-shift-select t)
  (when (featurep! :lang org +roam2)
    ;; Include property drawer metadata for 'org-roam' v2.
    (citar-org-note-include '(org-id org-roam-ref)))
  ;; Personal extras
  (setq citar-symbols
        `((file ,(all-the-icons-faicon "file-o" :v-adjust -0.1) . " ")
          (note ,(all-the-icons-material "speaker_notes" :face 'all-the-icons-silver :v-adjust -0.3) . " ")
          (link ,(all-the-icons-octicon "link" :face 'all-the-icons-dsilver :v-adjust 0.01) . " "))))

(use-package! oc-csl-activate
  :after oc
  :config
  (setq org-cite-csl-activate-use-document-style t)
  (defun +org-cite-csl-activate/enable ()
    (interactive)
    (setq org-cite-activate-processor 'csl-activate)
    (add-hook! 'org-mode-hook '((lambda () (cursor-sensor-mode 1)) org-cite-csl-activate-render-all))
    (defadvice! +org-cite-csl-activate-render-all-silent (orig-fn)
      :around #'org-cite-csl-activate-render-all
      (with-silent-modifications (funcall orig-fn)))
    (when (eq major-mode 'org-mode)
      (with-silent-modifications
        (save-excursion
          (goto-char (point-min))
          (org-cite-activate (point-max)))
        (org-cite-csl-activate-render-all)))
    (fmakunbound #'+org-cite-csl-activate/enable)))


(map! :map org-mode-map
      :localleader
      :desc "View exported file" "v" #'org-view-output-file)

(defun org-view-output-file (&optional org-file-path)
  "Visit buffer open on the first output file (if any) found, using `org-view-output-file-extensions'"
  (interactive)
  (let* ((org-file-path (or org-file-path (buffer-file-name) ""))
         (dir (file-name-directory org-file-path))
         (basename (file-name-base org-file-path))
         (output-file nil))
    (dolist (ext org-view-output-file-extensions)
      (unless output-file
        (when (file-exists-p
               (concat dir basename "." ext))
          (setq output-file (concat dir basename "." ext)))))
    (if output-file
        (if (member (file-name-extension output-file) org-view-external-file-extensions)
            (browse-url-xdg-open output-file)
          (pop-to-buffer (or (find-buffer-visiting output-file)
                             (find-file-noselect output-file))))
      (message "No exported file found"))))

(defvar org-view-output-file-extensions '("pdf" "md" "rst" "txt" "tex" "html")
  "Search for output files with these extensions, in order, viewing the first that matches")
(defvar org-view-external-file-extensions '("html")
  "File formats that should be opened externally.")

(setq org-latex-pdf-process '("latexmk -f -pdf -%latex -shell-escape -interaction=nonstopmode -output-directory=%o %f"))

(setq mu4e-marker-icons-mode 1)
