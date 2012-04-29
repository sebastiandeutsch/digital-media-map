//= require jquery
//= require jquery_ujs
//= require_tree .
//= require_tree ./google_maps

# start the app
jQuery ($) ->
  window.map = new GoogleMaps('map-canvas')
  window.markers = []
  
  $('.menu').on "click", (event) ->
    data_target = $(this).attr('data-target')
    $(data_target).slideToggle()
    if $(this).hasClass('open')
      $(this).removeClass('open')
    else
      $(this).addClass('open')
    
    return false
  
  $('.category-switch').on "click", (event) ->
    data_target = $(this).attr('data-target')
    if $(this).attr('data-value') == 'on'
      $('img', $(this)).attr('src', '/assets/switch-off.png')
      $(this).attr('data-value', 'off')
      state = off
    else
      $('img', $(this)).attr('src', '/assets/switch-on.png')
      $(this).attr('data-value', 'on')
      state = on
    
    $('.switch', data_target).each (i, el) ->
      link = $(el)
      data_target = $(link).attr('data-target')
      if state == on
        $('img', link).attr('src', '/assets/switch-on.png')
        $(link).attr('data-value', 'on')
        $(data_target).attr('checked', true);
      else
        $('img', link).attr('src', '/assets/switch-off.png')
        $(link).attr('data-value', 'off')
        $(data_target).attr('checked', false);
      
      return
    
    return false
  
  $('.switch').on "click", (event) ->
    data_target = $(this).attr('data-target')
    
    if $(this).attr('data-value') == 'on'
      $('img', $(this)).attr('src', '/assets/switch-off.png')
      $(this).attr('data-value', 'off')
      
      $(data_target).attr('checked', false);
      
    else
      $('img', $(this)).attr('src', '/assets/switch-on.png')
      $(this).attr('data-value', 'on')
      
      $(data_target).attr('checked', true);
    
    send_search_form()
    return false
  
  $.getJSON '/companies.json', (data) ->
    for startup in data
      markerWithPopup = new MarkerWithPopup(map, startup)
      window.markers.push(markerWithPopup.marker)
    return
  return

