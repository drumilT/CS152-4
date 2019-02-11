#lang racket
(require "list-comprehension.rkt")
(struct dir (info fdlist) #:transparent)
(struct file (info contents) #:transparent)
(define thistree(dir(cons "as" 1024)(list (dir(cons "cs613" 1024)(list (file (cons "quiz" 4246) "junk")(file (cons "tut" 7226) "junk")(dir (cons "2004" 1024)(list (file (cons "quiz" 576) "junk")(file (cons "tut" 345) "junk")))))(dir (cons "cs152" 1024)(list (file (cons "quiz1" 4532) "junk")(file (cons "quiz2" 1234) "junk")(file (cons "tut" 1223) "junk")))(dir (cons "cs154" 1024)(list (file (cons "tut1" 459) "junk")(file (cons "tut2" 782) "junk"))))))


( define ( findtree t path)
   ( if (equal? (length path) 1) t
        ( findtree (car (filter ( lambda (x)  (equal?
                                               (car ( if (dir? x )
                                                         ( dir-info x)
                                                         ( file-info x)
                                                         )
                                                    ) (cadr path)
                                                      )
                                   )
                                (dir-fdlist t)
                                )
                        )
                   (cdr path)
                   )
        )
   )

(define ( ls l path)
  ( lc (car ( if (dir? x )
                 ( dir-info x)
                 ( file-info x))) : x <- (dir-fdlist (findtree l path))))

(define (size l path)
   ( foldr + 0 (lc (cdr ( if (dir? x )
                 (+ ( size  x (car (dir-info x))) ( cdr (dir-info x)))
                 ( file-info x))) : x <- (dir-fdlist (findtree l path)))))


( define ( delete t path)
   ( if (equal? (length path) 2) ( dir (dir-info t) ( lc x : x <- (dir-fdlist t) @  (not(equal?
                                               (car ( if (dir? x )
                                                         ( dir-info x)
                                                         ( file-info x)
                                                         )
                                                    ) (cadr path) ))))
        ( dir (dir-info t) ( foldr ( lambda ( x y)
                                      ( append
                                        (list ( if (equal?
                                               (car ( if (dir? x )
                                                         ( dir-info x)
                                                         ( file-info x)
                                                         )
                                                    ) (cadr path))
                                                   ( delete x (cdr path) ) x)
                                              )
                                        y)
                                      )
                                   '() (dir-fdlist t) )
                                   )
              )
        )
   