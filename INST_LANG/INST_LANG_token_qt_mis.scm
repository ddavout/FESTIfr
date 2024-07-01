; INST_LANG_token_qt_mis
(defvar fdnaw)
(defvar RU)
(defvar result)
; for french_downcase_string
(require 'INST_LANG_utils)

(defvar apo "apostrophe")
(define (mis token name)

    (let (fdnaw (french_downcase_string name) reponse)
    ; (format t "\t\t\t\t\t\tici module mis sur %s" name)
    ; module ramasse-miette
    (if t
        (begin
            (or (format t "\t\t\t\t\t\tici module mis: on répond sur |%s|\n" name) t)
            (format t "explode %l\n" (utf8explode  name))
            (set! reponse t)
            (set! QT "QTmis" )
            (if (equal? (string-length_utf8 name) 1)
                (format t "monstre utf8ord %s\n" (utf8ord name)))
            (if (string-equal (string-last name) " ") (begin (format t "en trop") (set! name (string-but-last name))))
            (ru token name)


           (cond
            ((equal? (string-length_utf8 name) 1)
                (if (equal? (utf8ord name)  44)
                    (set! result)
                    ))            
            ((equal? (string-length_utf8 name) 1)
                (if (equal? (utf8ord name)  59)
                    (set! result)
                    ))


           (t
                ; recalé befapo
                ; pour cause d'espace avant apostrophe      

                ; (set! result (remove_last (french_parse_charlist name 1)))      
                (set! result (list "inconnu"))
                )
            
            ((equal? (string-length_utf8 name) 1)
                (if (equal? (utf8ord name)  -1)
                    ; ù ?
                    (set! result)
                    ))            
            ((equal? (string-length_utf8 name) 1)
                (if (equal? (utf8ord name)  249)
                    (set! result (tab_lookup "ù" with_accent_letter_tab))))

            ((equal? (string-length_utf8 name) 1)
                (if (equal? (utf8ord name)  185)
                    (set! result)
                    ))



            ((equal? (string-length_utf8 name) 1)
                (if (equal? name  ";")
                    
                    ))

            ((equal? (string-length_utf8 name) 1)
                (if (equal? name "\"") 
                    (set! result)
                    ))
            ((equal? (string-length_utf8 name) 1)
                (if (equal? name "\\\"") 
                    (set! result)
                    ))         
                        
                
            ((> (utf8ord (string-car name)) 255 )
                (set! result))

; recalé de befapo; 
; condition non remplie : (string-equal (item.feat token 'n.whitespace) "'")
            ((string-equal (string-before (item.feat token 'whitespace) "'") " ")
                (set! result (list apo name))
             )
            ; ex n rejeté de QTletter  " n'y vois aucun mal"
            (( string-equal (string-last (item.feat token 'whitespace)) " ")
               (format t "reste |%s|\n" (string-cdr name))
               ; on enlève les blancs excédentaires du whitespace de "n" et on renvoie
               (item.set_feat token 'whitespace "")
               ; renvoi
               (set! result (INST_LANG_token_to_words token name)))

            ; rejeté de pos4 pb d' PRE ou ART:ind
            ; pis-aller tempo ART:ind
            ; tempo



           (
            (and ( string-equal name "l")
                 (not (string-equal (item.feat token 'token_pos) "done")))
                     (item.set_feat token 'token_pos "dd")
                     (set! result (INST_LANG_token_to_words token name))

                     )

            ; (
            ;   (and 
            ;     ( string-equal name "d")
            ;     (not (string-equal (item.set_feat token 'token_pos) "ART:ind")))
                
            ;             (item.set_feat token 'token_pos "ART:ind")
            ;             ; TODO passage par Qtmis occulté
            ;             (set! RU (append RU (list QT ";" name)))
            ;             (set! result (INST_LANG_token_to_words token name)))



           (t 
                ; recalé befapo
                ; pour cause d'espace avant apostrophe      

                ;(set! result (remove_last (french_parse_charlist name 1)))      
                (set! result (list "inconnu"))
                )
            
           )))


    (format t "we leave the module mis sur |%s|\n" name)
   ; hors debug: c'est la dernière chance d'agir, pas besoin de mettre reponse à true 
   reponse))
(provide 'INST_LANG_token_qt_mis)

