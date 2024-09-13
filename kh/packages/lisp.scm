(define-module (kh packages lisp)
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
        (base32 "0bxprqabkw179cj6g8yi8d56xll8yji30rlns6dhbl3979sj7sax"))))
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
          (base32 "07lwy3sfcsl7qxw4xnwcl2gb892fflimbh5v4fjim9vl1k5wlj6p"))))
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
