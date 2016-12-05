
;; Additional mactex utilities.
;; All functions are based on code by Richard J. Fateman, copyright 1987.
;; Fateman's code was ported to Common Lisp by William Schelter.

;; If you want LaTeX style quotients, first load mactex and second
;; define tex-mquotient as follows

(defun tex-mquotient (x l r)
  (if (or (null (cddr x)) (cdddr x)) (wna-err (caar x)))
  (setq l (tex (cadr x) (append l '("\\frac{")) nil 'mparen 'mparen)
	r (tex (caddr x) (list "}{") (append '("}") r) 'mparen 'mparen))
  (append l r))

;; (defprop mtimes ("\\,") texsym)
;; adds a thin space.
;; The following tells TeX to use whatever it thinks best.
;; (defprop mtimes (" ") texsym)

;; To use amsmath style matrices, define tex-matrix as
;; (to TeX the code, you'll need to \usepackage{amsmath})

(defun tex-matrix (x l r) ;; matrix looks like ((mmatrix)((mlist) a b) ...)
  (append l `("\\begin{bmatrix}")
	 (mapcan #'(lambda(y)
			  (tex-list (cdr y) nil (list " \\\\ ") " & "))
		 (cdr x))
	 '("\\end{bmatrix}") r))

;;---------------------------------------Giorgio Nucci
;;--- REDEFINE THE FUNCTIONS TO INCLUDE PARENTHESIS---
;; (OR THE | SYMBOL FOR THE DETERMINANT)
;; I DON'T KNOW HOW TO DO THIS WITH tex-setup:
(defprop %determinant tex-determinant tex)
(defun tex-determinant(x l r)
  ;; format as \\determinant\left( \right) assuming implicit parens for determinant grouping
  (tex (cadr x) (append l '("\\left|")) (append '("\\right|") r) 'mparen 'mparen))

(defprop %acos tex-acos tex)
(defun tex-acos(x l r)
  ;; format as \\acos\left( \right) assuming implicit parens for acos grouping
  (tex (cadr x) (append l '("\\acos\\left(")) (append '("\\right)") r) 'mparen 'mparen))

(defprop %asin tex-asin tex)
(defun tex-asin(x l r)
  ;; format as \\asin\left( \right) assuming implicit parens for asin grouping
  (tex (cadr x) (append l '("\\asin\\left(")) (append '("\\right)") r) 'mparen 'mparen))

(defprop %atan tex-atan tex)
(defun tex-atan(x l r)
  ;; format as \\atan\left( \right) assuming implicit parens for atan grouping
  (tex (cadr x) (append l '("\\atan\\left(")) (append '("\\right)") r) 'mparen 'mparen))

(defprop %cosh tex-cosh tex)
(defun tex-cosh(x l r)
  ;; format as \\cosh\left( \right) assuming implicit parens for cosh grouping
  (tex (cadr x) (append l '("\\cosh\\left(")) (append '("\\right)") r) 'mparen 'mparen))

(defprop %cos tex-cos tex)
(defun tex-cos(x l r)
  ;; format as \\cos\left( \right) assuming implicit parens for cos grouping
  (tex (cadr x) (append l '("\\cos\\left(")) (append '("\\right)") r) 'mparen 'mparen))

(defprop %cot tex-cot tex)
(defun tex-cot(x l r)
  ;; format as \\cot\left( \right) assuming implicit parens for cot grouping
  (tex (cadr x) (append l '("\\cot\\left(")) (append '("\\right)") r) 'mparen 'mparen))

(defprop %coth tex-coth tex)
(defun tex-coth(x l r)
  ;; format as \\coth\left( \right) assuming implicit parens for coth grouping
  (tex (cadr x) (append l '("\\coth\\left(")) (append '("\\right)") r) 'mparen 'mparen))

(defprop %csc tex-csc tex)
(defun tex-csc(x l r)
  ;; format as \\csc\left( \right) assuming implicit parens for csc grouping
  (tex (cadr x) (append l '("\\csc\\left(")) (append '("\\right)") r) 'mparen 'mparen))

(defprop %dim tex-dim tex)
(defun tex-dim(x l r)
  ;; format as \\dim\left( \right) assuming implicit parens for dim grouping
  (tex (cadr x) (append l '("\\dim\\left(")) (append '("\\right)") r) 'mparen 'mparen))

(defprop %exp tex-exp tex)
(defun tex-exp(x l r)
  ;; format as \\exp\left( \right) assuming implicit parens for exp grouping
  (tex (cadr x) (append l '("\\exp\\left(")) (append '("\\right)") r) 'mparen 'mparen))

(defprop %gcd tex-gcd tex)
(defun tex-gcd(x l r)
  ;; format as \\gcd\left( \right) assuming implicit parens for gcd grouping
  (tex (cadr x) (append l '("\\gcd\\left(")) (append '("\\right)") r) 'mparen 'mparen))

(defprop %inf tex-inf tex)
(defun tex-inf(x l r)
  ;; format as \\inf\left( \right) assuming implicit parens for inf grouping
  (tex (cadr x) (append l '("\\inf\\left(")) (append '("\\right)") r) 'mparen 'mparen))

(defprop %ln tex-ln tex)
(defun tex-ln(x l r)
  ;; format as \\ln\left( \right) assuming implicit parens for ln grouping
  (tex (cadr x) (append l '("\\ln\\left(")) (append '("\\right)") r) 'mparen 'mparen))

(defprop %log tex-log tex)
(defun tex-log(x l r)
  ;; format as \\log\left( \right) assuming implicit parens for log grouping
  (tex (cadr x) (append l '("\\log\\left(")) (append '("\\right)") r) 'mparen 'mparen))

(defprop %max tex-max tex)
(defun tex-max(x l r)
  ;; format as \\max\left( \right) assuming implicit parens for max grouping
  (tex (cadr x) (append l '("\\max\\left(")) (append '("\\right)") r) 'mparen 'mparen))

(defprop %min tex-min tex)
(defun tex-min(x l r)
  ;; format as \\min\left( \right) assuming implicit parens for min grouping
  (tex (cadr x) (append l '("\\min\\left(")) (append '("\\right)") r) 'mparen 'mparen))

(defprop %sec tex-sec tex)
(defun tex-sec(x l r)
  ;; format as \\sec\left( \right) assuming implicit parens for sec grouping
  (tex (cadr x) (append l '("\\sec\\left(")) (append '("\\right)") r) 'mparen 'mparen))

(defprop %sin tex-sin tex)
(defun tex-sin(x l r)
  ;; format as \\sin\left( \right) assuming implicit parens for sin grouping
  (tex (cadr x) (append l '("\\sin\\left(")) (append '("\\right)") r) 'mparen 'mparen))

(defprop %sinh tex-sinh tex)
(defun tex-sinh(x l r)
  ;; format as \\sinh\left( \right) assuming implicit parens for sinh grouping
  (tex (cadr x) (append l '("\\sinh\\left(")) (append '("\\right)") r) 'mparen 'mparen))

(defprop %tan tex-tan tex)
(defun tex-tan(x l r)
  ;; format as \\tan\left( \right) assuming implicit parens for tan grouping
  (tex (cadr x) (append l '("\\tan\\left(")) (append '("\\right)") r) 'mparen 'mparen))

(defprop %tanh tex-tanh tex)
(defun tex-tanh(x l r)
  ;; format as \\tanh\left( \right) assuming implicit parens for tanh grouping
  (tex (cadr x) (append l '("\\tanh\\left(")) (append '("\\right)") r) 'mparen 'mparen))
;;--- FINISH RE-DEFINING FUNCTIONS---
;;-----------------------------------

;; REDEFINE GREEK VARIABLES (I LIKE vartheta,
;; BUT IT MAKES IT HARDER TO READ)
;(defprop $theta "\\vartheta" texword)
(defprop $theta "\\theta" texword)
;(defprop $epsilon "\\varepsilon" texword)
(defprop $epsilon "\\epsilon" texword)
;(defprop $phi "\\varphi" texword)
(defprop $phi "\\phi" texword)
