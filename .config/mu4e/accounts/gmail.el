(add-to-list 'mu4e-contexts)
(make-mu4e-context
 :name "gmail"
 :enter-func (lambda () (mu4e-message "gmail context"))
 :leave-func (lambda () (setq mu4e-maildir-list nil))
 :match-func (lambda (msg)
               (when msg
                 (mu4e-message-contact-field-matches msg
                    :to "georgepar.91@gmail.com")))
 :vars '((user-mail-address                . "georgepar.91@gmail.com")
         (message-sendmail-extra-arguments . ("-a" "gmail"))
         (mu4e-sent-messages-behavior      . delete)
         (mu4e-drafts-folder               . "/gmail/[Gmail].Drafts")
         (mu4e-trash-folder                . "/gmail/[Gmail].Trash")
         (mu4e-sent-folder                 . "/gmail/[Gmail].Sent")
         (mu4e-maildir-shortcuts           . (("/gmail/INBOX" . ?i)
                                              ("/gmail/[Gmail].Drafts"         . ?d)
                                              ("/gmail/[Gmail].Sent" . ?s)))
         (user-full-name                   . "Giorgos Paraskevopoulos")))
