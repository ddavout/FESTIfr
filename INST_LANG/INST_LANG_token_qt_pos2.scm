; INST_LANG_token_qt_pos

(defvar RU)
(defvar result)

; for french_downcase_string
(require 'INST_LANG_utils)
; for pattern-matches
(require 'INST_LANG_patternmatch)
(set! QTpos2_pattern "{[^-]+}-{.*}")
; (defvar h1)
; (defvar h2)
 ;"ne commence pas par un tiret mais en contient 1")

(define (pos2 token name)
" "
    (let ( (fdnaw (french_downcase_string name)) QT reponse)
    ;(format t "\t\t\t\t\t\tici module pos2 sur |%s|\n" name)
        (if 
            (and 
                ;**
                (or (format t "match ???\n") t)
                (pattern-matches fdnaw QTpos2_pattern)
                ;(pattern-matches "Donnez-en" QTpos2_pattern )
                (or (format t "match") t)
                (and (set! h1 #1)(set! h2 #2))
                (not (equal? h1 ""))
                ;**/
                
                ;  h1 3 _donnez_, h2 _en_
                (or ( format t "QTpos2 h1 3 _%s_, h2 _%s_\n" h1 h2) t)
                ;**
                (member_string h2 list_after_tiret)
                ;**/
                (or ( format t "QTpos2 h1 4 _%s_, h2 _%s_\n" h1 h2) t)
                ; nil
                (or (format t "\t\t\t\t\t\tici module pos2: on répond sur |%s|\n" name) t))


            (begin 
                (set! QT "QTpos2" )
                (set! RU (append RU (list name QT ";")))
                (set! suf1-1 (string-last h1)) 
                ; (item.set_feat (item.next token) 'token_pos "PRO:per")
                ;;  (format t "liste %l \n" (item.relation.leafs token 'Token)); (#<item 0x55c329c93bc0>) 
                ;; (item.first_leaf ITEM)   Returns he left most leaf in the tree dominated by ITEM. ..
                ;; (format t "leaf %s"  (na (item.first_leaf token))); n_est-ce
                ;; (format t "liste %l" (item.relations token)); Token
                (item.set_feat token "token_pos" "QTpos2")
                ; ex: vous-y reviendrez /  h1 3 _Donnez_, h2 _en_,  elles-même
                (if (and (member_string suf1-1 (list "t" "s" "z"))
                         (member_string (string-car h2 ) (list "e" "i" "o" "y")))
                      (begin 
                        (set! liste (append (INST_LANG_token_to_words token h1) 
                                             (INST_LANG_token_to_words token (if (string-equal suf1-1 "t")(string-append "t_" h2 )(string-append "z_" h2 )))))
                        (format t "liste %l" liste)
                        (set! result liste))
                      (begin ; ex ; ex h1_n_est_, h2 _ce_
                        (set! result 
                            (append (INST_LANG_token_to_words token h1)
                                (INST_LANG_token_to_words token h2) ))))))
 


            (format t "we leave the module pos2 sur |%s|\n" name)
           reponse))

(provide 'INST_LANG_token_qt_pos2)
