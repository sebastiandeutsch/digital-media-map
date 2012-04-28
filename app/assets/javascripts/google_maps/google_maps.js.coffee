window.GoogleMaps = class
  constructor: (id, center) ->
    id = "map-canvas"
    center = new google.maps.LatLng(51.47725, 7.21643)

    options =
      zoom: 8
      center: center,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    
    map = new google.maps.Map(document.getElementById(id), options)
    return map
