; INST_LANG_token_qt_locution_part_1
(defvar RU)
(defvar result)
; dans INST_LANG_token_to_word fdnaw  est globale
; pas besoin dans locution_part_1 de refaire le calcul
; on connait name, et fdnaw est calculé "continuellement"
; for french_downcase_string
; for na, tab_lookup
(require 'INST_LANG_utils)

(defvar fdnaw)

; for list_locution_part_1
; pas convaincu pour en 
(defvar list_locution_part_1
   '( "en" "tout_à" "tout_à_l" "tout_d" "chef_d" "aujour_d"))

(set! locution_part_2_tab_default
  '(
    ("aujourd" . ("hui"))
    ("chef_d" . ("oeuvre"))
    ("tout_d" . ("abord"))
    ("tout_à" . ("fait" "coup" "chacun"))
    ("trop_d" . ())
    ("en_moins" . ("de" "d"))
    ; test nécessité enregistremnt poslex
    ; ("toute_d" . ("abord"))

    ))
(require 'INST_LANG_token_to_words_lists)
; todo CHGT nam1 NAME name2
(define (locution_part_1 token name)
  ""
  ; où fdnam vaut (french_downcase_string name)
  ; intervient token0=token, token1 et token2
  ; sont condamnés à disparaître name, n_name au tour suivant
  (let  (QT nam1 token1 nam2 token2 n_name n_n_name token1 token2 reponse)
    ; |tout|
    ;(format t "\t\t\t\t\t\tici module locution_part_1 sur %s\n" name)
    (if 
      (and
        ;**
        ; inutile (not (null? (item.next token))) car item.next returns nil if there is no next item
        ; and (set! token nil) returns nil
        ;** 
        (set! token1 (item.next token))
        ; |à|
        (set! n_name (na token1))
        ; au pire nil & out, mais /!\ il pourrait rester un _ final, si on n'est pas jeté : TODO vérif
        (or (format t "locution QTlocution_part_1: ok1 n_name |%s| \n" n_name) t)
        
        ; aucun ponctuation ou preponctuation  entre tout et à
        ;**
        ; NON ! (null? (item.feat token 'punc))
        (equal? (item.feat token 'punc) 0)
        (or (format t "locution QTlocution_part_1: ok2\n") t)
        (string-equal (item.feat token 'n.prepunctuation) "")
        (or (format t "locution QTlocution_part_1: ok22\n") t)
        ;**
        ; |tout_à|
        (set! nam1 (string-append name "_" n_name))

        (or (format t "locution QTlocution_part_1: ok3 nam1 |%s| \n" nam1) t)

        ;***
        (member_string (french_downcase_string nam1) list_locution_part_1)
        ;***

        (or (format t "\t\t\t\t\t\tici module locution_part_1: on répond sur |%s|\n" name) t))

        (begin
          (format t "réponse pour QTlocution_part_1\n")
          (set! reponse t); on passera à |à|
          (set! QT "QTlocution_part_1")
          (set! RU (append RU (list name QT ";")))
          ; action
        
          ; /tout à coup/ versus /tout à son/ 
          (format t "tab_lookup nam1 locution_part_2_tab %l\n" (tab_lookup nam1 locution_part_2_tab) )
          (if 
            (and 
                ; nil or |fait|
                (set! token2 (item.next token1))
                (or (format t "locution QTlocution_part_1: ok3\n") t)

                ; |fait|
                (set! n_n_name (na token2)) 
                (or (format t "locution QTlocution_part_1: ok11 n_n_name |%s| \n" n_n_name) t)
                ; **
                (member_string n_n_name (tab_lookup nam1 locution_part_2_tab))
                (equal? (item.feat token 'punc) 0)
                (or (format t "locution QTlocution_part_1: pas de punc ok4\n") t)
                (string-equal (item.feat token 'n.n.prepunctuation) "")
                (or (format t "locution QTlocution_part_1: pas de prepunc ok5 3e larron\n") t)
                   )
              (begin 
                ; |tout_à_fait|; 
                (set! nam2 (string-append nam1 "_" n_n_name))
                ;** marquage pour suppression 
                (item.set_feat token 'delete  "next"); ce sera le tour de fait
                (item.set_feat token1 'delete  "next")
                ;** transfert d'une preponctuation éventuelle du premier vers le dernier
                ; mais pour faire un transfert, il faut d'abord une copie
                ; ce sera à QTdelp de supprimer les traces de ponctuation et preponctuation
                ; pour finaliser le transfert...
                ; \"tout
                (item.set_feat token2 'prepunctuation (item.feat token 'prepunctuation ))
                ; fait\"
                (item.set_feat token2 'punc (item.feat token 'n.n.punc ))
                (item.set_name token2 nam2 )
                ; (set! result (list "raté")) )
                (set! result))
              (begin
                ; pas de 3e larron
                ; transfert d'une ponctuation éventuelle du dernier vers le premier
                (item.set_feat token1 'prepunctuation (item.feat token 'prepunctuation ))
                (item.set_feat token1 'punc (item.feat token 'n.punc ))
                (format t "pas de part2 après %s\n" nam1)
                (item.set_name token1 nam1 )

               ; marquage pour suppression au tour suivant
                (item.set_feat token 'delete  "next")))

         ;(set! result (list "raté"))
         (set! result)))
    (format t "we leave the module locution_part_1 sur |%s|\n" name)
    reponse))


(provide 'INST_LANG_token_qt_locution_part_1)