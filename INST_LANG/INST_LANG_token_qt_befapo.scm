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
(set! list_before_apo_PRO_per (list "s" "t" "m")) 
(set! list_before_apo_ART (append list_before_apo_ART_ind list_before_apo_ART_def))

(define (befapo token name)
    (let (pos_sur reponse)
        ; pour n'importe on cherche à atteindre |n| 
       (format t "\t\t\t\t\t\tici module befapo sur |%s|\n" fdnaw)
       (set! QT "QTbefapo")

(format t "whitespace |%s|\n" (item.feat token '.whitespace))
(format t "n.whitespace |%s|\n" (item.feat token 'n.whitespace))

       ; un suivant, avec un apostrophe juste devant : on recale n dans |n 'y|
       (if (and (not (null? (item.next token))) 
                (string-equal (item.feat token 'n.whitespace) "'"))
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
                                      ; (begin
                                      ;   (set! pos_sur (item.feat token "token_pos")))
                                      (begin
                                        (if (member_string fdnaw list_before_apo_PRO_per )
                                          (begin
                                             (set! pos_sur "PRO:per"))
                                           (begin  
                                             (set! pos_sur (item.feat token "token_pos")))))



                                      ))))))); 54 44
              (set! token1 (item.next token))
              (set! n_name (na token1))

               );  43;
            (begin 
              (set! pos_sur "")))

       (format t "ou-suis-je %s\n" pos_sur)
           
       (if 
          (and 
            (not (string-equal pos_sur "")) 
            (or (format t "\t\t\t\t\t\tici module befapo: on répond avec pos_sur |%s| pour |%s|\n" pos_sur name) t))
      
        
              (begin 
                (format t "réponse pour QTbefapo\n")
                (set! reponse t)
                (ru token name)
                ; action
                (item.set_feat token 'delete  "next")
                

                (set! name1 (string-append name "_" n_name))
                (format t "name1 %s" name1)
                (item.set_feat token1 'name name1)
                (item.set_feat token1 'pos pos_sur)
                ;; suffit pour ne pas boucler
                (item.set_feat token1 'whitespace " ")
                (set! result (list name1))
                )
              )

          

       (format t "we leave the module befapo sur |%s|\n" name)
       reponse))

(provide 'INST_LANG_token_qt_befapo)

