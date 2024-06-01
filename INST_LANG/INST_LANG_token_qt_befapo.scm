; INST_LANG_token_qt_befapo

(defvar RU)
(defvar result)

; for list_before_apo_VER list_before_apo_*
(require 'INST_LANG_token_to_words_tools)

; for na, french_downcase_string
(require 'INST_LANG_utils)

(defvar fdnaw)
; LITTRE L'e final de quelque ne s'élide que devant un, une : quelqu'un, quelqu'une, hmm
; populaire; quelque espoir nécessitera posTlex (le pos n'est pas à changer)
; }{(0 k  eh  l )(0 k  ae )}{(0 eh  s )(0 p  w  a  rh )} -> }{(0 k  eh  l )(0 k  eh  s )(0 p  w  a  rh )}

; LITTRE L'e de quoique ne s'élide que lorsqu'il est suivi de il, ils, elle, elles, on, un, une. 
; Mais on écrit sans apostrophe : Quoique amis, ils ne se voient pas souvent. -> posTlex
; conjonction adversative
(set! list_before_apo_div (list "l" "d"  "qu" "presqu"))
; pas d Segmentation default
; "trop_d" géré par QTlocution_part_1
(set! list_before_apo_ART_ind (list "assez_d" "quelqu" "peu_d")) ; def ou ind
; pas l Segmentation fault l'important
(set! list_before_apo_ART_def) ; def ou ind
(set! list_before_apo_ART (append list_before_apo_ART_ind list_before_apo_ART_def))
(define (befapo token name)
    (let (pos_sur QT reponse)
        ; pour n'importe on cherche à atteindre |n| 
       (format t "\t\t\t\t\t\tici module befapo sur |%s|\n" fdnaw)
       (if (member_string fdnaw list_before_apo_VER )
                (set! pos_sur "VER")
                (begin 
                  (if (member_string fdnaw list_before_apo_CON )
                    (begin 
                      (set! pos_sur "CON"))
                    (begin
                        (if (member_string fdnaw list_before_apo_PRE )
                          (begin
                            (set! pos_sur "PRE"))
                          (begin 
                            (if (and (member_string fdnaw list_before_apo_ART_def ) t)
                              (begin
                                (set! token1 (item.next token))
                                (if (not (null? token1))
                                  (begin 
                                    (set! token2 (item.next token1))
                                    (if (member_string (item.name token2) (list "serait" "est" "c" "s" "sera" "était" "aurait" "aura" "peut" "pourrait" "pourra"))
                                      (item.set_feat token2 'pos "NOM")))))))



                                
                              (begin
                                (if (member_string fdnaw list_before_apo_ART_ind )
                                  (set! pos_sur "ART_ind"))))))))
             
       (if   
         (and
          (or (format t "ici module befapo: on vérifie point1\n") t)
          (not (null? (item.next token)))
          (or (format t "ici module befapo: on vérifie point2\n") t)
          ; c'est le suivant qui porte le whitespace
          ; TODO peut-on donner un sens plusieurs whitespace characters commençant par un apostrophe ? tempo : non
          (or (format t "ici module befapo: on vérifie point2 %l\n" (item.feat token 'n.whitespace) ) t)
          (string-equal (string-car (item.feat token 'n.whitespace)) "\'")
          (or (format t "\t\t\t\t\t\tici module befapo: on vérifie point3\n") t)
          

          ; (equal? (item.feat token 'punc) 0); on ne sait jamais... hmm on pardonne
          (or (format t "\t\t\t\t\t\tici module befapo: on répond avec pos_sur %l pour |%s|\n" pos_sur name) t))
          
          
          
          (begin 
            (format t "réponse pour QTbefapo\n")
            (set! reponse t)
            (set! QT "QTbefapo")
            (set! RU (append RU (list name QT ";")))
            ; action
            (set! n_name (na (item.next token))); n'|oublie|
            (format t "QTbefapo n_name %s\n" n_name)
            (set! name1 (string-append name "_" n_name))

            (item.set_name (item.next token) name1)
            ; si on n'est pas sûr, on se fie à poslex
            (if pos_sur (item.set_feat (item.next token) 'pos pos_sur))
            (format t "QTbefapo pos_sur %s\n" pos_sur)
            (item.set_feat (item.next token) 'whitespace "")

            ; on passe le relais ... au suivant, avant d're "delete", le suivant passera le relais !
            ; pas d'echo ...
            ; ce si on une règle de nettoyage..
            ; marquage pour suppression ***au tour suivant***.
            (item.set_feat token 'delete  "next")
            ;(set! result (list "raté" "apo"))
            (set! result)

            ))

       (format t "we leave the module befapo sur |%s|\n" name)
       reponse))

(provide 'INST_LANG_token_qt_befapo)

