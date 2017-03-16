class AddUserToEducationDetail < ActiveRecord::Migration[5.0]
  def change
    add_column :education_details, :user_id, :integer
  end
end
