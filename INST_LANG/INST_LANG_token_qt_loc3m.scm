; INST_LANG_token_qt_loc3m
(defvar RU)
(defvar result)
; dans INST_LANG_token_to_word fdnaw  est globale
; pas besoin dans locution_part_1 de refaire le calcul
; on connait name, et fdnaw est calculé "continuellement"
; for french_downcase_string
; for na, tab_lookup
(require 'INST_LANG_utils)

(define (loc3m token name)
  ""
  ; où fdnam vaut (french_downcase_string name)
  ; intervient token0=token, token1 et token2
  ; sont condamnés à disparaître name, n_name au tour suivant
  (let  (QT nam2 token1 nam2 token2 n_name n_n_name token1 token2 reponse)
    ; |tout|
    ;(format t "\t\t\t\t\t\tici module loc3m sur %s\n" name)
    (if 
      (and
        ;**
        ; inutile (not (null? (item.next token))) car item.next returns nil if there is no next item
        ; and (set! token nil) returns nil
        ;** 
        (set! token1 (item.next token))
        (set! token2 (item.next token1))
        (set! n_name (na (item.next token)))

        (set! n_n_name (na (item.next (item.next token))))
        ; pas de preponctuation et ponctuation génantes sur le chemin
        (equal? (item.feat token 'punc) 0)
        (string-equal (item.feat token 'n.prepunctuation) "")
        (equal? (item.feat token1 'punc) 0)
        (string-equal (item.feat token 'n.n.prepunctuation) "")

        (set! nam2 (string-append name "_" n_name "_" n_n_name))

        ;***
        (member_string (french_downcase_string nam2) french_multiple_word_expressions2)
        ;***
        (or (format t "\t\t\t\t\t\tici module locution3m: on répond sur |%s|\n" name) t))

          (begin
            (format t "réponse pour QTlocution3\n")
            (set! reponse t); on passera à ...
            (set! QT "QTlocution2m")
            (set! RU (append RU (list name QT ";")))
            ; action

                ;
                (item.set_feat token 'punc (item.feat (item.next (item.next token)) 'punc ) ); transfert de ponctuation du dernier vers le premier
                (item.set_feat token 'delete  "next"); marquage pour suppression du suivant: on y cherchera p.delete
                (item.set_feat token1 'delete  "next")
                
                (item.set_name token2 nam2 )
                )
          (set! result))

    (format t "we leave the module loc3m sur |%s|\n" name)
    reponse))


(provide 'INST_LANG_token_qt_loc3m)