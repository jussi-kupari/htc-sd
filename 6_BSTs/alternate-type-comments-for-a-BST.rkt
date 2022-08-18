;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname alternate-type-comments-for-a-BST) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;Consider these alternate type comments for a BST:

(define-struct entry (key val))
;; Entry is (make-entry Integer String)
;; a key and value pair

(define-struct node (e l r))
;; BST is one of:
;; - false
;; - (make-node Entry BST BST)
;; interp. false means no BST, or empty BST
;;         e contains the key and value
;;         l and r are left and right subtrees
;; INVARIANT: for a given node:
;;     key within entry is > all keys in its l(eft)  child
;;     key within entry is < all keys in its r(ight) child
;;     the same key never appears twice in the tree

;What effect would this new data definition have on writing a function such as lookup-in-bst?

#; Template for Entry
(define (fn-for-entry e)
  (... (entry-key e)
       ... (entry-val e)))


#; Template for alt-bst
(define (fn-for-alt-bst t)
  (cond
    [(false? t) (...)]
    [else
     (... (entry-key (node-e))
          (entry-value (node-e))
          (fn-for-alt-bst (node-l t))
          (fn-for-alt-bst (node-r t)))]))