  function setCookie( cookie_name, cookie_value, lifespan_in_days, valid_domain ) {
    var domain_string = valid_domain ? ("; domain=" + valid_domain) : '';
    document.cookie = cookie_name +
                       "=" + encodeURIComponent( cookie_value ) +
                       "; max-age=" + 60 * 60 *
                       24 * lifespan_in_days +
                       "; path=/" + domain_string;
  }

  function getCookie( cookie_name ) {
    var cookie_string = document.cookie;
    if (cookie_string.length != 0) {
      var cookie_value = cookie_string.match('(^|;)[\s]*' + cookie_name + '=([^;]*)' );
      return decodeURIComponent( cookie_value[2] );
    }

    return '';
  }

  //[ cookie_name, valid_domain(optional) ]
  function deleteCookie( cookie_name, valid_domain ) {
      var domain_string = valid_domain ? ("; domain=" + valid_domain) : '';
      document.cookie = cookie_name +"=; max-age=0; path=/" + domain_string;
  }
