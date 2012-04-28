class Tagging < ActiveRecord::Base
  attr_accessible :company_id, :tag_id
  belongs_to :tag
  belongs_to :company
end
