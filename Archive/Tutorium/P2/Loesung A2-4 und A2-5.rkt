;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Loesung) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname P2_Loesung) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Aufgabe 2.2 The Design Recipe Revolutions
; a)

; Siehe Skript, Kapitel 3.3.3 Entwurfsrezept zur Funktionsdefinition
; 1. Datendefinition und -beispiele
; 2. Signatur, Aufgabenbeschreibung, Funktionskopf
; 3. Tests (zwischen Aufgabenbeschreibung und Funktionskopf)
; 4. Grobe Funktionsstruktur erstellen (if, cond, …), ggf. Hilfsfunktionen definieren
; 5. Implementation
; 6. Tests ausführen, ggf. Fehler lösen
; 7. Refactoring

; Aufgabe 2.4 Datendefinitionen und -typen
; a)

; A Day is one of the following:
; - "Montag"
; - "Dienstag"
; - "Mittwoch"
; - "Donnerstag"
; - "Freitag"
; - "Samstag"
; - "Sonntag"

; Day -> Day
; Given a day d returns the next weekday
(define (next-day d)
  (cond [(string=? d "Montag")     "Dienstag"]
        [(string=? d "Dienstag")   "Mittwoch"]
        [(string=? d "Mittwoch")   "Donnerstag"]
        [(string=? d "Donnerstag") "Freitag"]
        [(string=? d "Freitag")    "Samstag"]
        [(string=? d "Samstag")    "Sontag"]
        [(string=? d "Sonntag")    "Montag"]
  )
)

; b)

; Temperature is a Number
; interp. temperature in °C

; A StateOfWater is a Temperature. It falls into one of the three intervals:
; - smaller than 0
; - between 0 and 100
; - greater than 100

; StateOfWater -> String
; Given the temperature t return the state of water as a string.
(define (state-of-water temp)
  (cond [(<= temp 0)    "solid"]
        [(< 0 temp 100) "liquid"]
        [(>= 100 temp)  "gas"]
  )
)

; Man beachte den Unterschied zwischen "smaller than 0" und `<= temp 0` etc.
; Dementsprechend sollte die Datendefinition oder die Funktionsimplementation
; überarbeitet werden.

; c)

; A NorS is one of:
; - Number
; - String

; Number Number -> NorS
; Returns "not defined" if b = 0, otherwise returns a divided by b
(define (my-div a b)
  (if (= b 0)
      "not defined"
      (/ a b)
  )
)

; d)

; A Date is a structure: (make-date Number Number Number)
; interp. a date consisting of day, month and year
(define-struct date (day month year))

; Date -> String
; Converts a date into a human readable string of the form "Day.Month.Year"
(define (d-to-s date)
  (if (date? date)
      (string-append (number->string (date-day date)) "."
                     (number->string (date-month date)) "."
                     (number->string (date-year date)))
      "The given argument is not a date"
  )
)

; Aufgabe 2.5 Algebraische Datentypen
; a)

; Color is a String
; interp. ...

; GasConsumption is a Number
; interp. ... in l/km

; An Automobile is a structure (make-automobile Color GasConsumption)
; interp. an automobile with a color and gas consumption
(define-struct automobile (color gasconsumption))


; Drive is one of:
; - "diesel"
; - "wind"

; Draft is a Number
; interp. ... (Tiefgang) in m

; A Boat is a structure (make-boat Drive Draft)
; interp. ...
(define-struct boat (drive draft))


; An Engine is one of:
; - "turbine"
; - "propeller"

; Span is a Number
; interp. ... (Spannweite) in m

; An Airplane is a structure (make-airplane Engine Span)
; interp. ...
(define-struct airplane (engine span))


; A Location is a structure (make-location String Boolean Boolean Boolean)
; interp. ...
(define-struct location (name connected-by-road has-harbour has-airport))

; Automobile Location -> String
(define (drive car loc)
  (if (location-connected-by-road loc)
      (string-append "The " (automobile-color car) " car is driving to " (location-name loc))
      "The location is not connected by a road!"
  )
)

; Boat Location -> String
(define (swim boat loc)
  (if (location-has-harbour loc)
      (string-append "The boat is swimming to " (location-name loc))
      "The location has no harbour!"
  )
)

; Airplane Location -> String
(define (fly airplane loc)
  (if (location-has-airport loc)
      (string-append "The airplane is flying to " (location-name loc))
      "The location has no airport!"
  )
)


; b)

; A Transport is one of:
; - an Automobile
; - a Boat
; - an Airplane
; interp. ...

; Transport Location -> String
(define (move-to t loc)
  (cond [(automobile? t) (drive t loc)]
        [(boat? t)       (swim t loc)]
        [(airplane? t)   (fly t loc)]
  )
)

(move-to (make-automobile "red" 8) (make-location "Marburg" true false false))
(move-to (make-boat "wind" 3) (make-location "Bremerhaven" true true false))
(move-to (make-airplane "turbine" 20) (make-location "Frankfurt" true true true))
