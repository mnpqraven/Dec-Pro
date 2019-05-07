;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname A4-1) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Aufgabe 4-1
;m und n sind natürliche Zahlen in Teilaufgaben a b und c
;a

(define (nat-add m n)
  (cond [(zero? m) n]
        [(zero? n) m]
        [else (add1 (nat-add (sub1 m) n))]))
;b
(define (nat-sub m n)
  (cond [(<= m n) 0]
        [else (add1 (nat-sub (sub1 m) n))]))

;c
(define (nat-mult m n)
  (cond [(zero? m) 0]
        [(zero? n) 0]
        [else (nat-add (nat-mul (sub1 m) n) n)]))

;d
(define (nat-pow m n)
  (cond [(zero? n) 1]
        [(positive? n) (nat-mul m (nat-pow m (sub1 n)))]))

;Aufgabe 4-2
;a

(define (addList l)
  (if (empty? l) 0 (+ (first l)(addList (rest l)))))

;b
(define (subList l)
  (if (empty? l) 0 (- (first l)(addList (rest l)))))

;c
(define (recMulSub l)
  (helper (ceiling (/ (length l) 2)) l))

(define (helper n l)
  (if (>= n 2)(helper (sub1 n) (cons (* (first l) (second l)) (rest (rest l)))) (subList l)))

;Aufgabe 4-3
;a
(define (list-size l)
  (if (empty? l) 0 (add1 (list-size (rest l)))))

;b
(define (list-contains e l)
  (cond [(empty? l) false]
        [(= (first l) e) true]
        [else (list-contains e (rest l))]))

;c
(define (list-max l)
  (cond [(= (length l) 1)(first l)]
        [(> (first l)(list-max (rest l))) (first l)]
        [else (list-max (rest l))]))