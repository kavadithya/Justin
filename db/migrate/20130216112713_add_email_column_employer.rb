class AddEmailColumnEmployer < ActiveRecord::Migration
  def up
  	add_column :employers, :email, :string
  	remove_column :employers, :E_email
  end

  def down
  end
end
