class Tag
  include Mongoid::Document
  
  has_many :companies

  field :name, type: String
  
  validates :name, presence: true

end
