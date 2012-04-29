class Company < ActiveRecord::Base
  belongs_to :category
  has_many :taggings
  has_many :tags, :through => :taggings

  mount_uploader :logo, LogoUploader

  attr_accessible :name, :description, :street, :zip, :city, :url, :email, :searches, :provides,
    :facebook_url, :twitter_url, :rss_url, :logo, :category_id, :tag_ids

  before_save :query_for_lonlat
  before_create :insert_private_slug
  after_create :notify_company

  QUERY_API = GoogleMaps

  def address
    "#{self.street}, #{self.zip} #{self.city}"
  end

  def query_for_lonlat
    lonlat = QUERY_API.query_for_lonlat(self.address, options = {})

    self.lon = lonlat.first
    self.lat = lonlat.second
    self.not_found = false
    true
  rescue
    self.not_found = true
    true
  end

  def insert_private_slug
    self.private_slug = SecureRandom.hex(12)
  end

  def notify_company

  end

end
