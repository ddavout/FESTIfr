; INST_LANG_token_qt_loc0

(defvar RU)
(defvar result)

; for french_downcase_string
(require 'INST_LANG_utils)

(define (loc0 token name)
" "
    (let (fdnaw (french_downcase_string name) QT reponse)
    (format t "\t\t\t\t\t\tici module loc0 sur %s" name)
        (if 
            (member_string fdnaw list_ADV_PRE)
                (begin
                    (set! reponse t)
                    (set! QT "QTloc0" )
                    (set! RU (append RU (list name QT ";")))
                    (item.set_feat token 'pos "ADV")
                    (set! result (list name))
                    (or (format t "ici module befapo: on répond\n") t))
                  (begin 
                    ;befapo non concernée
                    (set! reponse nil)))
        (format t "we leave the module loc0\n")
       reponse))
(provide 'INST_LANG_token_qt_loc0)