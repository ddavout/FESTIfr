; INST_LANG_token_qt_tim0

(defvar RU)
(defvar result)

; for french_downcase_string
(require 'INST_LANG_utils)

(define (tim0 token name)    
    ""
    (let (QT reponse)
        (format t "\t\t\t\t\t\tici module tim0 sur %s\n" name)
        (if 
           (and  ; volle Stunde  
                (string-matches name "[0-2]?[0-9]")
                (or (format t "QTtim0: ok1 |%s|" name ) t)
                (not (equal? (item.feat token 'split) 1))
                ; (not (member_string (item.feat token 'p.token_pos)
                ;      '("phonenumber" "Bankleitzahl" "Postfach" "Kontonummer")))
                (or (format t "QTtim0: ok2 |%s|" name ) t)
                ; entweder Schlüsselwort danach
                (or 
                    (and (member_string (french_downcase_string (item.feat token "n.name"))
                    '("heure" "heures" "h")) (or (format t "QTtim0: ok3 |%s|" n.name ) t))

                    ; oder Teil einer Zeitspanne QTtim
                    (and 
                        (member_string (item.feat token "n.name") '("à" "-"))
                        (or (format t "QTtim0: ok4 |%s|" n.name ) t)
                        (not (string-matches (item.feat token 'punc) "\\..*"))
                        (pattern-matches (item.feat token "nn.name")
                            "{[0-2]?[0-9]}{\\(.\\|:\\)?}{\\([0-5][0-9]\\)?}"))
                   ; make sure that this isn't just a cardinal matching above
                   ; condition
                   (not (string-matches (item.feat token "nn.name")
                          "[0-2]?[0-9][0-5][0-9]"))
                   ; info       
                   (and (format t "QTtim0: ok5 |%s|" nn.name ) nil)
                   
                   (or (> (parse-number #1) (parse-number name))
                       (and (equal? (parse-number #1) (parse-number name)) (> (parse-number #3) 0)))
                   (and 
                        (member_string (item.feat token "p.name") '("à" "-"))
                        (or (format t "QTtim0: ok5 |%s|" "à -" ) t)
                        (or (format t "QTtim0: ok6 |%l|" (item.feat token 'punc) ) t)
                        (not (string-matches (item.feat token 'punc  "\\..*")))
                        (or (format t "QTtim0: ok7 |%l|"  (item.feat token "pp.name") ) t)
                        (pattern-matches (item.feat token "pp.name") "{[0-2]?[0-9]}{\\(.\\|:\\)?}{\\([0-5][0-9]\\)?}")
                        (or (format t "QTtim0: ok8 |%l|"  #1 ) t)
                       ; make sure that this isn't just a cardinal matching above
                       ; condition
                       (not (string-matches (item.feat token "pp.name")  "[0-2]?[0-9][0-5][0-9]"))
                       (or (format t "QTtim0: ok9 condition match sur |%l|"  (item.feat token "pp.name") ) t)
                       (< (parse-number #1) (parse-number name)))))

                        (begin
                    (set! reponse t)    
                    (set! QT "QTtim0")
                    (set! RU (append RU (list name QT ";")))
                    (set! result
                        (list (french_parse_cardinal name)))
                    ))
        (format t "we leave the module tim0 sur |%s|\n" name)
       reponse))
(provide 'INST_LANG_token_qt_tim0)