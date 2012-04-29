ActiveAdmin.register Company do
  filter :name
  filter :city
  filter :zip
  filter :searches
  filter :provides
  
  scope :all, :default => true

  scope :disabled do |companies|
    companies.where("disabled=?", true)
  end
  
  index do 
    column :name
    column :zip
    column :city
    column :has_funding
    column :is_hiring
    column :searches_for_funding
    column :private_slug
  end
end
