class AddCompany < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.integer :category_id
        t.string :name
        t.string :description
      t.string :street
      t.string :zip
      t.string :city
      t.string :url
      t.string :email
      t.string :searches
      t.string :provides

      t.string :facebook_url
      t.string :twitter_url
      t.string :rss_url

      t.boolean :has_funding
      t.boolean :searches_for_funding
      t.boolean :is_hiring

      t.integer :company_size

      t.boolean :not_found
      t.boolean :disabled

      t.float :lon
      t.float :lat

      t.timestamps
    end
  end
end
