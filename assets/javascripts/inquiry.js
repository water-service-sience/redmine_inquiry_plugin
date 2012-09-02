

INQUIRY_SCOPE = {};


function init_map( map_canvas_id ){

  
    var latlng = new google.maps.LatLng(34.901610, 136.92380);
    var myOptions = {
      zoom: 15,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById(map_canvas_id),
        myOptions);
        
    INQUIRY_SCOPE.map = map;
        
    return map;

};


/**
 * { "name" : "name",
     "geo_type" : 1,
     "points" : [
       [2.3 , 23.2],
       
     ],
     "center" : [124.2, 232]
   }
 */
function set_geo_point( geo_info){
  
  if( geo_info.geo_type == 1){ // point
  }else if(geo_info.geo_type == 2){ // line
    
    var cordinates = geo_info.points.map( function(p){
      return new google.maps.LatLng(p[0],p[1]);
    });
      
    var polyline = new google.maps.Polyline({
      path: cordinates,
      strokeColor: "#FF0000",
      strokeOpacity: 1.0,
      strokeWeight: 2
    });
    polyline.setMap(INQUIRY_SCOPE.map);
  
  }else if(geo_info.geo_type == 3){ // polygon
  }
  
  var center = geo_info.center;
  INQUIRY_SCOPE.map.setCenter(new google.maps.LatLng(center[0],center[1]));
  

};
