(define-module (kh packages mail)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix utils)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages check)

  #:use-module (guix gexp)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cyrus-sasl)
  #:use-module (gnu packages dbm)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages tls))

;;
;; An older version of isync, for exploring where a recent error message
;; comes from.
;;
(define-public isync
  (package
    (name "isync")
    (version "1.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://sourceforge/isync/isync/"
                           version "/isync-" version ".tar.gz"))
       (sha256 (base32
                "1zq0wwvmqsl9y71546dr0aygzn9gjjfiw19hlcq87s929y4p6ckw"))
       (patches
        ;; Likely to be included in next version
        (search-patches "isync-openssl3-fix.patch"))))
    (build-system gnu-build-system)
    (arguments
     (list
       #:phases
       #~(modify-phases %standard-phases
           (add-after 'install 'substitute-openssl-path
             (lambda* (#:key inputs outputs #:allow-other-keys)
               (substitute* (string-append #$output "/bin/mbsync-get-cert")
                 (("openssl s_client")
                  (string-append (search-input-file inputs "/bin/openssl")
                                 " s_client"))))))))
    (native-inputs
     (list perl))
    (inputs
     (list bdb cyrus-sasl openssl zlib))
    (home-page "https://isync.sourceforge.io/")
    (synopsis "Mailbox synchronization program")
    (description
     "isync/mbsync is a command-line tool for two-way synchronization of
mailboxes.  Currently Maildir and IMAP are supported types.")
    (license license:gpl2+)))
