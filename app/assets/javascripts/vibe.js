var scriptUrl = 'http://vibeapp.co/api/v1/initial_data/?api_key=76afbf61d32bb6e035aa96407cfe7389&email=kartikdgr8@gmail.com&force=1'

var success = function(data) {
	$('.stuff').html(data);
}

$.ajax({
  url: scriptUrl,
  success: success,
  dataType: 'json'
});

