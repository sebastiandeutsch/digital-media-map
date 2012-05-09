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
      icon: "/assets/pins/pin-0.png"
    
    google.maps.event.addListener @marker, 'click', () =>
      if window.activeOverlay == @
        # we are closing the overlay
        window.activeOverlay = null
      else
        # we're toggling with another one, so close the first and open another
        window.activeOverlay.overlay.toggle() unless window.activeOverlay == null
        window.activeOverlay = @
      @overlay.toggle()
      return
    
    return

