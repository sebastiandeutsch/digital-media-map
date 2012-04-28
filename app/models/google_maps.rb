require 'net/http'

module GoogleMaps
  CONFIG = {
    :api_key => nil,
    :country_code_bias => nil
  }
  
  meta = class <<self; self; end
  CONFIG.keys.each do |key|
    meta.send(:define_method, "#{key}=") { |value| CONFIG[key] = value }
  end
  
  #error codes (coined GGeoStatusCode)
  G_GEO_SUCCESS = "200"
  
  G_GEO_SERVER_ERROR = "500"
  
  G_GEO_MISSING_QUERY = "601"
  G_GEO_UNKNOWN_ADDRESS = "602" #indicates that you asked for fex. "The Shire, Eriador"
  G_GEO_UNAVAILABLE_ADDRESS = "603"
  G_GEO_BAD_KEY = "610"
  G_GEO_TOO_MANY_QUERIES = "620"
  
  
  def self.query_for_lonlat(what, options = {})
    options = CONFIG.merge options.merge({ :output_format => 'csv'})
    url = query_url(what, options)
    
    http_response = Net::HTTP.get_response(URI.parse(url))
    
    if http_response.is_a? Net::HTTPOK
      status, accuracy, latitude, longitude = http_response.body.split(',')
      case status
      when G_GEO_SUCCESS
        return [longitude.to_f, latitude.to_f]
      when G_GEO_UNKNOWN_ADDRESS
        raise Geolocation::NoResultKnown
      else
        raise Geolocation::QueryingProblem, "GGeoStatusCode #{status}"
      end
    else
      raise Geolocation::QueryingProblem, "#{http_response.code} #{http_response.message} for #{query_string}"
    end
  end
  
  # Not in use currently! Zipcode to City not working correctly (Google sucks!)
  def self.query_for_german_plz(what)
    options = CONFIG.merge({ :country_code_bias => 'de', :output_format => 'xml'})
      
    url = query_url(what, options)
    
    http_response = Net::HTTP.get_response(URI.parse(url))
    
    if http_response.is_a? Net::HTTPOK
      xml = Nokogiri::XML.parse http_response.body 
      status = xml.css("code").text

      case status
      when G_GEO_SUCCESS
        #Result in Germany?
        if xml.css('default|Placemark foo|CountryName', {'default' => 'http://earth.google.com/kml/2.0', 'foo' => 'urn:oasis:names:tc:ciq:xsdschema:xAL:2.0'}).text == 'Deutschland'
          return xml.css('default|Placemark foo|LocalityName', {'default' => 'http://earth.google.com/kml/2.0', 'foo' => 'urn:oasis:names:tc:ciq:xsdschema:xAL:2.0'}).text          
        else
          raise Geolocation::NoResultKnown
        end          
      when G_GEO_UNKNOWN_ADDRESS
        raise Geolocation::NoResultKnown
      else
        #unknown http status code response
        raise Geolocation::QueryingProblem, "GGeoStatusCode #{status}"
      end
    else
      raise Geolocation::QueryingProblem, "#{http_response.code} #{http_response.message} for #{query_string}"
    end
  end
  
  def self.query_url(what, options)
    url = "http://maps.google.com/maps/geo?q=#{URI.escape(what)}&output=#{options[:output_format]}"
    url += "&gl=#{options[:country_code_bias]}" if options[:country_code_bias]
    url += "&key=#{options[:api_key]}"
    return url
  end
end