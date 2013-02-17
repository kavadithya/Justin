class AddIndexToEmployersEmailUsername < ActiveRecord::Migration
  def change
  	add_index :employers, :E_email, unique: true
  	add_index :employers, :E_username, unique: true
  end
end
