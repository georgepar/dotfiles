(add-to-list 'mu4e-contexts
 (make-mu4e-context
  :name "athena"
  :enter-func (lambda () (mu4e-message "athena context"))
  :leave-func (lambda () (setq mu4e-maildir-list nil))
  :match-func (lambda (msg)
                  (when msg
                    (mu4e-message-contact-field-matches msg
                       :to "g.paraskevopoulos@athenarc.gr")))
  :vars '((user-mail-address                . "g.paraskevopoulos@athenarc.gr")
          (message-sendmail-extra-arguments . ("-a" "athena"))
          (mu4e-sent-messages-behavior      . sent)
          (mu4e-drafts-folder               . "/athena/Drafts")
          (mu4e-trash-folder                . "/athena/Trash")
          (mu4e-sent-folder                 . "/athena/Sent")
          (mu4e-maildir-shortcuts           . (("/athena/INBOX" . ?i)
                                               ("/athena/Drafts"         . ?d)
                                               ("/athena/Sent" . ?s)))
          (user-full-name                   . "Giorgos Paraskevopoulos"))))
