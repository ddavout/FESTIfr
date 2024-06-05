(define (check fil)
  "(check file)"
 (voice_INST_LANG_VOX_cg)
 (require 'fileio)
 (set! outdir (dirname fil))
    (format t "fil: %s " fil)
    (set! p (load fil t))
    (mapcar
     (lambda (l)
        (set! utt (SayText (cadr l)))
        ;;(set! out (path-append outdir (string-append (car l) ".out")))
        (set! outt (path-append outdir (string-append (car l) ".outt")))
        ; (write-file outt (format nil "%l" (utt.relation.print utt 'Token)))
        (utt.save.relation utt 'Token outt)
        
        ;;(utt.save.relation utt 'Word out)
        (format t "check n°%l\n" (car l))
        (format t "check %l\n" (cadr l))
        ; pas le propos mais bon 
        (format t "%s" (utt.flat_repr utt))
       t)
     p))

