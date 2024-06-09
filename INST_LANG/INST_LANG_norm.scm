; INST_LANG_norm
; toujours en mouvement, on ne cherche ps encore à optimiser
; à terme  un script externe ?
; TODO use external script

; /!\ utf8
; notamment  pour string-replace_utf8 compatible utf8 tODO check
(require 'INST_LANG_util)
; surcharge string-replace_utf8
(load_library "INST_LANG_util.scm")
(defvar verbose_norm t)

; à reprendre 
(define (sampa? name)
    (string-matches name "@@.*"))
(define (norm_sampa texte)
  "maud me donne [[a l 0 b a 0 t rh o s 0]], je sers @@a l'b a't rh o s'"
  texte)







; mais pour ce qui est de norm
; changement de point de vue
; *norm* dédié à une normalisation typographique, aucune réforme lexicale ne sera promue
; 
  
 ; attention cohérence avec qt_normal   
(define (norm texte)
 (let (alias after multi_word text text1)
    ;  á å ä ā í ì î ñ œ ò ú
    ; ñ ?
    (if (sampa? texte)
        
        (norm_sampa texte)
        (begin 
          (set! text  texte)
          ; bug si texte commence par ; Segmentation fault !
          (if (string-equal (string-car text) ";")
            (set! text (string-cdr text)))
          ; bug si texte contient |\"|    QUOTATION MARK
          (set! text (string-replace_utf8 text "\"" "\""))
          (set! text (string-replace_utf8 text "\\\"" " \\\" "))
          ;   REVERSE SOLIDUS
          ;;;(set! text (string-replace_utf8 text "\\" "_reverse"))
          (set! text (string-replace_utf8 text " " " ")) ; "Oh !
          (set! text (string-replace_utf8 text " " " ")) ; TODO tout blanc non ascii TODO
          (set! text (string-replace_utf8 text " " " ")) ; (utf8ord " " 160)
          ;  ajout espace finale pour faciliter remplacement des t'en and alike...
          (set! text  (string-append text " "))
          ; regarde token ajout d'un caractère
           (set! text (string-replace_utf8 text "œ" "oe")); avec un utford 339 ok propose  (lex.add.entry '("œuf" NOM ((("oe" "f") 0))))
          ; moins justifiable regarde pas les token mais les lexiques (et la LTS)
          ; 
          (set! text (string-replace_utf8 text "ç" "_c"))
          ; (set! text (string-replace_utf8 text "á" "a"))
          ; (set! text (string-replace_utf8 text "À" "à"))
          ; (set! text (string-replace_utf8 text "å" "a"))
          ; (set! text (string-replace_utf8 text "ä" "a")); provoque un  monstre utf8ord  164
          ; (set! text (string-replace_utf8 text "ā" "a")); 257
          ; (set! text (string-replace_utf8 text "í" "i")); 173
          ; (set! text (string-replace_utf8 text "ì" "i"))
          ; (set! text (string-replace_utf8 text "î" "i"))
          ; (set! text (string-replace_utf8 text "ò" "o"))
          ; buggy string-replace pour ù ! 
           ; (set! text (string-replace_utf8 text (utf8chr 185) "_1"))
           ; as Latin-1 characters Ã ¹ or  (utf8ord "¹") =185
           (set! text (string-replace_utf8 text "Ã¹" "_u"))
           ; (set! text (string-replace_utf8 text "Ã¹" "u"))
           ; (set! text (string-replace_utf8 text (utf8chr 185) ""))

          ;;/ bug utf8 token.singlecharsymbols 
          (set! text (string-replace_utf8 text "°" "_o"));; n° et °C;  utf8ord 176
          ;  as Latin-1 characters  â <82> ¬ 
          ; (set! text (string-replace_utf8 text "€" " _Euro")); espace pour séparer 2€ provoque un  utf8ord 172 sinon remplacé pour un utf8 8364
          (set! text (string-replace_utf8 text "¥" " _yen")); provoquerait  utf8ord 165
          (set! text (string-replace_utf8 text "£" " _pound"))
          (set! text (string-replace_utf8 text "¢" " _cent"))
          ;; bug utf8 question ponctuation
          ; (set! text (string-replace_utf8 text "–" " ")) ; utf8 vu comme  "€“"; où ???
          ; pb avec les \
          ; (set! text (string-replace_utf8 text "„" "\\\" ."))
          (set! text (string-replace_utf8 text "„" " _apo1 "))
          
          (set! text (string-replace_utf8 text "…" "...")  )
          (set! text (string-replace_utf8 text "¸" ","))

          ;(set! text (string-replace_utf8 text "\"" " \""))
          ; (set! text (string-replace_utf8 text "« " "\""))
          ; (set! text (string-replace_utf8 text " »" "\""))
          ; (set! text (string-replace_utf8 text "«" "\""))
          ; (set! text (string-replace_utf8 text "»" "\""))
          
          (set! text (string-replace_utf8 text "«" " _apo_l "))
          (set! text (string-replace_utf8 text "»" " _apo_r "))
          (set! text (string-replace_utf8 text "´" "'"))


          (set! text (string-replace_utf8 text " …" "..."))  ; + typo pas d'espace devant des  points de suspsension !


          (set! text (string-replace_utf8 text "!." ".")) ; bad typo
          (set! text (string-replace_utf8 text "...." ""))  ; pas d'excès !

          ; (set! text (string-replace_utf8 text "--" " \""))  ; gutenberg TODO pas optimum
          (set! text (string-replace_utf8 text " - " "_tiret"))  ; gutenberg TODO pas optimum
          (set! text (string-replace_utf8 text "’" "'"))  
          ; 


          (set! text (string-replace_utf8 text " ," ",")) ; bad typo
          (set! text (string-replace_utf8 text "," ", ")) ; bad typo
          (set! text (string-replace_utf8 text ".(" ". (")); bad typo
          (set! text (string-replace_utf8 text ";(" "; (")); bad typo

          (set! text (string-replace_utf8 text " . " ".")) ; bad typo
          (set! text (string-replace_utf8 text " ." ".")) ; bad typo

          ; on ajuste les ponctuations françaises et anglaises, assez proches pour ne pas tout refaire
          (set! text (string-replace_utf8 text " ?" "?")); -> english typo
          (set! text (string-replace_utf8 text " )" ")")); -> english typo
          (set! text (string-replace_utf8 text "( " "(")); -> english typo ;  sinon ça complique le token_to_words où,notamment ) serait vu comme un mot(set! text (string-replace_utf8 text " ?" "?")); -> english typo
          (set! text (string-replace_utf8 text " ]" "]")); -> english typo
          (set! text (string-replace_utf8 text "[ " "[")); -> english typo ; 
          (set! text (string-replace_utf8 text "[" " [")); -> 
          (set! text (string-replace_utf8 text " :" ":")) 
          (set! text (string-replace_utf8 text " !" "!"))
          (set! text (string-replace_utf8 text ";" "; ")) ; ;trop collé
          (set! text (string-replace_utf8 text " ;" ";")) ; ; pour coller avec la typo anglaise


            (set! text (string-replace_utf8 text ".," ".")) ; pour VOLT., essai
            (set! text (string-replace_utf8 text "quart-" "quar-"))

            (set! text (string-replace_utf8 text "demi-" "demi "))
            (set! text (string-replace_utf8 text "semi-" "semi "))
            (set! text (string-replace_utf8 text "Demi-" "demi "))
            (set! text (string-replace_utf8 text "Semi-" "semi ")) 
            (set! text (string-replace_utf8 text "Mi-" "mi "))   
            (set! text (string-replace_utf8 text "mi-" "mi "))   
            (set! text (string-replace_utf8 text "mini-" "mini "))   
            (set! text (string-replace_utf8 text "mille-" "mille "))
            (set! text (string-replace_utf8 text "mini-" "mini "))
            (set! text (string-replace_utf8 text "Mille-" "mini "))

            (set! text (string-replace_utf8 text "ENA" "éna"))  ; voir autre sigle commençant par  E se lisant é

            ; tentation mais fausse bonne idée, on perd un feature
            ; (set! text (string-replace_utf8 text "'" "_"))
  
            ;pis-aller : ce n'est plus de la typo ! mais un problème de poslex
           ; (set! text (string-replace_utf8 text "ons-en" "on z_en")) pris en charge par QTpos2
           ;  (set! text (string-replace_utf8 text "ez-en" "é z_en")) ; pris en charge par QTpos2
           ; (set! text (string-replace_utf8 text "ons-y" "on z_y")) pris en charge par QTpos2
;            (set! text (string-replace_utf8 text "ez-y" "é z_y")); pris en charge par QTpos2
            (set! text (string-replace_utf8 text "eux-" "eux "))
            (set! text (string-replace_utf8 text "t'il " "t_il "))
            (set! text (string-replace_utf8 text "t'ils " "t_ils "))
            (set! text (string-replace_utf8 text "t'elle " "t_elle "))
            (set! text (string-replace_utf8 text "t'elles " "t_elles "))
            (set! text (string-replace_utf8 text "t'on " "t_on "))            
            (set! text (string-replace_utf8 text "m'en " "m_en "))            
            (set! text (string-replace_utf8 text "t'en " "t_en "))            
           ; supression de l'espace rajouté
           (set! text (string-but-last text))
            (if (and verbose_norm (not (string-equal text texte)))
                 (format t "verbose_norm %s gives %s\n" texte text))
            
          text))
    ))
;; pistes pour V1
; en cours pattermach ..à reprendre
; ou ...
(require 'INST_LANG_patternmatch)
; the Scheme-variable named #1, #2 ... is generated and the part of
; string that matches this expression is bound to this variable
; they should be used with caution to avoid overwriting 


; # surnumerary_spaces
; "start_of_paragraph":          [("^[  ]+", "")],
; "end_of_paragraph":            [("[  ]+$", "")],
; "between_words":               [("  |  ", " "),  # espace + espace insécable -> espace
;                                 ("  +", " "),    # espaces surnuméraires
;                                 ("  +", " ")],   # espaces insécables surnuméraires
; "before_punctuation":          [(" +(?=[.,…])", "")],
; "within_parenthesis":          [("\\([  ]+", "("),
;                                 ("[  ]+\\)", ")")],
; "within_square_brackets":      [("\\[[  ]+", "["),
;                                 ("[  ]+\\]", "]")],
; "within_quotation_marks":      [("“[  ]+", "“"),
;                                 ("[  ]”", "”")]
; ## non-breaking spaces
; # espaces insécables
; "nbsp_before_punctuation":     [("(?<=[]\\w…)»}])([:;?!])[   …]", " \\1 "),
;                                 ("(?<=[]\\w…)»}])([:;?!])$", " \\1"),
;                                 ("[  ]+([:;?!])", " \\1")],
; "nbsp_within_quotation_marks": [("«(?=\\w)", "« "),
;                                 ("«[  ]+", "« "),
;                                 ("(?<=[\\w.!?])»", " »"),
;                                 ("[  ]+»", " »")],
; "nbsp_within_numbers":         [("(\\d)[  ](?=\\d)", "\\1 ")],
; # espaces insécables fines 
; "nnbsp_before_punctuation":    [("(?<=[]\\w…)»}])([;?!])[   …]", " \\1 "),
;                                 ("(?<=[]\\w…)»}])([;?!])$", " \\1"),
;                                 ("[  ]+([;?!])", " \\1"),
;                                 ("(?<=[]\\w…)»}]):", " :"),
;                                 ("[  ]+:", " :")],
; "nnbsp_within_quotation_marks":[("«(?=\\w)", "« "),
;                                 ("«[  ]+", "« "),
;                                 ("(?<=[\\w.!?])»", " »"),
;                                 ("[  ]+»", " »")],
; "nnbsp_within_numbers":        [("(\\d)[  ](\\d)", "\\1 \\2")],


(set! punctuation_tab   '(
                                 (" +(?=[.,…])" . "") ; before_punctuation
                                 ("\\([  ]+" . "(" ) ; within_parenthesis 1
                                 
                                 ))
(set! before_punctuation_m " +(?=[.,…])")
(set! beforepunctuation_r "" )

(define (norm_punctuation texte)
  (let (results)
    (if (pattern-matches texte before_punctuation_m)
      (begin
        (set! h1 #1)(set! h2 #2)(set! h3 #3)
        (format t "h1 %s\n" h1)
        (format t "h2 %s\n" h2)            
        (format t "h3 %s\n" h3)
      ))))

;;; à commenter pendant séance de mise au point
(provide 'INST_LANG_norm) 

