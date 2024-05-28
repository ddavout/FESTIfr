
(defvar verbose_supra_lts t)
(defvar suivi)
(if suivi (set! verbose_supra_lts t))
(defvar lexdebug 0)
(defvar correction_lts nil)
; (if correction_lts (require 'correction_lts))
(require 'util)
(require 'INST_LANG_patternmatch); for pattern-matches
(require 'fileio)

; TODO_check autorise une INST_LANG_lts_rules externe si chargée avant .. pour test cummulate
(if (not (boundp 'INST_LANG_lts_rules))
      (require 'INST_LANG_lts_rules))
(require 'INST_LANG_phoneutils)
(require 'INST_LANG_lts)
(require 'INST_LANG_patternmatch)



(define (lts_brut word features)
  "TODO blabla"
  (let (entry (my_strict_lex.lookup word features) results)
    (if (not (null? entry))
      (begin
        (set! syls (car (cdr (cdr entry))))
        (set! results (list (string-append word "_" features)  features syls))
        (if verbose_supra_lts (format t "results taken from my_strict_lex.lookup %l\n" results)))
      (begin
          ; lexicon.cc will change features to -1
          ; assuming there is -1 is never in the pos field...
          (set! syls (slice_word word features))
          (set! results (list word features syls))


          ; ("devi" NOM ((("d" "eh") 0) (("v" "i") 0)))
          ; (lex.add.entry '("n_arriveré" nil (((n "a") 0) (("rh" "i") 0) (("v" "rh" "e") 0))))
          (if verbose_supra_lts 
            (begin
              (set! results1 (list (wordroot word features) features syls))
              (format t "supra_lts: no strict result\n, nous vous proposerons quelque chose comme\n (lex.add.entry '%l)\n" results1))
              (if suivi (write2-file "stats_tests" (format nil "(lex.add.entry '%l)\n" results1)))
            )


          
          ))
    results))


; TODO ??? location ici cause correction lts
; phoneutils correction netlex_sy..
(define (modify_listphones phones)
  (let (result str_phones)
    (if (not (null? phones))
      (begin 
        ;(format t "debug modify_listphones phones: %l\n" phones)
        ;(format t "nth 0 phones: %l\n" (nth 0 phones))
        ;(format t "nth 1 phones: %l\n" (nth 1 phones))
        ;(format t "last phones: %l\n" (last phones))
        ;(format t "butlast phones: %l\n" (butlast phones))
        ; pas les 2 derniers  :()
        ; utiliser pattern-matches une fois au point
        ; éventuellement revoir INST_LANG_lex_syllabify_phstress grosse consonne ex 'b-rh' grosse voyelle "a-j"
        ; plus ou moins réglable selon le niveau de langue ? autre phoneme à la place de ae ?
        (set! str_phones (list->-string phones)) ; "-ahn-t-rh-m-eh-l"
        (set! result (split-string (string-cdr  (if correction_lts (correct str_phones)  str_phones)) "-"))

        result))))
            
 
 ; TODO deplacer ? tools
  
(define (slice_word word features) ; return stressed syls 
  "given a word and its features give the list of the syllables of a possible pronunciation"
  ; exemple est -> ("est" "VER" (((eh) 0)))
  ; (slice_word "Á" nil) -> nil    
  ; festival> (slice_word "À" nil)) -> (("a") 0))
  ; (slice_word "ouvre-bouteille" nil) -> ((("u") 0) (("v" "rh" "ae") 0) (("b" "u") 0) (("t" "eh" "j") 0))
  ; on ne sliçait pas bien  "ouvre_bouteille" -> ((("u") 0) (("v" "rh" "b" "u") 0) (("t" "eh" "j") 0))
  ; DONE
  (lexdebug 1000 (format nil "slice_word word: %s feature: %s\n" word features))
  (let (syls phones word1)      
    (cond
      (t
        ; failed to find tree for T
        (set! phones (lts_predict_utf8 (french_downcase_string word) INST_LANG_lts_rules))
        ; tempo old lts 20210816
        (changepho_ah->a phones)

        (set! phones (modify_listphones phones))
        ;(format t "tempo: phones %l" phones)
        ; "s" dans  s'il y a 
        (set! last_phone (if (not(null? phones))(car (last phones)) ""))
        (set! butlast_phone (remove_last phones))
        (set! penlast_phone (if (not(null? butlast_phone)) (car (last butlast_phone)) ""))
        (if (and (member_string last_phone (list "rh"))(member_string penlast_phone (list "t")))
            (set! phones (append phones (list "ae"))))
        (set! syls (INST_LANG_lex_syllabify_phstress phones))
        
        syls))))

      

(provide 'INST_LANG_supra_lts)
