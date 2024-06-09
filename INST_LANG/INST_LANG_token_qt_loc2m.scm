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
  (let (fdnaw (french_downcase_string name) token1 n_name nam1 pos_sur reponse)
    (format t "\t\t\t\t\t\tici module loc2m sur |%s|\n" name)
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
        ; |jean| pour |blue jean|
        (set! n_name (na (item.next token)))
        (or (format t "ok1 n_name |%s| \n" n_name) t)

        ; collage composition |blue_jean|
        (set! nam1 (string-append (string-replace_utf8 name "-" special_slice_char) "_" n_name))
        (or (format t "ok2 nam1 |%s| \n" nam1) t)

        ;**
        ; et non tab_lookup nam1 qui donnerait nil pour des locutions au POS non "certain"
        (member_string nam1 (tab_getkeys locution2_tab))
        (or (format t "\t\t\t\t\t\tici module loc2m: on répond |%s|\n" name) t)
        
        )
          (begin
              (set! reponse t)
              (set! QT "QTloc2m" )
              (ru token name)
              ; je prépare la passation
              ; transfert d'une ponctuation éventuelle du dernier vers le premier
              (item.set_feat token1 'prepunctuation (item.feat token 'prepunctuation ))
              (item.set_feat token1 'punc (item.feat token 'n.punc ))
              (format t "pas de part2 après %s\n" nam1)
              (item.set_name token1 nam1 )

              ;marquage pour suppression au tour suivant
              (item.set_feat token 'delete  "next")     
              ; impose le POS ou laisse poslex décider
              ; suivant que la valeur de pos_sur
              (set! pos_sur (car (tab_lookup nam1 locution2_tab)))
              (format t "pos_sur |%s| \n" pos_sur)
              (if pos_sur
                (item.set_feat token 'pos pos_sur))
              ; (item.set_feat token 'pos  "ADV")

              ; je passe
              (set! result))) 

    (format t "we leave the module loc2m\n\n")
    reponse))


(provide 'INST_LANG_token_qt_loc2m)
