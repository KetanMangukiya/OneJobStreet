class AddUserdataToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :date_of_birth, :date
    add_column :users, :gender, :string
    add_column :users, :address, :string
    add_column :users, :pincode, :integer
    add_column :users, :marital_status, :boolean
  end
end
