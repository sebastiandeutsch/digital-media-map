//= require jquery
//= require jquery_ujs
//= require_tree .
//= require_tree ./google_maps

# start the app
jQuery ($) ->
  window.map = new GoogleMaps('map-canvas')
  window.markers = []
  
  $.getJSON '/companies.json', (data) ->
    for startup in data
      markerWithPopup = new MarkerWithPopup(map, startup)
      window.markers.push(markerWithPopup.marker)
    return
  return

