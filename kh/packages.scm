;;; Package definitions for GNU Guix
;;; Copyright © 2021-2024 Konrad Hinsen
;;;
;;; This file is NOT part of GNU Guix.
;;;
;;; These package definitions are work in progress. Once completed,
;;; I will most likely submit them to Guix and delete them here.

(define-module (kh packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix utils)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages check)
  )
