(define-module (kh packages lisp)
  #:use-module (gnu packages)
  #:use-module (gnu packages lisp)
  #:use-module (gnu packages lisp-xyz)
  #:use-module (gnu packages lisp-check)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system asdf))

;;
;; mel-base is unmaintained. This package refers to a bug fix that I applied
;; to the most recent version I could find.
;;
(define-public sbcl-mel-base
  (package
    (name "sbcl-mel-base")
    (version "0.9.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/khinsen/mel-base")
             (commit "1386b7cbc65a0e41913101d778877b067cbcf0a4")))
       (file-name (git-file-name "cl-mel-base" version))
       (sha256
        (base32 "0nk2x0nr0czjmjmz6ki6i54k3lha4ylpkjlmr2w7jh74x4gvp6hf"))))
    (build-system asdf-build-system/sbcl)
    (inputs
     (list sbcl-flexi-streams
           sbcl-cl+ssl
           sbcl-usocket
           sbcl-babel
           sbcl-ironclad
           sbcl-cl-base64
           sbcl-cl-base64))
    (synopsis "Common Lisp mail library")
    (description
     "A versatile mail library for common lisp. Handles POP3,
      IMAP, SMTP, Maildir.")
    (home-page "https://github.com/40ants/mel-base")
    (license license:bsd-2)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CLOG and updated dependencies
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; anypool has been submitted to Guix.

(define-public sbcl-anypool
  (let ((commit "5389ec945882e87f2fc1d3e852c91aaf176556e5")
        (revision "1"))
    (package
      (name "sbcl-anypool")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/fukamachi/anypool")
               (commit commit)))
         (file-name (git-file-name "anypool" version))
         (sha256
          (base32 "1ffssc5fzh7gj0z94xxfb3mk5cwja65lrhxyfgib15a6yxqf1kk1"))))
      (build-system asdf-build-system/sbcl)
      (native-inputs
       (list sbcl-rove))
      (inputs
       (list sbcl-bordeaux-threads
             sbcl-cl-speedy-queue))
      (arguments
       '(#:asd-systems '("anypool"
                         "anypool/middleware")))
      (home-page "https://github.com/fukamachi/anypool")
      (synopsis "General-purpose connection pooling library")
      (description
       "General-purpose connection pooling library for Common Lisp")
      (license license:bsd-2))))

(define-public cl-anypool
  (sbcl-package->cl-source-package sbcl-anypool))

(define-public ecl-anypool
  (sbcl-package->ecl-package sbcl-anypool))

;; the update to lack has been submitted to Guix

(define-public sbcl-lack
  (let ((commit "35d3a8e03cab9204eec88c7dfe4d5366fc2ea922")
        (revision "1"))
    (package
      (name "sbcl-lack")
      (version (git-version "0.3.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/fukamachi/lack")
               (commit commit)))
         (file-name (git-file-name "lack" version))
         (sha256
          (base32 "1yrhhzn8ywdjxwpaxzlnsm2lslhy45r89brn8gh5n08mdyjlp4l2"))
         (patches
          (parameterize
              ((%patch-path
                (map
                 (lambda (directory)
                   (string-append directory "/kh/packages/patches"))
                 %load-path)))
            (search-patches "lack.patch")))))
      (build-system asdf-build-system/sbcl)
      (native-inputs
       (list sbcl-prove
             sbcl-cl-cookie
             sbcl-dexador
             sbcl-hunchentoot))
      (inputs
       (list sbcl-alexandria
             sbcl-anypool
             sbcl-bordeaux-threads
             sbcl-circular-streams
             sbcl-cl-base64
             sbcl-cl-isaac
             sbcl-cl-redis
             sbcl-dbi
             sbcl-http-body
             sbcl-ironclad
             sbcl-local-time
             sbcl-quri
             sbcl-trivial-mimes
             sbcl-trivial-rfc-1123))
      (arguments
       '(#:asd-systems '("lack"
                         "lack-app-directory"
                         "lack-app-file"
                         "lack-component"
                         "lack-middleware-accesslog"
                         "lack-middleware-auth-basic"
                         "lack-middleware-backtrace"
                         "lack-middleware-csrf"
                         "lack-middleware-dbpool"
                         "lack-middleware-mount"
                         "lack-middleware-session"
                         "lack-middleware-static"
                         "lack-request"
                         "lack-response"
                         "lack-session-store-dbi"
                         "lack-session-store-redis"
                         "lack-util"
                         "lack-util-writer-stream"
                         "lack-middleware-backtrace"
                         "lack-middleware-static")))
      (home-page "https://github.com/fukamachi/lack")
      (synopsis "Lack, the core of Clack")
      (description
       "Lack is a Common Lisp library which allows web applications to be
constructed of modular components.  It was originally a part of Clack, however
it's going to be rewritten as an individual project since Clack v2 with
performance and simplicity in mind.")
      (license license:llgpl))))

