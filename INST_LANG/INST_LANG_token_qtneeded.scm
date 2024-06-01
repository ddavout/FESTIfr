; INST_LANG_token_qtneeded
; déclaration des QT* sollicitées

(defvar QTnormal t)
(defvar QTmis t)
;;; changement de pos si encore erreur de poslex
(defvar QTpos0 t); pas utile pour l'instant en tout cas?
(defvar QTpos1 t); fre_NAM_homo_tab ex: Marguerite |Duras|

; toujours en direct : pb de création de variables pour patternmatch ?
(defvar QTpos2 t); |donne|-moi -> donne VER; |donne|-m'en , grâce à  norm donne|-|m_en  -> donne VER *et* m_en PRO:per
; ne traite pas toi-même ??
; changements de pos pour cause d'erreurs de poslex
; vérifier de temps en temps 
; les changements de pos affecte l'analyse grammaticale, à faire, en principe, au plus vite
; NOM -> NAM  ou AUX -> VER , pour l'instant discutable
; TODO à ranger par fréquence ( en tenant compte de l'ordre d'apparition dans la phrase: voeu pieu)

(defvar QTpos3 t); tentative homo VER NOM par ex après adverbe de quantité,sans ferment
; liste en defvar dans INST_LANG_token_qt_pos3; pas encore défaut dans word_lists


(defvar QTpos4 t); homographe fier non homosyntaxique ; changement de pos ADJ<->VER
; exemple de changement de pos sur "place"


(defvar QTpos5 t); homographe maintenant ; changement de pos
; non fini donc non mis en oeuvre car pas d'exemple contrariant maintenant, tenat

; maintenant su sol ADV versus VER (gérondif)
; |bouge|-toi, sors de ce |bouge|  NOM versus VER
; sens                             NAM/NOM versus VER 

; ADJ versus VER (particpe passé) ; voeu pieux sans possibilité AUX versus VER entre autres pb

;  les QThomo_* qui ne changent pas l'analyse grammaticale peut se déplacer jusqu'à QTnormal ou ..même n'ont pas leur place ici

(defvar QThomo_fils t); homographe fils ; accroissement vocabulaire
(defvar QThomo_convient t); homographe convient ; accroissement vocabulaire
;(defvar QThomo_maintenant t); homographe mainten ; accroissement vocabulaire

(defvar QTpos2_pattern "{[^-]+}-{.*}")

(defvar QTtim t)
(defvar QTtim_pattern "{[0-2]?[0-9]}{[.|:]}{[0-5][0-9]}"); (set!  QTtim_pattern "{[0-2]?[0-9]}{[:|.]}{[0-5][0-9]}")
(defvar QTono t)
(defvar QTtrad1 t); avant QTnormal
(defvar QTquoi t); sans bcp d'intérêt
(defvar QTletter t); lié à can_be_single_letter après QTloc3m, QTloc2m (pour éviter les a minuscules dans les locutions !) mais avant QTnormal
(defvar QTdel t); attention à l'ordre
(defvar QTdelp t); nécessaire suppression répétition occasionée par QTloc2m
(defvar QTdelp.p nil)
(defvar QTdelp.n t)
(defvar QTdelp.p.n t)
; les locutions ; vers une simplification de l'analyse
(defvar QTloc0 t); list_PRE_ADV ex: au-dessus de est vu comme une PRE
(defvar QTloc3m t) ; avant QTloc2m et donc avant .. QTnormal; :french_multiple_word_expressions2 2 tirets
(defvar QTloc2m t); avant QTnormal; liste: list_locution2  ex french_multiple_word_expressions ex "quelques_uns"; "quoi_que"; "red_river";  "roast_beef"; pe après QTrad1 si abréviation sous forme de locution TODO
; lien avec  locution_part1 ex tout_à, éviter empiètement, pas de précédence mais mettre qd même locution_part1 en premier :)
; ex avec tout à, pour ne pas rater tout à l'heure
(defvar QTlocution_part_1 t) ; ex QTloc3mapo ex tout_à
(defvar QTbefapo t)
(defvar QTchefd )
(defvar QTparentho1 t)
(defvar QTparenthf1 t)
(defvar QTrom t); romains
(defvar QTrom_pattern "{[IVXLCM]+}")
(defvar QTromo t); romains ordinaux
(defvar QTromo_pattern1 "{[IVXLCM]+}{e}")
(defvar QTromo_pattern2 "{[IVXLCM]+}{ème}") ; TODO combiner
(defvar QTromo1) ; not QTromo not finished
(defvar QTdiglist t) ; liste de digits
(defvar QTdiglist_pattern "{[0]+}{[1-9][0-9]*}")
(defvar QTsplit t); ex pp.4 -> pp 4 pour pages 4 
(defvar QTsplit_pattern "{[A-Za-z]+}{\\.}{.*}")
(defvar QTsplit2 t); 33°
(defvar QTsplit2_pattern "{[0-9]+}{_o}{.*}")
(defvar QTnotinitblock t) 
(defvar QTstruc4 nil); erreur
(defvar QTstruc4-1 t); "499 121 456 790")
(defvar QTstruc3 t); first of 3 blocks |121| 456 790 ou 499 |121| 456 790 ?
(defvar QTstruc2 t)
(defvar QTacron t)
(defvar QTcurr t); avant QTletter
(defvar QTl1 t); lettre isolée non mot (après QTletter) après currency 1 £, après fre_abbr_with_point_tab ?  Rq 10 A après fre_unite_mesure_teststring2 ex 10 A ; après Rest Zahlen
; nécessite ex QT20? TODO QTcurr     isoliert currencies ? |_pound sinon  
(defvar QTtypo1 t) ; bad typo ex 10kg; 10US$ ?
(defvar QTtypo1_pattern "{[0-9]+}{[A-Za-zÀÁÂÂÄÅÆÇÈÉÊËÌÍÍÎÏÑÒÒÔÖÙÚÜĀŒāàáâäåçeèéêëiìíñîïœòóôöuùúûü$]+}");
(defvar QTtim_pattern "{[0-2]?[0-9]}{[:|.]}{[0-5][0-9]}") 
(defvar QTb12 t) ; "QT43?\t épil.l... 
(defvar QTb12_pattern "{[A-Za-zÀÁÂÂÄÅÆÇÈÉÊËÌÍÍÎÏÑÒÒÔÖÙÚÜĀŒāàáâäåçeèéêëiìíñîïœòóôöuùúûü]+}{[0-9]+}")
(defvar QTurl t)
(defvar QThomo t)
(defvar QThomo_suite )

(provide 'INST_LANG_token_qtneeded)