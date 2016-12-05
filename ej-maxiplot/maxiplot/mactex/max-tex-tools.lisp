;;
;; max-tex-tools.lisp
;; This file is part of `maxiplot' LaTeX package
;; Portions are modified versions from maxima package`mactex.lisp' 
;; Jose Miguel M. Planas, Marzo 2008
;;

;;* *************** *
;;* Output routines *
;;* *************** *

(defmspec $write_stdout ( arg) (setq arg (cdr arg))
  (let ((body (cdr arg)) res)
    (with-open-file (*standard-output* (NAMESTRING (maxima-string (car arg)))
                                        :direction :output
     :if-exists :supersede
     :if-does-not-exist :create)
                             (dolist (v body)
                               (setq res (meval* v)))
     res))
     )

(defmspec $append_stdout ( arg) (setq arg (cdr arg))
  (let ((body (cdr arg)) res)
    (with-open-file (*standard-output* (NAMESTRING (maxima-string (car arg)))
                                        :direction :output
     :if-exists :append
     :if-does-not-exist :create)
                             (dolist (v body)
          (setq res (meval* v)))
     res)))


;;* ********************************************************** *
;;* Added user defined start and end tags for math-mode blocks *
;;* ********************************************************** *

;(defprop mathmodestart "$$" texword)
;(defprop mathmodeend "$$" texword)

;(defun $mathmodebounds ( stag etag )
;  (putprop 'mathmodestart stag 'texword)
;  (putprop 'mathmodeend etag 'texword)
;)

