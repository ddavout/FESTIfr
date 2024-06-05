; INST_LANG_token_qt_mis
(defvar fdnaw)
(defvar RU)
(defvar result)
; for french_downcase_string
(require 'INST_LANG_utils)
; bouh
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

            (set! result (list "inconnu"))))

    (format t "we leave the module mis sur |%s|\n" name)
   ; hors debug: c'est la dernière chance d'agir, pas besoin de mettre reponse à true 
   reponse))
(provide 'INST_LANG_token_qt_mis)

