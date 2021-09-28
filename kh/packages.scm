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
  #:use-module (gnu packages astronomy)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages compression))

(define-public python-fitsio
  (package
    (name "python-fitsio")
    (version "1.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "fitsio" version))
       (sha256
        (base32 "1llql2i6xr9lkdl81jx5nvz80kspamvira90546y32ldy551hq1l"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'unbundle-cfitsio
           (lambda* (#:key inputs #:allow-other-keys)
             (let* ((cfitsio (assoc-ref inputs "cfitsio"))
                    (includedir (string-append "\"" cfitsio "/include\""))
                    (libdir (string-append "\"" cfitsio "/lib\"")))
               (substitute* "setup.py"
                 (("self.use_system_fitsio = False") "pass")
                 (("self.system_fitsio_includedir = None") "pass")
                 (("self.system_fitsio_libdir = None") "pass")
                 (("self.use_system_fitsio") "True")
                 (("self.system_fitsio_includedir") includedir)
                 (("self.system_fitsio_libdir") libdir))
               )
             ;; cfitsio is built without bzip2 support, so the bzip2 test
             ;; must fail.
             (substitute* "fitsio/test.py"
               (("'SKIP_BZIP_TEST' in os.environ") "True"))
             ;; (let* ((bzip2 (assoc-ref inputs "bzip2"))
             ;;        (bzip2-binary (string-append bzip2 "bin/bzip2")))
             ;;   (substitute* "fitsio/test.py"
             ;;     (("os.system('bzip2 %s' % fname)")
             ;;      (string-append
             ;;       "os.system('"
             ;;       bzip2-binary
             ;;       " %s' % fname)"))))
             #t))
         )))
    (propagated-inputs
     `(("python-numpy" ,python-numpy)
       ("cfitsio" ,cfitsio)))
    (native-inputs
     `(("bzip2" ,bzip2))) ;; used in tests
    (home-page "https://github.com/esheldon/fitsio")
    (synopsis
     "Python library to read from and write to FITS files")
    (description
     "A full featured python library to read from and write to FITS files.")
    (license license:gpl2)))

