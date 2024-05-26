; INST_LANG_token_qt_delp_p

(defvar RU)
(defvar result)

(define (delp.p token name)
"si le token d'avant est marqué, on exécute"
(let (QT reponse)
    (format t "\t\t\t\t\t\tici module delp.p sur %s\n" name)
        (if 
            (string-equal (item.feat token 'p.p.delete) "next")
                (begin
                    (set! reponse)
                    (set! QT "delp.p" )
                    (set! RU (append RU (list name QT ";")))
                    (set! result nil) 
                ))
        (format t "we leave the module delp.p\n")
       reponse))
(provide 'INST_LANG_token_qt_delp.p)
