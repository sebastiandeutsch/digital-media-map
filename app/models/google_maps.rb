require 'net/http'

module GoogleMaps
  
  class QueryError < RuntimeError; end #the query could not be fulfilled. all error classes derive from this
  class QueryingProblem < QueryError; end
  class NoResultKnown < QueryError; end

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
        raise GoogleMaps::NoResultKnown
      else
        raise GoogleMaps::QueryingProblem, "GGeoStatusCode #{status}"
      end
    else
      raise GoogleMaps::QueryingProblem, "#{http_response.code} #{http_response.message} for #{url}"
    end
  end

  def self.query_url(what, options)
    url = "http://maps.google.com/maps/geo?q=#{URI.escape(what)}&output=#{options[:output_format]}"
    url += "&gl=#{options[:country_code_bias]}" if options[:country_code_bias]
    url += "&key=#{options[:api_key]}"
    return url
  end
end