(define-public cl-lack
  (sbcl-package->cl-source-package sbcl-lack))

(define-public ecl-lack
  (sbcl-package->ecl-package sbcl-lack))

;; the update to clack has been submitted to Guix

(define-public sbcl-clack
  (let ((commit "4916ebb243d42d1b52f8030db146215033b1b71e")
        (revision "1"))
    (package
      (name "sbcl-clack")
      (version (git-version "2.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/fukamachi/clack")
               (commit commit)))
         (file-name (git-file-name "cl-clack" version))
         (sha256
          (base32 "0kgymwvv1ghzvl4jryl3fxf0kf44i6z19izcf1rf0k4cidx093a7"))))
      (build-system asdf-build-system/sbcl)
      (arguments
       ;; Only the handler for hunchentoot is included. The other
       ;; two Web servers supported by clack, toot and wookie,
       ;; have not yet been packaged for Guix.
       '(#:asd-systems '("clack"
                         "clack-handler-hunchentoot"
                         "clack-socket")))
      (inputs
       (list sbcl-alexandria
             sbcl-bordeaux-threads
             sbcl-flexi-streams
             sbcl-hunchentoot
             sbcl-lack
             sbcl-split-sequence
             sbcl-slime-swank
             sbcl-usocket))
      (home-page "https://github.com/fukamachi/clack")
      (synopsis "Web Application Environment for Common Lisp")
      (description
       "Clack is a web application environment for Common Lisp inspired by
Python's WSGI and Ruby's Rack.")
      (license license:expat))))

(define-public cl-clack
  (sbcl-package->cl-source-package sbcl-clack))

(define-public ecl-clack
  (sbcl-package->ecl-package sbcl-clack))

;; print-licenses has just been submitted by someone else

(define-public sbcl-print-licenses
  (let ((commit "3949663318fb736f4ee660e3aa810875187d531c")
        (revision "0"))
    (package
      (name "sbcl-print-licenses")
      (build-system asdf-build-system/sbcl)
      (version (git-version "0.1.0" revision commit))
      (home-page "https://github.com/vindarel/print-licenses/")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url home-page)
               (commit commit)))
         (file-name (git-file-name "cl-print-licenses" version))
         (sha256
          (base32 "14i6r6mf16dlj1g4xk0alg2912y3wy0qbfpyvvgsgxkkar63cmi5"))))
      (inputs (list sbcl-alexandria sbcl-iterate))
      (synopsis "Print licenses used by a Common Lisp project")
      (description "Print licenses used by a Common Lisp project and its dependencies.")
      (license license:bsd-2))))

(define-public ecl-print-licenses
  (sbcl-package->ecl-package sbcl-print-licenses))

(define-public cl-print-licenses
  (sbcl-package->cl-source-package sbcl-print-licenses))

;; the update to CLOG has not yet been submitted to Guix

