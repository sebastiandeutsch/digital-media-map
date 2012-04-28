//= require jquery
//= require jquery_ujs
//= require_tree .
//= require_tree ./google_maps

# start the app
jQuery ($) ->
  map = new GoogleMaps('map-canvas')

  $.getJSON '/companies.json', (data) ->
    for startup in data
      point = new google.maps.LatLng(startup.lonlat[1], startup.lonlat[0])
      shadow = '/assets/company-holder.png';
      image = new google.maps.MarkerImage(startup.logo,
        null,
        null,
        new google.maps.Point(25, 69))

      # add marker
      marker = new google.maps.Marker
        position: point,
        map: map,
        title: "Hello World!"
        icon: image
        shadow: shadow
      console.log startup.name
    return
  return

