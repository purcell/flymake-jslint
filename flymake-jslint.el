;;; flymake-jslint.el --- A flymake handler for javascript using jslint
;;
;;; Author: Steve Purcell <steve@sanityinc.com>
;;; Homepage: https://github.com/purcell/flymake-jslint
;;; Version: DEV
;;; Package-Requires: ((flymake-easy "0.1"))
;;
;;; Commentary:
;;
;; References:
;;   http://www.emacswiki.org/cgi-bin/wiki/FlymakeJavaScript
;;   http://d.hatena.ne.jp/kazu-yamamoto/mobile?date=20071029
;;
;; Usage:
;;   (require 'flymake-jslint)
;;   (add-hook 'js-mode-hook 'flymake-jslint-load)
;;
;; Uses flymake-easy, from https://github.com/purcell/flymake-easy

;;; Code:

(require 'flymake-easy)

(defgroup flymake-jslint nil
  "Flymake checking of Javascript using jslint"
  :group 'programming
  :prefix "flymake-jslint-")

;;;###autoload
(defcustom flymake-jslint-detect-trailing-comma t
  "Whether or not to report warnings about trailing commas."
  :type 'boolean :group :flymake-jslint)

;;;###autoload
(defcustom flymake-jslint-command "jsl"
  "Name (and optionally full path) of jslint executable."
  :type 'string :group 'flymake-jslint)

(defvar flymake-jslint-err-line-patterns
  '(("^\\(.+\\)\:\\([0-9]+\\)\: \\(SyntaxError\:.+\\)\:$" nil 2 nil 3)
    ("^\\(.+\\)(\\([0-9]+\\)): \\(SyntaxError:.+\\)$" nil 2 nil 3)
    ("^\\(.+\\)(\\([0-9]+\\)): \\(lint \\)?\\(warning:.+\\)$" nil 2 nil 4)))
(defvar flymake-jslint-trailing-comma-err-line-pattern
  '("^\\(.+\\)\:\\([0-9]+\\)\: strict \\(warning: trailing comma.+\\)\:$" nil 2 nil 3))

(defun flymake-jslint-command (filename)
  "Construct a command that flymake can use to check javascript source."
  (list flymake-jslint-command "-process" filename))


;;;###autoload
(defun flymake-jslint-load ()
  "Configure flymake mode to check the current buffer's javascript syntax."
  (interactive)
  (flymake-easy-load 'flymake-jslint-command
                     (append flymake-jslint-err-line-patterns
                             (when flymake-jslint-detect-trailing-comma
                               (list flymake-jslint-trailing-comma-err-line-pattern)))
                     'tempdir
                     "js"))


(provide 'flymake-js)
;;; flymake-jslint.el ends here
