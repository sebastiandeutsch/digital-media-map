class AddCreatedByAdminFlagToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :created_by_admin, :boolean
  end
end
