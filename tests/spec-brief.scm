(use atom)

;; rfc4287 brief example

(write-atom-doc
 (make-atom-doc
  (make-feed title: (make-title "Example Feed")
             links: (list (make-link uri: "http://example.org"))
             updated: "2003-12-13T18:30:02Z"
             authors: (list (make-author name: "John Doe"))
             id: "urn:uuid:60a76c80-d399-11d9-b93C-0003939e0af6"
             entries: (list
                       (make-entry title: (make-title "Atom-Powered Robots Run Amok")
                                   links: (list (make-link uri: "http://example.org/2003/12/13/atom03"))
                                   id: "urn:uuid:1225c695-cfb8-4ebb-aaaa-80da344efa6a"
                                   updated: "2003-12-13T18:30:02Z"
                                   summary: (make-summary "Some text."))))))

#|
<?xml version="1.0" encoding="utf-8"?>
<atom:feed xmlns:atom="http://www.w3.org/2005/Atom">
  <atom:author>
    <atom:name>John Doe</atom:name>
  </atom:author>
  <atom:id>urn:uuid:60a76c80-d399-11d9-b93C-0003939e0af6</atom:id>
  <atom:link href="http://example.org" rel="alternate" />
  <atom:title type="text">Example Feed</atom:title>
  <atom:updated>2003-12-13T18:30:02Z</atom:updated>
  <atom:entry>
    <atom:id>urn:uuid:1225c695-cfb8-4ebb-aaaa-80da344efa6a</atom:id>
    <atom:title type="text">Atom-Powered Robots Run Amok</atom:title>
    <atom:updated>2003-12-13T18:30:02Z</atom:updated>
    <atom:summary type="text">Some text.</atom:summary>
    <atom:link href="http://example.org/2003/12/13/atom03" rel="alternate" />
  </atom:entry>
</atom:feed>
|#
