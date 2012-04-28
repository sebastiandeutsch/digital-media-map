jQuery ($) ->
  # point = new google.maps.LatLng(-25.363882,131.044922)
  center = new google.maps.LatLng(51.47725, 7.21643)
  
  options =
    zoom: 8
    center: center,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  
  map = new google.maps.Map(document.getElementById('map-canvas'), options)
  
  # add map objects
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