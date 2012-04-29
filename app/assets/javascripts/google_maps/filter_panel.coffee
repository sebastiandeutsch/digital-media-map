window.send_search_form = () ->
  params = $('form#company_search').serialize()
  $.ajax({
    url: "/companies.json",
    data: params
    context: document.body
  }).done((data) ->
    # clear all markers
    for marker in window.markers
      marker.setMap(null);
  
    # clear all markers
    for startup in data
      markerWithPopup = new MarkerWithPopup(window.map, startup)
      window.markers.push markerWithPopup.marker
  )

jQuery ($) ->
  $('form#company_search input').change (e) ->
    send_search_form()
  return