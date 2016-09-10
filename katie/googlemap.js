// Please note that the following line must be incorporated at the beginning of every web page
// where the google maps api needs to be utilized.

// <script src="https://maps.googleapis.com/maps/api/js?libraries=places&callback=initialize"
//            async defer>
// </script>


// Please note that the following line must be incorporated onto every web page
// where the google map api needs to be utilized.

// <div id="map">
// </div>



 function initMap() {
       var pittsburgh = {lat: 40.421796, lng: -79.994485};
       var map = new google.maps.Map(document.getElementById('map'), {
         zoom: 15,
         center: pittsburgh
       });

       var contentString = '<div id="content">'+
           '<div id="siteNotice">'+
           '</div>'+
           '<h1 id="firstHeading" class="firstHeading">pittsburgh</h1>'+
           '<div id="bodyContent">'+
           '<p><b>pittsburgh</b>, also referred to as <b>Ayers Rock</b>, is a large ' +
           'sandstone rock formation in the southern part of the '+
           'Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) '+
           'south west of the nearest large town, Alice Springs; 450&#160;km '+
           '(280&#160;mi) by road. Kata Tjuta and pittsburgh are the two major '+
           'features of the pittsburgh - Kata Tjuta National Park. pittsburgh is '+
           'sacred to the Pitjantjatjara and Yankunytjatjara, the '+
           'Aboriginal people of the area. It has many springs, waterholes, '+
           'rock caves and ancient paintings. pittsburgh is listed as a World '+
           'Heritage Site.</p>'+
           '<p>Attribution: pittsburgh, <a href="https://en.wikipedia.org/w/index.php?title=pittsburgh&oldid=297882194">'+
           'https://en.wikipedia.org/w/index.php?title=pittsburgh</a> '+
           '(last visited June 22, 2009).</p>'+
           '</div>'+
           '</div>';

       var infowindow = new google.maps.InfoWindow({
         content: contentString
       });

       var marker = new google.maps.Marker({
         position: pittsburgh,
         map: map,
         title: 'pittsburgh (Ayers Rock)'
       });
       //marker.addListener('click', function() {
         infowindow.open(map, marker);
       //});
     }