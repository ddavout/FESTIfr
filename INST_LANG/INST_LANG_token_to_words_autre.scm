;INST_LANG_token_to_word_autre
; commentaires à ranger y comprris à la poubelle !
  ; TODO pas de correction typo 12h 30  ni 12h (-> hecto ...)
  ; 21 h ; 21:30 h ; "20:30 h à 21 h"; 20:30 h à 21:30 h; 
  ; 23:54 min 
  ; NON pour 20:30 ou  20:30 à 21 h; 
  ; pb interference fre_abbr_unite_mesure_dim_tab  "23h 34min 52s"

; tempo mise au point
(defvar verbose_INST_LANG_token_to_word t)

(defvar alternative1 nil)
; changer nécessité new load à cause du provide final

(defvar tokendebuglevel 20000)
(defvar debugQT t) ; ; pour débugger une QT en particulier lors de mise au point
; TODO prochaine tache
; améliorer RU liste de (QT*, name) , puisque le name peut changer !

; /!\ defvar et non pas set: sinon entre 2 appels successifs on perdrait la liste RU,
; en plus maintenant on a des "modules" externes !

; /!\ à ne pas mettre derrière un if fut-ce-t'il (if t
; ne pas mettre en local dans un module censé changer RU, etc.
(defvar RU)

; globale
; pour passage aux modules, ou appel réntrant
(defvar result)

(defvar fdnaw)
(defvar h1)
(defvar h2)
(defvar QT)
; verbose & debug
(defvar cg::debug); could be clunits_debug !
(if cg::debug
    (defvar tokendebuglevel 1000)
    (defvar tokendebuglevel -1))
(defvar verbose_INST_LANG_token_to_word)


