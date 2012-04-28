class Company < ActiveRecord::Base
  belongs_to :category
  has_many :taggings
  has_many :tags, :through => :taggings

  mount_uploader :logo, LogoUploader

  attr_accessible :description, :street, :zip, :city, :url, :email, :searches, :provides, :facebook_url, :twitter_url, :rss_url
  validates_presence_of :name, :description, :street, :zip, :city, :email

  before_save :query_for_lonlat

  def query_for_lonlat
    lonlat = QUERY_API.query_for_lonlat(self.address, options = {})
    self.lonlat = lonlat
    self.not_found = false
    true
  rescue
    self.not_found = true
    false
  end

  def address
    "#{self.street}, #{self.zip} #{self.city}"
  end

end
