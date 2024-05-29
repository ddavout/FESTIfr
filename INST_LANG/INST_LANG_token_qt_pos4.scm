; INST_LANG_token_qt_pos4

; à voir suis-je fier
(defvar RU)
(defvar result)

; for french_downcase_string
(require 'INST_LANG_utils)

(defvar list_qt_pos4_homo_NOM_VER (list "fier"))

(define (pos4 token name)
"ex je suis |fier|, se fier "
    (let 
        ((fdnaw (french_downcase_string name)) QT reponse)
        (format t "\t\t\t\t\t\tici module pos4 sur %s\n" name)
        (if 
          (and
            ; |sans| ferment
           ; (not (null? (item.next token)))
            (set! token-1 (item.prev token))
            (or (format t "QTpos4: ok1: name %s\n" name) t)
            ;*
;            (member_string (french_downcase_string name) list_qt_pos4_pre)

            ; aucune ponctuation ou preponctuation  entre sans et forment
            ;**
            (equal? (item.feat token-1 'punc) 0)
            (string-equal (item.feat token 'n.prepunctuation) "")

            (or (format t "locution list_qt_pos4: ok2\n") t)
            ;***
            (set! token-2 (item.prev token-1))
            (member_string (french_downcase_string name) list_qt_pos4_homo_NOM_VER)
            ;***            
            (or (format t "locution list_qt_pos4: ok3\n") t)
            (or (format t "\t\t\t\t\t\tici module pos4: on répond\n") t))

            
                (begin
                  (format t "réponse pour QTpos4\n")

                  (set! reponse t)
                  (set! QT "QTpos4")
                  (set! RU (append RU (list name QT ";")))
                  ; action directe suivant contexte token-2
                  (if (member_string (item.name token-2) (list "je" "tu" "il" "elle" "on"))
                        (begin
                            (format t "ADJ") 
                            (item.set_feat token 'pos "ADJ"))
                        (begin
                             ; token pas s_y !  
                            (if (member_string (item.name token-1) (list  "y" "se"))
                                (begin
                                    (format t "VER") 
                                    (item.set_feat token 'pos "VER"))
                                 ; (begin
                                 ;    ; fier intransitif donc pas VER en tout cas
                                 ;    ; laisser faire poslex
                                 ;    (if (member_string (item.name token-1) (list "le" "la" "lui"))
                                 ;         (item.set_feat token 'pos "ADJ")))
                                    )))))
                
                (set! result (list name))
            (format t "we leave the module pos4\n")
           reponse))

(provide 'INST_LANG_token_qt_pos4)
