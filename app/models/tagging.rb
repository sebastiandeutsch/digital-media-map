class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :company

  attr_accessible :company_id, :tag_id
end
