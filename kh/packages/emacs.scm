(define-module (kh packages emacs)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages emacs-xyz)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system emacs))

(define-public emacs-org-cliplink
  (package
   (name "emacs-org-cliplink")
   (version "20190608.2134")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/rexim/org-cliplink")
           (commit "82402cae7e118d67de7328417fd018a18f95fac2")))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0cx0bmpsniazpl420cck9pgvmyfznrvl5bgrjnfyvkmqgpz9nyzv"))))
   (build-system emacs-build-system)
   (home-page
    "http://github.com/rexim/org-cliplink")
   (synopsis
    "insert org-mode links from the clipboard")
   (description
    "A simple command that takes a URL from the clipboard and inserts an
org-mode link with a title of a page found by the URL into the
current buffer

This code was a part of my Emacs config almost a year. I decided to
publish it as a separate package in case someone needs this feature
too.
")
   (license (license:non-copyleft #:uri "http://github.com/rexim/org-cliplink/org-cliplink.el
"))))

(define-public emacs-pinboard
  (package
   (name "emacs-pinboard")
   (version "1.2")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/davep/pinboard.el")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0ljxvp9yppnmy1lnnipqqbk09bmay523haa8h0gnfnrl02jwgs91"))))
   (build-system emacs-build-system)
   (home-page
    "https://github.com/davep/pinboard.el")
   (synopsis "A pinboard.in client")
   (description
    "pinboard.el provides an Emacs client for pinboard.in.

To get started, visit your password settings page
(https://pinboard.in/settings/password) on Pinboard and get the API token
that's displayed there. Then edit ~/.authinfo and add a line like this:

machine api.pinboard.in password foo:8ar8a5w188l3

Once done, you can M-x pinboard RET and browse your pins. A number of
commands are available when viewing the pin list, press \"?\" or see the
\"Pinboard\" menu for more information.

Commands available that aren't part of the pin list, and that you might
want to bind to keys, include:

| Command                | Description                           |
| ---------------------- | ------------------------------------- |
| pinboard               | Open the Pinboard pin list            |
| pinboard-add           | Add a new pin to Pinboard             |
| pinboard-add-for-later | Prompt for a URL and add it for later |
")
   (license license:gpl3)))

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

;; (define-public emacs-org-roam-ui
;;   (package
;;     (name "emacs-org-roam-ui")
;;     (version "20211209.1418")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url "https://github.com/org-roam/org-roam-ui.git")
;;              (commit "9ed0c5705a302a91fab2b8bcc777a12dcf9b3682")))
;;        (sha256
;;         (base32 "1am11vnzklv0cbivsw5r8x8fx457166mvfgyv7cdhrz88s8iqm23"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs
;;      (list emacs-org-roam emacs-simple-httpd emacs-websocket))
;;     (arguments
;;      '(#:include
;;        '("^[^/]+.el$"
;;          "^[^/]+.el.in$"
;;          "^dir$"
;;          "^[^/]+.info$"
;;          "^[^/]+.texi$"
;;          "^[^/]+.texinfo$"
;;          "^doc/dir$"
;;          "^doc/[^/]+.info$"
;;          "^doc/[^/]+.texi$"
;;          "^doc/[^/]+.texinfo$"
;;          "^out$")
;;        #:exclude
;;        '("^.dir-locals.el$"
;;          "^test.el$"
;;          "^tests.el$"
;;          "^[^/]+-test.el$"
;;          "^[^/]+-tests.el$")))
;;     (home-page "https://github.com/org-roam/org-roam-ui")
;;     (synopsis "Browser-based user interface for Org-roam")
;;     (description
;;      "Org-roam-ui provides a web interface for navigating around notes created
;; within Org-roam.")
;;     (license license:gpl3+)))
