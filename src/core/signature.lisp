
(in-package :oauth)

(defun signature-base-string (uri &key (request-method (request-method))
                                       (parameters (normalized-parameters)))
  (concatenate 'string (string-upcase (princ-to-string request-method))
                       "&" (url-encode
                             (normalize-request-uri uri))
                       "&" (url-encode
                             (alist->query-string parameters
                                                  :include-leading-ampersand nil))))

(defun hmac-key (consumer-secret token-secret)
  "9.2"
  (concatenate 'string consumer-secret "&" token-secret))

(defun encode-signature (octets)
  "9.2.1"
  (url-encode
    (cl-base64:usb8-array-to-base64-string octets)))

