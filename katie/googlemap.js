// Please note that the following line must be incorporated at the beginning of every web page
// where the google maps api needs to be utilized.

// <script src="https://maps.googleapis.com/maps/api/js?libraries=places&callback=initialize"
//            async defer>
// </script>


// Please note that the following line must be incorporated onto every web page
// where the google map api needs to be utilized.

// <div id="map">
// </div>

function initialize() {
	var directionsService = new google.maps.DirectionsService();
	var directionsDisplay = new google.maps.DirectionsRenderer();
	pittsburgh = new google.maps.LatLng(40.421796, -79.994485);
	mapOptions = { zoom:11, mapTypeId: google.maps.MapTypeId.ROADMAP, center: pittsburgh }
	map = new google.maps.Map(document.getElementById("map"), mapOptions);
	directionsDisplay.setMap(map);
}

function markerlocation(address, companyname) {

	$.getJSON('http://maps.googleapis.com/maps/api/geocode/json?address='+address+'&compnay='+companyname+'&sensor=false', null, function (data) {
		var addresslocation = data.results[0].geometry.location
		var latlng = new google.maps.LatLng(addresslocation.lat, addresslocation.lng);
		var marker = new google.maps.Marker({
	    	position: latlng, //it will place marker based on the addresses, which they will be translated as geolocations.
	    	map: map,
	    	title:address,
	    	animation: google.maps.Animation.DROP
		});

		marker.addListener('click', function() {
		    map.setZoom(15);
		    map.setCenter(marker.getPosition());
		});

		marker.infowindow = new google.maps.InfoWindow({
			content: '<b>' + companyname + '</b>'
        });

		google.maps.event.addListener(marker, 'click', function() {
	    marker.infowindow.open(map,marker);
		});
	});
}