(define-public sbcl-clog
  (package
    (name "sbcl-clog")
    (version "2.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/rabbibotton/clog")
             (commit (string-append "v" version))))
       (file-name (git-file-name "cl-clog" version))
       (sha256
        (base32 "175zb93kxnxv0hr8435mkm94fqhjq51wq55ybd55kcyk5y5h2xaf"))))
    (build-system asdf-build-system/sbcl)
    (inputs
     (list sbcl-alexandria
           sbcl-atomics
           sbcl-bordeaux-threads
           sbcl-cl-isaac
           sbcl-cl-pass
           sbcl-cl-ppcre
           sbcl-cl-sqlite
           sbcl-cl-template
           sbcl-clack
           sbcl-closer-mop
           sbcl-colorize
           sbcl-dbi
           sbcl-hunchentoot
           sbcl-lack
           sbcl-mgl-pax
           sbcl-parse-float
           sbcl-print-licenses
           sbcl-quri
           sbcl-trivial-open-browser
           sbcl-trivial-gray-streams
           sbcl-websocket-driver))
    (arguments
     '(#:asd-systems '("clog")))
    (home-page "https://github.com/rabbibotton/clog")
    (synopsis "Common Lisp Omnificent GUI")
    (description
     "This package provides a Common Lisp web framework for building GUI
applications.  CLOG can take the place, or work along side, most cross platform
GUI frameworks and website frameworks.  The CLOG package starts up the
connectivity to the browser or other websocket client (often a browser embedded
in a native template application).")
    (license license:bsd-3)))

(define-public sbcl-clog-docs
  (package
    (inherit sbcl-clog)
    (name "sbcl-clog-docs")
    (inputs
     (modify-inputs (package-inputs sbcl-clog)
       (prepend sbcl-clog
                sbcl-3bmd)))
    (arguments
     '(#:asd-systems '("clog/docs")))))

;; The ACE plugin for CLOG - big JavaScript dependency!

(define-public sbcl-clog-ace
  (let ((commit "61f3c2e48402e043738b3079271f64a3b515af28")
        (revision "1"))
    (package
      (name "sbcl-clog-ace")
      (version (string-append "0.0." revision))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/rabbibotton/clog-ace")
               (commit commit)))
         (file-name (git-file-name "cl-clog-ace" version))
         (sha256
          (base32 "0bwg0b04ff0dgm9k6fw976amdz0s35lss3nv5ywznx9plahi5s5h"))))
      (build-system asdf-build-system/sbcl)
      (inputs
       (list sbcl-clog))
      (arguments
       '(#:asd-systems '("clog-ace")))
      (home-page "https://github.com/rabbibotton/clog-ace")
      (synopsis "CLOG Plugin for the ACE Editor")
      (description "")
      (license license:bsd-3))))

(define-public sbcl-clog-terminal
  (let ((commit "304e3308e050abe0184ecc904cd039986e54b34f")
        (revision "1"))
    (package
      (name "sbcl-clog-terminal")
      (version (string-append "0.0." revision))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/rabbibotton/clog-terminal")
               (commit commit)))
         (file-name (git-file-name "cl-clog-terminal" version))
         (sha256
          (base32 "1pvrja8fvdzqmiqzl23lb7665vcpx9lhwxahns81wlykkyx7cjd5"))))
      (build-system asdf-build-system/sbcl)
      (inputs
       (list sbcl-clog))
      (arguments
       '(#:asd-systems '("clog-terminal")))
      (home-page "https://github.com/rabbibotton/clog-terminal")
      (synopsis "CLOG-Terminal plug-in for jQueryTerminal ")
      (description "")
      (license license:bsd-3))))

