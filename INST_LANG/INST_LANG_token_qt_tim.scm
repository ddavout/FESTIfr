; INST_LANG_token_qt_tim

(defvar RU)
(defvar result)

; for french_downcase_string
(require 'INST_LANG_utils)

; for fre_unit_time_name_default
(require 'INST_LANG_token_to_words_lists )

; tempo develop
; (defvar fre_unit_time_name fre_unit_time_name_default)
; (set! fre_unit_time_full_name
; (set! fre_unit_time_abbr_name
(set! fre_unit_time_name
    (list "h" "heure" "heures" "min" "minute" "minutes" "s" "seconde" "secondes"))

(defvar fdnaw)
; Uhrzeit und Zeitangaben
(defvar QTtim_pattern "{[0-2]?[0-9]}{\\.\\|:}{[0-5][0-9]}")

(define (tim token name)
    "lecture de l'heure 23h 34min 52s ou durée"
    (let  (n_name units reponse)
        (format t "\t\t\t\t\t\tici module tim sur %s\n" name)
        (if 
            (and
                (pattern-matches name QTtim_pattern)
                (or (format t "QTtim: ok1: name %s\n" name) t)
                (or (set! h1 #1) t)
                (or (set! h2 #2) t)
                (or (set! h3 #3) t)
                ; info h1 |21| h2 |:| h3 |20|
                (or (format t "QTtim: ok2 h1 |%s| h2 |%s| h3 |%s|\n" h1 h2 h3) t)
                ;
                (or (set! token1 (item.next token)) t)
                ; ex à
                (or (format t "pour n.name %l\n" (item.feat token 'n.name)) t )
                (or (set! n_name (french_downcase_string (na token1))) t)
                ; info
                (or (format t "QTtim: ok3 |%s|" n_name ) t)
                ;
                (or (set! units (french_downcase_string n_name)) t)
                (if t
                    ; ims_german_token_words
                    ; (or (member_string (item.feat token "n.name")
                    ;       '("Uhr" "h" "MESZ" "MEZ" "min" "Min" "Minute" "Minuten" "Sekunde" "Sekunden" "s"))
                    ;       ; oder Teil einer Zeitspanne
                    ;       (and (member_string (item.feat token "n.name") '("bis" "-"))
                    ;            (string-matches (item.feat token "nn.name")
                    ;              "[0-2]?[0-9]\\(.\\|:\\)[0-5][0-9]"))
                    ;       (and (member_string (item.feat token "p.name") '("bis" "-"))
                    ;            (string-matches (item.feat token "pp.name")
                    ;              "[0-2]?[0-9]\\(.\\|:\\)[0-5][0-9]")))
                    t)
                (or   units
                      ; oder Teil einer Zeitspanne
                      (and (member_string n_name '("à" "-"))
                           (string-matches (item.feat token "nn.name")
                             "[0-2]?[0-9]\\(.\\|:\\)[0-5][0-9]"))
                      (and (member_string (item.feat token "p.name") '("à" "-"))
                           (string-matches (item.feat token "pp.name")
                             "[0-2]?[0-9]\\(.\\|:\\)[0-5][0-9]"))))
                (begin
                    (set! reponse t)    
                    (set! QT "QTtim")
                    (ru token name)
                    (item.set_feat token "token_pos" "time")
                    (if (member_string n_name fre_unit_time_name)
                            (item.set_feat token "delete" "next"))  ; AS don't say Uhr again

                    (set! result
                                (append
                                    ; heure minute seconde féminin
                                    (INST_LANG_number h1 1)
                                    (if (member_string n_name (list "heure" "heures" "h")) (list  "heure"))
                                    (if (member_string n_name (list "minute" "minutes" "min")) (list "minute"))
                                    (if (member_string n_name (list "seconde" "secondes" "s")) (list "seconde"))
                                    (if (not (equal? h3 "00"))
                                        (french_parse_cardinal h3))))
                    ))
        (format t "we leave the module tim sur |%s|\n" name)
       reponse))
(provide 'INST_LANG_token_qt_tim)