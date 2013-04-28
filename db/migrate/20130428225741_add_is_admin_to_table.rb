class AddIsAdminToTable < ActiveRecord::Migration
  def self.up
    add_column :users, :isAdmin, :boolean, :default => false
  end
end