;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Auf6-4) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Aufgabe 4
(define WIDTH 400)
(define HEIGHT 400)
(define SHAPE1 (overlay (circle 10 "solid" "yellow")(rectangle 150 50 "solid" "purple")))
(define MIDDLEX (/ WIDTH 2))
(define TOPY (/ HEIGHT 4))
(define BOTTY (- HEIGHT TOPY))


; Angle is a Number
; interp. a rotation angle from 0 to 360 degrees

; Progress is a Number
; interp. a the progress of an animation in [0,1]




; Ease is a (Progress -> Progress)
; interp. a manipulation of a linear animation

(define (ease/linear progress)  progress )
(define (quadratic-ease  progress) (* progress progress))
(define (ease2 progress)  (sqrt (+ 0.001 progress)))
(define (ease1 progress)  (expt progress 6))


; Shape is a (Color -> Image)
; interp. generates a shape with the given color
(define (circ col) (circle 0 "solid" col ))

; A color-anim is (make-color-anim Color Color Ease
; (make-color-anim Color(0 0 0 255) Color(255 255 255 255) ease/linear)
(define-struct color-anim    (from to ease))


; A rotation-anim is (make-movement-anim Angle Angle Ease)
; (make-rotation-anim 0 180 ease/linear)
(define-struct rotation-anim (from to ease))

; A movement-anim is (make-movement-anim Posn Posn Ease)
; (make-movement-anim (make-posn 0 0) (make-posn 100 100) ease/linear)
(define-struct movement-anim (from to ease))

; An animation is (make-animation Shape Number Number Boolean Movement-Anim Rotation-Anim Color-Anim
; Keep determines whether the shape is rendered at its final position/color/rotation after end is reached
; (make-animation circ 0 100 true ....)
(define-struct animation (shape start end keep movement rotation color))

; A world is (make-world Number (list-of Animation)
; interp. as a complex animation over time
(define-struct world (t animations))
 
; Progress Position-Animation -> Posn
; Returns the shape's position according to the given progress
(define (apply/pos progress anim)
  (local [(define startx (posn-x (movement-anim-from anim)))
          (define starty (posn-y (movement-anim-from anim)))
          (define endx   (posn-x (movement-anim-to anim)))
          (define endy   (posn-y (movement-anim-to anim)))
          (define dx (- endx startx))
          (define dy (- endy starty))
          (define tprog ((movement-anim-ease anim) progress))]
    (make-posn (+ startx (* tprog dx)) (+ starty (* tprog dy)))))

; Image Progress Rotation-Animation -> Image
; Applys the rotation to the given image, according to the animation-rules
(define (apply/rot img progress anim)
  (local [(define da (- (rotation-anim-to anim) (rotation-anim-from anim)))
          (define tprog ((rotation-anim-ease anim) progress))]
    (rotate (+ (rotation-anim-from anim) (* tprog da)) img)))

; Shape Progress Color-Animation -> Image
; Creates a shape with the color specified by the given animation
(define (apply/color shape progress anim)
  (local [(define cstart (color-anim-from anim))
          (define cend (color-anim-to anim))
          (define dr (- (color-red cend) (color-red cstart)))
          (define dg (- (color-green cend) (color-green cstart)))
          (define db (- (color-blue cend) (color-blue cstart)))
          (define da (- (color-alpha cend) (color-alpha cstart)))
          (define tprog ((color-anim-ease anim) progress))]
    (shape (make-color (floor (+ (color-red cstart) (* dr tprog)))
                       (floor (+ (color-green cstart) (* dg tprog)))
                       (floor (+ (color-blue cstart) (* db tprog)))
                       (floor (+ (color-alpha cstart) (* da tprog)))))))

; Animation Image Number -> Image
; Renders the given animation into the scene according to the time elapsed
(define (render/animation anim scene t)
  (if (and (<= (animation-start anim) t) (or (<= t (animation-end anim)) (animation-keep anim)))
      (local [(define ts (animation-start anim))
              (define te (animation-end anim))
              (define progress (min (/ (- t ts) (- te ts)) 1.0))
              (define plain-img (apply/color (animation-shape anim) progress (animation-color anim)))
              (define rot-img (apply/rot plain-img progress (animation-rotation anim)))
              (define pos (apply/pos progress (animation-movement anim)))]
        (place-image rot-img (posn-x pos) (posn-y pos) scene))
      scene))

; (list-of Animation) Number -> Image
; Renders all animation according to the current world-state
(define (render/all anims t)
  (if (empty? anims)
      (empty-scene WIDTH HEIGHT)
      (render/animation (first anims) (render/all (rest anims) t) t)))

; World -> Image
; Renders all animation according to the current world-state
(define (render w)
  (render/all (world-animations w) (world-t w)))

; World -> World
; Progresses the animation
(define (tick w)
  (make-world (+ 1 (world-t w)) (world-animations w)))

; World -> Boolean
; Determines if the animation is finished
(define (eow w)
  (> (world-t w)
     (foldr max 0 (map (lambda (anim) (animation-end anim)) (world-animations w)))))

(define DEMO (make-animation (lambda (color) (circle 70 "solid" color))
                               0 200 true
                               (make-movement-anim (make-posn 0 HEIGHT) (make-posn MIDDLEX 200) ease/linear)
                               (make-rotation-anim 0 3600 ease/linear)
                               (make-color-anim (make-color 0 0 0 0) (make-color 125 125 125 125) ease/linear)))

(define RECTANGLETOP (make-animation (λ (color) SHAPE1)
                               0 200 true
                               (make-movement-anim (make-posn WIDTH HEIGHT) (make-posn MIDDLEX TOPY) ease2)
                               (make-rotation-anim 0 360 ease2)
                               (make-color-anim (make-color 255 0 0 255) (make-color 255 0 0 255) ease2)))

(define STAR (make-animation (λ (color) (star 55 "solid" color))
                               0 200 true
                               (make-movement-anim (make-posn WIDTH 0) (make-posn MIDDLEX 200) quadratic-ease)
                               (make-rotation-anim 0 3600 quadratic-ease)
                               (make-color-anim (make-color 255 0 0 255) (make-color 255 255 0 255) quadratic-ease)))


(define RECTANGLEBOTT (make-animation (λ (color) SHAPE1)
                               0 200 true
                               (make-movement-anim (make-posn 0 0) (make-posn MIDDLEX BOTTY) ease1)
                               (make-rotation-anim 0 360 ease1)
                               (make-color-anim (make-color 255 0 0 255) (make-color 255 0 0 255) ease1)))


; Holds the list of animations
(define ANIMS (list DEMO RECTANGLETOP STAR RECTANGLEBOTT))
  
; BIG BANG
(big-bang (make-world 0 ANIMS)
          (on-tick tick 0.02)
          (to-draw render)
          (stop-when eow))