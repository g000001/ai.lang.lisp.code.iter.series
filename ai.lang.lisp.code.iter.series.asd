;;;; ai.lang.lisp.code.iter.series.asd -*- Mode: Lisp;-*- 

(cl:in-package :asdf)

(defsystem :ai.lang.lisp.code.iter.series
  :serial t
  :depends-on (:fiveam)
  :components ((:file "package")
               (:file "cltl1-compat")
               (:file "ai.lang.lisp.code.iter.series")
               (:file "test")))

(defmethod perform ((o test-op) (c (eql (find-system :ai.lang.lisp.code.iter.series))))
  (load-system :ai.lang.lisp.code.iter.series)
  (or (flet ((_ (pkg sym)
               (intern (symbol-name sym) (find-package pkg))))
         (let ((result (funcall
                        (_ :ai.lang.lisp.code.iter.series.test
                           :do-tests))))
           result))
      (error "test-op failed") ))

