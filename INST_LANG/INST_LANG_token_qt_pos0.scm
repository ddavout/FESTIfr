; INST_LANG_token_qt_pos0

(defvar RU)
(defvar result)

; for ..
(require 'INST_LANG_utils)

(defvar fdnaw)

(define (pos0 token name)
" "
    (let  (QT reponse)
        (format t "\t\t\t\t\t\tici module pos0 sur %s\n" name)
        (if 
            (member_string fdnaw list_ADV_PRE)
                (begin
                    (set! reponse t)
                    (set! QT "QTpos0" )
                    (set! RU (append RU (list name QT ";")))
                    (item.set_feat token 'pos "ADV")
                    (set! result (list name))
                    (or (format t "ici module pos0: on répond sur |%s|\n" name) t)))

        (format t "we leave the module pos0 sur |%s|\n" name)
       reponse))
(provide 'INST_LANG_token_qt_pos0)