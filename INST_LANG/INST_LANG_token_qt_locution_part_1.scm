; list_locution_part_1
(defvar RU)
(defvar result)
; dans INST_LANG_token_to_word fdnaw  est globale
; pas besoin dans locution_part_1 de refaire le calcul
; on connait name, et fdnaw est calculé "continuellement"
; for french_downcase_string
; for tab_lookup
(require 'INST_LANG_utils)

(defvar fdnaw)

; for list_locution_part_1
(require 'INST_LANG_token_to_words_lists)
; todo CHGT nam1 NAME name2
(define (locution_part_1 token name)
    ; où fdnam vaut (french_downcase_string name)   
    ; intervient token0=token, token1 et token2  
    ; sont condamnés à disparaître name, n_name au tour suivant
    (let  (QT nam1 token1 nam2 token2 n_name n_n_name token1 token2 reponse)
    ; |tout|  
    (format t "ici module locution_part_1 %s\n" name)
        (if 
          (and 
            (set! token1 (item.next token) )
            (not (null? (item.next token)))
            ; |à|
            (set! n_name (na token1))
            ; au pire nil & out, mais /!\ il pourrait rester un _ final, si on n'est pas jeté : TODO vérif
            (or (format t "locution QTlocution_part_1: ok1 n_name |%s| \n" n_name) t)
            (set! token2 (item.next token1))
            ; |fait|
            (set! n_n_name (na token2)) 
            (or (format t "locution QTlocution_part_1: ok11 n_n_name |%s| \n" n_n_name) t)
            ; |tout à|
            (set! nam1 (string-append name "_" n_name))
            ; |tout_à_fait|; 
            (set! nam2 (string-append nam1 "_" n_n_name))
            (or (format t "locution QTlocution_part_1: ok2 nam1 |%s| \n" nam1) t)
            (member_string (french_downcase_string nam1) list_locution_part_1)
            (or (format t "\t\t\t\t\t\tici module locution_part_1: on répond\n") t))
          (begin
            (format t "réponse pour QTlocution_part_1\n")
            (set! reponse t); on passera à |à|
            (set! QT "QTlocution_part_1")            
            (set! RU (append RU (list name QT ";")))
            ; action
            ; /tout à coup/ versus /tout à son/ 
            (format t "tab_lookup nam1 locution_part_2_tab %l" (tab_lookup nam1 locution_part_2_tab) )
            ;(if (member_string (french_downcase_string nam2) french_multiple_word_expressions2 )
            (if (member_string n_n_name (tab_lookup nam1 locution_part_2_tab))
                (begin 
                  ; transfert d'une pre TODO ponctuation éventuelle du dernier vers le premier
                  ; ex tout à fait !
                  ;; TODO (item.set_feat token 'punc (item.feat token2 'punc ) )
                  ; marquage pour suppression 
                  (item.set_feat token 'delete  "next"); ce sera le tour de fait
                  (item.set_feat token1 'delete  "next")

                  ;; (item.set_feat (item.next (item.next token)) 'punc (item.feat token 'punc ) )
                  (item.set_name token2 nam2 )
                  ;(set! result (list "raté")) )
                  (set! result))

                (begin
                  ; transfert d'une ponctuation éventuelle du dernier vers le premier
                  ;(item.set_feat token1 'punc (item.feat token 'punc ) )
                  (format t "pas de part2 après %s" nam1)
                  (item.set_name token1 nam1 )

                  ; marquage pour suppression au tour suivant
                  (item.set_feat token 'delete  "next")))

           ;(set! result (list "raté"))
           (set! result)))
     (format t "we leave the module locution_part_1\n")
            
    reponse))    
    (provide 'INST_LANG_token_qt_locution_part_1)