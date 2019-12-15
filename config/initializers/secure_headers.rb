# secure_headers gem config
# See https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy

SecureHeaders::Configuration.default do |config|
  config.cookies = {
    # mark all cookies as "Secure"
    secure: true,

    # In Google Chrome < 76 Setting SameSite=lax is safer than omitting the
    # attribute. (But if your implementation currently relies on cross-origin
    # requests, double-check that adding the attribute doesn't break anything.)
    # In Google Chrome 80 is targeted for enabling this feature by default. The
    # feature will be enabled in the Beta version only, starting in Chrome 78.
    # This feature is available as of Chrome 76 by enabling the
    # same-site-by-default-cookies flag.
    samesite: {
      lax: true # mark all cookies as SameSite=lax
    }
  }
  # Strict-Transport-Security response header (often abbreviated as HSTS) lets a
  # web site tell browsers that it should only be accessed using HTTPS, instead
  # of using HTTP.
  config.hsts = "max-age=#{1.year.to_i}"

  # X-Frame-Options HTTP response header can be used to indicate whether or not
  # a browser should be allowed to render a page in a <frame>, <iframe>, <embed>
  # or <object>. Sites can use this to avoid clickjacking attacks, by ensuring
  # that their content is not embedded into other sites.
  config.x_frame_options = "DENY"

  # X-Content-Type-Options response HTTP header is a marker used by the server
  # to indicate that the MIME types advertised in the Content-Type headers
  # should not be changed and be followed. This allows to opt-out of MIME type
  # sniffing, or, in other words, it is a way to say that the webmasters knew
  # what they were doing.
  #
  # Site security testers usually expect this header to be set.
  config.x_content_type_options = "nosniff"

  # The X-Download-Options is specific to IE 8, and is related to how IE 8
  # handles downloaded HTML files. Turns out if you download an HTML file from a
  # web page and chooses to "Open" it in IE, it will execute in the context of
  # the web site. That means that any scripts in that file will also execute
  # with the origin of the web site.
  config.x_download_options = "noopen"

  # Cross-Origin Resource Policy is an opt-in mechanism that allows web
  # applications to protect against certain cross-origin requests, such as those
  # issued by the browser when resources are embedded using elements such as
  # <script> and <img>. This serves as an additional layer of protection above
  # and beyond the same-origin policy which can mitigate speculative side
  # channel attacks as well as Cross-Site Script Inclusion attacks. Cross-Origin
  # Resource Policy complements Cross-Origin Read Blocking (CORB), which is a
  # mechanism to prevent some cross-origin reads by default.
  #
  # As this policy is expressed via a response header, the actual request is not
  # prevented—rather, the browser prevents the result from being leaked by
  # stripping the response body.
  config.x_permitted_cross_domain_policies = "none"

  # Referrer-Policy HTTP header controls how much referrer information (sent via
  # the Referer header) should be included with requests.
  #
  # origin-when-cross-origin - Send the origin, path, and query string when
  # performing a same-origin request, but only send the origin of the document
  # for other cases.
  # strict-origin-when-cross-origin - Send the origin, path, and querystring
  # when performing a same-origin request, only send the origin when the
  # protocol security level stays the same (HTTPS→HTTPS), and send no header to
  # a less secure destination (HTTPS→HTTP).
  config.referrer_policy = %w(origin-when-cross-origin strict-origin-when-cross-origin)
  config.csp = {
    # "meta" values. these will shape the header, but the values are not
    # included in the header.

    # default: false. Schemes are removed from host sources to save bytes and
    # discourage mixed content.
    preserve_schemes: true,

    # default: false. If false, `unsafe-inline` will be added automatically when
    # using nonces. If true, it won't. See #403 for why you'd want this.
    disable_nonce_backwards_compatibility: true,

    # default-src directive serves as a fallback for the other CSP fetch
    # directives. For each of the following directives that are absent, the user
    # agent will look for the default-src directive
    # See https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy/default-src
    default_src: %w('none'),

    # base-uri directive restricts the URLs which can be used in a document's
    # <base> element. If this value is absent, then any URI is allowed. If this
    # directive is absent, the user agent will use the value in the <base>
    # element.
    base_uri: %w('self'),

    # block-all-mixed-content directive prevents loading any assets using HTTP
    # when the page is loaded using HTTPS.
    # All mixed content resource requests are blocked, including both active and
    # passive mixed content. This also applies to <iframe> documents, ensuring
    # the entire page is mixed content free.
    # see http://www.w3.org/TR/mixed-content/
    block_all_mixed_content: true,

    # child-src directive defines the valid sources for web workers and nested
    # browsing contexts loaded using elements such as <frame> and <iframe>. For
    # workers, non-compliant requests are treated as fatal network errors by the
    # user agent.
    # if child-src isn't supported, the value for frame-src will be set.
    child_src: %w('self'),

    # connect-src directive restricts the URLs which can be loaded using script
    # interfaces. The APIs that are restricted are:
    # - <a> ping
    # - Fetch
    # - XMLHttpRequest
    # - WebSocket
    # - EventSource
    # - Navigator.sendBeacon()
    connect_src: %w(wss: https://www.google-analytics.com),

    # font-src directive specifies valid sources for fonts loaded using
    # @font-face.
    font_src: %w('self' https://fonts.gstatic.com data:),

    # `form-action` directive restricts the URLs which can be used as the target
    # of a form submissions from a given context.
    form_action: %w('self'),

    # frame-ancestors directive specifies valid parents that may embed a page
    # using <frame>, <iframe>, <object>, <embed>, or <applet>.
    frame_ancestors: %w('none'),

    # img-src directive specifies valid sources of images and favicons.
    # Google-specific:
    #   -
    img_src: %w('self' https://www.googletagmanager.com https://ssl.gstatic.com https://www.gstatic.com https://www.google-analytics.com),
    # manifest-src directive specifies which manifest can be applied to the resource.
    # See https://developer.mozilla.org/en-US/docs/Web/Manifest
    manifest_src: %w('self'),

    # media-src directive specifies valid sources for loading media using the
    # <audio> and <video> elements.
    media_src: %w('self'),

    # object-src directive specifies valid sources for the <object>, <embed>,
    # and <applet> elements.
    object_src: %w('self'),

    # sandbox directive enables a sandbox for the requested resource similar to the <iframe> sandbox attribute. It applies restrictions to a page's actions including preventing popups, preventing the execution of plugins and scripts, and enforcing a same-origin policy.
    #
    # allow-forms - Allows the embedded browsing context to submit forms. If
    # this keyword is not used, this operation is not allowed.
    #
    # allow-same-origin - Allows the content to be treated as being from its
    # normal origin. If this keyword is not used, the embedded content is
    # treated as being from a unique origin.
    #
    # allow-scripts - Allows the embedded browsing context to run scripts (but
    # not create pop-up windows). If this keyword is not used, this operation is
    # not allowed.
    sandbox: ['allow-forms', 'allow-scripts', 'allow-same-origin', 'allow-popups'], # true and [] will set a maximally restrictive setting

    # plugin-types directive restricts the set of plugins that can be embedded
    # into a document by limiting the types of resources which can be loaded.
    # plugin_types: %w(application/x-shockwave-flash),

    # script-src directive specifies valid sources for JavaScript. This includes not only URLs loaded directly into <script> elements, but also things like inline script event handlers (onclick) and XSLT stylesheets which can trigger script execution.
    script_src: %w('self' https://www.googletagmanager.com https://tagmanager.google.com https://www.google-analytics.com https://ssl.google-analytics.com),

    # style-src directive specifies valid sources for stylesheets.                        #404
    style_src: %w('self' https://tagmanager.google.com https://fonts.googleapis.com 'sha256-q1icEMQsuyXJEkViimPBHE4Ygjz1l0TO8g6eUYNW7fc='),

    # worker-src directive specifies valid sources for Worker, SharedWorker, or ServiceWorker scripts.
    worker_src: %w('self'),

    # upgrade-insecure-requests directive instructs user agents to treat all of a site's insecure URLs (those served over HTTP) as though they have been replaced with secure URLs (those served over HTTPS). This directive is intended for web sites with large numbers of insecure legacy URLs that need to be rewritten.
    # see https://www.w3.org/TR/upgrade-insecure-requests/
    upgrade_insecure_requests: true, # see https://www.w3.org/TR/upgrade-insecure-requests/

    # Deprecated
    # This feature is no longer recommended. Though some browsers might still support it, it may have already been removed from the relevant web standards, may be in the process of being dropped, or may only be kept for compatibility purposes. Avoid using it, and update existing code if possible; see the compatibility table at the bottom of this page to guide your decision. Be aware that this feature may cease to work at any time.
    # report_uri: %w(https://report-uri.io/example-csp)
  }
end

# Which headers you decide to use for API responses is entirely a personal
# choice. Things like X-Frame-Options seem to have no place in an API response
# and would be wasting bytes. While this is true, browsers can do funky things
# with non-html responses. At the minimum, we suggest CSP:
#
# However, I would consider these headers anyways depending on your load and
# bandwidth requirements.
# See https://github.com/twitter/secure_headers
SecureHeaders::Configuration.override(:api) do |config|
  config.csp = { default_src: 'none' }
  config.hsts = SecureHeaders::OPT_OUT
  config.x_frame_options = SecureHeaders::OPT_OUT
  config.x_content_type_options = SecureHeaders::OPT_OUT
  config.x_xss_protection = SecureHeaders::OPT_OUT
  config.x_permitted_cross_domain_policies = SecureHeaders::OPT_OUT
end
