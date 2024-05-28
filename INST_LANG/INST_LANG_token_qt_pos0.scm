; INST_LANG_token_qt_pos0

(defvar RU)
(defvar result)

; for french_downcase_string
(require 'INST_LANG_utils)

(define (pos0 token name)
" "
    (let (fdnaw (french_downcase_string name) QT reponse)
    (format t "\t\t\t\t\t\tici module pos0 sur %s\n" name)
        (if 
            (member_string fdnaw list_ADV_PRE)
                (begin
                    (set! reponse t)
                    (set! QT "QTpos0" )
                    (set! RU (append RU (list name QT ";")))
                    (item.set_feat token 'pos "ADV")
                    (set! result (list name))
                    (or (format t "ici module pos0: on répond\n") t)))

        (format t "we leave the module pos0\n")
       reponse))
(provide 'INST_LANG_token_qt_pos0)