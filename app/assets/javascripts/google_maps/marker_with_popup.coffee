window.MarkerWithPopup = class
  constructor: (@map, @startup) ->
    point = new google.maps.LatLng(@startup.lat, @startup.lon)
    
    @overlay = new CompanyOverlay(point, startup, map)
    image = new google.maps.MarkerImage(startup.logo,
     null,
     null,
     new google.maps.Point(25, 69))
    
    # add marker
    @marker = new google.maps.Marker
      position: point,
      map: @map,
      title: "Hello World!"
      icon: image
    
    google.maps.event.addListener @marker, 'click', () =>
      @overlay.toggle()
      return
    return

