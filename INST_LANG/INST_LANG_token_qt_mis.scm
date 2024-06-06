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
            (set! reponse t)
            (set! QT "QTmis" )
            (ru token name)

           (cond
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
            (and ( string-equal name "d")
                 (not (string-equal (item.set_feat token 'token_pos) "done")))
                     (item.set_feat token 'token_pos "ART:ind")
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
            (set! result (list "inconnu")))
            
           )))


    (format t "we leave the module mis sur |%s|\n" name)
   ; hors debug: c'est la dernière chance d'agir, pas besoin de mettre reponse à true 
   reponse))
(provide 'INST_LANG_token_qt_mis)

