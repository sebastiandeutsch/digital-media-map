window.GoogleMaps = class
  constructor: (id, center) ->
    id = "map-canvas"
    center = new google.maps.LatLng(51.47725, 7.21643)
    
    options =
      zoom: 8
      center: center,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      panControl: false,
      overviewMapControl: false,
      mapTypeControl: false,
      streetViewControl: false,
      styles: [
        {
          featureType: "administrative.province",
          stylers: [
            { visibility: "on" },
            { invert_lightness: true }
          ]
        },{
          featureType: "administrative.country",
          stylers: [
            { saturation: -12 },
            { visibility: "simplified" },
            { invert_lightness: true }
          ]
        },
        {
            featureType: "road.highway",
            stylers: [
              { saturation: -12 },
              { visibility: "off" }
            ]
          }
      ]

    map = new google.maps.Map(document.getElementById(id), options)
    google.maps.event.addListener map, 'click', ->
      if window.activeOverlay != null
        window.activeOverlay.overlay.toggle()
        window.activeOverlay = null
    return map
