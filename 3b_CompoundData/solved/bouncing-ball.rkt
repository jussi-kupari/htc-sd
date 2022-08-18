;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname bouncing-ball) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/universe)
(require 2htdp/image)

;; -- An animation of a rotating cube


;; -- Constants

(define CANVAS (empty-scene 1000 100))
(define BALL (circle 50 "solid" "black"))


;; -- Data Definition

(define-struct ball (prevx newx))

;; Ball is (make-ball Number Number Number)
;; interp. (make-ball prevx newx):
;;                           prevx: previous x-position of cube
;;                           newx: new x-position of cube

(define B1 (make-ball 100 101))

#;
(define (fn-for-ball b)
  (... (ball-prevx b)     ;Number
       (ball-newx b)))    ;Number


;; Template rules used:
;;  - compound: 2 fields


;; -- Functions


(define (main b)
  (big-bang b                      ; Ball
    (on-tick   next-ball)  ; Ball -> Ball
    (on-key reverse-ball)  ; Ball -> Ball
    (to-draw   render)))   ; Ball -> Image


;; Ball -> Ball
;; Given Ball, returns next Ball
(check-expect (next-ball (make-ball 49 50)) (make-ball 50 55))
(check-expect (next-ball (make-ball 999 998)) (make-ball 998 993))
(check-expect (next-ball (make-ball 5 0)) (make-ball 0 5))

(define (next-ball b)
  (make-ball (ball-newx b)
             (cond
               [(>= (ball-newx b) (image-width CANVAS)) (- (ball-newx b) 5)]
               [(<= (ball-newx b) 0) (+ (ball-newx b) 5)]
               [(> (ball-newx b) (ball-prevx b)) (+ (ball-newx b) 5)]
               [(< (ball-newx b) (ball-prevx b)) (- (ball-newx b) 5)])))  


;; Ball -> Ball
;; Given Ball, reverses the direction when space-bar is pressed.
(check-expect (reverse-ball (make-ball 50 55) " ") (make-ball 55 50))
(check-expect (reverse-ball (make-ball 999 994) " ") (make-ball 994 999))

(define (reverse-ball b ke)
  (cond
    [(and (key=? ke " ") (> (ball-newx b) (ball-prevx b)))
     (make-ball (ball-newx b) (- (ball-newx b) 5))]
    [(and (key=? ke " ") (< (ball-newx b) (ball-prevx b)))
     (make-ball (ball-newx b) (+ (ball-newx b) 5))]
    [else b]))


;; Cube -> Image
;; Given Cube, draws an image of a cube

(check-expect (render B1) (place-image BALL 101 50 CANVAS))

(define (render b)
  (place-image BALL (ball-newx b) 50 CANVAS))


















