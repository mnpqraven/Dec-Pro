;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Auf4-3) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Aufgabe 4-3

(define-struct hero (supername realname race))
(define (reveal hero) (cond
[(string=? (hero-race hero) "Martian") (string-append
(hero-supername hero) " is " (hero-realname hero)
" from Mars.")]
[(string=? (hero-race hero) "Kryptonian") (string-append
(hero-supername hero) " is " (hero-realname hero)
" from Krypton.")]
[(string=? (hero-race hero) "New God") (string-append
(hero-supername hero) " is " (hero-realname hero)
" from New Genesis.")]
[(string=? (hero-race hero) "Timelord") (string-append
(hero-supername hero) " is " (hero-realname hero)
" from Gallifrey.")]
[(string=? (hero-race hero) "Sayajin") (string-append
(hero-supername hero) " is " (hero-realname hero)
" from Vegeta.")]
[(string=? (hero-race hero) "Old One") (string-append
(hero-supername hero) " is " (hero-realname hero)
" from R’lyeh.")]
[true (string-append (hero-supername hero) " is "
(hero-realname hero) " from Earth.")]))
(define THEDOCTOR (make-hero "The Doctor" "Unkown" "Timelord"))
(reveal THEDOCTOR) 

;Reduzieren den Ausdruck (reveal THEDOCTOR): "The Doctor is Unkown from Gallifrey."
(check-expect (reveal THEDOCTOR) "The Doctor is Unkown from Gallifrey.")

;Reduktionschritte

(cond
[(string=? (hero-race hero) "Martian") ...]
[(string=? (hero-race hero) "Kryptonian") ...]
[(string=? (hero-race hero) "New God") ...]
[(string=? (hero-race hero) "Timelord") (string-append
(hero-supername hero) " is " (hero-realname hero)
" from Gallifrey.")]
...)

;1. (hero-race hero) wird zunächst zu "Timelord" reduziert, damit (string=? (hero-race hero) "Martian")zu false reduziert werden kann. <Kongruenzregel>
(cond
[false ...]
[(string=? (hero-race hero) "Kryptonian") ...]
[(string=? (hero-race hero) "New God") ...]
[(string=? (hero-race hero) "Timelord") (string-append
(hero-supername hero) " is " (hero-realname hero)
" from Gallifrey.")]
...)
;   Da diese Bedingung falsch ist, ignorieren wir den Rest dieses Zweigs und betrachten den nächsten Zweig von cond. <Reduktionsregeln für konditionale Ausdrücke>
(cond
[(string=? (hero-race hero) "Kryptonian") ...]
[(string=? (hero-race hero) "New God") ...]
[(string=? (hero-race hero) "Timelord") (string-append
(hero-supername hero) " is " (hero-realname hero)
" from Gallifrey.")]
...)

;2. (hero-race hero) wird zunächst zu "Timelord" reduziert, damit (string=? (hero-race hero) "Kryptonian")zu false reduziert werden kann. <Kongruenzregel>
(cond
[false ...]
[(string=? (hero-race hero) "New God") ...]
[(string=? (hero-race hero) "Timelord") (string-append
(hero-supername hero) " is " (hero-realname hero)
" from Gallifrey.")]
...)
;   Da diese Bedingung falsch ist, ignorieren wir den Rest dieses Zweigs und betrachten den nächsten Zweig von cond. <Reduktionsregeln für konditionale Ausdrücke>
(cond
[(string=? (hero-race hero) "New God") ...]
[(string=? (hero-race hero) "Timelord") (string-append
(hero-supername hero) " is " (hero-realname hero)
" from Gallifrey.")]
...)

;3. (hero-race hero) wird zunächst zu "Timelord" reduziert, damit (string=? (hero-race hero) "New God")zu false reduziert werden kann. <Kongruenzregel>
(cond
[false ...]
[(string=? (hero-race hero) "Timelord") (string-append
(hero-supername hero) " is " (hero-realname hero)
" from Gallifrey.")]
...)
;   Da diese Bedingung falsch ist, ignorieren wir den Rest dieses Zweigs und betrachten den nächsten Zweig von cond. <Reduktionsregeln für konditionale Ausdrücke>
(cond
[(string=? (hero-race hero) "Timelord") (string-append
(hero-supername hero) " is " (hero-realname hero)
" from Gallifrey.")]
...)

;4. (hero-race hero) wird zunächst zu "Timelord" reduziert, damit (string=? (hero-race hero) "Timelord")zu true reduziert werden kann. <Kongruenzregel>
(cond
[true (string-append
(hero-supername hero) " is " (hero-realname hero)
" from Gallifrey.")]
...)
;   Da diese Bedingung richtig ist, wird der Rest dieses Zweigs betrachtet. <Reduktionsregeln für konditionale Ausdrücke>
(string-append (hero-supername hero) " is " (hero-realname hero)" from Gallifrey.")


;5. (hero-supername hero) wird zu "The Doctor" und (hero-realname hero) wird zu "Unkown" ausgewertet und dadurch kann (string-append (hero-supername hero) " is " (hero-realname hero) " from Gallifrey.") reduziert werden. <Kongruenzregel>
(string-append "The Doctor" " is " "Unkown" " from Gallifrey.") ---> "The Doctor is Unkown from Gallifrey."

