(use atom rfc3339)

;; rfc4287 extensive example

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

#|

<?xml version="1.0" encoding="utf-8"?>
<atom:feed xmlns:atom="http://www.w3.org/2005/Atom">
  <atom:generator uri="http://www.example.com" version="1.0">Example Toolkit</atom:generator>
  <atom:id>tag:example.org,2003:3</atom:id>
  <atom:link href="http://example.org" rel="alternate" type="text/html" hreflang="en" />
  <atom:link href="http://example.org/feed.atom" rel="self" type="application/atom+xml" />
  <atom:rights type="text">Copyright (c) 2003, Mark Pilgrim</atom:rights>
  <atom:subtitle type="html">
    A &lt;em&gt;lot&lt;/em&gt; of effort went
    into making this effortless</atom:subtitle>
  <atom:title type="text">dive into mark</atom:title>
  <atom:updated>2005-07-31T12:29:29Z</atom:updated>
  <atom:entry>
    <atom:author>
      <atom:name>Mark Pilgrim</atom:name>
      <atom:uri>http://example.org</atom:uri>
      <atom:email>f8dy@example.com</atom:email>
    </atom:author>
    <atom:contributor>
      <atom:name>Sam Ruby</atom:name>
    </atom:contributor>
    <atom:contributor>
      <atom:name>Joe Gregorio</atom:name>
    </atom:contributor>
    <atom:content type="xhtml">
      <xhtml:div xmlns:xhtml="http://www.w3.org/1999/xhtml">
        <xhtml:p>
          <xhtml:i>[Update: The Atom draft is finished.]</xhtml:i>
        </xhtml:p>
      </xhtml:div>
    </atom:content>
    <atom:id>tag:example.org,2003:3.2397</atom:id>
    <atom:published>2003-12-13T08:29:29-04:00</atom:published>
    <atom:title type="text">Atom draft-07 snapshot</atom:title>
    <atom:updated>2005-07-31T12:29:29Z</atom:updated>
    <atom:link href="http://example.org/2005/04/02/atom" rel="alternate" type="text/html" />
    <atom:link href="http://example.org/audio/ph34r_my_podcast.mp3"
               rel="enclosure" type="audio/mpeg" length="1337" />
  </atom:entry>
</atom:feed>

|#
