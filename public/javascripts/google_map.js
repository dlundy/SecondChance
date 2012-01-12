jQuery(function(){
  GoogleMap.init();
});


var GoogleMap = function(){  
  
  return {
   
    init:function(){
      var mapDiv = jQuery("#event_map");
      if(mapDiv.length > 0){
        var latLng = new google.maps.LatLng(mapDiv.attr("data-lat"), mapDiv.attr("data-lng"));
        var gmapOptions = {
         zoom: 15,
         center: latLng,
         mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById('event_map'), gmapOptions);
        var venueMarker = new google.maps.Marker({
            position: latLng, 
            map: map, 
            title: mapDiv.attr("data-title")
        });
      }
    }

  }
  
}();