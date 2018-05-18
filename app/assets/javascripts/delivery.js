function geoFindMe() {
  var output = document.getElementById("out");

  if (!navigator.geolocation){
    output.innerHTML = "<p>Geolocation is not supported by your browser</p>";
    return;
  }

  function success(position) {

    var latitude  = position.coords.latitude;
    var longitude = position.coords.longitude;
    console.log(latitude, longitude);

output.innerHTML = " ";
    var latLng = new google.maps.LatLng(latitude, longitude);
    var marker = new google.maps.Marker({
            animation: google.maps.Animation.DROP,
            icon: 'https://www.freeiconspng.com/minicovers/red-beach-umbrella-png-12.png',
            map: window.map,
            position: latLng
          });
    window.map.setCenter(latLng);
    $('#map').fadeIn(1000);

  }

  function error() {
    output.innerHTML = "Unable to retrieve your location";
  }

  output.innerHTML = "<p>Locating…</p>";

  navigator.geolocation.getCurrentPosition(success, error);
}
