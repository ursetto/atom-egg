(cond-expand
  (chicken-4 (use atom))
  (else (import atom)))

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
<feed xmlns="http://www.w3.org/2005/Atom">
  <author>
    <name>John Doe</name>
  </author>
  <generator uri="http://3e8.org/chickadee/atom" version="0.1.1">atom egg for Chicken</generator>
  <id>urn:uuid:60a76c80-d399-11d9-b93C-0003939e0af6</id>
  <link href="http://example.org" rel="alternate" />
  <title type="text">Example Feed</title>
  <updated>2003-12-13T18:30:02Z</updated>
  <entry>
    <id>urn:uuid:1225c695-cfb8-4ebb-aaaa-80da344efa6a</id>
    <title type="text">Atom-Powered Robots Run Amok</title>
    <updated>2003-12-13T18:30:02Z</updated>
    <summary type="text">Some text.</summary>
    <link href="http://example.org/2003/12/13/atom03" rel="alternate" />
  </entry>
</feed>
|#
