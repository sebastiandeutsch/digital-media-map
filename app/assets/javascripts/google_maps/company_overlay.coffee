window.CompanyOverlay = (latLng, company, map) ->
  @latLng = latLng
  @company = company
  @map = map
  
  @div = null
  @setMap(@map)
  return

window.CompanyOverlay.prototype = new google.maps.OverlayView()
window.CompanyOverlay.prototype.onAdd = () ->
  html  = '<div class=\"company-overlay\" style=\"visibility:hidden\">'
  html += '  <div class=\"company-overlay-container\">'
  html += '    <div class=\"company-overlay-content\">'
  html += '      <div class=\"company-text\">'
  html += '<img src="' + @company.logo + '" />'
  html += '<h2>'
  html += @company.name
  html += '</h2>'
  html += '<p>'
  html += @company.description
  html += '</p>'
  html += "<p><a href=\"#{@company.url}\">"
  html += @company.url
  html += '</a></p>'
  html += '<p>'
  html += @company.street + '<br />'
  html += @company.zip + " " + @company.city + '<br />'
  html += '</p>'
  html += "<p><a href=\"mailto:#{@company.email}\">"
  html += @company.email
  html += '</a></p>'
  html += '<p>We are looking for:<br />'
  html += @company.description
  html += '</p>'
  html += '<p>We are offering:<br />'
  html += @company.description
  html += '</p>'
  html += '      </div>'
  html += '    </div>'
  html += '    <div class=\"company-overlay-arrow\">'
  html += '    </div>'
  html += '  </div>'
  html += '</div>'
  
  @div = jQuery(html).get(0)
  @getPanes().floatPane.appendChild(@div)
  return

window.CompanyOverlay.prototype.draw = () ->
  # position these elements
  pixelposition = @getProjection().fromLatLngToDivPixel(@latLng)
  
  @div.style.left = Math.floor(pixelposition.x - 350 / 2) + 'px'
  @div.style.top = Math.floor(pixelposition.y - 400 - 100) + 'px'
  @div.style.width = '350px'
  @div.style.height = '450px'
  return

window.CompanyOverlay.prototype.hide = () ->
  @div.style.visibility = "hidden" if @div
  return

window.CompanyOverlay.prototype.show = () ->
  @div.style.visibility = "visible" if @div 
  return

window.CompanyOverlay.prototype.toggle = () ->
  if @div
    if @div.style.visibility == "hidden"
      @show()
    else
      @hide()

  # USGSOverlay.prototype.toggleDOM = function() {
  #   if (this.getMap()) {
  #     this.setMap(null);
  #   } else {
  #     this.setMap(this.map_);
  #   }
  # }