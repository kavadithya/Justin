class AddColumnRememberTokenEmployers < ActiveRecord::Migration
  def up
  	add_column :employers, :remember_token, :string
  	add_index :employers, :remember_token
  end

  def down
  end
end
