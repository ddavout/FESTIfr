; INST_LANG_token_qt_del

(defvar RU)
(defvar result)

(define (del token name)
"si le token d'avant est marqué, on exécute"
(let (reponse)
    (format t "\t\t\t\t\t\tici module del sur |%s| %l\n" name (item.feat token 'delete))
        (if (and 
                (string-equal (item.feat token 'delete) "next")
                (or (format t "\t\t\t\t\t\tici module del: on répond |%s|\n" name) t))
            (begin
                (set! reponse t)
                (set! QT "del" )
                (ru token name)
                ; (set! result (list "effacé" name)) 
                (set! result) 
                (format t " (item.feat token 'n.name) %l\n"  (item.feat token 'n.name))
                ; (if (string-equal (na (item.feat token 'n.name)) "important")
                ;     (format t "AGIR ciciiiii\n"))
                ;;(item.set_feat token 'prepunctuation "")
                ;;(item.set_feat token 'punc nil)
            ))
        (format t "we leave the module del\n")
       reponse))

(provide 'INST_LANG_token_qt_del)


