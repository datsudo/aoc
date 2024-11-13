(defun day2 (filepath)
  (setq input (mapcar #'string-to-number
                      (s-split "," (nth 0 (u/parse-input filepath)) t)))
  (setq part1 (run-intcode input 12 2))
  part1)

(message (number-to-string (day2 "2.txt")))


(defun run-intcode (prog-list noun verb)
  (let ((mod-prog-list
         (u/replace-nth 2 verb
                        (u/replace-nth 1 noun (cl-copy-list prog-list)))))
    (run mod-prog-list 0 (nth 0 mod-prog-list))))

(defun run (prog-list curr-pos opcode)
  (defun get-val (pos)
    (let ((idx (nth (+ curr-pos pos) prog-list)))
      (if (eq pos 3) idx
        (nth idx prog-list))))
  (if (eq opcode 99) (nth 0 prog-list)
    (let ((address1 (get-val 1))
          (address2 (get-val 2))
          (output-pos (get-val 3)))
      (setq result (cond ((eq opcode 1) (+ address1 address2))
                         (t (* address1 address2))))
      (setf (nth output-pos prog-list) result)
      (run prog-list
           (+ curr-pos 4)
           (nth (+ curr-pos 4) prog-list)))))
