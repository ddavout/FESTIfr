; INST_LANG_token_qt_normal
(defvar verbose_INST_LANG_token_to_word)

(defvar RU)
(defvar QT)
(defvar result)

; for list_before_apo_VER list_before_apo_div
(require 'INST_LANG_token_to_words_lists)

; for na, french_downcase_string
(require 'INST_LANG_utils)
; for is_normal
(require 'INST_LANG_token)
(define (normal token name)
  ;(format t "\t\t\t\t\t\tici module normal sur %s\n" name)
  (let ( (fdnaw (french_downcase_string name)) reponse)
    (set! reponse nil); (to be clear ! hidden in the let ... par défaut nil
    (format t "ici module normal\n")
    (if (is_normal fdnaw)
      (begin
        (format t "réponse pour QTnormal\n")
        (set! reponse t)
        (set! QT "QTnormal")
        ;(set! RU (append RU (list name QT ";")))
        (ru token name)

       ; action
       (cond 

        (t 
          (set! result (list name))
          (or (format t "\t\t\t\t\t\ici module normal: on répond sur |%s|\n" name) t)
          ) ; hmm

          )
      ))

     (format t "we leave the module normal sur |%s|\n" name)
            
    reponse))

(provide 'INST_LANG_token_qt_normal)
; (if nil 
;           ((and (> tokendebuglevel -1)(format t "QTnormal?\t normal ?: |%s|\n" name)  nil) nil); condition jamais remplie 
;                  (set! ponct (item.feat token 'punc ))
;                  (if (not (null?  (item.prev token)))
;                       (if verbose_INST_LANG_token_to_word (format t "prev %s\n" (item.feat (item.prev token) 'name))))
;               ;    (cond 
;               ;       ; pour régler le pb de où va-t'on qui donne actuellement va_t on et non va_t_on chef d'ilôt
;               ;           ((and
;               ;               QTchefd
;               ;               (string-equal (item.feat token 'n.whitespace) "'"))
;               ;                   (set! QT "QTchefd")
;               ;                   (set! RU (append RU (list QT )))
;               ;                   (set! name1 (string-append (string-replace name "-" special_slice_char) "_" n_name)); chef-d passe à chef_
;               ;                   (item.set_feat token 'delete  "next"); sinon au final va_t_il il 
;               ;                   (set! result (list name1)))
;               ;           ((and ; ex de petite \( mais ancienne\) noblesse"
;               ;                QTparentho1
;               ;                ;(string-equal (item.feat token 'prepunctuation) "("))
;               ;                (set! preponc (item.feat token 'prepunctuation))
;               ;                (or (format t "ok\n") t)
;               ;                (member_string preponc (list "(" "\\\"" "|" )))
;               ;                    (set! QT "QTparentho1")
;               ;                    (set! RU (append RU (list QT )))
;               ;                    (set! ponc (item.feat token 'punc) )
;               ;                    (if (string-equal preponc "(" )
;               ;                        (if (string-equal ponc ")")
;               ;                            (set! result (append (fre_abbr_lookup "(" fre_symbols_tab_default  ) (list name ) (fre_abbr_lookup ")" fre_symbols_tab_default )))
;               ;                            (set! result (append (fre_abbr_lookup "(" fre_symbols_tab_default  ) (list name ))))
;               ;                        (if (string-equal preponc "[" )
;               ;                            (if (string-equal ponc "]")
;               ;                                (set! result (append (fre_abbr_lookup "[" fre_symbols_tab_default  ) (list name ) (fre_abbr_lookup "]" fre_symbols_tab_default )))
;               ;                                (set! result (append (fre_abbr_lookup "[" fre_symbols_tab_default  ) (list name ))))
;               ;                            (if (string-equal preponc "\\\"" )
;               ;                                (if (string-equal ponc "\\\"")
;               ;                                    (set! result (append (fre_abbr_lookup "\\\"" fre_symbols_tab_default  ) (list name ) (fre_abbr_lookup "\\\"" fre_symbols_tab_default )))
;               ;                                    (set! result (append (fre_abbr_lookup "\\\"" fre_symbols_tab_default  ) (list name )))))
                                             
;               ;                                ))
;               ;                    )
;               ;               ((and (> tokendebuglevel -1)(format t "QTparenthf1?\t normal ?: |%s| %s\n" name (item.feat token 'punc))  nil) nil);     
;               ;               ((and ; ex de petite \( mais ancienne\) noblesse"
;               ;                    QTparenthf1
;               ;                    (string-equal (item.feat token 'punc) ")")); |ancienne| porteur de la ponctuation punc ")" 
;               ;                        (set! QT "QTparenthf1")
;               ;                        (set! RU (append RU (list QT )))
;               ;                        (set! result (append (list name) (fre_abbr_lookup ")" fre_symbols_tab_default  ) ))
;               ;                    )
                         
                           

                        
;               ;               (t  
;                         ;         (set! QT "QTnormal_T" )
;                         ;         (set! RU (append RU (list QT )))                
;                         ;         (tokendebug -1 (format nil "ok5 normal no punc point %s\n" name))
;                         ;         ; récalcitrant
;                         ;         (format t "ici %l\n" (string-after name "_"))
;                         ;         (if (string-equal (string-last (string-after name "_") "m"))
;                         ;             (begin 

;                         ;                 (item.set_feat token 'pos "VER")))

;                         ;         ; (if (and ; aigrefeuille-d'aunis
;                         ;         ;          nil
;                         ;         ;          (pattern-matches name "{[^-]+}-{d}")
;                         ;         ;          (set! nt (item.next token)) ; not nil
;                         ;         ;          ;(member_string (item.feat token 'n.pos) (list "NOM"))
;                         ;         ;          ;(or (format t "3333 |%s|"(item.feat nt 'whitespace)) t)
;                         ;         ;          (equal? (item.feat nt 'whitespace) "'"))
;                         ;         ;     (begin 
;                         ;         ;       (set! name (string-append name "_" (na nt)))
;                         ;         ;       (item.set_feat nt "name" "")
;                         ;         ;       ))
;                         ;         (set! result (list (string-replace name "-" special_slice_char)))) ; hmm
;                         ; ); end conv
;               ;   )    ; 20/04
; )