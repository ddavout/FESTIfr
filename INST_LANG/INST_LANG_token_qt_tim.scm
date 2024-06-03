; INST_LANG_token_qt_tim

(defvar RU)
(defvar result)

; for french_downcase_string
(require 'INST_LANG_utils)

; for fre_unit_time_name_default
(require 'INST_LANG_token_to_words_lists )

; tempo develop
; (defvar fre_unit_time_name fre_unit_time_name_default)
(set! fre_unit_time_name 
    (list "h" "heure" "heures" "min" "minute" "minutes" "s" "seconde" "secondes"))

(defvar fdnaw)
(defvar QTtim_pattern "{[0-2]?[0-9]}{[.|:]}{[0-5][0-9]}")


(define (tim token name)
    "lecture de l'heure 23h 34min 52s"
    (let  (QT reponse)
        (format t "\t\t\t\t\t\tici module tim sur %s\n" name)
        (if 

            (and
                (pattern-matches name QTtim_pattern)
                (or (format t "QTtim: ok1: name %s\n" name) t)
                (set! h1 #1)
                (set! h2 #2)
                (set! h3 #3)
                (or (format t "QTtim: ok2 h1 %s h2 %s h3 %s\n" h1 h2 h3) t)
                (not (null? (item.next token)))
                (set! n_name (item.feat token "n.name"))
                (set! units (french_downcase_string n_name))
                (or (format t "QTtim units |%s|\n" units) t)
                (member_string n_name fre_unit_time_name))

                    (begin
                        (set! reponse t)    
                        (set! QT "QTtim")
                        (set! RU (append RU (list name QT ";")))
                         ; AS don't say Uhr again
                        (item.set_feat token "delete" "next")

                        (set! result
                                    (append
                                        (INST_LANG_number_point h1 1) ; heure minute féminin
                                         ; pluriel identiques 23h 34min 52s
                                        (if  (string-matches units "heures\\|heure\\|h") '("heure"))
                                        (if  (string-matches units "minutes\\|minute\\|min") '("minute"))
                                        (if  (string-matches units "secondes\\|seconde\\|s") '("seconde"))
                                        (if (not (equal? h3 "00")) (INST_LANG_number_point h3 1)'("zéro" "zéro"))
                                            ;(if (member_string (item.feat token "nn.name") '("à" "-") ));
                                            ))))
        (format t "we leave the module tim sur |%s|\n" name)
       reponse))
(provide 'INST_LANG_token_qt_tim)