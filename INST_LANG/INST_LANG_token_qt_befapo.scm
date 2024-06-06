; INST_LANG_token_qt_befapo

(defvar RU)
; global
(defvar QT)
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
    (let (pos_sur reponse)
        ; pour n'importe on cherche à atteindre |n| 
       (format t "\t\t\t\t\t\tici module befapo sur |%s|\n" fdnaw)
       (set! QT "QTbefapo")
       (if (not (null? (item.next token)))
           (begin  
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
                                  (if (member_string fdnaw list_before_apo_ART_def )
                                    (begin
                                      (set! pos_sur "ART:def"))
                                    (begin
                                      (set! pos_sur (item.feat token "token_pos")))
                                    ))))))))
           (begin 
            (set! pos_sur "")))

       (format t "ou-suis-je %s\n" pos_sur)
           
       (if 
          (and 
            (not (string-equal pos_sur "")) 
            (not (string-equal pos_sur "0"))

            (or (format t "ici module befapo: on vérifie point1\n") t)
            (or (format t "ici module befapo: on regarde le point2\n") t)
            ; c'est le suivant qui porte le whitespace
            ; TODO peut-on donner un sens plusieurs whitespace characters commençant par un apostrophe ? tempo : non
            (or (format t "ici module befapo: on vérifie point2 %l\n" (item.feat token 'n.whitespace) ) t)
            ; n ' y refusé y a un whitespace de "' "
            (string-equal (string-last (item.feat token 'whitespace)) "")
            (or (format t "\t\t\t\t\t\tici module befapo: on vérifie point3\n") t)
          
            (or (format t "\t\t\t\t\t\tici module befapo: on répond avec pos_sur |%s| pour |%s|\n" pos_sur name) t))
      
        
              (begin 
                (format t "réponse pour QTbefapo\n")
                (set! reponse t)
                (ru token name)
                ; action
                (if (not (item.set_feat token 'token_pos "done"))
                  (begin
                      (item.set_feat token 'pos pos_sur)
                      (item.set_feat token 'token_pos "done")
                      (set! result (INST_LANG_token_to_words token name)))
                  (set! result (list name)))

                )

              (begin
                (set! reponse nil)
                (set! result (list "miss"))))

          

       (format t "we leave the module befapo sur |%s|\n" name)
       reponse))

(provide 'INST_LANG_token_qt_befapo)

