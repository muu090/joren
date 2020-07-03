var map;
function initMap() {
  var target = document.getElementById('gmap');
  var empire = {lat: 40.748441, lng: -73.985664};  
  //Empire State Bldg の緯度（latitude）と経度（longitude）
  map = new google.maps.Map(target, {
    center: empire,
    zoom: 14
  });
}