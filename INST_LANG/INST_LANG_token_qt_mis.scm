; INST_LANG_token_qt_mis
(defvar fdnaw)
(defvar RU)
(defvar result)
; for french_downcase_string
(require 'INST_LANG_utils)
; bouh
(define (mis token name)

    (let (fdnaw (french_downcase_string name) QT reponse)
    (format t "\t\t\t\t\t\tici module mis sur %s" name)
    ; module ramasse-miette
    (if t
        (begin
            (or (format t "\t\t\t\t\t\tici module mis: on répond\n") t)
            (set! reponse t)
            (set! QT "QTmis" )
            (set! RU (append RU (list name QT ";")))

            (set! result (list "inconnu"))))

    (format t "we leave the module mis\n")
   ; hors debug: c'est la dernière chance d'agir, pas besoin de mettre reponse à true 
   reponse))
(provide 'INST_LANG_token_qt_mis)

