class Company
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name,          :type => String
  field :description,   :type => String
  field :street,        :type => String
  field :zip,           :type => String
  field :city,          :type => String
  field :url,           :type => String
  field :email,         :type => String
  field :searching_for, :type => String
  field :providing,     :type => String
  
  field :has_funding,           :type => Boolean, :default => false
  field :searching_for_funding, :type => Boolean, :default => false 
  field :is_hiring,             :type => Boolean, :default => false
  
  field :not_found,     :type => Boolean, :default => true
  field :lonlat,        :type => Array
  field :disabled,      :type => Boolean, :default => false
  
  mount_uploader :logo, LogoUploader
  
  validates_presence_of :name, :description, :street, :zip, :city, :email
  
  class QueryError < RuntimeError; end #the query could not be fulfilled. all error classes derive from this
  class QueryingProblem < QueryError; end
  class NoResultKnown < QueryError; end
  QUERY_API = GoogleMaps
  
  before_save :query_for_lonlat
  def query_for_lonlat
    begin
      lonlat = QUERY_API.query_for_lonlat(self.address, options = {})
      self.lonlat = lonlat
      self.not_found = false
      return true
    rescue => exception
      self.not_found = true
      return false
    end
  end
  
  def address
    "#{self.street}, #{self.zip} #{self.city}"
  end
end