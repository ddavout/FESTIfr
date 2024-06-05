; INST_LANG_token_qt_tim1

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
; correspond à  12.30Uhr 12:30h ...
; mais mon pattermatch a des pbs avec | 
(defvar QTtim1_pattern "{[0-2]?[0-9]}{\\.}{:}{[0-6][0-9]}{h\\|H}")

(define (tim1 token name)
    "lecture de l'heure 23:54h, deux chiffres pour les minutes"
    (let  (QT reponse)
        (format t "\t\t\t\t\t\tici module tim1 sur %s\n" name)
        (if 
            (and
                (pattern-matches name QTtim1_pattern)

                (or (format t "QTtim1: ok1: name %s\n" name) t)
                (set! h1 #1)
                (set! h2 #2)
                (set! h3 #3)
                (or (string-equal h2 ".") (string-equal h3 ":"))
                (set! h4 #4)

                (or (format t "QTtim1: ok2 h1 %s h2 %s h3 %s h4 %s\n" h1 h2 h3 h4) t)
                ; voir QTtim1
                (not (string-equal h4 ""))

                ; essai alternatif CORRECT !
                ; ok (pattern-matches name "{[0-2]?[0-9]}{\\(.\\|:\\)?}{:}{[0-6][0-9]}{h\\|H}")
                (pattern-matches name "{[0-2]?[0-9]}{\\(.\\|:\\)}{[0-6][0-9]}{h\\|H}")
                (or (format t "okkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk\t") t )
                (set! hh1 #1)
                (set! hh2 #2)
                (set! hh3 #3)
                (set! hh4 #4)
                
                (or (format t "QTtim1: ok2 hh1 %s hh2 %s hh3 %s hh4 %s\n" hh1 hh2 hh3 hh4) t)

                )


;                         ici module tim sur 20:30
; QTtim: ok1: name 20:30
; QTtim: ok2 h1 20 h2 : h3 30
; QTtim units |h|
; INST_LANG_number_from_digits ("2" "0")
; INST_LANG_number_from_digits ("3" "0")



                    (begin
                        (set! reponse t)    
                        (set! QT "QTtim")
                        (set! RU (append RU (list name QT ";")))
                         ; AS don't say Uhr again
                        (item.set_feat token "delete" "next")

                        (set! result
                                    (append
                                        (INST_LANG_number_point h1 1) 
                                        (list "heure")
                                        (if (not (equal? h4 "00")) (INST_LANG_number_point h4 1)'("zéro" "zéro"))
                                        
                                            ;(if (member_string (item.feat token "nn.name") '("à" "-") ));
                                            ))
                        ))
        (format t "we leave the module tim1 sur |%s|\n" name)
       reponse))
(provide 'INST_LANG_token_qt_tim1)