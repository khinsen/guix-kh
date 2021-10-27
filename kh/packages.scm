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
  #:use-module (gnu packages base)
  #:use-module (gnu packages check)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-check)
  #:use-module (gnu packages python-xyz))

(define-public python-pytest-subtests
  (package
    (name "python-pytest-subtests")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pytest-subtests" version))
       (sha256
        (base32 "087i03nmkmfnrpc7mmizvr40ijnjw4lfxc22rnk8jk6s1szy9lav"))))
    (build-system python-build-system)
    (propagated-inputs `(("python-pytest" ,python-pytest)))
    (home-page "https://github.com/pytest-dev/pytest-subtests")
    (synopsis "unittest subTest() support and subtests fixture")
    (description "unittest subTest() support and subtests fixture")
    (license license:expat)))

(define-public python-pint
  (package
   (name "python-pint")
   (version "0.17")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "Pint" version))
     (sha256
      (base32 "04zklf8ba7zj6garfr753x2nd19m4wjgxvn6lx3ni7i32fkwml7l"))))
   (build-system python-build-system)
   (propagated-inputs
    `(("python-importlib-metadata" ,python-importlib-metadata)
      ("python-importlib-resources" ,python-importlib-resources)
      ("python-packaging" ,python-packaging)))
   (native-inputs
    `(("python-pytest" ,python-pytest)
      ("python-pytest-cov" ,python-pytest-cov)
      ("python-pytest-mpl" ,python-pytest-mpl)
      ("python-pytest-subtests" ,python-pytest-subtests)))
   (home-page "https://github.com/hgrecco/pint")
   (synopsis "Physical quantities module")
   (description "Physical quantities module")
   (license license:bsd-3)))
