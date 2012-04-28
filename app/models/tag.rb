class Tag < ActiveRecord::Base
  has_many :taggings
  belongs_to :category

  attr_accessible :name
  validates :name, presence: true
end
