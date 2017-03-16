class AddContactnumberToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :contactnumber, :string
  end
end
