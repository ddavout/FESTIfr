; INST_LANG_qtletter

(defvar RU)
(defvar result)
(defvar fdnaw)
; for french_downcase_string, letter_list
(require 'INST_LANG_utils)
; pour can_be_single_letter
(require 'INST_LANG_token_to_words_tools)

(define (letter token name)

	(let (QT reponse lettre_seule)
    ;(format t "\t\t\t\t\t\tici module letter sur %s\n" name)
    (if 
	    	(or 
	    		(and 
		    		(member_string fdnaw letter_list)
		    		(item.feat token 'prepunctuation)
		    		(item.feat token 'punc)
		    		(or (set! lettre_seule t) t))
	    		
	    		(and 
	    			(not (item.prev token))
	    			(or (set! lettre_seule t) t))

	    		(and 
	    			(member_string (french_downcase_string (item.feat token 'p.name)) (list "un" "une" "des" "le" "ce" "cet" "cette" "ces" "lettres" "lettre" "signe" "signes"))
	    			(or (set! lettre_seule t) t))

		    	(and 
					(can_be_single_letter (french_downcase_string name))
			    	; on exclut les lettres dont le suivant porte l'apostrophe (au cas où,par ex si avant befapo)
					(if (null? (item.next token))
				   		t 
				   		(not (string-equal (item.feat token 'n.whitespace) "'")))
					; on exclut pour cause d'homophonie "M" M. Marguerite, Monsieur
					; on ne lève pas l'ambiguité...
					(not (string-equal (item.feat token 'punc ".") "."))
					))


    	(begin 
			(format t "\t\t\t\t\t\tici module letter: on répond sur |%s|\n" name)

    		(set! reponse t)
            (set! QT "QTletter")
            (set! RU (append RU (list name QT ";")))
            (if lettre_seule (item.set_feat token 'pos "NOM"))
            (set! result (list name))))

        (format t "we leave the module letter sur |%s|\n" name)
       reponse))

(provide 'INST_LANG_token_qt_letter)
