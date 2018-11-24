$(document).ready(function() {
  var data = {};
  $.ajax({
    url: '/api/cv',
    dataType: 'json',
    type: 'GET',
    data: data,
    success: function(data) {
      console.log(data);
    }
  });
});
