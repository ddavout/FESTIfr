 ; INST_LANG_token_qt_loc2m
 ; question : y-a-t'il lieu, avec l'utilisation de l'alist,  de faire des déclarations dans poslex ou dans ses addendas ?
 ;  
(defvar RU)
(defvar result)

; for na, french_downcase_string
(require 'INST_LANG_utils)

; for locution2_tab 
(require 'INST_LANG_token_to_words_lists)


; locution 2 mots 
; liste dans INST_LANG_token_to_words_lists via locution2_tab
; "vingt_cinq"  "wait_and_see" "way_of_life" à jeun quelques_uns"; "quoi_que"; "red_river"
; ex à jeun : à_jeun POS ADV dans freeling 
; et éventuellement prononciation de à_jeun  dans dico
(define (loc2m  token name)
  " "
  ;;;
  (let (fdnaw (french_downcase_string name) token1 n_name nam1 pos_sur QT reponse)
    (format t "\t\t\t\t\t\tici module loc2m sur %s\n" name)
    (if 
      (and
        ; item.next  Return the next ITEM in the **current** relation, or nil if there is none
        (set! token1 (item.next token) )
        ;**
        ; ni ponctuation, ni preponctuation  entre le premier et le suivant
        (equal? (item.feat token 'punc) 0);
        (or (format t "locution QTlocution_part_1: pas de punc ok\n") t)
        (string-equal (item.feat token 'n.prepunctuation) "")
        (or (format t "locution QTlocution_part_1: pas de prepunc ok\n") t)
        ;**
        (set! n_name (na (item.next token)))
        (or (format t "ok1 n_name |%s| \n" n_name) t)

        ; chef-d passe à chef_ |chef-d'oeuvre|
        (set! nam1 (string-append (string-replace name "-" special_slice_char) "_" n_name))
        (or (format t "ok2 nam1 |%s| \n" nam1) t)

        ;**
        ; et non tab_lookup nam1 qui donnerait nil pour des locutions au POS non "certain"
        (member_string nam1 (tab_getkeys locution2_tab))
        
        )
          (begin
              (set! reponse t)
              (set! QT "QTloc2m" )
              (set! RU (append RU (list name QT ";")))
              ;** transfert de ponctuation du dernier vers le premier
              (item.set_feat token 'punc (item.feat (item.next token) 'punc ))
              ;** marquage pour suppression du suivant: on y cherchera p.delete
              (item.set_feat token 'delete  "next")
              ; impose le POS ou laisse poslex décider
              (set! pos_sur (car (tab_lookup nam1 locution2_tab)))
              (format t "pos_sur |%s| \n" pos_sur)
              (if pos_sur
                (item.set_feat token 'pos pos_sur))
              ; (item.set_feat token 'pos  "ADV")


              (set! result (list nam1)))) 

    (format t "we leave the module loc2m\n\n")
    reponse))


(provide 'INST_LANG_token_qt_loc2m)