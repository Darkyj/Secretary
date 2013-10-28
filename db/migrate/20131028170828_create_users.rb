class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :password_diget
      t.string :email_address
      t.integer :phone_number

      t.timestamps
    end
  end
end
