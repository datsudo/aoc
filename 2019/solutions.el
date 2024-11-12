(load-file "./utils.el")
(setq filepath "./input.txt")


(defun day1 (filepath)
  (defun calculate-fuel (mass)
    (- (truncate (/ mass 3)) 2))

  (defun get-total-fuel (mass &optional accum)
    (unless accum (setq accum 0))
    (let ((fuel (calculate-fuel mass)))
      (if (<= (truncate (/ fuel 3)) 0)
          (+ accum (cond ((> fuel 0) fuel) (t 0)))
        (get-total-fuel fuel (+ accum fuel)))))

  (let ((input (u/parse-input filepath t)))
     (u/print-res "1"
                  (apply '+ (mapcar #'calculate-fuel input))
                  (apply '+ (mapcar #'get-total-fuel input)))))

(day1 filepath)
