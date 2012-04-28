object @companies
attributes :id, :name, :description, :street, :zip, :city, :url, :email, :searching_for, :providing, :has_funding, :is_hiring, :lonlat
node(:logo) { |company| company.logo.square.url }
node(:company_show_url) { |company| company_url(company) }
