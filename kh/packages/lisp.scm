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
;; CIEL and dependencies
;; All of these packages have been submitted
;; to Guix.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-public sbcl-moira
  (let ((commit "448d8e77b95f5de7b41d2897a2167c4b1fb85a76")
        (revision "0"))
    (package
      (name "sbcl-moira")
      (version (git-version "0.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/ruricolist/moira")
               (commit commit)))
         (file-name (git-file-name "cl-moira" version))
         (sha256
          (base32 "01wxjg122flla4pgys57hya3fwrkyjkpp26j5ypl5885zz1ip5b7"))))
      (build-system asdf-build-system/sbcl)
      (inputs
       (list sbcl-alexandria
             sbcl-bordeaux-threads
             sbcl-osicat
             sbcl-serapeum
             sbcl-trivial-features
             sbcl-trivial-garbage))
      (home-page "https://github.com/ruricolist/moira")
      (synopsis "Monitor and restart background threads")
      (description
       "Moira is a library for monitoring and, if necessary, restarting
long-running threads.  In principle, it is like an in-Lisp process supervisor.")
      (license license:expat))))

(define-public sbcl-file-finder
  (let ((commit "ec392d775eee33dbdea0d6532d20952438991f99")
        (version "0.2.0"))
    (package
      (name "sbcl-file-finder")
      (version version)
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/lisp-maintainers/file-finder")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1mpasi7n0ysggx0inxdbzlwavh08m0jxvv220ammvcyn3xybbchj"))))
      (build-system asdf-build-system/sbcl)
      (inputs
       (list sbcl-alexandria
             sbcl-cl-str
             sbcl-file-attributes
             sbcl-local-time
             sbcl-named-readtables
             sbcl-serapeum))
      (synopsis "Enable rapid file search, inspection and manipulation")
      (description
       "Modern file handling for Common Lisp, which avoids many of
the pitfalls of pathnames.")
      (home-page "https://github.com/lisp-maintainers/file-finder")
      (license license:gpl3+))))

(define-public sbcl-cl-ftp
  (let ((commit "530f1ec06427c69966d83c86638be628eacb9502")
        (version "1.6.1"))
    (package
      (name "sbcl-cl-ftp")
      (version version)
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/pinterface/cl-ftp")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32  "0q5x9g419crvaf106q33k0xkh4xvglzjyjhibz9siymcngyc7zdh"))))
      (build-system asdf-build-system/sbcl)
      (inputs
       (list sbcl-split-sequence
             sbcl-usocket))
      (synopsis "FTP client for Common Lisp")
      (description
       "CL-FTP is a library which provides FTP client functionality
to a Common Lisp program. CL-FTP uses the USOCKET package for network
sockets and the SPLIT-SEQUENCE package for some parsing needs.")
      (home-page "https://github.com/pinterface/cl-ftp")
      (license license:expat))))

(define-public sbcl-secret-values
  (let ((commit "72996c0551eea338afa355ee90e20171ac74ebd4")
        (revision "0"))
    (package
      (name "sbcl-secret-values")
      (version (git-version "0.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/rotatef/secret-values")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32  "07ph49s27gvjzx60yy094bb9ddwiys34r8cx5l837i34nm2fn3nh"))))
      (build-system asdf-build-system/sbcl)
      (synopsis "Hide passwords and similar secret inputs")
      (description
       "Provides a wrapper type for secret values.")
      (home-page "https://github.com/rotatef/secret-values")
      (license license:expat))))

(define-public sbcl-progressons
  (let ((commit "69a8092e43876d66943aef709ab641818d52f2da"))
    (package
      (name "sbcl-progressons")
      (version "0.1")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/vindarel/progressons")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1i93khd0l1aphzh6qb4yy9cpi2nmqac08b90yx95p4zymap03nly"))))
      (build-system asdf-build-system/sbcl)
      (inputs
       (list sbcl-cl-ansi-text
             sbcl-cl-str))
      (synopsis "Display a progress bar on one line")
      (description
       "Display a progress bar on one line.")
      (home-page "https://github.com/vindarel/progressons")
      (license license:expat))))

