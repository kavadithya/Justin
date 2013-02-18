class AddColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :last_name, :string
  	add_column :users, :immigration_status, :string
  	add_column :users, :city, :string
  	add_column :users, :country, :string
  	add_column :users, :user_name, :string
  end
end
