;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname rotating-cube-test) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/universe)
(require 2htdp/image)

;; -- An animation of a rotating cube

;; -- Constants

(define CANVAS (square 100 "outline" "black"))
(define CUBE (rectangle 50 50 "solid" "orange"))


;; -- Data Definition

;; RotationState (RS) is Natural[0, 359]
;; interp. the rotation-angle of the cube in degrees around central axis

(define RS1 10)
(define RS2 254)

#;
(define (fn-for-rotation-state r)
  (... r))

;; Template rules used:
;; - atomic non-distinct: Natural[0, 359]


;; -- Functions

(define (main r)
  (big-bang r                        ; RS
            (on-tick   rotate-cube)  ; RS -> RS
            (to-draw   render)))     ; RS -> Image


;; RS -> RS
;; Given RS, returns an RS with one degree more of rotation
(check-expect (rotate-cube 100) 101)

(define (rotate-cube r)
  (+ r 1))

;; RS -> Image
;; Given RS, draws an image of a cube
(check-expect (render 5) (overlay (rotate 5 CUBE) CANVAS))

(define (render r)
  (overlay (rotate r CUBE) CANVAS))


















