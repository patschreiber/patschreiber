function setCookie( cookie_name, cookie_value, lifespan_in_days, valid_domain ) {
  var domain_string = valid_domain ? ("; domain=" + valid_domain) : '';
  
  document.cookie = cookie_name + "=" + encodeURIComponent( cookie_value ) + "; max-age=" + 60 * 60 * 24 * lifespan_in_days + "; path=/" + domain_string;
}

function getCookie( cookie_name ) {
  var value = "; " + document.cookie;
  var parts = value.split("; " + cookie_name + "=");
  if (parts.length == 2) return parts.pop().split(";").shift();
}

//[ cookie_name, valid_domain(optional) ]
function deleteCookie( cookie_name, valid_domain ) {
    var domain_string = valid_domain ? ("; domain=" + valid_domain) : '';
    document.cookie = cookie_name +"=; max-age=0; path=/" + domain_string;
}
