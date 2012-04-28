class Category < ActiveRecord::Base
  has_many :companies
  has_many :tags

  attr_accessible :name
  validates :name, presence: true
end
