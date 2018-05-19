function initMap() {
  console.log('initMap')
  $(document).on('turbolinks:load', function() {
    window.map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: 30, lng:-80 },
      zoom: 14
    })
  });
}
