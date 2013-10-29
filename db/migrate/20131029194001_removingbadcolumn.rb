class Removingbadcolumn < ActiveRecord::Migration
  def change
  	remove_column :users, :password_diget, :string
  end
end