;; requis à distribuer suivant les QT
; for na, french_downcase_string
(require 'INST_LANG_utils)
(require 'INST_LANG_patternmatch); for pattern-matches
; pour entre autre INST_LANG_homographs, INST_LANG_homographs1
; is_letter
(require 'INST_LANG_tokenpos);
;(require 'INST_LANG_token);
(require 'INST_LANG_numbers)
; for french_numbers_to_words 
(require 'INST_LANG_token_numbers_to_words)
; for french_parse* is_currency, french_parse_ordinal, etc.
(require 'INST_LANG_token_to_words_tools)
; for fre_abbr_* ; fre_unit_time_name; list_before_apo_VER list_before_apo_div
(require 'INST_LANG_token_to_words_lists)

(require 'INST_LANG_token_qtneeded)


(define (boundQT QTname modu)
    "QTname de module modu utilisable ?"
    ; renvoie t, pour usage dans tests
    (and (boundp 'QTname)  (boundp 'modu))t)


(define (ru token name)
    (set! RU (append RU (list name QT ";")))
    (format t "RU %l\n" RU)
    (item.set_feat token 'ru  QT))




    ; à mettre à nil au niveau de notre SayText TODO
; // EN TETE

(define (INST_LANG_token_to_words token name)
  "Returns a list of words for NAME from TOKEN.  This allows the
  user to customize various non-local, multi-word, context dependent
  translations of tokens into words.  If this function is unset only
  the builtin translation rules are used, if this is set the builtin
  rules are not used unless explicitly called. [see Token to word rules]
  A few simple ad hoc solutions for the most common simple T2W-problems."
    ; It would be much nicer to use an external Perl text letterizer ?" ... pas sûr
    ; handles abbreviations,  numeral expressions such as phone numbers,
    ; ratios, dates, currencies, compounds of letters and digits, roman
    ; numbers, lines, scale units.
    ; on distingue les unités de temps et de devise pour une question d'ordre de lecture
    ; ou d'écriture 20 h 30 ; 30,50 Euros
 
    ; The TokenToWords UtteranceProcessor creates a word Relation from the
    ; token Relation by iterating through the token Relation Item list and
    ; creating one or more words for each token. 
    ; For most tokens there is a one to one relationship between words and
    ; tokens, in which case a single word Item is generated for the token item.

    ;  Other tokens, such as "2001" generate multiple words "two thousand one".
    ;  Each word is created as an Item and **added** to the word Relation.
    ;  **Additionally**, each word Item is added as a daughter to the corresponding token in
    ;  the token Relation. ref FreeTTS

    ; The main role of TokenToWords is to look for various forms of numbers
    ; and convert them into the corresponding (sic English) words. TokenToWords
    ; looks for simple digit strings, comma separated numerals (such as
    ; 1,234,567), ordinal values, years, floating point values, and
    ; exponential notation. TokenToWords uses the JDK 1.4 regular expression
    ; API to perform some classification. In addition a CART (Classification
    ; and Regression Tree) is used to classify numbers as one of: year,
    ; ordinal, cardinal, digits. (FreeTTs case  ?..)

  (format t "===================\n")
  (format t "PREVIOUS TOKEN %s\n" (if (not (null? (item.prev token))) (begin (print (item.features (item.prev token) )))))
  (format t "ACTUAL TOKEN: |%s|\n |%l|\n" name (item.features token))
  (format t "ACTUAL TOKEN is_in_poslex name |%l| \n" (is_in_poslex_all name))
  (format t "ACTUAL TOKEN is_in_poslex name |%l| \n" (is_in_poslex_all (string-replace name "-" special_slice_char)))
  (format t "===================\n")
  
  (let 
    ; /!\ best way to spoil everything  put (let (#1 #2 #3 #4) preventing to create them with pattern-matches ...
    ; il y a mieux pour le pire ?! déclarer ici result en local
    ; TODO réduire au strict nécessaire
    ; en cours : sûr fdnaw, 
    (ponct)
    ; fdnaw non local
    (set! fdnaw (french_downcase_string name))
    (set! ponct (item.feat token 'punc ))

    (cond 

    ((and 
        ; pas de module direct TODO (boundQT 'QTdeltim QTdeltim)
        QTdeltim
        ( member_string fdnaw (list "h" "heure" "heures" "minute" "minutes" "seconde" "secondes")  
        (string-equal (item.feat token 'p.delete) "next"))
        (begin
            (set! QT "QTdeltim" )
            (set! reponse t)
            (set! RU (append RU (list name QT ";")))
            ; action
            (set! result))
        (format t "we leave the module deltim sur |%s|\n" name)
        reponse))
  

    
       ((and 
            QTdelp.p.n
            (string-equal (item.feat token 'p.p.n_delete) "next"))
            
                (set! QT "QTdelp.p.n" )
                (set! RU (append RU (list name QT )))
                (tokendebug -1 "QTdelp.p.n\n")
                (set! result))
      ; ((and 
      ;       QTdelp.n
      ;       (string-equal (item.feat token 'n.delete) "next"))
            
      ;           (set! QT "QTdelp.n" )
      ;           (set! RU (append RU (list name QT )))
      ;           (tokendebug -1 "QTdelp.n\n")
      ;           (set! result)) 




      ((format t "QTdel ?\t élimination programmée ? |%s| si %s\n" name (boundQT 'QTdel QTdel))  nil)
      ((and 
        (boundQT 'QTdel QTdel)
        (or (require 'INST_LANG_token_qt_del) t)
        (del token name)))        

      ((and 
        (boundQT 'QTpos0 QTpos0)
        (or (require 'INST_LANG_token_qt_pos0) t)
        (pos0 token name)))

      ((and 
        (boundQT 'QTpos1 QTpos1)
        (or (require 'INST_LANG_token_qt_pos1) t)
        (pos1 token name)))
    
      ((and
        (boundQT 'QTpos2 QTpos2)
        (or (require 'INST_LANG_token_qt_pos2) t)
        (pos2 token name)))

      ((and
        (boundp 'QTpos3)
        (or (require 'INST_LANG_token_qt_pos3) t)
        (pos3 token name)))

      ((and
        (boundp 'QTpos4)
        (or (require 'INST_LANG_token_qt_pos4) t)
        (pos4 token name)))

      ; ((format t "QTdel ?\t élimination programmée ? |%s| si %s\n" name (boundp 'QTdelp ))  nil)
      ; ((and 
      ;       (boundp 'QTdel)
      ;       (or (require 'INST_LANG_token_qt_del) t)
      ;       (del token name)))        


      ; ((format t "QTdelp ?\t élimination programmée ? |%s| si %s\n" name (boundp 'QTdelp ))  nil)
      ; ((and 
      ;       (boundp 'QTdelp)
      ;       (or (require 'INST_LANG_token_qt_delp) t)
      ;       (delp token name)))

      ; ((format t "QTdelp.p ?\t élimination programmée ? |%s| si %s\n" name (boundp 'QTdelp.p ))  nil)  
      ; ((and 
      ;       (boundp 'QTdelp.p)
      ;       (or (require 'INST_LANG_token_qt_delp_p) t)
      ;       (delp.p token name)))




      ((format t "QTbefapo?\t essai élision à venir ? |%s| si %s\n" name (boundp 'QTbefapo ))  nil)  
      ((and 
            (boundp 'QTbefapo)
            (or (require 'INST_LANG_token_qt_befapo) t)
            (befapo token name)))

      ((and 
            (boundp 'QTletter)
            (or (require 'INST_LANG_token_qt_letter) t)
            (letter token name)))

      ((and 
            (boundp 'QTloc3m)
            (or (require 'INST_LANG_token_qt_loc3m) t)
            (loc3m token name))) 


      ((and 
            (boundp 'QTlocution_part_1)
            (or (require 'INST_LANG_token_qt_locution_part_1) t)
            (locution_part_1 token name)))




      ((and 
            (boundp 'QTloc2m)
            (or (require 'INST_LANG_token_qt_loc2m) t)
            (loc2m token name))) 

      ((and 
            (boundp 'QTbefapo)
            (or (require 'INST_LANG_token_qt_befapo) t)
            (befapo token name)))

      ((and 
            (boundp 'QTletter)
            (or (require 'INST_LANG_token_qt_letter) t)
            (letter token name)))


      ((and 
            (boundp 'QTlocution_part_1)
            (or (require 'INST_LANG_token_qt_locution_part_1) t)
            (locution_part_1 token name)))

      ((and 
            (boundp 'QTnormal)
            (or (require 'INST_LANG_token_qt_normal) t)
            (normal token name)))

      ((and 
            (boundp 'QTdiglist)
            (or (require 'INST_LANG_token_qt_diglist) t)
            (diglist token name)))

      ((and 
            (boundp 'QTtim1)
            (or (require 'INST_LANG_token_qt_tim1) t)
            (tim1 token name)))

      ((and 
            (boundp 'QTtim)
            (or (require 'INST_LANG_token_qt_tim) t)
            (tim token name)))

      ((and 
            (boundp 'QTmis)
            (or (require 'INST_LANG_token_qt_mis) t)
            (mis token name)))



      (t 
        (format t "à suivre\n")
        bouh)  



    ); // COND
    ;(set! result (list (string-replace name "-" special_slice_char)))
    result)) ;// DEFINE 

; "modules"




(if (not debugQT )(provide 'INST_LANG_token_to_words))

; à voir oui ? ici ou postlex ou liaison

;QT cardinal
; Prononc. et Orth.: vehn à la pause ou devant cons.: vint fois sauf dans les nombres de 33 à 39: vint-deux [vεtdø].
; [vehnt] devant voy.: vint arbres ou h non aspiré: vint hommes (pb de post_lex)

; cinq devant consonnes ou voyelles ou "pause"
; was 
;(lex.add.entry '("cinq" nil (((s ehn)0))))
;(lex.add.entry '("cinq_ADJ:num" "ADJ:num" (((s ehn k) 0))))
;(lex.add.entry '("cinq_sehn" sehn (((s ehn)0))))
;(lex.add.entry '("cinq_sehnk" sehnk (((s ehn k)0))))
