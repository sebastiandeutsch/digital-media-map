class AddPrivateSlugToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :private_slug, :string
  end
end
