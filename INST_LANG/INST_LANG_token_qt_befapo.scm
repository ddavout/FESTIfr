; INST_LANG_token_qt_befapo

(defvar RU)
(defvar result)

; for list_before_apo_VER list_before_apo_*
(require 'INST_LANG_token_to_words_tools)

; for na, french_downcase_string
(require 'INST_LANG_utils)

(define (befapo token name)
    (let (pos_sur QT reponse)
        ; pour n'importe on cherche à atteindre |n| 
       (format t "\t\t\t\t\t\tici module befapo sur |%s|\n" name)
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
          
          (or (member_string (french_downcase_string name) list_before_apo_div)
               (if (member_string (french_downcase_string name) list_before_apo_VER )(set! pos_sur "VER"))
               (if (member_string (french_downcase_string name) list_before_apo_CON )(set! pos_sur "CON"))
               (if (member_string (french_downcase_string name) list_before_apo_PRE )(set! pos_sur "PRE"))
               ; (if (member_string (french_downcase_string name) list_before_apo_NOM )(set! pos_sur "NOM"))

               (if (member_string (french_downcase_string name) list_before_apo_ART_def )(set! pos_sur "ART_def"))
               )
          ; (equal? (item.feat token 'punc) 0); on ne sait jamais... hmm on pardonne
          (or (format t "\t\t\t\t\t\tici module befapo: on répond sur |%s|\n" name) t)
          
          )
          
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
            
            (item.set_feat (item.next token) 'whitespace "")
            (if pos_sur
              (or (format t "ici module befapo: on a chercher à imposer le POS:%s à %s\n" pos_sur name1 ) t)
              (or (format t "ici module befapo: on n'a pas de POS préféré pour %s\n" name1 ) t))
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

