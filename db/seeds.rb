# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

companies = YAML.load File.open(File.join(Rails.root, "db/seed.yml"))
companies.each do |company|
  tags = company.delete("sub_categories")
  category = company.delete("category")
  company = Company.build(company)

end
