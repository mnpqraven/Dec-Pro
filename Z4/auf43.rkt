;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Auf4-2) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Aufgabe 4.2
; 1. Datendefinition und -beispiel
; Fallunterscheidung des Problemstellungswerts

; GasConsumption is one of the followings:
; 8 (Liter per 100km), if speed is smaller than or equals to 120 (km/)    <1>
; 10 (Liter per 100km), if the speed lies between 120 and 160(km/)        <2>
; a Number representing a linear gas consumption rate with respect to the speed of the car, if the speed is greater than 160(km/) <3>

; 2. Signatur, Aufgabenbeschreibung, Funktionskopf
; Number -> GasConsumption <Signatur>
; Given is the speed of the car, return its GasConsumption <Aufgabenbeschreibung>
(define (GasConsumption speed)...) ;<Funktionskopf>

; 3. Tests (zwischen Aufgabenbeschreibung und Funktionskopf)
(check-expect (GasConsumption 100) 8) ; für den ersten Fall <1>
(check-expect (GasConsumption 150) 10); fuer den zweiten Fall <2>
(check-expect (GasConsumption 200) 12.2); fuer den dritten Fall <3>

; 4. Grobe Funktionsstruktur erstellen (if, cond, …), ggf. Hilfsfunktionen definieren

(define (GasConsumption speed) (cond [(<= speed 120)...]
                                     [(< 120 speed 160)... ]
                                     [(<= 160 speed)...])) ; Grobe Funktionsstruktur
;Rate between gas consumtion and speed in <3> (Liter pro km/h)
(define Rate (/ 0.55 10))
;Gas consumption in the second case <2>
(define GasConsumption<2> 10)

;Number -> Number
;given is the speed (condition: speed must be greater than 160), compute the gas consumption by using the linear equation formed from the given information
(define (GasConsumption<3> speed)(+ GasConsumption<2> (* Rate (- speed 160))))

; 5. Implementation
; jeden Zweig des cond Ausdrucks einzeln und nacheinander durchgehen und implementieren durchzugehen und zu implementieren
(define (GasConsumption speed) (cond [(<= speed 120)8]
                                     [(< 120 speed 160)10 ]
                                     [(<= 160 speed)(GasConsumption<3> speed)]))
