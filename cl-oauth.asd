;;; Copyright (C) 2009 Leslie P. Polzer
;;; All rights reserved.
;;; See the file LICENSE for terms of use and distribution.

(in-package #:cl-user)

(defpackage :cl-oauth-asd
  (:use #:cl #:asdf))

(in-package :cl-oauth-asd)

(defsystem :cl-oauth
  :name "CL-OAuth"
  :description "Common Lisp OAuth implementation"
  :version "0.1"
  :maintainer "Leslie P. Polzer <polzer@gnu.org>"
  :licence "LLGPL"
  :components ((:static-file "cl-oauth.asd")
               (:module "src"
                        :components ((:file "package")
                                     (:module "util"
                                              :components ((:file "uri")
                                                           (:file "query-string"))
                                              :depends-on ("package"))
                                     (:module "core"
                                              :components ((:file "crypto")
                                                           (:file "request")
                                                           (:file "parameters"
                                                                  :depends-on ("request"))
                                                           (:file "signature")
                                                           (:file "tokens"
                                                                  :depends-on ("signature")))
                                              :depends-on ("package" "util"))
                                     (:module "service-provider"
                                              :components ((:file "handlers")
                                                           (:file "server"))
                                              :depends-on ("package" "core"))
                                     (:module "consumer"
                                              :components ()
                                              :depends-on ("package" "core"))))
               (:module "test"
                        :components ((:file "package")
                                     (:module "core"
                                              :components ((:file "parameters")
                                                           (:file "signature"))
                                              :depends-on ("package")))))
  :depends-on (:ironclad :cl-base64 :babel
               :alexandria :anaphora :f-underscore :split-sequence
               :trivial-garbage
               :fiveam
               :puri :hunchentoot))

