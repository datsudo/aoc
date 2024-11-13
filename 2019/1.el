(defun day1 (filepath)
  (let ((input (u/parse-input filepath t)))
    (let ((part1 (apply '+ (mapcar #'calculate-fuel input)))
          (part2 (apply '+ (mapcar #'get-total-fuel input))))
      (u/print-res "1" part1 part2))))
(day1 "1.txt")


(defun calculate-fuel (mass)
  (- (truncate (/ mass 3)) 2))

(defun get-total-fuel (mass &optional accum)
  (unless accum (setq accum 0))
  (let ((fuel (calculate-fuel mass)))
    (if (<= (truncate (/ fuel 3)) 0)
        (+ accum (cond ((> fuel 0) fuel) (t 0)))
      (get-total-fuel fuel (+ accum fuel)))))
