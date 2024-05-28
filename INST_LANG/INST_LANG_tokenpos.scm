;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                                       ;;
;;;                Centre for Speech Technology Research                  ;;
;;;                     University of Edinburgh, UK                       ;;
;;;                       Copyright (c) 1996,1997                         ;;
;;;                        All Rights Reserved.                           ;;
;;;                                                                       ;;
;;;  Permission is hereby granted, free of charge, to use and distribute  ;;
;;;  this software and its documentation without restriction, including   ;;
;;;  without limitation the rights to use, copy, modify, merge, publish,  ;;
;;;  distribute, sublicense, and/or sell copies of this work, and to      ;;
;;;  permit persons to whom this work is furnished to do so, subject to   ;;
;;;  the following conditions:                                            ;;
;;;   1. The code must retain the above copyright notice, this list of    ;;
;;;      conditions and the following disclaimer.                         ;;
;;;   2. Any modifications must be clearly marked as such.                ;;
;;;   3. Original authors' names are not deleted.                         ;;
;;;   4. The authors' names are not used to endorse or promote products   ;;
;;;      derived from this software without specific prior written        ;;
;;;      permission.                                                      ;;
;;;                                                                       ;;
;;;  THE UNIVERSITY OF EDINBURGH AND THE CONTRIBUTORS TO THIS WORK        ;;
;;;  DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING      ;;
;;;  ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT   ;;
;;;  SHALL THE UNIVERSITY OF EDINBURGH NOR THE CONTRIBUTORS BE LIABLE     ;;
;;;  FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES    ;;
;;;  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN   ;;
;;;  AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,          ;;
;;;  ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF       ;;
;;;  THIS SOFTWARE.                                                       ;;
;;;                                                                       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;  Functions used in identifying token types.
;;;

    ;;; Functions used in identifying token types.
    ;;; alphabet ascii + ÀÁÂÄÅÇÈÉÊËÌÍÎÏÒÓÔÖÙÚÛÜàáâäåçèéêëìíîïòóôöùúûü

    ;;(require 'INST_LANG_token_to_words_tools); ?numeric ... french_year_indicator
 (require 'INST_LANG_token_to_words_lists)
 (defvar tokendebuglevel -1)
    
; à mettre ou non ? dans wordlist 
; en l'occurence ne sert pas à grand-chose
; si 
    (defvar INST_LANG_token_most_common
      "token_most_common
      A list of French words which were found to be most common in 
      an text database and are used as discriminators in token analysis."
      ; valeur par défaut modifiable dans la voix, 240 dans le lib/tokenpos.scm
      ; non utilisé par les allemands ou les catalans
      ; mais dans utilisé dans festival/lib/tokenpos

      '("a" "action" "ainsi" "an" "au" "aujourd'hui" "avec" "banque" "bas"
      "c'est" "capital" "car" "cause" "ce" "cela" "certain" "ces" "cette"
      "chose" "client" "comme" "conditions" "crise" "d'" "dans" "de"
      "depuis" "des" "dire" "dont" "du" "en" "enfin" "ensemble" "entre"
      "entreprise" "est" "et" "Europe" "font" "forte" "France" "il" "ils"
      "important" "indice" "je" "jusque" "la" "le" "les" "loin" "long"
      "mais" "me" "ne" "ni" "non" "nos" "nous" "obligations" "on" "ont"
      "or" "par" "part" "pas" "pendant" "petit" "place" "plan" "plus"
      "point" "position" "possible" "pour" "pouvoir" "programme" "propose"
      "public" "qu'" "quant" "que" "question" "qui" "se" "sein" "selon"
      "service" "si" "simple" "situation" "son" "sur" "tout" "type" "un"
      "une" "va" "vous" "y" ))

    ; sc as ?? s as symbol ? segment ? syntax ? string ?
    ; c as ?? category ? context ?
    (define (INST_LANG_token_pos_guess sc)
      "(tok_pos sc)
      Returns a general pos for sc's name. 
      numeric  All digits
      number  float or comma'd numeric
      sym    contains at least one non alphanumeric
      month   has month name (or abbrev)
      day    has day name (or abbrev)
      sos    occur only at the beginning of french sentences, + ims_french

      rootname else downcased alphabetic. NON !?!
      Note this can help to find token_pos but isn't used directly as
      its not disciminatory enough."
      (let ((name (item.feat sc 'name))
            (pooh (item.features sc)))
          (tokendebug 0  (format nil  "INST_LANG_token_pos_guess _%s_" name))
          (tokendebug 0  (format nil  "INST_LANG_token_pos_guess _%l_" pooh)) ;
        (cond
        ((and (> tokendebuglevel 0)(format t "QGP?\tne_me ?\n" )  nil))
        ; ; "ne" ou "n" + PRO:per
        ; ((null? (is_ne_me name))  'ne_me)  
        ((and (> tokendebuglevel -1)(format t "QGP?\tprobnotplur ?\n" )  nil))
        ((null? (is_prob_pluriel name))  'probnotplur) 
        ((and (> tokendebuglevel 0)(format t "QGP?\tnumeric ?\n" )  nil))
        ((?numeric name) 'numeric) 
        ((and (> tokendebuglevel 0)(format t "QGP?\tnumber ?\n" )  nil))
        ((?number name) 'number)
        ((and (> tokendebuglevel 0)(format t "QGP?\tsymbol ?\n" )  nil))
        ((?sym name) 'sym)
        ((and (> tokendebuglevel 0)(format t "QGP?\tmonth ?\n" )  nil))
        ((member_string name french_months) 'month)
        ((member_string name french_days) 'day)
        ((member_string name french_sos) 'sos) ; start of sentence, satzanfang
        ((member_string name token_most_common) name)
        (t
          (french_downcase_string name))))) ; french (downcase name) à voir pour moi ne correspond pas au cas 
        ; français majuscule discriminatoire nom propre ou début de phrase; 
        ; hmm les anglais utilise par 
        ;     (t
        ;   '_other_)))


      ; This assigns a form of part of speech to tokens.  It is typically use ;
      ; to assign gross level pos for things before they are converted to     ;
      ; words, particularly, numbers (ordinals, digitized, years, numbers)    ;

        
      ; The module modules/Text/token_pos.cc   assigns token_pos feature to each token based on the
      ; Assoc list of Regex to CART trees in token_pos_cart_trees.





      ;  Token pos are gross level part of speech tags which help decide ; 
      ; pronunciation of tokens (particular expansion of Tokens into words) ;  The
      ; most obvious example is identifying number types (ordinals, ;  years, digits
      ; or numbers). ; 
      ; Festival offers a method for assigning a token_pos feature to
      ; each token. It does so using Yarowsky-type disambiguation techniques. A list
      ; of disambiguators can be provided in the variable token_pos_cart_trees. Each
      ; disambiguator consists of a regular expression and a CART tree (which may be a
      ; decision list as they have the same format).
      ; If a token matches the regular
      ; expression the CART tree is applied to the token and the resulting class is
      ; assigned to the token via the feature token_pos. This is done by the Token_POS
      ; module. ; 

      ; Note that these only assign values for the feature token_pos and do nothing
      ; more. You must have a related token to word rule that interprets this feature
      ; value and does the required translation


      ; this Tree is built from hand. if somebody has a set of training data
      ; it can be built automatically (see chapter 14.3 "Homograph disambiguation"
      ; in "The Festival Speech Synthese System" Edition 1.2)

      ;  a Scheme CART tree consist of nodes, and leaves
      ; the nodes consist of a question containing a feature pathname, an operator, and a value,
      ; plus an outcome-yes-node and an outcome-no-node. 


    ;;;
    (set! INST_LANG_token_pos_cart_trees
      '(;  Format is (Regex Tree) modèle allemand
      ("[0-9]+" ; digits only -> cardinal, ordinal or year?
          ((punc matches "\\..*") ; number followed by a "." or 3 
            ((n.lisp_INST_LANG_token_pos_guess is sos)
              ; next Token sentence start -> Cardinal
              ((p.name in french_year_indicator)
                ; year or cardinal?
                ((year))
                ((p.lisp_INST_LANG_token_pos_guess is month)
                  ((year)); juillet 1953
                  ((pp.name in (als1 jusqu)) ; ?? bof à meubler ..
                    ((year))
                    ((cardinal)))))
              ((n.name is 0) ; end of utterance?
                ((p.name in french_year_indicator)
                  ; year or cardinal?
                  ((year))
                  ((p.lisp_INST_LANG_token_pos_guess is month)
                    ((year))
                    ((pp.name in (als2)) ; equivalent français ?
                    ((year))
                    ; potentially disambiguate between ordinal and cardinal!
                    ((cardinal)))))
                ((p.lisp_INST_LANG_token_pos_guess is month)
                  ((year))
                  ((p.name in french_year_indicator)
                    ((year))
                    ((p.lisp_INST_LANG_token_pos_guess is numeric)
                      ((cardinal))
                      ((ordinal)))))))
            ((p.name in french_year_indicator) 
              ;; year or cardinal?
              ((year))
              ((p.lisp_INST_LANG_token_pos_guess is month)
                ((year))
                ((pp.name in (als jusque jusqu))
                  ((year)) ; jusqu'en 1987 1987 aura un token_pos à year
                  ((cardinal))))) ; 0123. 
            )
          )
  
    ))

        

    (provide 'INST_LANG_tokenpos)

