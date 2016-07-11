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
var latlngsent;
var latlngrcvd;


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
function markerlocation(organizationid, address, organization, organizationabout) {
	$.getJSON('http://maps.googleapis.com/maps/api/geocode/json?address='+address+'&organization='+organization+'&organizationabout='+organization+'&sensor=false', null, function (data) {
		var addresslocation = data.results[0].geometry.location;
		var latlng = new google.maps.LatLng(addresslocation.lat, addresslocation.lng);
		var marker = new google.maps.Marker({
	    	position: latlng, //it will place marker based on the addresses, which they will be translated as geolocations.
	    	map: map,
	    	title: organization,
	    	animation: google.maps.Animation.DROP,
				id: organizationid
		});

		markers.push(marker);

		marker.addListener('click', function() {
		    map.setCenter(marker.getPosition());
		});

		var contentString = 
		'<div>' +
			'<div class="parentinfo">' + 
				'<div class="logoholder">' + '<img src=/logos/' + organizationid + '/serve style= "width: 100%">' + 
				'</div>' +
				'<p class="orgtitle">' + organization + '</p>' +
				'<p class="aboutlink">' + '<a href=/organizations/' + organizationid + '>' + 'about' + '</a>' +'</p>' +
			'</div>'+
			'<div class="descripcontainer">'+
				'<p class="descripbox">' + organizationabout + '</p>' +
			'</div>' +
		'</div>'	
		;

		marker.infowindow = new google.maps.InfoWindow({
			content: contentString
    });
    
    	// this is for styling the infowindow
    	google.maps.event.addListener(marker.infowindow, 'domready', function() {

		   // Reference to the DIV which receives the contents of the infowindow using jQuery
		   var iwOuter = $('.gm-style-iw');
		
		   /* The DIV we want to change is above the .gm-style-iw DIV.
		    * So, we use jQuery and create a iwBackground variable,
		    * and took advantage of the existing reference to .gm-style-iw for the previous DIV with .prev().
		    */
		   var iwBackground = iwOuter.prev();
		
		   // Remove the background shadow DIV
		   iwBackground.children(':nth-child(2)').css({'display' : 'none'});
		
		   // Remove the white background DIV
		   iwBackground.children(':nth-child(4)').css({'display' : 'none'});
		   //console.log(iwBackground);
		   
			 // adds the gm-arrow-shadow class to the div used to make that shadow 
			//iwBackground.children(':nth-child(1)').attr('class', function(i,s){ return s + 'gm-arrow-shadow'});

			// Moves the arrow 76px to the left margin 
			//iwBackground.children(':nth-child(3)').attr('style', function(i,s){ return s + 'left: 76px !important;'});
			
			var iwCloseBtn = iwOuter.next();

	// Apply the desired effect to the close button
	iwCloseBtn.css({
	  // by default the close button has an opacity of 0.7
	  'right': '25px', 'top': '25px', // button repositioning
	   // increasing button border and new color
	  'border-radius': '1px', // circular effect
	  'box-shadow': '0 0 1px #000',// 3D effect to highlight the button
  });
		
	});

		google.maps.event.addListener(marker, 'click', function() {
	    marker.infowindow.open(map,marker);
	    	active_markers = [];
			markerpolyline(organizationid, marker);
			// markerremoval(marker);
		});

		var latlngbounds = new google.maps.LatLngBounds();
		for (var i = 0; i < markers.length; i++) {
			latlngbounds.extend(markers[i].getPosition());
		}
		map.fitBounds(latlngbounds);

		return marker;
	});
}

function markerpolyline(organizationid, marker) {
 	$.post("organizations/"+organizationid+"/showvectors", function(data)
 	{
			$( ".result" ).html( data );
			addpolyline(data, marker);
 	});
 }

function addpolyline(data, marker) {
	var sendrcvds = data;
	markerremoveall(marker);
	for (var i = 0; i < sendrcvds.length; i++) {
		var sendrcvd = sendrcvds[i];
		for (var j = 0; j < sendrcvd.length; j++) {
				//function (i, j) {};
			if (j % 2 == 0) {
				var latitude = sendrcvd[j];
			} else {
				var longitude = sendrcvd[j];
				
				var colorChoice = "";
				if (sendrcvds[sendrcvds.length - 1] == 1){
					colorChoice = "#FF0000";
				} else {
					colorChoice = "#00FF00";
				}
				
				var addressLocationObject = {lat: parseFloat(latitude), lng: parseFloat(longitude)};
				if ((j+1) % 4 != 0) {
					latlngrcvd = addressLocationObject;
				} else {
					latlngsent = addressLocationObject;
				}	
				if ((j+1) % 4 == 0) {
					var linemapping = [
						latlngsent, latlngrcvd
		    		];

					var lineSymbol = {
				    	path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW
					};

					var linepath = new google.maps.Polyline({
		        		path: linemapping,
		        		geodesic: true,
		        		strokeColor: colorChoice,
		        		strokeOpacity: 1.0,
		        		strokeWeight: 2,
			  			icons: [{
		        			icon: lineSymbol,
		        			offset: '100%'
		        		}]
					});

					linepath.setMap(map);
					markershow(latlngsent, latlngrcvd);
				}
			}
		}
	}
	active_markers = duplicatesarray();
	mapdynamiczoom();
}


//Handles markers displayed based on the marker selected.
function markershow(latlngsent, latlngrcvd) {
	
	for (var i = 0; i < markers.length; i++) {
		if (round(markers[i].getPosition().lat(),6) == round(latlngrcvd.lat,6) || round(markers[i].getPosition().lat(),6) == round(latlngsent.lat,6)) {
			markers[i].setMap(map);
			active_markers.push(markers[i]);
		}
	}
}

function mapdynamiczoom() {
	var latlngbounds = new google.maps.LatLngBounds();
	console.log(active_markers.length);
	for (var i = 0; i < active_markers.length; i++) {
		latlngbounds.extend(active_markers[i].getPosition());
	}
	map.fitBounds(latlngbounds);
}

function markerremoveall(marker) {
	for (var i = 0; i < markers.length; i++) {
		if (markers[i] != marker) {
			markers[i].setMap(null);
		}
	}
}

function markershowall() {
	var latlngbounds = new google.maps.LatLngBounds();
	
	for (var i = 0; i < markers.length; i++) {
		markers[i].setMap(map);
		latlngbounds.extend(markers[i].getPosition());
	}

	map.fitBounds(latlngbounds);
}

function round(value, decimals) {
    return Number(Math.round(value+'e'+decimals)+'e-'+decimals);
}

function duplicatesarray() {
	var sorted_active_markers = active_markers.slice().sort();
	var results = [];
	for (var i = 0; i < active_markers.length - 1; i++) {
    	if (sorted_active_markers[i + 1] == sorted_active_markers[i]) {
        	results.push(sorted_active_markers[i]);
    	}
	}
	return results
}