; INST_LANG_token_qt_pos5

; à voir 
; en le maintenant au sol
; en le tenant serré
; avant ADV NOM
; devant ADV NOM VER 
; entrée double *ant" VER 

; mais aucun problème avec maintenant, tenant
; d'ou arrêt ! 
; "on en est tout à fait sûr maintenant")
; En les maintenant au sol"
; "je vais maintenant vous quitter"
; "Range ta chambre maintenant
; "en maintenant les faux-semblants
; "venons-en maintenant au fait"
; maintenant dis-moi tout




(defvar list_qt_pos5_homo_VER (list "tenant"))

(defvar list_per_sujet (list "je" "tu" "il" "elle" "on"))
(defvar list_per_sujet_inv (list "je" "tu" "il" "elle" "on" "nous" "vous" "ils"))
(defvar list_qt5_prev (list "le" "la" "les" "en"))

(defvar RU)
(defvar result)

; for french_downcase_string
(require 'INST_LANG_utils)

(define (pos5 token name)
   ""
    (let 
        ((fdnaw (french_downcase_string name)) pos_gue reponse)
        (format t "\t\t\t\t\t\tici module pos5 sur %s\n" name)
        (if 
          (and 
             ;***
             (member_string (french_downcase_string name) list_qt_pos5_homo_VER)
             ;***
             (or (format t "\t\t\t\t\t\tici module pos5: on répond sur |%s|\n" name) t))
                (begin
                  (format t "réponse pour QTpos5\n")
                  (set! reponse t)
                  (set! QT "QTpos5")
                  (ru token name)
                  ; action directe
                  (set! token-1 (item.prev token))
                  (if (null? token-1)
                     (begin
                        (set! pos_giv "ADV")
                        (item.set_feat token 'pos "pos_giv"))
                     (begin
                        (set! p_name (french_downcase_string (item.name token-1)))
                        (if (and (member_string p_name list_qt5_prev) t)                              
                                 ; ponc
                             (set! pos_giv "VER"))
                        )    
                           
                        
                     )


                  )
                (begin
                  ))
        (set! result (list name))
        (format t "we leave the module pos4 sur |%s|\n" name)
        reponse))

(provide 'INST_LANG_token_qt_pos5)