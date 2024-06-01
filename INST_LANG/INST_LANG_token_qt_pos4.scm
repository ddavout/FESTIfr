; INST_LANG_token_qt_pos4

; à voir 
; suis-je fier;
; pas fier le mec !
; je ne suis pas fier
; suis pas fier
; suis pas très fier

(defvar RU)
(defvar result)

; for french_downcase_string
(require 'INST_LANG_utils)

(defvar list_qt_pos4_homo_NOM_VER (list "fier"))
(defvar list_per_sujet (list "je" "tu" "il" "elle" "on"))
(defvar list_per_sujet_inv (list "je" "tu" "il" "elle" "on" "nous" "vous" "ils"))

(define (pos4 token name)
"ex je suis |fier|, se fier, suis-je "
    (let 
        ((fdnaw (french_downcase_string name)) QT reponse)
        (format t "\t\t\t\t\t\tici module pos4 sur %s\n" name)
        (if 
          (and
            (set! token-1 (item.prev token))
            (or (format t "QTpos4: ok1: name %s\n" name) t)
            ;*
            ; aucune ponctuation ou preponctuation  entre * et fier
            ;**
            (equal? (item.feat token-1 'punc) 0)
            (string-equal (item.feat token 'prepunctuation) "")

            (or (format t "locution list_qt_pos4: ok2\n") t)
            ;***
            (member_string (french_downcase_string name) list_qt_pos4_homo_NOM_VER)
            ;***            
            (or (format t "locution list_qt_pos4: ok3\n") t)
            (or (format t "\t\t\t\t\t\tici module pos4: on répond sur |%s|\n" name) t))

            
                (begin
                  (format t "réponse pour QTpos4\n")

                  (set! reponse t)
                  (set! QT "QTpos4")
                  (set! RU (append RU (list name QT ";")))
                  ; action directe suivant contexte token-2
                  (set! token-2 (item.prev token-1))

                  (if (and token-2 (member_string (item.name token-2) list_per_sujet))
                        (begin
                            (format t "ADJ") 
                            (item.set_feat token 'pos "ADJ"))
                        (begin
                             ; token pas s_y !  
                            (if (member_string (item.name token-1) (list  "y" "se"))
                                (begin
                                    (format t "VER") 
                                    (item.set_feat token 'pos "VER"))
                                 ; statuer ou laisser faire poslex
                                 (begin
                                    ; fier intransitif donc pas VER en tout cas ; inversion es-tu fier grâce à QTpos2
                                    (set! p_name (item.name token-1))
                                    (format t "ici, dernier cas %s" p_name) 
                                    (if (or (member_string p_name (list "le" "la" "lui"))
                                            (member (string-after p_name "-") list_per_sujet_inv)
                                            (and 
                                                (set! token-2 (item.prev token))
                                                (set! p_p_name (french_downcase_string (item.name token-2)))
                                                (member_string p_p_name  (list "pas"))))

                                        (begin
                                            (format t "ici, dernier cas  %s\n" p_name ) 
                                            (item.set_feat token 'pos "ADJ")))
                                            )
                                    )))))
                
                (set! result (list name))
            (format t "we leave the module pos4 sur |%s|\n" name)
           reponse))

(provide 'INST_LANG_token_qt_pos4)
