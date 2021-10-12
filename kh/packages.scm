;;; Package definitions for GNU Guix
;;; Copyright © 2021 Konrad Hinsen
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
  #:use-module (guix build-system python)
  #:use-module (guix build-system font)
  #:use-module (gnu packages astronomy)
  #:use-module (gnu packages base)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages compression))

(define-public font-juliamono
  (package
    (name "font-juliamono")
    (version "0.043")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cormullion/juliamono/releases/download/"
                    "v" version "/JuliaMono-ttf.tar.gz"))
              (sha256
               (base32
                "0vb7n9yqgasnxzps13ckklay5bla6b0i79pzmfqvjms1r37079gh"))))
    (build-system font-build-system)
    (arguments
     `(#:phases (modify-phases %standard-phases
                  (replace 'unpack
                    (lambda* (#:key source #:allow-other-keys)
                      (mkdir "source")
                      (chdir "source")
                      (invoke "tar" "xzf" source))))))
    (native-inputs `(("tar" ,tar)))
    (home-page "https://juliamono.netlify.app/")
    (synopsis "JuliaMono typeface")
    (description "The JuliaMono font is a monospaced font with good Unicode
coverage, in particular for the needs of scientific and technical computing.")
    (license license:silofl1.1)))
