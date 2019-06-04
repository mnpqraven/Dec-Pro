;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Auf 3.3|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(require racket/base)
(require racket/date)

; BDay, BMonth, BYear are Numbers
; interp. one's birthday

; CDay, CMonth, CYear are Numbers
; interp. current date


; BYear CYear -> Number
; interp. the age at the current year's birthday
(check-expect (new-age 1997 2017) 20)

(define (new-age byear cyear)(- cyear byear))


; BYear CYear -> Number
; interp. the age at the last year's birthday
(check-expect (old-age 1997 2017) 19)

(define (old-age byear cyear)(- (- cyear byear) 1))


; BDay BMonth BYear CDay CMonth CYear -> Number
; calculates the age in years by comparing the given birthday (bday.bmon.byear)
; with the given date (cday.cmon.cyear)
(check-expect (age 11 12 2018 11 12 2017) "Invalid Dates")
(check-expect (age 11 12 2017 11 12 2017) 0)
(check-expect (age 11 12 1997 08 05 2017) 19)
(check-expect (age 11 12 1997 11 12 2017) 20)
(check-expect (age 11 12 1997 01 01 2018) 20)
(check-expect (age 11 12 1997 10 12 2017) 19)

(define (age bday bmon byear cday cmon cyear)
  (if (< cyear byear) "Invalid Dates"
      (cond [(> cmon bmon) (new-age byear cyear)] 
            [(< cmon bmon) (old-age byear cyear)]
            [(= cmon bmon) (if (>= cday bday) (new-age byear cyear) (old-age byear cyear))]
            )))


; vector -> vector
; retrieves the current command-line arguments
(define args (current-command-line-arguments))


; Number Number Number date -> Number
; Calculates the age by comparing the given birthday (bday.bmon.byear)
; with the given date (cdate)
(define (call-age bday bmon byear cdate)
  (age bday bmon byear (date-day cdate) (date-month cdate) (date-year cdate) ))


; This program expects three command-line arguments representig
; a valid date and prints the current age.
; Example: racket batch-skel.rkt 1 5 1992
(if (= (vector-length args) 3)
    (display (call-age
              (string->number (vector-ref args 0))
              (string->number (vector-ref args 1))
              (string->number (vector-ref args 2))
              (current-date) ))
    (error "Bitte genau drei Parameter uebergeben"))
