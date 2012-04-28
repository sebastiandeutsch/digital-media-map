//= require jquery
//= require jquery_ujs
//= require_tree .
//= require_tree ./google_maps

# start the app
jQuery ($) ->
  map = new GoogleMaps('map-canvas')

  $.getJSON '/companies.json', (data) ->
    for startup in data
      markerWithPopup = new MarkerWithPopup(map, startup)
    return
  return

