; INST_LANG_qtletter

(defvar RU)
(defvar result)

; for french_downcase_string
(require 'INST_LANG_utils)
; pour can_be_single_letter
(require 'INST_LANG_token_to_words_tools)

(define (letter token name)

	(let (QT reponse)
    (format t "\t\t\t\t\t\tici module letter sur %s\n" name)
    (if 
    	(and 
			(can_be_single_letter (french_downcase_string name))
	    	; on exclut les lettres dont le suivant porte l'apostrophe (au cas où,par ex si avant befapo)
			(if (null? (item.next token))
		   		t 
		   		(not (string-equal (item.feat token 'n.whitespace) "'")))
			; on exclut pour cause d'homophonie "M" M. Marguerite, Monsieur
			; on ne lève pas l'ambiguité...
			(not (string-equal (item.feat token 'punc ".") "."))
			(or (format t "\t\t\t\t\t\tici module letter: on répond\n") t)
			)
    	(begin 
    		(set! reponse t)
            (set! QT "QTletter")
            (set! RU (append RU (list name QT ";")))
            (set! result (list name))))

        (format t "we leave the module letter\n\n")
       reponse))

(provide 'INST_LANG_token_qt_letter)
