class ChangeCompanyRssUrltoCrunchbaseUrl < ActiveRecord::Migration
  def change
    remove_column :companies, :rss_url
    add_column :companies, :crunchbase_url, :string
  end
end
