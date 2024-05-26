; INST_LANG_token_qt_del

(defvar RU)
(defvar result)

(define (del token name)
"si le token d'avant est marqué, on exécute"
(let (QT reponse)
    (format t "\t\t\t\t\t\tici module del sur %s\n" name)
        (if 
            (string-equal (item.feat token 'delete) "next")
            (begin
                (set! reponse t)
                (set! QT "del" )
                (set! RU (append RU (list name QT ";")))
                ; (set! result (list "effacé" name)) 
                (set! result) 
            ))
        (format t "we leave the module del\n")
       reponse))

(provide 'INST_LANG_token_qt_del)


