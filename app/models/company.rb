class Company
  include Mongoid::Document
  include Mongoid::Timestamps
  
  
  belongs_to :category
  has_and_belongs_to_many :tags
  
  
  field :name,          :type => String
  field :description,   :type => String
  field :street,        :type => String
  field :zip,           :type => String
  field :city,          :type => String
  field :url,           :type => String
  field :email,         :type => String
  field :searching_for, :type => String
  field :providing,     :type => String
  
  field :facebook_url, :type => String
  field :twitter_url,  :type => String
  field :rss_url,      :type => String
  
  field :has_funding,           :type => Boolean, :default => false
  field :searching_for_funding, :type => Boolean, :default => false 
  field :is_hiring,             :type => Boolean, :default => false
  
  field :not_found,     :type => Boolean, :default => true
  field :lonlat,        :type => Array
  field :disabled,      :type => Boolean, :default => false
  
  field :company_size,  :type => Integer, :default => 0
  
  mount_uploader :logo, LogoUploader
  
  validates_presence_of :name, :description, :street, :zip, :city, :email
  
  QUERY_API = GoogleMaps
  
  before_save :query_for_lonlat
  
  def self.search(args)
    
  end

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