(defun tex1 (mexplabel &optional filename ) ;; mexplabel, and optional filename
  (prog (mexp  texport $gcprint ccol x y itsalabel)
     ;; $gcprint = nil turns gc messages off
     (setq ccol 1)
     (cond ((null mexplabel)
	    (displa " No eqn given to TeX")
	    (return nil)))
     ;; collect the file-name, if any, and open a port if needed
     (setq texport (cond((null filename) *standard-output* ) ; t= output to terminal
			(t
			 (open (string (print-invert-case (stripdollar filename)))
			       :direction :output
			       :if-exists :append
			       :if-does-not-exist :create))))
     ;; go back and analyze the first arg more thoroughly now.
     ;; do a normal evaluation of the expression in macsyma
     (setq mexp (meval mexplabel))
     (cond ((member mexplabel $labels :test #'eq)	; leave it if it is a label
	    (setq mexplabel (concatenate 'string "(" (print-invert-case (stripdollar mexplabel))
					 ")"))
	    (setq itsalabel t))
	   (t (setq mexplabel nil)))	;flush it otherwise

     ;; maybe it is a function?
     (cond((symbolp (setq x mexp)) ;;exclude strings, numbers
	   (setq x ($verbify x))
	   (cond ((setq y (mget x 'mexpr))
		  (setq mexp (list '(mdefine) (cons (list x) (cdadr y)) (caddr y))))
		 ((setq y (mget x 'mmacro))
		  (setq mexp (list '(mdefmacro) (cons (list x) (cdadr y)) (caddr y))))
		 ((setq y (mget x 'aexpr))
		  (setq mexp (list '(mdefine) (cons (list x 'array) (cdadr y)) (caddr y)))))))
     (cond ((and (null(atom mexp))
		 (member (caar mexp) '(mdefine mdefmacro) :test #'eq))
	    (format texport "~%\\begin{verbatim}~%")
	    (cond (mexplabel (format texport "~a " mexplabel)))
	    (mgrind mexp texport)	;write expression as string
	    (format texport ";~%\\end{verbatim}~%"))
	   ((and
	     itsalabel ;; but is it a user-command-label?
         ;; THE FOLLOWING TESTS SEEM PRETTY STRANGE --
         ;; WHY CHECK INITIAL SUBSTRING IF SYMBOL IS ON THE $LABELS LIST ??
         ;; PROBABLY IT IS A HOLDOVER FROM THE DAYS WHEN LABELS WERE C AND D INSTEAD OF %I AND %O
	     (<= (length (string $inchar)) (length (string mexplabel)))
	     (eq (getchars (maybe-invert-string-case (string $inchar)) 2 (1+ (length (string $inchar))))
		 (getchars mexplabel 2 (1+ (length (string $inchar)))))
	     ;; Check to make sure it isn't an outchar in disguise
	     (not
	      (and
	       (<= (length (string $outchar)) (length (string mexplabel)))
	       (eq (getchars (maybe-invert-string-case (string $outchar)) 2 (1+ (length (string
		$outchar))))
		   (getchars mexplabel 2 (1+ (length (string $outchar))))))))
	    ;; aha, this is a C-line: do the grinding:
	    (format texport "~%\\begin{verbatim}~%~a " mexplabel)
	    (mgrind mexp texport)	;write expression as string
	    (format texport ";~%\\end{verbatim}~%"))
	   (t 
	    (if mexplabel (setq mexplabel (quote-% mexplabel)))
					; display the expression for TeX now:
	    ;(myprinc (texword 'mathmodestart))
	    (mapc #'myprinc
		  ;;initially the left and right contexts are
		  ;; empty lists, and there are implicit parens
		  ;; around the whole expression
		  (tex mexp nil nil 'mparen 'mparen))
	    (cond (mexplabel
		   (format texport "\\leqno{\\tt ~a}" mexplabel)))
	    ;(myprinc (texword 'mathmodeend))
		))
     (terpri texport)
     (cond (filename   ; and close port if not terminal
	    (close texport)))
     (return mexplabel)))

(defun myprinc (chstr)
  (prog (chlst)
     (cond ((and (> (+ (length (setq chlst (exploden chstr))) ccol) 70.)
                 (or (stringp chstr) (equal chstr '| |)))
	    (write '%)
	    (terpri texport)      ;would have exceeded the line length
	    (setq ccol 1.)
	    ));(myprinc " "))) ; lead off with a space for safetyso we split it up.			
     (do ((ch chlst (cdr ch))
	  (colc ccol (1+ colc)))
	 ((null ch) (setq ccol colc))
       (write-char (car ch) texport))))



; Giorgio Nucci: This breaks the new format for functions like cos: 
; \cos\left( right)
;;;* *********************** *
;;;* Allow alliaseds symbols *
;;;* *********************** *


;(defun tex-atom (x l r)	;; atoms: note: can we lose by leaving out {}s ?
  ;(append l
	  ;(list (cond ((numberp x) (texnumformat x))
		      ;((and (symbolp x) (or (get x 'reversealias) (get x 'texword))))
                      ;((stringp x) (tex-string x))
                      ;((mstringp x)
                       ;(let ((s (maybe-invert-string-case (symbol-name (stripdollar x)))))
                         ;(tex-string (quote-% (if $stringdisp (concatenate 'string "``" s "''") s)))))
                      ;((characterp x) (tex-char x))
		      ;(t (tex-stripdollar x))))
	  ;r))


;;* *************** *
;;* LaTeX utilities *
;;* *************** *

;; LaTeX style quotients
(defprop mquotient tex-mquotient tex)

(defun tex-mquotient (x l r)
  (if (or (null (cddr x)) (cdddr x)) (wna-err (caar x)))
  (setq l (tex (cadr x) (append l '("\\frac{")) nil 'mparen 'mparen)
 r (tex (caddr x) (list "}{") (append '("}") r) 'mparen 'mparen))
  (append l r))

;; amsmath style matrix
(defprop $matrix amsmath-matrix tex)

(defun amsmath-matrix (x l r) ;; matrix looks like ((mmatrix)((mlist) a b) ...)
  (append l `("\\begin{bmatrix}")
  (mapcan #'(lambda(y)
     (tex-list (cdr y) nil (list " \\\\ ") " & "))
   (cdr x))
  '("\\end{bmatrix}") r))
