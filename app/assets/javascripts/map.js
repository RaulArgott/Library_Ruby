var map;
$(document).ready(function () {
  map = new GMaps({
    el: '#map',
    lat: 22.123014,
    lng: -100.984380
  });
  map.addMarker({
    lat: 22.123014,
    lng: -100.984380,
  });
});