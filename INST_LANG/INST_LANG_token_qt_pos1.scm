; INST_LANG_token_qt_pos1

(defvar RU)
(defvar result)

; for french_downcase_string
(require 'INST_LANG_utils)

(define (pos1 token name)
" "
    (let (fdnaw (french_downcase_string name) QT reponse)
    (format t "\t\t\t\t\t\tici module pos1 sur %s\n" name)
        (if 
            (and ; fre_NAM_homo_tab homo ***non en tête de phrase avec typographie correcte***
                ;  M Proust, Marguerite Duras, le roi Charles
                (not (null? (item.prev token)))
                (not (member_string (item.feat (item.prev token) 'punc ) (list "." "?" "!")))
                (is_cap (string-car name))
                (fre_abbr_lookup fdnaw fre_NAM_homo_tab))
                    (begin
                        (set! reponse t)
                        (set! QT "QTpos1" )
                        (set! RU (append RU (list name QT ";")))
                        (item.set_feat token 'pos "ADV")
                        (set! result (list name))
                        (or (format t "\t\t\t\t\t\tici module pos1: on répond\n") t)))
                
            (format t "we leave the module pos1\n")
           reponse))
(provide 'INST_LANG_token_qt_pos1)

