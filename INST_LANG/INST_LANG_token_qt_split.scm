; INST_LANG_token_qt_split
; pour une simplification de norm
(defvar symboles (list "°" "¥" ))

          ; ;;/ bug utf8 token.singlecharsymbols 
          ; (set! text (string-replace text "°" "_o"));; n° et °C
          ; (set! text (string-replace text "€" " _Euro")); espace pour séparer 2€
          ; (set! text (string-replace text "¥" " _yen"))
          ; (set! text (string-replace text "£" " _pound"))
          ; (set! text (string-replace text "¢" " _cent"))
          ; ;; bug utf8 question ponctuation
          ; (set! text (string-replace text "–" " ")) ; utf8 vu comme  "€“"; où ???
          ; (set! text (string-replace text "„" "\\\""))
          
          ; (set! text (string-replace text "…" "...")  )
          ; (set! text (string-replace text "¸" ","))

          ; ;(set! text (string-replace text "\"" " \""))
          ; (set! text (string-replace text "« " "\\\""))
          ; (set! text (string-replace text " »" "\\\""))
          ; (set! text (string-replace text "«" "\\\""))
          ; (set! text (string-replace text "»" "\\\""))



(defvar RU)
(defvar result)

; for french_downcase_string
(require 'INST_LANG_utils)


 (defvar QTsplit_pattern "{[A-Za-z]+}{\\.}{.*}")


(define (split token name)
    ""
     (let (reponse)
        (format t "\t\t\t\t\t\tici module split sur %s\n" name)
        (if 
            (pattern-matches name QTsplit_pattern)
            (begin
                (set! reponse t)
                (set! QT "QTsplit")
                (ru token name)
                 (set! h1 #1)
                 ; (not (string-equal h1 ""))
                 (or (format t "h1 %s\n" h1) t)
                 (set! h2 #2)
                 (not (string-equal h2 ""))
                 (or (format t "h1 %s h2 %s\n" h1 h2) t)

              (item.set_feat token 'name h1)
              (item.set_feat token 'punc ".")
              (set! result (append (INST_LANG_token_to_words token h1) 
                (append (INST_LANG_token_to_words token (string-cdr h2))) 
                ; (append (INST_LANG_token_to_words token h3))
                ))


                 )

                    )
       (format t "we leave the module split sur |%s|\n" name)
       reponse))
(provide 'INST_LANG_token_qt_split)
 
       ; (( and 
       ;      QTsplit
       ;      ; le cas ; et , sont gérés par norm
       ;       (or (set! h3) t); on prévoit blabla? ou regarde punc ou on place la règle en dernier 
       ;       (pattern-matches name QTsplit_pattern)
       ;       (set! h1 #1)
       ;       ; (not (string-equal h1 ""))
       ;       (or (format t "h1 %s\n" h1) t)
       ;       (set! h2 #2)
       ;       (not (string-equal h2 ""))
       ;       (or (format t "h1 %s h2 %s\n" h1 h2) t))
       ;          (set! QT "QTsplit")
       ;          (set! RU (append RU (list QT )))
       ;          (set! h3 #3)
       ;          (format t "h3 %s\n" h3)
       ;          ;(set! poncsupp (string-car h2))
       ;              (begin 
       ;                (item.set_feat token 'name h1)
       ;                (item.set_feat token 'punc ".")
       ;                (set! result (append (INST_LANG_token_to_words token h1) (append (INST_LANG_token_to_words token (string-cdr h2))) (append (INST_LANG_token_to_words token h3))))
       ;                )
       ;              )