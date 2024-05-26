; INST_LANG_token_qt_delp_n

(defvar RU)
(defvar result)

(define (delp.n token name)
"si le token d'avant est marqué, on exécute"
(let (QT reponse)
    (format t "\t\t\t\t\t\tici module delp.n sur %s\n" name)
        (if 
            (string-equal (item.feat token 'p.p.delete) "next")
                (begin
                ))
            (begin
                ; t pour arrêter le flux
                (set! reponse)
                (set! QT "delp.n" )
                (set! RU (append RU (list name QT ";")))
                (set! result nil) 

            )
        (format t "we leave the module delp.n\n")
       reponse))
(provide 'INST_LANG_token_qt_delp.n)
