window.GoogleMaps = class
  constructor: (id, center) ->
    id = "map-canvas"
    center = new google.maps.LatLng(51.47725, 7.21643)
    
    options =
      zoom: 8
      center: center,
      mapTypeId: google.maps.MapTypeId.ROADMAP

    map = new google.maps.Map(document.getElementById(id), options)
    google.maps.event.addListener map, 'click', ->
      if window.activeOverlay != null
        window.activeOverlay.overlay.toggle()
        window.activeOverlay = null
    return map
