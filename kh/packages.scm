;;; Package definitions for GNU Guix
;;; Copyright © 2021-2022 Konrad Hinsen
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
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages check)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-check)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages time)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages linux)
  )

;; (define-public python-pytest-subtests
;;   (package
;;     (name "python-pytest-subtests")
;;     (version "0.5.0")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (pypi-uri "pytest-subtests" version))
;;        (sha256
;;         (base32 "087i03nmkmfnrpc7mmizvr40ijnjw4lfxc22rnk8jk6s1szy9lav"))))
;;     (build-system python-build-system)
;;     (propagated-inputs `(("python-pytest" ,python-pytest)))
;;     (home-page "https://github.com/pytest-dev/pytest-subtests")
;;     (synopsis "unittest subTest() support and subtests fixture")
;;     (description "unittest subTest() support and subtests fixture")
;;     (license license:expat)))

;; (define-public python-pint
;;   (package
;;    (name "python-pint")
;;    (version "0.17")
;;    (source
;;     (origin
;;      (method url-fetch)
;;      (uri (pypi-uri "Pint" version))
;;      (sha256
;;       (base32 "04zklf8ba7zj6garfr753x2nd19m4wjgxvn6lx3ni7i32fkwml7l"))))
;;    (build-system python-build-system)
;;    (propagated-inputs
;;     `(("python-importlib-metadata" ,python-importlib-metadata)
;;       ("python-importlib-resources" ,python-importlib-resources)
;;       ("python-packaging" ,python-packaging)))
;;    (native-inputs
;;     `(("python-pytest" ,python-pytest)
;;       ("python-pytest-cov" ,python-pytest-cov)
;;       ("python-pytest-mpl" ,python-pytest-mpl)
;;       ("python-pytest-subtests" ,python-pytest-subtests)))
;;    (home-page "https://github.com/hgrecco/pint")
;;    (synopsis "Physical quantities module")
;;    (description "Physical quantities module")
;;    (license license:bsd-3)))

;; (define-public python-pymupdf
;;   (package
;;     (name "python-pymupdf")
;;     (version "1.19.1")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (pypi-uri "PyMuPDF" version))
;;        (sha256
;;         (base32 "0xgx4szwmdjxkq9c9zwbal8k14gc5jz9j1mnjmxk57sjs5qwcw2a"))))
;;     (build-system python-build-system)
;;     (inputs
;;      `(("mupdf" ,mupdf)))
;;     (propagated-inputs
;;      `(("python-pillow" ,python-pillow)
;;        ("python-fonttools" ,python-fonttools)))
;;     (home-page "https://github.com/pymupdf/PyMuPDF")
;;     (synopsis "Python bindings for the PDF toolkit and renderer MuPDF")
;;     (description "Python bindings for the PDF toolkit and renderer MuPDF")
;;     (license #f)))

;; (define-public python-xmp-toolkit
;;   (package
;;     (name "python-xmp-toolkit")
;;     (version "2.0.1")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (pypi-uri "python-xmp-toolkit" version))
;;        (sha256
;;         (base32 "0f4s86hji6idyfg9007jncl366gasjjmldbwbknldzgrdya15ngq"))))
;;     (build-system python-build-system)
;;     (propagated-inputs `(("python-pytz" ,python-pytz)))
;;     (home-page "https://github.com/python-xmp-toolkit/python-xmp-toolkit")
;;     (synopsis "Python XMP Toolkit for working with metadata.")
;;     (description "Python XMP Toolkit for working with metadata.")
;;     (license #f)))

;; (define-public ocrmypdf
;;   (package
;;     (name "ocrmypdf")
;;     (version "12.7.0")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (pypi-uri "ocrmypdf" version))
;;        (sha256
;;         (base32 "136nq1awnld6bb26268dggay7fjwbxrsk54ky136mnlvllgd8dsv"))))
;;     (build-system python-build-system)
;;     (propagated-inputs
;;      `(("python-cffi" ,python-cffi)
;;        ("python-coloredlogs" ,python-coloredlogs)
;;        ("img2pdf" ,img2pdf)
;;        ("python-importlib-metadata" ,python-importlib-metadata)
;;        ("python-importlib-resources" ,python-importlib-resources)
;;        ("python-pdfminer-six" ,python-pdfminer-six)
;;        ("python-pikepdf" ,python-pikepdf)
;;        ("python-pillow" ,python-pillow)
;;        ("python-pluggy" ,python-pluggy)
;;        ("python-reportlab" ,python-reportlab)
;;        ("python-tqdm" ,python-tqdm)))
;;     (native-inputs
;;      `(("python-coverage" ,python-coverage)
;;        ("python-pymupdf" ,python-pymupdf)
;;        ("python-pytest" ,python-pytest)
;;        ("python-pytest-cov" ,python-pytest-cov)
;;        ("python-pytest-xdist" ,python-pytest-xdist)
;;        ("python-xmp-toolkit" ,python-xmp-toolkit)))
;;     (home-page "https://github.com/jbarlow83/OCRmyPDF")
;;     (synopsis
;;      "OCRmyPDF adds an OCR text layer to scanned PDF files, allowing them to be searched")
;;     (description
;;      "OCRmyPDF adds an OCR text layer to scanned PDF files, allowing them to be searched")
;;     (license #f)))

;; (define-public minimacy
;;   (package
;;     (name "minimacy")
;;     (version "0.6.2")
;;     (source (origin
;;              (method git-fetch)
;;              (uri (git-reference
;;                    (url "https://github.com/ambermind/minimacy/")
;;                    (commit "0.6.2")))
;;              (file-name (git-file-name name version))
;;              (sha256
;;               (base32
;;                "1x9i1spf79lq3kxms55dx7lf8pl84cyblq313sjyfpr9l187ailb"))
;;              ;;(patches (search-patches "minimacy.patch"))
;;              (patches (list "/home/hinsen/src/guix-kh/kh/patches/minimacy.patch"))))
;;     (build-system gnu-build-system)
;;     (inputs (list libx11 libxext alsa-lib mesa glu))
;;     (outputs '("out"     ; the core
;;                "X11"     ; for GUI programs, with X11 and ALSA
;;                "X11GL")) ; for GUI programs, with X11, OpenGL, and ALSA
;;     (arguments
;;      `(#:phases
;;        (modify-phases %standard-phases
;;          (add-after 'unpack 'patch-path
;;                     (lambda _
;;                       (substitute* "src/hw.c"
;;                                    (("minimacy-in-gnu-store")
;;                                     (assoc-ref %outputs "out")))))
;;          (delete 'configure)
;;          (replace 'build
;;            (lambda _
;;              (chdir "unix")
;;              (invoke "make" "nox")
;;              (for-each delete-file
;;                        (find-files "../obj" "\\.o$"))
;;              (invoke "make" "x11")
;;              (for-each delete-file
;;                        (find-files "../obj" "\\.o$"))
;;              (invoke "make" "x11gl")
;;              (chdir "..")))
;;          (replace 'install
;;            (lambda _
;;              (let ((output (assoc-ref %outputs "out")))
;;                (install-file "bin/minimacy" (string-append output "/bin"))
;;                (mkdir-p (string-append output "/rom"))
;;                (mkdir-p (string-append output "/system"))
;;                (copy-recursively "rom" (string-append output "/rom"))
;;                (copy-recursively "system" (string-append output "/system")))
;;              (let ((output (assoc-ref %outputs "X11")))
;;                (install-file "bin/minimacyX11" (string-append output "/bin")))
;;              (let ((output (assoc-ref %outputs "X11GL")))
;;                (install-file "bin/minimacyX11GL" (string-append output "/bin")))))
;;          (delete 'check))))
;;     (synopsis "Minimalist computing system")
;;     (description
;;      "Minimacy is an open-source minimalist computing technology.
;; It consists of a programming language (compiler plus virtual machine)
;; and a library, written such that the whole system can be fully
;; understood by a single person.  An optional extension to the virtual
;; machine adds X11 and ALSA for user interfaces, another extension
;; adds OpenGL support.")
;;     (home-page "https://minimacy.net/")
;;     (license license:gpl2)))
