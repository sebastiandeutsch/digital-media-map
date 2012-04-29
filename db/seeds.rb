# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)



#{
  #"Advertising" => [

  #],
  #"eCommerce / eTransaction" => [

  #],
  #"Games" => [

  #],
  #"Web & App Agency" => [

  #],
  #"Content" => [

  #],
  #"Social Networks" => [

  #],
  #"Web Tools / Services" "Others" => [

  #]
#}.each do |category_name, tags|
  #c = Category.create :name => category_name
  #tags.each do |tag_name|
    #c.tags << Tag.create(:name => tag_name)
  #end
#end

companies = YAML.load File.open(File.join(Rails.root, "db/seed.yml"))
companies.each do |details|
  company = Company.new(details)

  category = Category.where(:name => details["category"]).first
  fail "No category '#{details['category']}' for '#{details['name']}'" unless category
  company.category = category

  tags = details["sub_categories"].map do |sub_cat|
    tag = Tag.where(:name => sub_cat).first
    fail "No tag '#{sub_cat}'' for '#{details['name']}''" unless tag
    tag
  end
  company.tags = tags
  company.remote_logo_url = details["logo_url"]

  begin
    company.save!
  rescue => e
    puts "MAJOR LOGO FAIL:"
    p e
    puts "Logo URL: #{details['logo_url']}"
  end
end
