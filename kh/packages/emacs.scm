(define-module (kh packages emacs)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages texinfo)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system emacs))

(define-public emacs-guess-language
  (package
   (name "emacs-guess-language")
   (version "20170620.308")
   (source
    (origin
     (method url-fetch)
     (uri (string-append
           "https://github.com/tmalsburg/guess-language.el/"
           "archive/1f1602f74d7159e7fb8c90f92ec5a3d1df5429da.tar.gz"))
     (sha256
      (base32
       "11nxf9bl6y91fdp7hm5d3fifgkjcqixwzlj2y5bcr9aky7vqrrbj"))))
   (build-system emacs-build-system)
   (arguments
    `(#:include '("\\.el$" "^trigrams/")))
   (home-page "https://github.com/tmalsburg/guess-language.el")
   (synopsis "Robust automatic language detection")
   (description
    "Guess-language is a buffer-local minor mode that guesses the
language of the current paragraph when flyspell detects an incorrect
word and changes Ispell's dictionary and typo-mode (if present)
accordingly.  The detection algorithm is based on counts of character
trigrams.")
   (license license:gpl3+)))

(define emacs-org-pdfview
  (package
   (name "emacs-org-pdfview")
   (version "0.4")
   (source
    (origin
     (method url-fetch)
     (uri (string-append
           "http://stable.melpa.org/packages/org-pdfview-"
           version
           ".el"))
     (sha256
      (base32
       "188rpjj1xrvvm9w2dsrwzgnwbgbgam3k9x6hcmbf4yh6w3f3dg42"))))
   (build-system emacs-build-system)
   (propagated-inputs
    `(("emacs-org" ,emacs-org)
      ("emacs-pdf-tools" ,emacs-pdf-tools)))
   (home-page "https://github.com/markus1189/org-pdfview")
   (synopsis
    "Support for links to documents in pdfview mode")
   (description
    "Add support for org links to PDF buffers.")
   (license license:gpl3+)))
