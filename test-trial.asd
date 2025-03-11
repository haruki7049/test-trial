(asdf:defsystem test-trial
    :components ((:file "package")
                 (:file "main"))
    :depends-on (:trial))
