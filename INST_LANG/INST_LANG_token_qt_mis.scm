; INST_LANG_token_qt_mis
(defvar fdnaw)
(defvar RU)
(defvar result)
; for french_downcase_string
(require 'INST_LANG_utils)
bouh
(define (mis token name)

    (let (fdnaw (french_downcase_string name) QT reponse)
    (format t "\t\t\t\t\t\tici module mis sur %s" name)
    ; module ramasse-miette
    (if t
        (begin
            (set! reponse t)
            (set! QT "QTmis" )
            (set! RU (append RU (list name QT ";")))
            (set! result (list name)))
          (begin 
            ;befapo non concernée
            (set! reponse nil)))
    (format t "we leave the module mis\n")
   reponse))
(provide 'INST_LANG_token_qt_mis)

