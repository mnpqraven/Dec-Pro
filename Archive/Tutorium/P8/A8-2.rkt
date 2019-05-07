;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname A8-2) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Aufgabe 8-2
;a
; A BST is one of:
; - (make-leaf Number)
(define-struct leaf (val))
; - (make-node Number BST BST)
(define-struct node (val left right))
; interp. as binary search tree for numbers

; Number BST -> BST
; Inserts the given number into the tree
(define (tree/insert value tree)
  (cond [(leaf? tree) (if (<= value (leaf-val tree))
                          (make-node (leaf-val tree) (make-leaf value) (make-leaf null))
                          (make-node (leaf-val tree) (make-leaf null) (make-leaf value)))]
        [(node? tree) (if (<= value (node-val tree))
                          (tree/insert value (node-left tree))
                          (tree/insert value (node-right tree)))]))

; Number BST -> Boolean
; Checks if the given tree contains the given Number
(define (tree/contains value tree)
  (cond [(leaf? tree) (= value (leaf-val tree))]
        ((node? tree) (cond [(= value (node-val tree)) #true]
                            [(< value (node-val tree)) (tree/contains value (node-left tree))]
                            [(> value (node-val tree)) (tree/contains value (node-right tree))]))))

;b
(define-type BST
  [leaf (val number?)]
  [node (val number?)(left BST?)(right BST?)])

; Number BST -> BST
; Inserts the given number into the tree
(define (tree/insert value tree)
  (type-case BST tree
    [leaf (val) (if (<= value val)
                          (make-node val (make-leaf value) (make-leaf null))
                          (make-node val (make-leaf null) (make-leaf value)))]
    [node (val left right)(if (<= value val)
                          (tree/insert value left)
                          (tree/insert value right))]))

; Number BST -> Boolean
; Checks if the given tree contains the given Number
(define (tree/contains value tree)
  (type-case BST tree
    [leaf (val) (= value val)]
    [node (val left right) (cond [(= value val) #true]
                                 [(< value val) (tree/contains value left)]
                                 [(> value val) (tree/contains value right)])]))