(define-public sbcl-termp
  (let ((commit "29789fe83db624679b6f341e3fae3f2577ce6a45"))
    (package
      (name "sbcl-termp")
      (version "0.1")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/vindarel/termp")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "03r5cv01q4yg0a2dv2ckn2xys53y9isrq3hkp0dqa96q8wrindlh"))))
      (build-system asdf-build-system/sbcl)
      (inputs
       (list sbcl-log4cl))
      (synopsis "Test for real vs. dumb terminal window")
      (description
       "A trivial utility for distinguishing between a process running
in a real terminal window and a process running in a dumb one, e.g.
emacs-slime.")
      (home-page "https://github.com/vindarel/termp")
      (license license:expat))))

(define-public sbcl-ciel
  (let ((commit "0b26d64dcd91a3a2aa962842629a853261dd30fe")
        (version "0.2.1"))
    (package
      (name "sbcl-ciel")
      (version version)
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/ciel-lang/CIEL")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0gm8slnz4jw98rkijnh2dp6x629xdnfk8z7j35g03j6ypr56v06h"))))
      (build-system asdf-build-system/sbcl)
      (native-inputs
       (list sbcl-fiveam))
      (inputs
       (list sbcl-access
             sbcl-alexandria
             sbcl-arrow-macros
             sbcl-bordeaux-threads
             sbcl-cl-ansi-text
             sbcl-cl-cron
             sbcl-cl-csv
             sbcl-cl-ftp
             sbcl-cl-json-pointer
             sbcl-cl-ppcre
             sbcl-cl-reexport
             sbcl-cl-str
             sbcl-clesh
             sbcl-clingon
             sbcl-closer-mop
             sbcl-cmd
             sbcl-dbi
             sbcl-defstar
             sbcl-dexador
             sbcl-dissect
             sbcl-easy-routes
             sbcl-file-finder
             sbcl-file-notify
             sbcl-for
             sbcl-fset
             sbcl-generic-cl
             sbcl-hunchentoot
             sbcl-local-time
             sbcl-log4cl
             sbcl-lparallel
             sbcl-lquery
             sbcl-metabang-bind
             sbcl-modf
             sbcl-moira
             sbcl-named-readtables
             sbcl-parse-float
             sbcl-parse-number
             sbcl-printv
             sbcl-progressons
             sbcl-pythonic-string-reader
             sbcl-quicksearch
             sbcl-quri
             sbcl-repl-utilities
             sbcl-secret-values
             sbcl-serapeum
             sbcl-shasht
             sbcl-shlex
             sbcl-spinneret
             sbcl-sxql
             sbcl-termp
             sbcl-trivia
             sbcl-trivial-arguments
             sbcl-trivial-do
             sbcl-trivial-monitored-thread
             sbcl-trivial-package-local-nicknames
             sbcl-trivial-types
             sbcl-vgplot
             sbcl-which))
      (outputs '("out" "image"))
      (arguments
       (list
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'create-asdf-configuration 'build-image
              (lambda* (#:key outputs #:allow-other-keys)
                (build-image
                 (string-append (assoc-ref outputs "image") "/bin/ciel")
                 outputs
                 #:dependencies '("ciel")))))))
      (home-page "http://ciel-lang.org/")
      (synopsis "CIEL Is an Extended Lisp")
      (description
       "CIEL is a ready-to-use collection of libraries providing: a binary, to
run CIEL scripts; a simple full-featured REPL for the terminal; a Lisp library
and a core image .")
      (license license:expat))))

(define-public sbcl-ciel-repl
  (let ((commit "afd11148b558fe963202d07b5360c66ba73d250d")
        (version "0.2"))
    (package
      (name "sbcl-ciel-repl")
      (version version)
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/khinsen/CIEL")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1hhhjv10klinpi255rnhrkk3bnis5zxabdw7ygg76yj3k7xfllmz"))))
      (build-system asdf-build-system/sbcl)
      (inputs
       (list sbcl-ciel
             sbcl-cl-readline
             sbcl-lisp-critic
             sbcl-magic-ed))
      (arguments
       (list
        #:asd-systems ''("ciel/repl")
        #:phases
        #~(modify-phases %standard-phases
            ;; The built-in scripts require special care. They are
            ;; read from src/scripts in the current directory.
            ;; When the binary is built, the current directory is
            ;; {out}/bin, so the scripts have to be copied there,
            ;; but that copy must be deleted after the binary has been
            ;; built, otherwise it would end up in the package.
            (add-after 'create-asdf-configuration 'install-scripts
              (lambda _
                (let ((dir (string-append #$output "/bin/src/scripts")))
                  (for-each (lambda (file)
                              (install-file file dir))
                            (find-files "src/scripts" "\\.lisp$")))))
            (add-after 'install-scripts 'build-program
              (lambda* (#:key outputs #:allow-other-keys)
                (build-program
                 (string-append #$output "/bin/ciel")
                 outputs
                 #:entry-program '((ciel::main))
                 #:dependencies '("ciel/repl")
                 #:compress? #t)))
            (add-after 'build-program 'delete-scripts
              (lambda _
                (let ((dir (string-append #$output "/bin/src")))
                  (delete-file-recursively dir))))
            ;; Remove everything except the binary.
            (add-after 'delete-scripts 'delete-lisp-files
              (lambda _
                (let ((dir (string-append #$output "/etc")))
                  (delete-file-recursively dir))
                (let ((dir (string-append #$output "/lib")))
                  (delete-file-recursively dir))
                (let ((dir (string-append #$output "/share")))
                  (delete-file-recursively dir))
                (let ((dir (string-append #$output "/.asd-files")))
                  (delete-file-recursively dir)))))))
      (home-page "http://ciel-lang.org/")
      (synopsis "CIEL Is an Extended Lisp")
      (description
       "CIEL is a ready-to-use collection of libraries providing: a binary, to
run CIEL scripts; a simple full-featured REPL for the terminal; a Lisp library
and a core image .")
      (license license:expat))))

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
