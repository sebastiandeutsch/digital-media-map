class Tag < ActiveRecord::Base
  has_many :taggings
  belongs_to :category

  validates :name, presence: true
end
