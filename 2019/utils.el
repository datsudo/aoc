(defun u/parse-input (filepath &optional to-int)
  "Return lines from FILEPATH as a list of strings
or numbers (if `to-int' is t)."
  (let ((f-lines (s-split "\n" (f-read-text filepath 'utf-8) t)))
    (if to-int
        (mapcar #'string-to-number f-lines)
        f-lines)))

(defun u/out (output)
  "Displays output in buffer named `*aoc-output*'."
  (if (eq (get-buffer "*aoc-output*") nil)
      (setq aoc-out-buffer (generate-new-buffer "*aoc-output*"))
      (funcall (lambda ()
              (print output aoc-out-buffer)
              (split-window-below)
              (other-window 1)
              (switch-to-buffer aoc-out-buffer)))))


(defun u/print-res (day-num p1 p2 &optional to-str)
  (defun u/fmt-ans (p-num ans)
    (concat "D" day-num
            " Part " p-num ": "
            (cond ((not (eq (type-of ans) 'string)) (number-to-string ans))
                  (t ans))))

  (let ((p1-fmt (u/fmt-ans "1" p1))
        (p2-fmt (u/fmt-ans "2" p2)))
    (u/out (concat p1-fmt "\n" p2-fmt))))
