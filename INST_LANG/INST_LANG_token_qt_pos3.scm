; INST_LANG_token_qt_pos3

(defvar RU)
(defvar result)

; for french_downcase_string
(require 'INST_LANG_utils)

(defvar list_qt_pos3_pre (list "sans"))
(defvar list_qt_pos3_pre_homo_NOM (list "ferment" "couvent"))

(define (pos3 token name)
" "
    (let 
        ((fdnaw (french_downcase_string name)) QT reponse)
        (format t "\t\t\t\t\t\tici module pos3 sur |%s|\n" name)
        (if 
          (and
            ; |sans| ferment
            (not (null? (item.next token)))
            (set! token1 (item.next token))
            (or (format t "QTpos3: ok1: name %s\n" name) t)
            ;*
;            (member_string (french_downcase_string name) list_qt_pos3_pre)

            ; aucun ponctuation ou preponctuation  entre sans et forment
            ;**
            (equal? (item.feat token 'punc) 0)
            (string-equal (item.feat token 'n.prepunctuation) "")

            (or (format t "locution list_qt_pos3: ok2\n") t)
            ;***
            (set! n_name (na token1))
            (member_string (french_downcase_string n_name) list_qt_pos3_pre_homo_NOM)
            ;***            
            (or (format t "locution list_qt_pos3: ok3\n") t)
            (or (format t "\t\t\t\t\t\tici module pos3: on répond |%s|\n" name) t))

            
                (begin
                  (format t "réponse pour QTpos3\n")

                  (set! reponse t)
                  (set! QT "QTpos3")
                  (set! RU (append RU (list name QT ";")))
                  ; action
                  ; influence le next
                  (item.set_feat token1  'pos "NOM")
                  (set! result (list name))                    
                  ))

            (format t "we leave the module pos3\n")
           reponse))

(provide 'INST_LANG_token_qt_pos3)
