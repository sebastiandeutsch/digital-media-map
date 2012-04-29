jQuery ($) ->
  $('form#company_search input').change (e) ->
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
  return