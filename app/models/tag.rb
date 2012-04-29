class Tag < ActiveRecord::Base
  has_many :taggings
  belongs_to :category

  attr_accessible :name, :category_id
end
