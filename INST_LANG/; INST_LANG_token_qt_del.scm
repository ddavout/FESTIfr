; INST_LANG_token_qt_del

(defvar RU)
(defvar result)

(define (del token name)
"si le token d'avant est marqué, on exécute"
(let (QT reponse)
    (format t "ici module del\n")
        (if 
            (string-equal (item.feat token 'delete) "next")
                (begin
                ))
            (begin
                ; t pour arrêter le flux
                ; (set! reponse t)
                (set! QT "del" )
                (set! RU (append RU (list name QT ";")))
            )
        (format t "we leave the module del\n")
       reponse))
(provide 'INST_LANG_token_qt_del)


