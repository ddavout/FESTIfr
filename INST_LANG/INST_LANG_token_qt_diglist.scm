; INST_LANG_token_qt_diglist

(defvar RU)
(defvar result)

; for ..
(require 'INST_LANG_utils)
; for is_quantifiable_fem
(require 'INST_LANG_token_to_words_lists)

(require 'INST_LANG_numbers)

; for french_parse_charlist, french_parse_cardinal
(require 'INST_LANG_token_to_words_tools)
(defvar fdnaw)
(defvar QTdiglist_pattern "{[0]+}{[1-9][0-9]*}")

(define (diglist token name)
    "pour lire une liste de chiffres"
    (let  (QT reponse)
        (format t "\t\t\t\t\t\tici module diglist sur %s\n" name)
        (if 
            (pattern-matches name QTdiglist_pattern)
                (begin 
                    (set! reponse t)
                    (set! QT "QTdiglist" )
                    (set! RU (append RU (list name QT ";")))
                    (set! h1 #1)(set! h2 #2); ex 00 56; ex 3
                    ;(not (equal? (item.feat token 'punc) ",")) ; hyp
                    ;  h1 |00| h2 |56| ?; ex h1 "" h2 "3" ou  h1 || h2 |61| ? 61 années
                    (format t "QTdiglist !!! \t  h1 |%s| h2 |%s| ?\n" h1 h2)
                    (set! n_n_name  (item.feat token 'n.n.name))
                    (format t "QTdiglist !! n_n_name %l\n" n_n_name)

                    ;;(format t "QTdiglist !! charlist %l\n" (french_parse_charlist h1 0))
                    (item.set_feat token "token_pos" "cardinal")
                    (set! fem 0)
                    (if (is_quantifiable_fem (symbol->string n_n_name)) (set! fem 1))
                    (format t "locution QTdiglist: ok1\n")
                    ; leading zeros
                    (if (string-equal h1 "")
                            (set! result 
                                 (INST_LANG_number h2 fem))
                            (set! result
                                 (append (french_parse_charlist h1 0)
                                  (INST_LANG_number h2 fem)  
                                  (if (string-equal (item.feat token 'punc) ",") (list "virgule"))
                                  ))
                    )))


        (format t "result: %l\n" result)
        (format t "we leave the module diglist sur |%s|\n" name)
       reponse))
(provide 'INST_LANG_token_qt_diglist)        