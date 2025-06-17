(require 'reformatter)

(defgroup ormolu nil
  "Format Haskell using ormolu."
  :group 'languages)

(defcustom ormolu-command "ormolu"
  "Command used for reformatting."
  :type 'string
  :safe #'stringp)

(defcustom ormolu-args '()
  "Additional arguments to pass to ormolu."
  :type '(repeat string)
  :safe #'listp)

;; Commands for reformatting

;;;###autoload (autoload 'ormolu-buffer "ormolu" nil t)
;;;###autoload (autoload 'ormolu-region "ormolu" nil t)
;;;###autoload (autoload 'ormolu-on-save-mode "ormolu" nil t)
(reformatter-define ormolu
  :program ormolu-command
  :args (append ormolu-args
                (when buffer-file-name
                  (list "--stdin-input-file" buffer-file-name)))
  :lighter " Ormolu"
  :group 'ormolu)

(provide 'ormolu)
