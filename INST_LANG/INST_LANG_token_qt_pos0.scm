; INST_LANG_token_qt_pos0

(defvar RU)
(defvar result)

; for ..
(require 'INST_LANG_utils)
(set! rever "_reverse")
(set! guillemet "_guillemet")
(defvar fdnaw)

(define (pos0 token name)
    " "
    (let  (reponse)
        (format t "\t\t\t\t\t\tici module pos0 sur %s\n" name)
        (if 
            (member_string name (list "\""))
                (begin
                    (set! reponse t)
                    (set! QT "QTpos0" )
                    (ru token name)
                    (set! result (list guillemet))
                    (or (format t "ici module pos0: on répond sur |%s|\n" name) t))
                )


        (if 
            (member_string name (list "\\"))
                (begin
                    (format t "reverse %l" rever )
                    (set! reponse t)
                    (set! QT "QTpos0" )
                    (ru token name)
                    (set! result (list rever))
                    (or (format t "ici module pos0: on répond sur |%s|\n" name) t))
                )

        (format t "we leave the module pos0 sur |%s|\n" name)
       reponse))
(provide 'INST_LANG_token_qt_pos0)