(define-public sbcl-clog-tools
  (package
    (inherit sbcl-clog)
    (name "sbcl-clog-tools")
    (inputs
     (list sbcl-clog
           sbcl-clog-ace
           sbcl-clog-terminal
           sbcl-s-base64
           sbcl-cl-indentify
           sbcl-definitions
           sbcl-parenscript
           sbcl-plump
           sbcl-slime-swank
           sbcl-trivial-main-thread))
    (arguments
     '(#:asd-systems '("clog/tools")))))

;; https://github.com/jingtaozf/literate-lisp

(define-public sbcl-literate-lisp
  (let ((commit "76d4d2c16ab08296d58e0ef3c41861b615e697c0"))
    (package
      (name "sbcl-literate-lisp")
      (version "0.6")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/jingtaozf/literate-lisp")
               (commit commit)))
         (file-name (git-file-name "literate-lisp" version))
         (sha256
          (base32 "0smxf0a62dnwcfxsbsdkx4n5nqx9dlxdz6c2vfivxpqld6d6ap02"))))
      (build-system asdf-build-system/sbcl)
      (inputs
       (list sbcl-cl-ppcre
             sbcl-iterate
             sbcl-cl-fad))
      (native-inputs
       (list sbcl-fiveam))
      (home-page "https://github.com/jingtaozf/literate-lisp")
      (synopsis "Load Common Lisp code blocks from Org-mode files")
      (description "")
      (license license:expat))))

;; https://github.com/jingtaozf/s-graphviz

(define-public sbcl-s-graphviz
  (let ((commit "a06d9573f0d4e21751b0ae782515b63a40ad6eae"))
    (package
      (name "sbcl-s-graphviz")
      (version "2.0")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/jingtaozf/s-graphviz")
               (commit commit)))
         (file-name (git-file-name "s-graphviz" version))
         (sha256
          (base32 "1841xwci6y1gfhg15464wrlnw8xgsh1mwbg4yy2y7di02q4fbma2"))))
      (build-system asdf-build-system/sbcl)
      (inputs
       (list sbcl-iterate))
      (native-inputs
       (list sbcl-literate-lisp))
      (home-page "https://github.com/jingtaozf/s-graphviz")
      (synopsis "An s-expression representation of GraphViz DOT Language")
      (description "")
      (license license:expat))))


(define-public sbcl-kh-dependencies
  (let ((commit "7beab14f0d5c94a3eda797b7fd46bfd4f40d9b01")
        (revision "2"))
    (package
      (name "sbcl-kh-dependencies")
      (version (string-append "0.1." revision))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://codeberg.org/khinsen/kh-dependencies")
               (commit commit)))
         (file-name (git-file-name "kh-dependencies" version))
         (sha256
          (base32 "1xl8bkha9nf3097l9lfj4xicvj3i5x3lh50x6f2d1r2xa7779wmb"))))
      (build-system asdf-build-system/sbcl)
      (inputs
       (list sbcl-3bmd
             sbcl-alexandria
             sbcl-arrows
             sbcl-babel
             sbcl-ciel
             sbcl-cl-base64
             sbcl-cl-base32
             sbcl-cl-fad
             sbcl-cl-mime
             sbcl-cl-qprint
             sbcl-cl-store
             sbcl-cl-unicode
             sbcl-cl-who
             sbcl-clog
             sbcl-clog-ace
             sbcl-closer-mop
             sbcl-closure-template
             sbcl-drakma
             sbcl-flexi-streams
             sbcl-fset
             sbcl-hunchentoot
             sbcl-local-time
             sbcl-mel-base
             sbcl-parse-float
             sbcl-plump
             sbcl-plump-sexp
             sbcl-quickproject
             sbcl-s-graphviz
             sbcl-serapeum
             sbcl-cl-str
             sbcl-slime-swank
             sbcl-tooter
             sbcl-trivial-clipboard
             sbcl-trivial-open-browser
             sbcl-vom
             ))
      (home-page "https://codeberg.org/khinsen/kh-dependencies")
      (synopsis "All my CL dependencies")
      (description "")
      (license license:gpl3+))))
