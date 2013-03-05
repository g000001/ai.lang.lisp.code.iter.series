(cl:in-package :ai.lang.lisp.code.iter.series.internal)


(defmacro cltl1-eval-when ((&rest args) &body body)
  `(eval-when (,@(mapcar (lambda (k)
                           (case k
                             (compile :compile-toplevel)
                             (load :load-toplevel)
                             (eval :execute)))
                         args))
     ,@body))


(cl:defun special-form-p (x) (special-operator-p x))

;;; *EOF*


