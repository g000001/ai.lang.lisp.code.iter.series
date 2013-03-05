;;;; package.lisp

(cl:in-package :cl-user)

(defpackage :ai.lang.lisp.code.iter.series
  (:use)
  (:export
   ;;(2) readmacros (#M and #Z)
   ;;(5) declarations and types (note dual meaning of series)
   :optimizable-series-function :off-line-port  ;series
   :series-element-type
   :propagate-alterability 
   ;;(10) special functions
   :alter :to-alter :encapsulated :terminate-producing
   :next-in :next-out :generator :gatherer :result-of :gathering 
   ;;(55) main line functions
   :make-series :series :scan :scan-multiple :scan-range :scan-sublists :scan-fn
   :scan-fn-inclusive :scan-lists-of-lists :scan-lists-of-lists-fringe :scan-file
   :scan-hash :scan-alist :scan-plist :scan-symbols :collect-fn :collect
   :collect-append :collect-nconc :collect-file :collect-alist :collect-plist
   :collect-hash :collect-length :collect-sum :collect-max :collect-min
   :collect-last :collect-first :collect-nth :collect-and :collect-or :previous
   :map-fn :iterate :mapping :collecting-fn :cotruncate :latch :until :until-if
   :positions :choose :choose-if :spread :expand :mask :subseries :mingle
   :catenate :split :split-if :producing :chunk 
   ;;(5) variables
   :*series-expression-cache*
   :*last-series-loop* :*last-series-error* :*suppress-series-warnings*)
  (:intern :let :let* :multiple-value-bind :funcall :defun
           :install
           :*optimize-series-expressions*
           :*series-implicit-map*
           :*in-series-expr*
           :*testing-errors*
           :*not-straight-line-code*
           :end))


(defpackage :ai.lang.lisp.code.iter.series.internal
  (:use :ai.lang.lisp.code.iter.series :cl :named-readtables :fiveam)
  (:import-from #+sbcl :sb-cltl2 :compiler-let)
  (:shadowing-import-from :ai.lang.lisp.code.iter.series 
                          :let :let* :multiple-value-bind :funcall :defun
                          :install
                          :*optimize-series-expressions*
                          :*series-implicit-map*
                          :*in-series-expr*
                          :*testing-errors*
                          :*not-straight-line-code*
                          :end)
  (:intern :iterative-copy-tree
           :clean-code1
           :make-test
           :nsubst-inline
           :make-frag
           :active-terminator-p
           :vars-of
           :make-general-setq))


(defpackage :ai.lang.lisp.code.iter.series.test
  (:use :cl :ai.lang.lisp.code.iter.series)
  (:shadowing-import-from :ai.lang.lisp.code.iter.series 
                          :let :let* :multiple-value-bind :funcall :defun
                          :install
                          :*optimize-series-expressions*
                          :*series-implicit-map*
                          :*in-series-expr*
                          :*testing-errors*
                          :*not-straight-line-code*
                          :end)
  (:shadowing-import-from  :ai.lang.lisp.code.iter.series.internal
                           :let :let* :multiple-value-bind :funcall :defun 
                           :iterative-copy-tree
                           :clean-code1
                           :make-test
                           :nsubst-inline
                           :make-frag
                           :active-terminator-p
                           :vars-of
                           :make-general-setq))

;;; *EOF*

