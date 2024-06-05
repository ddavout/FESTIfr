; INST_LANG_token_qt_pos2_debug

(defvar RU)
(defvar result)

; for french_downcase_string
(require 'INST_LANG_utils)
; for pattern-matches
(require 'INST_LANG_patternmatch)
(set! QTpos2_debug_pattern "{[^-]+}-{.*}")
(defvar h1)
(defvar h2)
 ;"ne commence pas par un tiret mais en contient 1")

(define (pos2_debug token name)
" "
    (let ( (fdnaw (french_downcase_string name)) reponse)
    (format t "\t\t\t\t\t\tici module pos2_debug sur |%s|\n" name)
        (if 
            (and 
                ;**
                (pattern-matches fdnaw QTpos2_debug_pattern)
                (or (format t "match ??? %s\n" fdnaw) t)
                (or ( format t "QTpos2 h1 4 _%s_, h2 _%s_\n" h1 h2) t))
        (begin 
            (format t "Où est le problème                                           ???\n")))
            (format t "we leave the module pos2_debug\n")
           reponse))

(provide 'INST_LANG_token_qt_pos2_debug)        


    