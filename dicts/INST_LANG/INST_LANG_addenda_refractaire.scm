(defvar verbose_addendas)
(if verbose_addendas (format t "addenda_refractaire.scm loaded"))
(lex.add.entry '( "" nil nil))
;; à ranger ici avant migration possible vers poslex ou éliminaion...
; ( "m_en" ( ( PRO:per 0) )()) ; SIWIS                   
; ( "m_y" ( ( PRO:per -2.912) )()) ; SIWIS
; ( "t_en" ( ( PRO:per 0) )())
; ( "t_à" ( ( PRE -0.804) )()) ; addenda neut_parl_s06_0669       
; ( "n_en" (( ADV -2.384))()) ; SIWIS                   
; ( "n_es" (( VER -2.384))()) ; neut_book_s01_0006                   
; ( "n_est" (( VER -2.384))()) 
; ( "n_est_pas" (( VER -2.384))()) ; SIWIS                   
; ( "n_importe_comment" (( ADV 0))()) 
; ( "n_importe_où" (( ADV 0))()) 
; ( "n_importe_quel" (( ART:ind 0))()) 
; ( "n_importe_quelle" (( ART:ind 0))()) ; SIWIS                   
; ( "n_importe_qui" (( PRO:ind 0))()) 
; ( "n_ont" (( AUX -1.401) ( VER -2.707))()) ; SIWIS                
; ( "n_y" (( ADV -4.000))()) ;                    
; ( "n_y_a" (( AUX -1.000) ( VER -1.000))()) ; neut_book_s01_0119                
; ( "n_y_en" (( ADV -4.000))()) ;                    
; ( "n_y_en_a" (( AUX -0.616) ( VER -1.569))()) ; neut_book_s01_0119                
; ( "n_étaient" (( VER -2.384))()) 
; ( "n_était" (( VER -2.384))()) ; SIWIS 

; ( "et_caetera" ( ( ADV -5.509) )()) 
; ( "et_cetera" ( ( ADV -4.893) )()) 
; ( "et_hop" ( ( ONO -0.524) )()) 


; ( "_y" ( ( ADV -4.953) ( PRO:per -5.953) )()) ; artifice addenda sans liaison ; TODO compléter; vérifier         
; ( "a_" ( ( AUX -0.616) ( VER -1.569) )()) ; SIWIS                
; ( "a_t_elle" ( ( AUX -0.616) ( VER -0.616) )()) ; SIWIS                
; ( "a_t_il" ( ( AUX -0.516) ( VER -0.516) )()) ; SIWIS    

;;;;;
(lex.add.entry '( "pour" nil ((("p" "u" "rh") 0))))
(lex.add.entry '( "aprè" nil ((("a") 0) (("p" "rh" "eh") 0))))
(lex.add.entry '( "ceci" nil ((("s" "ae") 0) (("s" "i") 0))))
(lex.add.entry '( "en_fait" nil (((ahn)0)((f eh t)0))))
(lex.add.entry '( "après" nil ((("a")0)((p rh eh)0))))
(lex.add.entry '( "au_dedans" nil ((("o")0)(("d" "ae")0)(("d" "ahn")0))))
(lex.add.entry '( "hors" nil ((("oh" "rh")0)))) ; toDO
(lex.add.entry '( "au_dehors" nil ((("o")0)(("d" "ae")0)(("oh" "rh")0))))
(lex.add.entry '( "au_dessous" nil ((("o")0)(("d" "ae")0)(("s" "u")0))))
(lex.add.entry '( "au_dessus" nil ((("o")0)(("d" "ae")0)(("s" "y")0))))
(lex.add.entry '( "au_devant" nil ((("o")0)(("d" "ae")0)(("v" "ahn")0))))
(lex.add.entry '( "au_fur_et_à_mesure" nil ((("o")0)((f y rh)0)((e)0)((a)0)((m ae)0)((z y rh)0))))
(lex.add.entry '( "depuis" nil (((d ae)0)((p hw i)0))))
(lex.add.entry '( "nonobstant" nil (((n ohn)0)((n oh b)0)((s t ahn)0))))
(lex.add.entry '( "par_dessus" nil (((p a rh)0)(("d" "ae")0)(("s" "y")0))))
(lex.add.entry '( "avec" nil ((("a")0)(("v" "eh" "k")0)))); prends ça avec. ??
(lex.add.entry '( "donc" nil ((("d" "ohn" "k") 0))))
(lex.add.entry '( "peut_être" nil ((("p" "oe") 0) (("t" "eh" "t" "rh") 0))))


; mots utilisés dans word_list

;;  mots ex fre_symbols_tab_default
;(lex.add.entry '( "
; TODO avantage ? fre_symbols_tab_default
; symbols hors ponctuation et (y compris double bits pour voir)
;(lex.add.entry '( "+" nil (((p l y s)0))))
;(lex.add.entry '( ">" nil (((s y)0) ((p e)0) ((r j oe rh)0))))
;(lex.add.entry '( "<" nil (((ehn)0) ((f eh)0) ((r j oe rh)0))))
;(lex.add.entry '( "/" nil (((
;(lex.add.entry '( "=" nil (((
;(lex.add.entry '( "$" nil (((
;(lex.add.entry '( "¢" nil (((
;(lex.add.entry '( "%" nil (((
(lex.add.entry '( "%" nil (((p u rh)0)((s ahn)0))))
;(lex.add.entry '( "§" nil (((
;(lex.add.entry '( "#" nil (((
;
;(lex.add.entry '( "*" nil (((
;(lex.add.entry '( "~" nil (((
;(lex.add.entry '( "^" nil (((
;(lex.add.entry '( "@" nil (((
;(lex.add.entry '( "&" nil (((
;(lex.add.entry '( "|" nil (((
(lex.add.entry '( "€" nil (((eu)0) ((rh o)0))))
(lex.add.entry '( "." SENT (((pau)0))))
(lex.add.entry '( "(" nil (((pau pau pau)0))))
(lex.add.entry '( ")" nil (((pau pau pau)0))))
(lex.add.entry '( "etc" nil (((eh t)0) ((s e)0) ((t e)0) ((rh a)0))))
(lex.add.entry '( "—" nil nil))
(lex.add.entry '( "’" nil nil))
(lex.add.entry '( "…" nil nil))
(lex.add.entry '( "-" nil nil))

; silences utilisés dans word_lists TODO pour épeler
(lex.add.entry '( "_ﬂ" "nil" (((pau)0))))

; artifices norm
(lex.add.entry '( "_euro" nil ((("eu") 0) (("rh" "o") 0))))
(lex.add.entry '( "_" nil nil))
(lex.add.entry '( "_o" nil (((d ae)0)((g rh e)0))))
; TODO un _cent 
(lex.add.entry '( "_cent" nil (((s eh n s)0))))
(lex.add.entry '( "_yen" nil (((j eh n)0))))
(lex.add.entry '( "r_o" nil ((("rh" "eh")0)(("k" "t_o" "o")0))))
(lex.add.entry '( "f_o" nil ((("f" "oh")0)(("l" "j_o" "o")0))))
(lex.add.entry '( "n_o" nil (((n y)0) ((m e )0) (( rh o)0))))
(lex.add.entry '( "C_o" nil (((s eh l)0)((s j y s)0)))); C°
(lex.add.entry '( "pourcent" nil (((p u rh)0)((s ahn)0)))) ; %




; grammaire
(lex.add.entry '( "ne" nil (((n ae)0))))

(lex.add.entry '( "a_VER" VER ((("a")0))))
(lex.add.entry '( "as_VER" VER ((("a")0))))
(lex.add.entry '( "a_AUX" AUX ((("a")0))))
(lex.add.entry '( "as_AUX" AUX ((("a")0))))
(lex.add.entry '( "ai" nil ((("eh")0))))
(lex.add.entry '( "auron" nil ((("o") 0) (("rh" "ohn") 0))))
(lex.add.entry '( "a_t_elle" nil ((("a" )0) (("t" eh "l") 0))))
(lex.add.entry '( "aura_t_il" nil ((("o") 0) (("rh" "a") 0) (("t" "i" "l") 0))))
(lex.add.entry '( "es_AUX" AUX ((("eh")0))))
(lex.add.entry '( "es_VER" VER ((("eh")0))))
(lex.add.entry '( "c_étè" nil (((s e)0)((t eh)0))))
(lex.add.entry '( "c_étaient" nil (((s e)0)((t eh)0))))
(lex.add.entry '( "est_AUX" AUX (((eh)0))))
(lex.add.entry '( "est_VER" VER (((eh)0))))
(lex.add.entry '( "eû" nil ((("y") 0))))
(lex.add.entry '( "eut" nil ((("y")0))))
(lex.add.entry '( "fût" nil ((("f" "y")0))))
(lex.add.entry '( "fut" nil ((("f" "y")0))))
(lex.add.entry '( "dû" nil ((("d" "y") 0))))

(lex.add.entry '( "s_est" nil (((s eh)0))))
(lex.add.entry '( "s_étaient" nil (((s e)0)((t eh)0))))
(lex.add.entry '( "s_était" nil (((s e)0)((t eh)0))))
(lex.add.entry '( "t_es_AUX" AUX (((t "eh")0))))

(lex.add.entry '( "t_es_VER" VER (((t eh)0))))
(lex.add.entry '( "êtes_vou" nil ((("eh" "t") 0) (("v" "u") 0)))); et non pas t eh s v u

(lex.add.entry '( "j_ai" nil (((zh eh)0)))) ; important
(lex.add.entry '( "n_ai" nil (((n e)0)))) ; important sinon core dump neut_parl_s01_0266
(lex.add.entry '( "j_aie" nil (((zh eh)0)))) ; important sinon core dump neut_parl_s01_0266
(lex.add.entry '( "j_en" nil (((zh ahn)0))))
(lex.add.entry '( "j_irai" nil (((zh i)0)((rh e)0)))) ; important évite pb de dépendre de la LTS
(lex.add.entry '( "j_irais" nil (((zh i)0)((rh eh)0)))) ; important
(lex.add.entry '( "j_y" nil ((("zh" "i")0))))
(lex.add.entry '( "je" nil ((("zh" "ae")0))))
(lex.add.entry '( "l_ai" nil (((l eh)0))))

(lex.add.entry '( "cette" nil (((s eh t)0))))
(lex.add.entry '( "c_en" nil ((("s" "ahn") 0))))
(lex.add.entry '( "ce_PRO:dem" PRO:dem ((("s" "ae") 0))))  
(lex.add.entry '( "ce_ADJ:dem" ADJ:dem ((("s" "ae") 0))))  
(lex.add.entry '( "ces_ADJ:dem" ADJ:dem ((("s" "e")0))))
; ne suffit pas(lex.add.entry '( "ceux-ci" nil ((("s" "eu")0)(("s" "i")0))))
(lex.add.entry '( "ceux-ci" nil ((("s" "eu")0)(("s" "i")0))))
(lex.add.entry '( "celle_là" nil (((s eh)0)((l ae)0)((l a)0))))

(lex.add.entry '( "les_PRO:per" "PRO:per" (((l e)0))))
(lex.add.entry '( "les" "ADJ:def" (((l e)0))))
(lex.add.entry '( "où" nil (((u)0))))

(lex.add.entry '( "le" nil (((l ae)0))))
(lex.add.entry '( "la" nil ((("l" "a") 0))))
(lex.add.entry '( "de_PRE" PRE (((d ae)0))))
(lex.add.entry '( "de_ART:ind" ART:ind (((d ae)0))))
(lex.add.entry '( "des_ART:ind" "ART:ind" (((d e)0))))

(lex.add.entry '( "leur" nil ((("l" "oe" "rh")0))))
(lex.add.entry '( "ma" nil ((("m" "a")0))))
(lex.add.entry '( "me" nil (((m "ae")0))))
(lex.add.entry '( "mes_ADJ:pos" ADJ:pos ((("m" "e")0))))
(lex.add.entry '( "mon" nil ((("m" "ahn")0))))
(lex.add.entry '( "nou" nil (((n u)0))))
(lex.add.entry '( "un" nil ((("oen")0))))
(lex.add.entry '( "du" nil ((("d" y)0))))
(lex.add.entry '( "no" nil ((("n" "o")0))))
(lex.add.entry '( "eu" nil (((y)0))))
(lex.add.entry '( "eux"  "PRO:per" (((eu)0))))
(lex.add.entry '( "vôtre" nil ((("v" "o" "t" "rh")0))))
(lex.add.entry '( "nôtre" nil ((("n" "o" "t" "rh")0))))
(lex.add.entry '( "notre" nil ((("n" "oh" "t" "rh")0))))
(lex.add.entry '( "votre" nil ((("v" "oh" "t" "rh")0))))

(lex.add.entry '( "vous_même" nil ((("v" "u") 0) (("m" "eh" "m") 0))))
(lex.add.entry '( "nous_même" nil (((n u)0)((m eh m)0))))


(lex.add.entry '( "eu" nil (((y)0))))
(lex.add.entry '( "eux"  "PRO:per" (((eu)0))))

; tous à revoir tokenizer et exceptions
(lex.add.entry '( "tous_PRO:ind" PRO:ind (((t u s)0))))
(lex.add.entry '( "tous_ADJ:ind" "ADJ:ind" (((t u s) 0))))
(lex.add.entry '( "tous_le" nil ((("t" "u")0)(("l")0))))


(lex.add.entry '( "quelque" nil ((("k" "eh" "l")0) (("k" ae) 0))))
(lex.add.entry '( "qui" nil ((("k" "i") 0))))

; y compris "locutions" primordiales
(lex.add.entry '( "et" nil (((e)0))))
(lex.add.entry '( "en" nil ((("ahn")0))))
(lex.add.entry '( "dans_PRE" "PRE" ((("d" ahn) 0))))

(lex.add.entry '( "j_en" nil ((("zh" "ahn") 0))))
(lex.add.entry '( "m_en" nil ((("m" "ahn") 0)))); et non m ehn
(lex.add.entry '( "t_en" nil ((("t" "ahn") 0))))
(lex.add.entry '( "s_en" nil ((("s" "ahn") 0))))
(lex.add.entry '( "l_en" nil ((("l" "ahn") 0))))
(lex.add.entry '( "n_en" nil (((n ahn)0))))
(lex.add.entry '( "y_en" nil (((j ahn)0))))
(lex.add.entry '( "y_a" nil ((("j" "a") 0))))

(lex.add.entry '( "c_est" nil ((("s" "eh") 0))))
(lex.add.entry '( "n_est" nil ((("n" "eh") 0))))
(lex.add.entry '( "n_es_AUX" AUX ((("n" "eh") 0))))
(lex.add.entry '( "n_es_VER" VER ((("n" "eh") 0))))
(lex.add.entry '( "il_y_aura" nil ((("i") 0) (("l" j "oh") 0) (("rh" "a") 0))))

(lex.add.entry '( "t_on" nil (((t ohn)0))))
(lex.add.entry '( "t_il" nil ((("t" "i" l)0))))
(lex.add.entry '( "l_ai" nil (((l eh)0))))
(lex.add.entry '( "l_une" nil ((("l" "y" "n")0))))
(lex.add.entry '( "l_un" nil ((("l" "oen")0))))
(lex.add.entry '( "l_on" nil ((("l" "ohn")0))))

(lex.add.entry '( "z_en" nil (((z ahn)0))))
(lex.add.entry '( "d_où" nil (((d u)0))))

(lex.add.entry '( "assez_ADV" ADV (((a)0)((s e)0))))
; TODO "assez de" locution comme du ART:def 
(lex.add.entry '( "a_t_il" nil ((("a") 0) ((t "i" "l") 0))))
(lex.add.entry '( "afin_de" PRE (((a)0)((f ehn)0)((d ae)0)))) ; si dans liste de locutions /!\ addenda ou revoir règle de liaisons
(lex.add.entry '( "afin_que" CON (((a)0)((f ehn)0)((k ae)0)))); ; si dans liste de locutions /!\ addenda
(lex.add.entry '( "c_est_à_dire" nil ((( s eh)0) ((t a )0) (( d i rh)0))))
(lex.add.entry '( "en_plus" nil (((ahn)0)(("p" "l" "y")0))))
(lex.add.entry '( "de_plus" nil (((d ae)0)((p l y s)0))))
(lex.add.entry '( "n_est_ce" nil ((("n" "eh" "s" )0) )));
(lex.add.entry '( "n_est_pa" nil ((("n" "eh")0)(("p" "a")0))))
(lex.add.entry '( "n_est_ce_pa" nil (((n eh s)0) ((p a)0)))) 
(lex.add.entry '( "est_ce" nil ((("eh")0)(("s" "ae")0))))
(lex.add.entry '( "desquel" nil ((("d" e) 0) (("k" "eh" "l") 0))))

(lex.add.entry '( "n_importe_comment" nil ((("n" "ehn") 0) (("p" "oh" "rh" "t") 0) (("k" "oh")0) (("m" ahn) 0))))
(lex.add.entry '( "n_importe_où" nil ((("n" "ehn") 0) (("p" "oh" "rh") 0) (("t" "u") 0))))
(lex.add.entry '( "n_importe_quand" nil ((("n" "ehn") 0) (("p" "oh" "rh" "t") 0) (("k" "ahn") 0))))
(lex.add.entry '( "n_importe_quel" nil ((("n" "ehn") 0) (("p" "oh" "rh" "t") 0) (("k" "eh" "l") 0))))
(lex.add.entry '( "n_importe_quelle" nil ((("n" "ehn") 0) (("p" "oh" "rh" "t") 0) (("k" "eh" "l") 0))))
(lex.add.entry '( "n_importe_qui" nil ((("n" "ehn") 0) (("p" "oh" "rh" "t") 0) (("k" "i") 0))))
(lex.add.entry '( "n_importe_quoi" nil  (((n ehn)0) ((p oh rh)0) ((t ae)0) ((k w a)0))))
(lex.add.entry '( "n_y" nil ((("n" "i") 0))))
(lex.add.entry '( "n_y_a" nil ((("n" "j" "a") 0))))
(lex.add.entry '( "n_y_en" nil ((("n" "j" "ahn") 0))))
(lex.add.entry '( "n_y_en_a" nil ((("n" "j" "ahn") 0)((n a)0))))
(lex.add.entry '( "ne_plu" nil ((("n" "ae") 0) (("p" "l" "y") 0))))
(lex.add.entry '( "prends_en" nil (((p rh ahn)0) ((z ahn)0))))
(lex.add.entry '( "qu_a" nil (((k a)0))))
(lex.add.entry '( "qu" nil ((("k" "ae") 0))))
(lex.add.entry '( "qu’à" nil ((("k" "a") 0))))

(lex.add.entry '( "qu_afin" nil (((k a)0)((f ehn)0))))
(lex.add.entry '( "qu_au" nil (((k o)0))))
(lex.add.entry '( "qu_aucun" nil (((k o)0)((k oen)0))))

(lex.add.entry '( "qu_aucune" nil (((k o)0)((k y n)0))))
(lex.add.entry '( "qu_aussi" nil (((k o)0)((s i)0))))
(lex.add.entry '( "qu_aussitôt" nil (((k o)0)((s i)0)((t o)0))))
(lex.add.entry '( "qu_avec" nil (((k a)0)((v eh k)0))))
(lex.add.entry '( "qu_elle" nil (((k eh l)0))))
(lex.add.entry '( "qu_en" nil (((k ahn)0))))
(lex.add.entry '( "qu_est_ce" nil (((k eh s)0))))
(lex.add.entry '( "qu_es_VER" VER (((k eh)0)))); à cause du s final
(lex.add.entry '( "qu_a_t_il" nil ((("k" "a") 0) (("t" "i" "l") 0))))
(lex.add.entry '( "qu_eux_PRO:per" nil ((("k" "eu")0))))

(lex.add.entry '( "qu_il" nil (((k i l)0))))
;(lex.add.entry '( "qu_ils" "PRO:per" (((k i l)0))))
(lex.add.entry '( "qu_on_PRO:per" "PRO:per"  (((k ohn)0)))); important
(lex.add.entry '( "qu_un" nil (((k oen)0))))

(lex.add.entry '( "qu_une" nil (((k y n)0))))
(lex.add.entry '( "quant_à" nil (((k ahn)0) ((t a) 0))))
(lex.add.entry '( "que" nil (((k ae)0))))
(lex.add.entry '( "quelqu" nil ((("k" "eh" "l" "k")0))))
(lex.add.entry '( "quelqu_un" nil ((("k" "e" "l") 0) (("k" "ehn") 0))))
(lex.add.entry '( "quelque" nil (((k eh l)0)((k ae)0))))
(lex.add.entry '( "quelques_un" nil (((k e l)0)((k ae)0)((z ehn)0))))
(lex.add.entry '( "quelques_une" nil ((("k" "eh" "l") 0) (("k" "eh") 0) (("s" "y" "n") 0))))
(lex.add.entry '( "quoique" nil (((k w a)0)((k ae)0))))
(lex.add.entry '( "s_y" nil ((("s" "i")0))))
(lex.add.entry '( "sa" nil ((("s" "a")0))))
(lex.add.entry '( "sans_PRE" "PRE" (((s ahn)0)))) 
(lex.add.entry '( "se" "PRO:per" ((("s" ae) 0))))
(lex.add.entry '( "se" nil (((s ae)0))))
(lex.add.entry '( "ses_ADJ:pos" ADJ:pos ((("s" "e") 0))))
(lex.add.entry '( "son" nil ((("s" "ohn")0))))
(lex.add.entry '( "t_a" nil ((("t" "a") 0))))
(lex.add.entry '( "t_y" nil ((("t" "i")0))))
(lex.add.entry '( "ta" nil ((("t" "a")0))))
(lex.add.entry '( "te" nil (((t ae)0))))
(lex.add.entry '( "tes_ADJ:pos" ADJ:pos ((("t" "e") 0))))
(lex.add.entry '( "tout_à_l" nil ((("t" "u") 0) (("t" "a" "l") 0))))
(lex.add.entry '( "vo" nil ((("v" "o")0))))
(lex.add.entry '( "vou" nil (((v u)0))))
(lex.add.entry '( "y_a_t_il" nil ((("j" "a") 0) (("t" "i" "l") 0))))
(lex.add.entry '( "y_avait_il" nil ((("i") 0) (("a") 0) (("v" "eh") 0) (("t" "i" "l") 0))))
(lex.add.entry '( "y_avait_t_il" nil ((("i") 0) (("a") 0) (("v" "eh") 0) (("t" "i" "l") 0)))); incorrect
(lex.add.entry '( "par_dessu" nil ((("p" "a" "rh") 0) (("d" "ae") 0) (("s" "y") 0))))
(lex.add.entry '( "la_plupart_de" nil (((p l y) 0) ((p a rh) 0) ((d ae) 0))))
(lex.add.entry '( "la_plupart_du" nil (((p l y) 0) ((p a rh) 0) ((d y) 0))))
(lex.add.entry '( "dessu" nil (((d ae)0) ((s y) 0))))
(lex.add.entry '( "jusque" nil  (((zh y s)0)((k ae)0))))
(lex.add.entry '( "jusqu_en" nil (((zh y s)0)((k o)0))))

(lex.add.entry '( "jusqu_où" nil (((zh y s)0)((k u)0))))
(lex.add.entry '( "jusqu_à" nil (((zh y s)0)((k a)0))))
(lex.add.entry '( "où" nil (((u)0))))
(lex.add.entry '( "en_effet" nil (((ahn)0)((n e)0)((f eh)0))))
(lex.add.entry '( "puisque" nil  (((p "hw" i s)0)((k ae)0))))
(lex.add.entry '( "parce_que" nil (((p a rh)0)((s ae)0)((k ae)0))))
(lex.add.entry '( "alors_que" nil (((a)0)((l oh rh)0)((k ae)0))))
(lex.add.entry '( "pendant_que" nil  (((p ahn)0)((d ahn)0)((k ae)0))))
(lex.add.entry '( "alors" nil (((a)0)((l oh rh)0))))
(lex.add.entry '( "point" nil (((p w ehn)0))))
(lex.add.entry '( "plus_ou_moins" nil ((("p" "l" "y")0)((z u)0)((m w ehn)0))))
(lex.add.entry '( "çà" nil ((("s" "a") 0))))
(lex.add.entry '( "tandis_qu" nil  (((t ahn)0)((d i)0))))

;;





(lex.add.entry '( "cinq_ADJ:num" "ADJ:num" (((s ehn k) 0))))
(lex.add.entry '( "cinq_NOM" NOM ((("s" "ehn" k) 0))))
(lex.add.entry '( "cinq_PRO:ind" PRO:ind ((("s" "ehn" k) 0))))
(lex.add.entry '( "cinquante" nil (((s ehn)0)((k ahn t)0))))
(lex.add.entry '( "deu" nil ((("d" "eu") 0))))
(lex.add.entry '( "deux_" nil (((d eu)0)))) ; ?? changement dans superlts ?
; TODO pas besoin de mettre tous les POS possibles ?
(lex.add.entry '( "dix_ADJ:num" ADJ:num (((d i)0))))
(lex.add.entry '( "dix_NOM" NOM (((d i s)0))))
(lex.add.entry '( "dix_PRO:ind" PRO:ind (((d i s)0))))
(lex.add.entry '( "douze" nil (((d u z)0))))
(lex.add.entry '( "huit_ADJ:num" "ADJ:num" ((("hw" i)0)))); régler liaisons
(lex.add.entry '( "huit_NOM" NOM ((("hw" i)0)))); régler liaisons
(lex.add.entry '( "huit_PRO:ind" PRO:ind ((("hw" i t)0)))); régler liaisons
(lex.add.entry '( "neuf" NOM ((("n" "oe" "f")0)))) 
(lex.add.entry '( "neuf" nil ((("n" "oe" "f")0)))) 
(lex.add.entry '( "sept" nil ((("s" "eh" "t") 0)))); et non pas un s e p
(lex.add.entry '( "six" nil (((s i s)0))))
(lex.add.entry '( "six_ADJ:num" ADJ:num ((("s" i) 0))))
(lex.add.entry '( "six_NOM" NOM ((("s" i s) 0))))
(lex.add.entry '( "six_PRO:ind" PRO:ind ((("s" i s) 0))))
(lex.add.entry '( "soixante" nil (((s w a)0)((s ahn t)0)))) ; pour french_number
(lex.add.entry '( "soixante-et-onze" nil (((s w a)0)((s ahn t)0)((e)0)((ohn z)0)))) ; pour french_number
(lex.add.entry '( "treize" nil (((t rh eh z)0))))
(lex.add.entry '( "troi" nil ((("t" "rh" "w" "a") 0))))
(lex.add.entry '( "trois_ADJ:num" "ADJ:num" ((("t" "rh" "w" "a") 0))))
;(lex.add.entry '( "un" nil ((("oen")0))))
(lex.add.entry '( "vingt" nil ((("v" "ehn") 0))))
(lex.add.entry '( "vingt_et_une" nil ((("v" "ehn")0) (("t" "e") 0) (("y" "n") 0))))
(lex.add.entry '( "vingt" nil (((v ehn)0)))) ; INST_LANG_number + VER ; TODO revoir INST_LANG_number
; TODO à revoir tiret
(lex.add.entry '( "vingt-et-un" nil (((v ehn)0)((t e)0)((ehn)0))))
(lex.add.entry '( "vingt-et-une" nil (((v ehn)0)((t e)0)((y n)0))))
(lex.add.entry '( "vingt_cinq" nil (((v ehn t)0)((s ehn)0)))) ; INST_LANG_number
(lex.add.entry '( "vingt_deux" nil (((v ehn t)0)((d eu)0)))) ; INST_LANG_number
(lex.add.entry '( "vingt_huit" nil (((v ehn t)0)((h w i)0)))) ; INST_LANG_number
(lex.add.entry '( "vingt_neuf" nil (((v ehn t)0)((n oe f)0)))) ; INST_LANG_number
(lex.add.entry '( "vingt_quatre" nil (((v ehn t)0)((k a t rh)0)))) ; INST_LANG_number
(lex.add.entry '( "vingt_sept" nil (((v ehn t)0)((s eh t)0)))) ; INST_LANG_number
(lex.add.entry '( "vingt_six" nil (((v ehn t)0)((s i)0)))) ; INST_LANG_number
(lex.add.entry '( "vingt_troi" nil (((v ehn t)0)((t rh w a)0)))) ; INST_LANG_number
(lex.add.entry '( "trente_neuf" nil ((("t" "rh" "ahn" "t") 0) (("n" "eu" "f") 0))))

(lex.add.entry '( "cent" nil (((s ahn)0))))
(lex.add.entry '( "mille" nil (((m i l)0))))

; ordinaux
(lex.add.entry '( "zéroième" nil ((("z" "e")0)(("rh" "o")0)((j "eh" "m")0))))
(lex.add.entry '( "deuxième" nil ((("d" "eu") 0) (("z" "j" "eh" "m") 0))))
(lex.add.entry '( "sixième" nil ((("s" "i") 0) (("z" "j" "eh" "m") 0))))

;; romains
(lex.add.entry '( "Ier" NOM (((p rh ae)0) ((m j e)0))))
(lex.add.entry '( "Ie" NOM (((p rh ae)0) ((m j e)0))))
(lex.add.entry '( "Ière" NOM (((p rh ae)0) ((m j eh rh)0))))
(lex.add.entry '( "XXIe" nil (((v ehn)0)((t e)0)((y)0)((n j eh m)0))))
(lex.add.entry '( "XXe" nil (((v ehn)0)((t j eh m)0))))


;; lettre et mots de 1 caractère ; TODO réviser finir


(lex.add.entry '( "a_NOM" NOM ((("a")0))))

(lex.add.entry '( "B" NOM (((b e)0)))); vitamine B12
(lex.add.entry '( "C_NOM" NOM ((("s" "e") 0) (("m" "a") 0) (("zh" "y" "s") 0) (("k" "y" "l") 0))))
(lex.add.entry '( "c_NOM" NOM ((("s" "e") 0) (("m" "i") 0) (("n" "y" "s") 0) (("k" "y" "l") 0))))
(lex.add.entry '( "e" nil ((("ae")0))))
(lex.add.entry '( "e_NOM" NOM ((("ae")0))))
(lex.add.entry '( "i" NOM ((("i") 0))))
(lex.add.entry '( "o" NOM ((("o") 0))))
(lex.add.entry '( "m" NOM ((("eh" m) 0))))
(lex.add.entry '( "u" nil ((("y") 0))))
(lex.add.entry '( "x" NOM ((("i" "k" "s") 0))))
(lex.add.entry '( "y" nil ((("i") 0))))
(lex.add.entry '( "y_NOM" NOM ((("i") 0)((g rh eh k)))))
(lex.add.entry '( "à" nil ((("a") 0))))
(lex.add.entry '( "è" nil ((("eh") 0))))
(lex.add.entry '( "è" nil (((eh)0))));
(lex.add.entry '( "é" nil ((("e") 0))))
(lex.add.entry '( "s_NOM" "NOM" (((eh s)0))))
(lex.add.entry '( "x" NOM ((("i" "k" "s") 0))))

;; à voir

(lex.add.entry '( "c" "PRO:dem"  nil))
(lex.add.entry '( "d" "PRE" nil))
(lex.add.entry '( "l" "ART:def" nil))
(lex.add.entry '( "s" "PRO:per" nil))
(lex.add.entry '( "j" "PRO:per" nil))
(lex.add.entry '( "m" "PRO:per" nil))
(lex.add.entry '( "t" "PRO:per" nil))



;; unités internationales ou pas
(lex.add.entry '( "Hz" nil (((eh rh t z)0))))
(lex.add.entry '( "kHz" nil (((k i)0)((l o)0)((eh rh t z)0))))
(lex.add.entry '( "volt" nil ((("v" "oh" "l" "t") 0)))) ; et non v oh l
(lex.add.entry '( "Hertz" nil (((eh rh t s)0))))

;;
(lex.add.entry '( "adj" NOM ((("a") 0) (("d" "zh" "eh" "k") 0) (("t" "i" "f") 0))))

;; url
(lex.add.entry '( "www" nil ((("d" "u" "b" "l")0)(("v" e)0)(("d" "u" "b" "l")0)(("v" e)0)(("d" "u" "b" "l")0)(("v" e)0))))
(lex.add.entry '( "fr" nil ((("eh" "f")0) ((eh "rh") 0))))
(lex.add.entry '( "http" nil (((a sh)0) ((t e)0)((t e)0)((p e)0))))
(lex.add.entry '( "https_NOM" nil (((a sh)0) ((t e)0)((t e)0)((p e)0) (eh s)0))); avec déclaration dans poslex
(lex.add.entry '( "ftp" nil (((eh f)0) ((t e)0) ((p e)0))))
(lex.add.entry '( "ftps_NOM" nil (((eh f)0) ((t e)0) ((p e)0) ((eh s)0)))); après déclaration dans poslex
(lex.add.entry '( "mail" nil (((m eh l)0))))
(lex.add.entry '( "url" nil (((y)0)((eh rh)0)((eh l)0))))
(lex.add.entry '( "l_url" nil (((l y)0)((eh rh)0)((eh l)0))))
(lex.add.entry '( "d_url" nil (((d y)0)((eh rh)0)((eh l)0))))

; sigles, abréviations, acronymes
(lex.add.entry '( "ok" nil (((o)0) ((k eh)0))))
(lex.add.entry '( "ko" nil (((k a)0) ((o)0))))
(lex.add.entry '( "cf" nil (((k ohn)0) ((f eh rh)0))))
(lex.add.entry '( "confer" nil (((k ohn)0) ((f eh rh)0)))) ; cf.
(lex.add.entry '( "MM" nil (((m e)0)((s j eu)0)))); normaalement suivi d'un point !

; abréviations avec/sans point final
; avec unicode ou non
(lex.add.entry '( "abc" nil (((a)0)((b e)0)((s e)0))))
(lex.add.entry '( "tv" nil (((t e)0)((l e)0))))
(lex.add.entry '( "dvd" nil (((d e)0)((v e)0)((d e)0))))
(lex.add.entry '( "etc" nil (((eh t)0)((s e)0)((t e)0)((rh a)0))))
(lex.add.entry '( "ex" nil (((eh k s)0))))
(lex.add.entry '( "ft" "NOM" ((("f_oe" j)0)((j "eh" "oe" j)0)((j "eh")0))))
(lex.add.entry '( "POS" nil (((p o s)0))))

; mois TODO check
;; mois
;; pour Jan. voir 
(lex.add.entry '( "Jan" "year" (((zh ahn)0)((v j e)0)))) 

; titres
(lex.add.entry '( "Mr" nil (((m i s)0)((t oe rh)0))))
(lex.add.entry '( "Dr" nil (((d oh k)0)((t oe rh)0))))
;(lex.add.entry '( "Me" titre (((m eh t rh)0))))
(lex.add.entry '( "mlles_NOM" NOM ((("m" "e" "d")0)(("m" "w" a)0)(("z" "eh" "l")0))))
(lex.add.entry '( "mlles_ADJ" ADJ ((("m" "e" "d")0)(("m" "w" a)0)(("z" "eh" "l")0))))
(lex.add.entry '( "mlle" nil ((("m" a "d")0)(("m" "w" a)0)(("z" "eh" "l")0))))
(lex.add.entry '( "S.M" nil ((("s" a)0)(("m" a)0)((zh eh s)0)(("t" "e")0))))


;; devises
(lex.add.entry '( "cèn" nil (((s eh n t s)0))))
(lex.add.entry '( "cèn_NOM" NOM (((s eh n t s)0))))
; pb du sing/pluriel non résolu ...
; yen sen et sens
(lex.add.entry '( "yen" nil (((j eh n)0))))
(lex.add.entry '( "sèn" nil (((s eh n)0))))
(lex.add.entry '( "sèns" nil (((s eh n)0))))






;; homographes de INST_LANG_tokenpos par accroissement de vocabulaire

(lex.add.entry '( "fils_NOM" NOM ((("f" "i" "s")0))))
(lex.add.entry '( "fil" nil ((("f" "i" "l")0)))) ; au fil de l'eau
(lex.add.entry '( "fils_fil" NOM ((("f" "i" l) 0)))) ; les fils de lin
(lex.add.entry '( "fils_fis_NOM" "NOM" (((f i s)0))))

(lex.add.entry '( "maintenant" nil ((("m" "ehn" "t") 0) (("n" "ahn") 0))))


(lex.add.entry '( "fier_ADJ" "ADJ" ((("f" "j" "eh" "rh")0))))
(lex.add.entry '( "fiers_ADJ" "ADJ" ((("f" "j" "eh" "rh")0))))
(lex.add.entry '( "fiers_VER" "VER" ((("f" "j" "e")0)))); au cas où


(lex.add.entry '( "convient" nil (((k ohn)0)((v j ehn)0)))); pb homographes ;(
(lex.add.entry '( "convient_vie" nil ((("k" "ohn") 0)(("v" "i") 0)))); ils la convient
(lex.add.entry '( "convient_vient" nil ((("k" "ohn") 0)(("v" "i") 0)))); il en convient
; TODO revient, survient
;TODO ?
(lex.add.entry '( "sens_NOM" NOM ((("s" "ahn" "s") 0))))
(lex.add.entry '( "sens_VER" VER ((("s" "ahn") 0))))



; final et/ou homographes  simples (POS différents et pas d'erreurs de poslex )
(lex.add.entry '( "pays_NOM" NOM (((p e)0)((i)0)))) ;
(lex.add.entry '( "ferment_NOM" NOM (((f eh rh )0) ((m ahn)0)))) 
(lex.add.entry '( "myosotis_NOM" NOM ((("m" "j" "oh") 0) (("z" "oh") 0) (("t" "i" "s") 0))))
(lex.add.entry '( "récurrent_ADJ" ADJ ((("rh" "e") 0) (("k" "y") 0) (("rh" "ahn") 0))))
(lex.add.entry '( "supporter_NOM" NOM (((s y)0)((p oh rh)0) ((t oe rh)0))))
(lex.add.entry '( "l_atlas_NOM" NOM ((("l" "a") 0) (("t" "l" "a" "s") 0)))); à cause du s
(lex.add.entry '( "as_NOM" NOM (((a s)0))))
(lex.add.entry '( "l_hiver" NOM (((l i)0)((v eh rh)0))))
(lex.add.entry '( "oeufs_NOM" NOM  ((("eu") 0))))
(lex.add.entry '( "boeufs_NOM" NOM  (((b "eu") 0))))
(lex.add.entry '( "neuf_ADJ" "ADJ" ((("n" "oe" f) 0))))
(lex.add.entry '( "hélas_NOM" "NOM" (((e)0)((l a s)0)))); hélas VER
(lex.add.entry '( "hélas_ONO" "ONO" (((e)0)((l a s)0)))); hélas VER
(lex.add.entry '( "faciès_NOM" NOM ((("f" "a") 0) (("s" "j" "eh" "s") 0))))



; confusion possible dû à l'utilisation hook du lexicon
(lex.add.entry '( "innocent" nil ((("i")0) (("n" "oh")0) (("s" "ahn")0))))
(lex.add.entry '( "d_argent" nil (((d a rh)0) ((zh ahn)0))))
(lex.add.entry '( "mécontent" nil (((m e)0)((k ohn)0)((t ahn)0))))
(lex.add.entry '( "l_argent" nil (((l a rh)0) ((zh ahn)0))))



; pour cause de wordroot insuffisant (petit "radical" notamment)
; à intégrer dans le dico car pas d'homographes
(lex.add.entry '( "abstient_VER" VER (((a b s)0)((t j ehn)0))))
(lex.add.entry '( "advient_VER" VER (((a d)0)((v j ehn)0)))); pb homographes ;(
(lex.add.entry '( "appartient_VER" VER (((a)0)((p a rh)0)((t j ehn)0))))
(lex.add.entry '( "circonvient_VER" VER (((s i rh)0)((k ohn)0)((v j ehn)0))))
(lex.add.entry '( "contient_VER" VER (((k ohn)0)((t j ehn)0))))
(lex.add.entry '( "contrevient_VER" VER (((k ohn)0)((t rh ae)0)((v j ehn)0))))
; homo (lex.add.entry '( "convient" nil (((k ohn)0)((v j ehn)0))));
(lex.add.entry '( "devient_VER" VER (((d ae)0)((v j ehn)0))))
(lex.add.entry '( "détient_VER" VER (((d e)0)((t j ehn)0))))
(lex.add.entry '( "intervient_VER" VER (((ehn)0)((t eh rh)0)((v j ehn)0))))
(lex.add.entry '( "maintient_VER" VER (((m ehn)0)((t j ehn)0))))
(lex.add.entry '( "obtient_VER" VER (((oh b)0)((t j ehn)0))))
(lex.add.entry '( "parvient_VER" VER (((p a rh)0)((v j ehn)0))))
(lex.add.entry '( "provient_VER" VER (((p rh o)0)((v j ehn)0))))
(lex.add.entry '( "prévient_VER" VER (((p rh e)0)((v j ehn)0))))
(lex.add.entry '( "qu_obtient_elle" nil (((k oh p)0)((t j ehn)0)((t eh l)0))))
(lex.add.entry '( "qu_obtient_il" nil (((k oh p)0) ((t j ehn)0) ((t i l)0))))
(lex.add.entry '( "qu_obtient_on" nil (((k oh p)0)((t j ehn)0)((t ohn)0))))
(lex.add.entry '( "redevient_VER" VER (((rh ae)0)((d ae)0)((v j ehn)0))))
(lex.add.entry '( "retient_VER" VER (((rh ae)0)((t j ehn)0))))
; homo (lex.add.entry '( "revient" nil (((rh ae)0)((v j ehn)0)))); 
(lex.add.entry '( "soutient_VER" VER (((s u)0)((t j ehn)0))))
(lex.add.entry '( "souvient_VER" VER (((s u)0)((v j ehn)0))))
(lex.add.entry '( "subvient_VER" VER (((s y b)0)((v j ehn)0))))
; homo (lex.add.entry '( "survient" nil (((s y rh)0)((v j ehn)0))));
(lex.add.entry '( "tient_VER" VER (((t j ehn)0))))
; homo (lex.add.entry '( "vient" nil (((v j ehn)0)))); 

(lex.add.entry '( "convainc" nil ((("k" "ohn") 0) (("v" "ehn") 0))))
(lex.add.entry '( "convainc_t_elle" nil ((("k" "ohn") 0) (("v" "ehn") 0) (("t" "eh" "l") 0))))
(lex.add.entry '( "convainc_t_il" nil ((("k" "ohn") 0) (("v" "ehn") 0) (("t" "i" "l") 0))))
(lex.add.entry '( "convainc_t_on" nil ((("k" "ohn") 0) (("v" "ehn") 0) (("t" "ohn") 0))))

(lex.add.entry '( "conviens" nil (((k ohn)0)((v j ehn)0))))
(lex.add.entry '( "adviens" nil (((a d)0)((v j ehn)0)))); pb homographes ;(
(lex.add.entry '( "abstiens" nil (((a b s)0)((t j ehn)0))))
(lex.add.entry '( "appartiens" nil (((a)0)((p a rh)0)((t j ehn)0))))
(lex.add.entry '( "circonviens" nil (((s i rh)0)((k ohn)0)((v j ehn)0))))
(lex.add.entry '( "contiens" nil (((k ohn)0)((t j ehn)0))))
(lex.add.entry '( "contreviens" nil (((k ohn)0)((t rh ae)0)((v j ehn)0))))
(lex.add.entry '( "deviens" nil (((d ae)0)((v j ehn)0))))
(lex.add.entry '( "détiens" nil (((d e)0)((t j ehn)0))))
(lex.add.entry '( "interviens" nil (((ehn)0)((t eh rh)0)((v j ehn)0))))
(lex.add.entry '( "maintiens" nil (((m ehn)0)((t j ehn)0))))
(lex.add.entry '( "obtiens" nil (((oh b)0)((t j ehn)0))))
(lex.add.entry '( "parviens" nil (((p a rh)0)((v j ehn)0))))
(lex.add.entry '( "proviens" nil (((p rh o)0)((v j ehn)0))))
(lex.add.entry '( "préviens" nil (((p rh e)0)((v j ehn)0))))

(lex.add.entry '( "agit" nil ( ((a)0)((zh i)0)))) ; pas t
(lex.add.entry '( "di" nil (((d i)0))))
(lex.add.entry '( "dis_je" nil (((d i zh)0))))
(lex.add.entry '( "dirai" nil (((d i)0)((rh e)0))))
(lex.add.entry '( "diré" nil (((d i)0)((rh e)0))))
(lex.add.entry '( "disai" nil (((d i)0)((z e)0))))
(lex.add.entry '( "disais" nil (((d i)0)((z eh)0))))
(lex.add.entry '( "dirais" nil (((d i)0)((rh eh)0))))
(lex.add.entry '( "diraient" nil (((d i)0)((rh eh)0))))
(lex.add.entry '( "dirait" nil (((d i)0)((rh eh)0))))
(lex.add.entry '( "dirè" nil (((d i)0)((rh eh)0))))
(lex.add.entry '( "dit" nil (((d i)0))))
(lex.add.entry '( "dût" nil (((d y)0))))
(lex.add.entry '( "fit" nil (((f i)0))))
(lex.add.entry '( "fis" nil (((f i)0))))
(lex.add.entry '( "met" nil (((m eh)0))))
(lex.add.entry '( "mets" nil (((m eh)0))))
(lex.add.entry '( "lit" nil (((l i)0))))
(lex.add.entry '( "mi" nil (((m i)0))))
(lex.add.entry '( "mit" nil (((m i)0))))

; en dico pour simplification de lts *end: pas sûr
(lex.add.entry '( "prend" nil (((p rh ahn) 0))))
(lex.add.entry '( "comprend" nil (((k ohn)0) (p rh ahn) 0)))


; artifice pour les mots singulier se terminant par us et se prononçant y s
; tant que les pluriels ne sont pas cherchés ! donc pour un certain temps...
; au contraire ceux se prononçant u seront (en général) trouvés par la lts bien entrainée
; HYPOTHÈSE1 du lex
(lex.add.entry '( "processu" nil  ((("p" "rh" "oh")0)(("s" e)0)(("s" "y" s)0))))
(lex.add.entry '( "prospectu" nil  ((("p" "rh" "oh" s)0)(("p" eh k)0)(("t" "y" s)0))))
(lex.add.entry '( "détritu" nil  (((d e)0)((t rh i)0)(("t" "y" s)0)))); mot singulier
(lex.add.entry '( "infarctu" nil  (((ehn)0)((f a rh k)0)(("t" "y" s)0))));
(lex.add.entry '( "versu" nil(((v eh rh)0)((s y s)0)))) ; 
(lex.add.entry '( "hiatu" nil(((j a)0)((t y s)0))))
(lex.add.entry '( "bibliobu" nil(((b i)0)((b l j o)0)((b y s)0))))
(lex.add.entry '( "bus_NOM" NOM (((b y s)0))))
(lex.add.entry '( "consensu" nil((("k" "ohn")0)(("s" "ahn")0)(("s" "y" "s")0))))
(lex.add.entry '( "blocu" nil(((b l oh)0)((k y s)0))))
(lex.add.entry '( "campu" nil(((k ahn)0)((p y s)0))))
(lex.add.entry '( "choru" nil(((k oh)0)((rh y s)0))))
(lex.add.entry '( "crocu" nil(((k rh oh)0)((k y s)0))))
(lex.add.entry '( "phallu" nil(((f a)0)((l y s)0))))
(lex.add.entry '( "clausu" nil(((k l o)0)((z y s)0))))
(lex.add.entry '( "collapsu" nil(((k oh)0)((l a "p")0)((s y s)0))))
(lex.add.entry '( "cubitu" nil(((k y)0)((b i)0)((t y s)0))))
(lex.add.entry '( "cirru" nil(((s i)0)((rh y s)0))))
(lex.add.entry '( "mésu" nil(((m e)0)((z y s)0))))
(lex.add.entry '( "bonu" nil(((b oh)0)((n y s)0))))
(lex.add.entry '( "nimbu" nil(((n ehn)0)((b y s)0))))
(lex.add.entry '( "cactu" nil(((k a k)0)((t y s)0))))

;; magouille liaison hiatus avec y semi-voyelle
(lex.add.entry '( "yeu" nil ((("z" "j" "eu")0))))

; (utf8ord "ï") 239
(lex.add.entry '( "maïs" nil (((m a)0)((i s)0))))
(lex.add.entry '( "haï" nil ((( a )0)((i)0))))
(lex.add.entry '( "À" nil (((a)0)))); ou norm ? TODO check


; plus variante
; recoup INST_LANG_foreign
; faire distingo ? francisé ou calqué 
; Certains patronymes ne prennent pas l’accent aigu sur le e, en dépit
; de la prononciation [é] à ajouter dans l'adenda spécialisé "NOM" propre (actuellement foreign) TODO
(lex.add.entry '( "Etat" nil (((e)0)((t a)0))))
(lex.add.entry '( "Ecole" nil (((e)0)((k oh l)0))))
(lex.add.entry '( "Emile" nil (((e)0)((m i l)0))))
(lex.add.entry '( "Eve" nil (((eh v)0))))
(lex.add.entry '( "Eva" nil (((e)0)((v a)0))))

;; seuls noms  t j ohn
(lex.add.entry '( "question" nil ((("k" "eh" "s") 0) (("t" "j" "ohn") 0))))
(lex.add.entry '( "admixtion" nil (((a d)0)((m i k s)0)((t j ohn)0))))

;(lex.add.entry '( "attention_NOM" "NOM" (((a)0)(("t" ahn)0)((s j ohn)0))))
;(lex.add.entry '( "attentions_NOM" "NOM" (((a)0)(("t" ahn)0)((s j ohn)0))))
;(lex.add.entry '( "attention_VER" "VER" (((a)0)(("t" ahn)0)((t j ohn)0))))


; réfractaire non essentiels ; exceptions notoires du b-a ba
(lex.add.entry '( "gen" nil ((("zh" "ahn") 0))))
(lex.add.entry '( "pays" nil (((p eh)0)((i)0))))
(lex.add.entry '( "addenda" nil (((a)0) ((d ehn)0) ((d a)0))))
(lex.add.entry '( "dan" NOM ((("d" "a" n) 0))))
(lex.add.entry '( "dans_NOM" NOM ((("d" "a" n) 0))))
(lex.add.entry '( "femme" nil ((("f" "a" "m") 0))))
(lex.add.entry '( "monsieur" nil  (((m ae)0)((s j eu)0))))

; contredisant les ess initiaux et les ess* finaux
(lex.add.entry '( "ressource" nil ((("rh" "ae") 0) (("s" "u" "rh" "s") 0))))

; non respect VsV
(lex.add.entry '( "parasol" nil (((p a)0)((rh a)0) ((s oh l )0))))
(lex.add.entry '( "aérosol" nil (((a)0) ((e)0) ((rh o)0) ((s oh l )0))))
(lex.add.entry '( "primesautier" nil (((p rh i m)0)((s o)0)((t j e)0))))
(lex.add.entry '( "primesautière" nil (((p rh i m)0)((s o)0)((t j eh rh)0))))
(lex.add.entry '( "carousel" nil ((("k" "a") 0) (("rh" "u") 0) (("s" "eh" "l") 0))))
(lex.add.entry '( "carrousel" nil ((("k" "a") 0) (("rh" "u") 0) (("s" "eh" "l") 0))))
(lex.add.entry '( "ultrason" nil (((y l)0)((t rh a)0)((s ohn)0))))

;
(lex.add.entry '( "listing" nil (((l i s)0)((t i n g)0))))
(lex.add.entry '( "dumping" nil (((d oh m)0)((p i n g)0))))
(lex.add.entry '( "trading" nil (((t rh e)0)((d i n g)0))))
(lex.add.entry '( "parking" nil (((p a rh)0)((k i n g)0))))
(lex.add.entry '( "holding" nil (((hh oh l)0)((d i n g)0))))
(lex.add.entry '( "spoofing" nil (((s p u)0)((f i n g)0))))

;
(lex.add.entry '( "c_esthh" nil ((("s" "eh") 0))))
(lex.add.entry '( "ethh" nil ((("e")0)))); SIWIS
