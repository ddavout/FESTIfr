; INST_LANG_qtletter

(defvar RU)
(defvar result)
(defvar fdnaw)
; for french_downcase_string, letter_list
(require 'INST_LANG_utils)
; pour can_be_single_letter
(require 'INST_LANG_token_to_words_tools)

(define (letter token name)

	(let (reponse lettre_seule)
    (format t "\t\t\t\t\t\tici module letter sur %s\n" name)
    (if (or 	
    		(and (member_string name letter_list)
			     (or 
			    	(and 
				    	(not (string-equal (item.feat token 'prepunctuation) ""))
				    	(not (string-equal (item.feat token 'punc) ""))
				    	(or (format t "ok1") t)
				    	(or (set! lettre_seule 1) t))
			    		
					(and 
						(not (string-matches (item.feat token 'whitespace) "  "))
							(or (format t "ok0") t)
							(or (set! lettre_seule 1) t))



			    	(and 
			    		(member_string (french_downcase_string (symbol->string (item.feat token 'p.name))) (list "un" "une" "des" "le" "ce" "cet" "cette" "ces" "lettres" "lettre" "signe" "signes"))
			    		(or (format t "ok3") t)
			    		(or (set! lettre_seule 1) t))))

	    	(and 
				(can_be_single_letter (french_downcase_string name))
		    	; on exclut les lettres dont le suivant porte l'apostrophe (au cas où,par ex si avant befapo)
				(if (null? (item.next token))
			   		t 
			   		(not (string-equal (item.feat token 'n.whitespace) "'")))
				; on exclut pour cause d'homophonie "M" M. Marguerite, Monsieur
				; on ne lève pas l'ambiguité...
				(not (string-equal (item.feat token 'punc ".") "."))
				(or (format t "ok5") t)
				))


	    	(begin 
	    		(if (equal? lettre_seule 1) 
	            	(begin 
	            		(item.set_feat token 'pos "NOM")
	            		(set! reponse t )
	            		(format t "\t\t\t\t\t\tici module letter: on répond sur |%s|\n" name)
	            		(set! QT "QTletter")
	            		(ru token name)
	            		; sans certitude on laisse poslex
	                    (set! result (list name)))
	    			(begin
	    				(if (string-equal fdnaw "y")
	    					(begin 
			            		(format t "\t\t\t\t\t\tici module letter: on répond sur |%s|\n" name)
	            				(set! QT "QTletter")
	            				(ru token name)
	            				; bon compromis PRO:per ou ADV
	    						(item.set_feat token 'pos "ADV")
	    						(set! reponse t )
	    						(set! result (list name)))
	    	    			(begin
			    				(if (string-equal fdnaw "à")
			    					(begin 
					            		(format t "\t\t\t\t\t\tici module letter: on répond sur |%s|\n" name)
			            				(set! QT "QTletter")
			            				(ru token name)
			            				; bon compromis PRO:per ou ADV
			    						(item.set_feat token 'pos "PRE")
			    						(set! reponse t )
			    						(set! result (list name)))

			    					(begin 
			    						(if (string-equal fdnaw "a")
			    							(begin 
							            		(format t "\t\t\t\t\t\tici module letter: on répond sur |%s|\n" name)
					            				(set! QT "QTletter")
					            				(ru token name)
					            				; bon compromis PRO:per ou ADV
					    						(item.set_feat token 'pos "PRE")
					    						(set! reponse t )
					    						(set! result (list name)))))


			    					)))))))


        (format t "we leave the module letter sur |%s|\n" name)
       reponse))

(provide 'INST_LANG_token_qt_letter)
