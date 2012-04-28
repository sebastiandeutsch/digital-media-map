class Tag
  include Mongoid::Document

  has_and_belongs_to_many :companies

  field :name, type: String

  validates :name, presence: true

end
