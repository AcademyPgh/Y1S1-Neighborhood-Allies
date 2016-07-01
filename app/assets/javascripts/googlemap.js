// Please note that the following line must be incorporated at the beginning of every web page
// where the google maps api needs to be utilized.

// <script src="https://maps.googleapis.com/maps/api/js?libraries=places&callback=initialize"
//            async defer>
// </script>


// Please note that the following line must be incorporated onto every web page
// where the google map api needs to be utilized.

// <div id="map">
// </div>

var markers = [];
var active_markers = [];
var marker;


function initialize() {
	var directionsService = new google.maps.DirectionsService();
	var directionsDisplay = new google.maps.DirectionsRenderer();
	var pittsburgh = new google.maps.LatLng(40.421796, -79.994485);
	mapOptions = { zoom:10, mapTypeId: google.maps.MapTypeId.ROADMAP, center: pittsburgh }
	map = new google.maps.Map(document.getElementById("map"), mapOptions);
	directionsDisplay.setMap(map);

	if (document.getElementById("searchAddressField")) {
		var input = document.getElementById('searchAddressField');
		var options = {componentRestrictions: {country: 'us'}};

		new google.maps.places.Autocomplete(input, options);
	}
}


//Handles marker placement, dynamic zoom, and on click functionality.
function markerlocation(address, organization, orgimage, organizationabout) {
	$.getJSON('http://maps.googleapis.com/maps/api/geocode/json?address='+address+'&organization='+organization+'&organizationabout='+organization+'&sensor=false', null, function (data) {
		var addresslocation = data.results[0].geometry.location
		var latlng = new google.maps.LatLng(addresslocation.lat, addresslocation.lng);
		var marker = new google.maps.Marker({
	    	position: latlng, //it will place marker based on the addresses, which they will be translated as geolocations.
	    	map: map,
	    	title: organization,
	    	animation: google.maps.Animation.DROP
		});

		markers.push(marker);

		marker.addListener('click', function() {
		    //map.setZoom(15);
		    map.setCenter(marker.getPosition());
		});

		var contentString = '<div class="top col-sm-3 col-xs-3">'+
           '<div class="bottom">'+
           '<span class="glyphicon glyphicon-triangle-bottom " aria-hidden="true" >'+
           '</span>'+
           '</div>'+
           '<div class="logoholder">'+orgimage+
           '</div>'+
           '<div class="infoholder">'+
           '<div class="titlefield"><a href="http://www.academypgh.com/"><p id="orgtitle">'+organization+'</p></a></div>'+
           '<div class="orgdetails"><p>'+organizationabout+'</p></div>'+
           '</div>'+
           '</div>';

		marker.infowindow = new google.maps.InfoWindow({
			content: contentString
    });

		google.maps.event.addListener(marker, 'click', function() {
	    marker.infowindow.open(map,marker);
			markerremoval(marker);
		});

		var latlngbounds = new google.maps.LatLngBounds();
		for (var i = 0; i < markers.length; i++) {
			latlngbounds.extend(markers[i].getPosition());
		}
		map.fitBounds(latlngbounds);

		return marker;
	});
}


//Handles marker hiding and dynamically sets the zoom based on the marker selected.
function markerremoval(marker) {
	for (var i = 0; i < markers.length; i++) {
		if (markers[i] != marker) {
			markers[i].setMap(null);
		}
	}
	var latlngbounds = new google.maps.LatLngBounds();
	latlngbounds.extend(marker.getPosition());
	map.fitBounds(latlngbounds);
}
