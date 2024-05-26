; INST_LANG_token_qt_delp

(defvar RU)
(defvar result)

(define (delp token name)
"si le token d'avant est marqué, on exécute"
(let (QT reponse)
    (format t "\t\t\t\t\t\tici module delp sur %s\n" name)
        (if 
            (string-equal (item.feat token 'p.delete) "next")

            (begin
                (if (not (null? (item.next token)))
                    (begin 
                        (set! reponse t)
                        (format t "\t\t\t\tici module locution_part_1: on répond\n")

                        (set! QT "delp" )
                        (set! RU (append RU (list name QT ";")))
                        ; tu 
                        (set! result )))                
            ))
        (format t "we leave the module delp\n")
       reponse))
(provide 'INST_LANG_token_qt_delp)


