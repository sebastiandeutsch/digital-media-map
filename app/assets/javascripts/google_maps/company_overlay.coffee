window.CompanyOverlay = (latLng, company, map) ->
  @latLng = latLng
  @company = company
  @map = map
  
  @div = null
  @setMap(@map)
  return

window.CompanyOverlay.prototype = new google.maps.OverlayView()
window.CompanyOverlay.prototype.onAdd = () ->
  @div = jQuery("<div class=\"company-overlay\" style=\"visibility:hidden\"><div class=\"company-overlay-container\"><div class=\"company-overlay-content\">#{@company.name}</div><div class=\"company-overlay-arrow\"></div></div></div>").get(0)
  @getPanes().floatPane.appendChild(@div)
  return

window.CompanyOverlay.prototype.draw = () ->
  # position these elements
  pixelposition = @getProjection().fromLatLngToDivPixel(@latLng)
  
  @div.style.left = Math.floor(pixelposition.x - 350 / 2) + 'px'
  @div.style.top = Math.floor(pixelposition.y - 400 - 100) + 'px'
  @div.style.width = '350px'
  @div.style.height = '400px'
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