//= require jquery
//= require jquery_ujs
//= require_tree .
//= require_tree ./google_maps

# start the app
jQuery ($) ->
  if $('#map-canvas').size() == 0
    $('#company_category_id').on "change", (event) ->
      $(".tags_for_category").hide()
      $(".tags_for_category input").attr("checked", false)
      $("#tags_for_category-#{$(this).val()}").show()
  else
    getInnerDimensions = () ->
      myWidth = 0
      myHeight = 0
      if( typeof( window.innerWidth ) == 'number' )
        myWidth = window.innerWidth
        myHeight = window.innerHeight
      else if( document.documentElement && ( document.documentElement.clientWidth || document.documentElement.clientHeight ) )
        myWidth = document.documentElement.clientWidth
        myHeight = document.documentElement.clientHeight
      else if( document.body && ( document.body.clientWidth || document.body.clientHeight ) )
        myWidth = document.body.clientWidth
        myHeight = document.body.clientHeight
        
      return { width : myWidth, height : myHeight }
    
    resizeMap = () ->
      windowSize = getInnerDimensions()
      $('#map-canvas').css('width', (windowSize.width - 299) + 'px')
    
    resizeMap()
    $(window).resize () ->
      resizeMap()
      return true
    
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

