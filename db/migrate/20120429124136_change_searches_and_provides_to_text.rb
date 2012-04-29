class ChangeSearchesAndProvidesToText < ActiveRecord::Migration
  def change
    change_column :companies, :searches, :text
    change_column :companies, :provides, :text
  end
end
