(cond-expand
 (chicken-4
  (use test atom rfc3339))
 (else
  (import test atom rfc3339)
  (import (chicken port))))

(test "Write brief atom example from the RFC 4287 spec"
      #t
      (string=?
       (with-output-to-string
         (lambda ()
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
                                              summary: (make-summary "Some text."))))))))
       #<<END
<?xml version="1.0" encoding="utf-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
  <author>
    <name>John Doe</name>
  </author>
  <generator uri="https://github.com/ursetto/atom-egg" version="0.1.5">atom egg for Chicken</generator>
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
END
       ))

(test "Write extensive atom example from the RFC 4287 spec"
      #t
      (string=?
       (with-output-to-string
         (lambda ()
           (write-atom-doc
            (make-atom-doc
             (make-feed
              title: (make-title "dive into mark")
              subtitle: (make-subtitle "A <em>lot</em> of effort went into making this effortless"
                                       type: 'html)
              updated: "2005-07-31T12:29:29Z"
              id: "tag:example.org,2003:3"
              links: (list (make-link type: 'html
                                      uri-language: "en"
                                      uri: "http://example.org")
                           (make-link relation: "self"
                                      type: "application/atom+xml"
                                      uri: "http://example.org/feed.atom"))
              rights: (make-rights "Copyright (c) 2003, Mark Pilgrim")
              generator: (make-generator "Example Toolkit"
                                         uri: "http://www.example.com"
                                         version: "1.0")
              entries: (list
                        (make-entry
                         title: (make-title "Atom draft-07 snapshot")
                         links: (list (make-link type: 'html
                                                 uri: "http://example.org/2005/04/02/atom")
                                      (make-link relation: "enclosure"
                                                 type: "audio/mpeg"
                                                 length: 1337
                                                 uri: "http://example.org/audio/ph34r_my_podcast.mp3"))
                         id: "tag:example.org,2003:3.2397"
                         updated: (rfc3339->string (make-rfc3339 2005 07 31 12 29 29 0 0))
                         published: (rfc3339->string (make-rfc3339 2003 12 13 08 29 29 0 (* 3600 4)))
                         authors: (list (make-author name: "Mark Pilgrim"
                                                     uri: "http://example.org"
                                                     email: "f8dy@example.com"))
                         contributors: (list (make-contributor
                                              name: "Sam Ruby")
                                             (make-contributor
                                              name: "Joe Gregorio"))
                         ;; xml:base, xml:lang cannot be handled yet
                         content: (make-content
                                   '(xhtml:div
                                     (xhtml:p (xhtml:i "[Update: The Atom draft is finished.]")))
                                   type: 'xhtml))))))
           ))
       #<<END
<?xml version="1.0" encoding="utf-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
  <generator uri="http://www.example.com" version="1.0">Example Toolkit</generator>
  <id>tag:example.org,2003:3</id>
  <link href="http://example.org" rel="alternate" type="text/html" hreflang="en" />
  <link href="http://example.org/feed.atom" rel="self" type="application/atom+xml" />
  <rights type="text">Copyright (c) 2003, Mark Pilgrim</rights>
  <subtitle type="html">A &lt;em&gt;lot&lt;/em&gt; of effort went into making this effortless</subtitle>
  <title type="text">dive into mark</title>
  <updated>2005-07-31T12:29:29Z</updated>
  <entry>
    <author>
      <name>Mark Pilgrim</name>
      <uri>http://example.org</uri>
      <email>f8dy@example.com</email>
    </author>
    <contributor>
      <name>Sam Ruby</name>
    </contributor>
    <contributor>
      <name>Joe Gregorio</name>
    </contributor>
    <content type="xhtml">
      <div xmlns="http://www.w3.org/1999/xhtml">
        <p>
          <i>[Update: The Atom draft is finished.]</i>
        </p>
      </div>
    </content>
    <id>tag:example.org,2003:3.2397</id>
    <published>2003-12-13T08:29:29-04:00</published>
    <title type="text">Atom draft-07 snapshot</title>
    <updated>2005-07-31T12:29:29Z</updated>
    <link href="http://example.org/2005/04/02/atom" rel="alternate" type="text/html" />
    <link href="http://example.org/audio/ph34r_my_podcast.mp3" rel="enclosure" type="audio/mpeg" length="1337" />
  </entry>
</feed>
END
       
       ))


(test-exit)
