class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.string :E_first_name
      t.string :E_last_name
      t.string :E_company
      t.string :E_email
      t.string :E_address
      t.string :E_city
      t.string :E_country
      t.string :E_username

      t.timestamps
    end
  end
end
